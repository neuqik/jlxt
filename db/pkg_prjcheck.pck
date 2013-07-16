CREATE OR REPLACE PACKAGE pkg_prjcheck IS
  -- 保存检查点信息
  PROCEDURE prc_savepoint(prm_prjid          IN VARCHAR2,
                          prm_checkgroup     IN VARCHAR2, -- 检查单编号
                          prm_checkdate      IN VARCHAR2,
                          prm_checkitem      IN VARCHAR2,
                          prm_act_score      IN VARCHAR2,
                          prm_jsdw_id        IN VARCHAR2, -- 建设单位
                          prm_sgdw_id        IN VARCHAR2, -- 施工单位
                          prm_construct_type IN VARCHAR2, -- 结构形式
                          prm_prj_progress   IN VARCHAR2,
                          prm_memo           IN VARCHAR2,
                          prm_appcode        OUT VARCHAR2,
                          prm_errmsg         OUT VARCHAR2,
                          prm_checkgroup_out OUT VARCHAR2);
END pkg_prjcheck;
/
CREATE OR REPLACE PACKAGE BODY pkg_prjcheck IS
  -- 保存检查点信息
  PROCEDURE prc_savepoint(prm_prjid          IN VARCHAR2,
                          prm_checkgroup     IN VARCHAR2, -- 检查单编号
                          prm_checkdate      IN VARCHAR2,
                          prm_checkitem      IN VARCHAR2,
                          prm_act_score      IN VARCHAR2,
                          prm_jsdw_id        IN VARCHAR2, -- 建设单位
                          prm_sgdw_id        IN VARCHAR2, -- 施工单位
                          prm_construct_type IN VARCHAR2, -- 结构形式
                          prm_prj_progress   IN VARCHAR2,
                          prm_memo           IN VARCHAR2,
                          prm_appcode        OUT VARCHAR2,
                          prm_errmsg         OUT VARCHAR2,
                          prm_checkgroup_out OUT VARCHAR2) IS
    d_enddate   DATE;
    d_startdate DATE;
    n_prjid     NUMBER(20);
    n_score     NUMBER(10, 2);
    d_checkdate DATE;
    n_count     NUMBER(10) := 0;
    v_emp_id    VARCHAR2(20);
    v_prjno     VARCHAR2(20);
    n_temp      NUMBER(10, 2) := 0;
    n_point     NUMBER(10, 2) := 0;
    n_sum1      NUMBER(10, 2) := 0; -- 得分总计
    n_sum2      NUMBER(10, 2) := 0; -- 应得分总计
    n_sum3      NUMBER(10, 2) := 0; -- 实得分总计
    n_ratio     NUMBER(10, 2) := 0; -- 得分率
  BEGIN
    prm_appcode := '1';
    -- 1.获取项目编号，检查项目编号是否已经结束，根据竣工日期
    BEGIN
      SELECT id,
             nvl(prj_endtime, to_date('2099-01-01', 'yyyy-mm-dd')),
             prj_starttime,
             prjno
        INTO n_prjid, d_enddate, d_startdate, v_prjno
        FROM v_prj_info
       WHERE id = to_number(prm_prjid);
    EXCEPTION
      WHEN no_data_found THEN
        prm_appcode := '-1';
        prm_errmsg  := '没有找到编号为' || v_prjno || '的信息';
        RETURN;
      WHEN too_many_rows THEN
        prm_appcode := '-1';
        prm_errmsg  := '编号为' || v_prjno || '的信息存在多条';
        RETURN;
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := SQLERRM;
        RETURN;
    END;
    -- 1.1.检查扣分是否是数字
    BEGIN
      SELECT to_number(prm_act_score), to_date(prm_checkdate, 'yyyy-mm-dd')
        INTO n_score, d_checkdate
        FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '输入的扣分不是数字:' || prm_act_score || '或检查时间不是日期类型:' ||
                       prm_checkdate || SQLERRM;
        RETURN;
    END;
    -- 1.1.1.检查扣分是否超过了最大扣分金额
    BEGIN
      SELECT point - n_score, point
        INTO n_temp, n_point
        FROM t_checklist_prj
       WHERE check_code = prm_checkitem;
      IF n_score > n_point OR n_score < 0 THEN
        prm_appcode := '-1';
        prm_errmsg  := '输入的扣分数字:' || prm_act_score || '超过最大可扣分数' || n_point;
        RETURN;
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '检查扣分是否超过最大可扣分值时出错。' || SQLERRM;
        RETURN;
    END;
    -- 1.2.检查时间是否处于项目的有效期范围内
    IF d_checkdate > d_enddate THEN
      prm_appcode := '-1';
      prm_errmsg  := '检查日期晚于竣工日期' || to_char(d_enddate, 'YYYY-MM-DD');
      RETURN;
    END IF;
    IF d_checkdate < d_startdate THEN
      prm_appcode := '-1';
      prm_errmsg  := '检查日期早于开工日期' || to_char(d_startdate, 'YYYY-MM-DD');
      RETURN;
    END IF;
    -- 1.3.检查项目中是否有工程信息
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_building
     WHERE prj_id = n_prjid;
    IF n_count <= 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '编号' || v_prjno || '中没有录入有效工程';
      RETURN;
    END IF;
    n_count := 0;
    -- 2.检查项目是否设置了总监，如果没有设置总监，提示去增加总监
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_org
     WHERE prj_id = n_prjid
       AND prj_role =
           fun_getcodevalue(codetype => 'PRJ_ROLE', codedesc => '总监');
    IF n_count < 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '编号' || v_prjno || '中没有有效的总监';
      RETURN;
    END IF;
    IF n_count > 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '编号' || v_prjno || '中设置了多个有效的总监';
      RETURN;
    END IF;
    SELECT emp_id
      INTO v_emp_id
      FROM v_prj_org
     WHERE prj_id = n_prjid
       AND prj_role =
           fun_getcodevalue(codetype => 'PRJ_ROLE', codedesc => '总监');
    n_count := 0;
    -- 3.检查项目是否录入了施工单位和参建单位，如果咩有录入，提示增加
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_unit
     WHERE prj_id = n_prjid
       AND unit_type =
           fun_getcodevalue(codetype => 'UNIT_TYPE', codedesc => '建设单位');
    IF n_count < 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '编号' || v_prjno || '中没有有效的建设单位';
      RETURN;
    END IF;
    -- 目前暂时只有一个建设单位
    IF n_count > 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '编号' || v_prjno || '中设置了多个有效的建设单位';
      RETURN;
    END IF;
    -- 检查是否有录入了分公司信息
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_unit_relate
     WHERE prj_id = n_prjid;
    IF n_count < 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '编号' || v_prjno || '中没有有效的分公司信息';
      RETURN;
    END IF;
    -- 3.复制当前项目的基本信息到表中的冗余字段
    -- 3.1.处理多个单位的情况
    -- 如果没有检查表编码，则认为是第一个，然后返回编码
    IF prm_checkgroup IS NULL OR nvl(prm_checkdate, '') = '' THEN
      SELECT to_char(SYSDATE, 'YYYYMMDDHH24MISS')
        INTO prm_checkgroup_out
        FROM dual;
    ELSE
      prm_checkgroup_out := prm_checkgroup;
    END IF;
  
    INSERT INTO v_prj_check
      (id,
       prj_id,
       checkitem,
       checkdate,
       act_score,
       
       jsdw_id,
       sgdw_id,
       prj_progress,
       construct_type,
       emp_id,
       begindate,
       enddate,
       memo,
       valid,
       checkgroup_no,
       point)
    VALUES
      (seq_id.nextval,
       n_prjid,
       prm_checkitem,
       d_checkdate,
       n_score,
       to_number(prm_jsdw_id),
       to_number(prm_sgdw_id),
       prm_prj_progress,
       prm_construct_type,
       v_emp_id,
       d_startdate,
       d_enddate,
       prm_memo,
       '1',
       prm_checkgroup_out,
       n_point);
  
    -- 4.更新prj_majorcheck的汇总
    SELECT nvl(SUM(act_score), 0),
           nvl(SUM(point), 0),
           nvl(SUM(act_score), 0)
      INTO n_sum1, n_sum2, n_sum3
      FROM v_prj_check
     WHERE checkgroup_no = prm_checkgroup;
    IF n_sum2 <> 0 THEN
      n_ratio := n_sum1 / n_sum2;
    ELSE
      n_ratio := 0;
    END IF;
    -- 更新计算
    UPDATE v_prj_majorcheck
       SET sum1 = n_sum1, sum2 = n_sum2, sum3 = n_sum3, ratio1 = n_ratio
     WHERE checkgroup_no = prm_checkgroup;
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := SQLERRM;
  END;
END pkg_prjcheck;
/

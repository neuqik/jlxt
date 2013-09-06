CREATE OR REPLACE PACKAGE pkg_prjcheck IS
  def_checktype_safe      CONSTANT VARCHAR2(3) := '01';
  def_checktype_construct CONSTANT VARCHAR2(3) := '02';
  def_checktype_water     CONSTANT VARCHAR2(3) := '03';
  def_checktype_electric  CONSTANT VARCHAR2(3) := '04';
  ------
  def_jointype_join   CONSTANT VARCHAR2(3) := '1';
  def_jointype_nojoin CONSTANT VARCHAR2(3) := '0';
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
  -- 生成检查报告
  PROCEDURE prc_checkreport(prm_majorcheck_id IN VARCHAR2,
                            prm_appcode       OUT VARCHAR2,
                            prm_errmsg        OUT VARCHAR2,
                            prm_reportid      OUT VARCHAR2);
  ------------------------------------------------------------------
  /*项目监理部检查新建检查单
  *
  *
  ------------------------------------------------------------------*/
  PROCEDURE prc_newsuperchk(prm_checkgroup           IN VARCHAR2, --新检查单号
                            prm_batchno              IN VARCHAR2,
                            prm_prjid                IN VARCHAR2,
                            prm_deptid               IN VARCHAR2,
                            prm_checktime            IN VARCHAR2,
                            prm_checkuser            IN VARCHAR2,
                            prm_progress             IN VARCHAR2,
                            prm_memo                 IN VARCHAR2,
                            prm_construction_comment IN VARCHAR2,
                            prm_water_comment        IN VARCHAR2,
                            prm_electric_comment     IN VARCHAR2,
                            prm_safe_comment         IN VARCHAR2,
                            prm_checkitem1           IN VARCHAR2,
                            prm_itemchild1           IN VARCHAR2,
                            prm_child1               IN VARCHAR2,
                            prm_child1_sum           IN VARCHAR2,
                            prm_child1_comment       IN VARCHAR2,
                            prm_checkitem2           IN VARCHAR2,
                            prm_itemchild2           IN VARCHAR2,
                            prm_child2               IN VARCHAR2,
                            prm_child2_sum           IN VARCHAR2,
                            prm_child2_comment       IN VARCHAR2,
                            prm_checkitem3           IN VARCHAR2,
                            prm_itemchild3           IN VARCHAR2,
                            prm_child3               IN VARCHAR2,
                            prm_child3_sum           IN VARCHAR2,
                            prm_child3_comment       IN VARCHAR2,
                            prm_appcode              OUT VARCHAR2,
                            prm_errmsg               OUT VARCHAR2);
  ------------------------------------------------------------------
  /*项目监理部检查保存检查单
  *
  *
  ------------------------------------------------------------------*/
  PROCEDURE prc_editsuperchk(prm_checkgroup           IN VARCHAR2, --新检查单号
                             prm_batchno              IN VARCHAR2,
                             prm_prjid                IN VARCHAR2,
                             prm_deptid               IN VARCHAR2,
                             prm_checktime            IN VARCHAR2,
                             prm_checkuser            IN VARCHAR2,
                             prm_progress             IN VARCHAR2,
                             prm_memo                 IN VARCHAR2,
                             prm_construction_comment IN VARCHAR2,
                             prm_water_comment        IN VARCHAR2,
                             prm_electric_comment     IN VARCHAR2,
                             prm_safe_comment         IN VARCHAR2,
                             prm_checkitem1           IN VARCHAR2,
                             prm_itemchild1           IN VARCHAR2,
                             prm_child1               IN VARCHAR2,
                             prm_child1_sum           IN VARCHAR2,
                             prm_child1_comment       IN VARCHAR2,
                             prm_checkitem2           IN VARCHAR2,
                             prm_itemchild2           IN VARCHAR2,
                             prm_child2               IN VARCHAR2,
                             prm_child2_sum           IN VARCHAR2,
                             prm_child2_comment       IN VARCHAR2,
                             prm_checkitem3           IN VARCHAR2,
                             prm_itemchild3           IN VARCHAR2,
                             prm_child3               IN VARCHAR2,
                             prm_child3_sum           IN VARCHAR2,
                             prm_child3_comment       IN VARCHAR2,
                             prm_appcode              OUT VARCHAR2,
                             prm_errmsg               OUT VARCHAR2);
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
    n_ratio     NUMBER(10, 2) := 0; -- 
    v_checktype VARCHAR2(3) := ''; -- 检查类型
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
      prm_appcode := '-1';
      prm_errmsg  := '编号' || v_prjno || '没有有效的检查单号。';
      RETURN;
    ELSE
      prm_checkgroup_out := prm_checkgroup;
    END IF;
    SELECT check_type
      INTO v_checktype
      FROM v_prj_majorcheck
     WHERE checkgroup_no = prm_checkgroup;
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
       point,
       check_type)
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
       n_point,
       v_checktype);
  
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
  -- 生成检查报告
  PROCEDURE prc_checkreport(prm_majorcheck_id IN VARCHAR2,
                            prm_appcode       OUT VARCHAR2,
                            prm_errmsg        OUT VARCHAR2,
                            prm_reportid      OUT VARCHAR2) IS
    v_checktype       VARCHAR2(3) := '';
    v_reportid        VARCHAR2(20) := '';
    n_act_score       NUMBER(10, 2) := 0;
    v_prj_progress    VARCHAR2(1000) := '';
    v_checkcontent_up VARCHAR2(1000) := '';
    n_deserve_point   NUMBER(10, 2) := 0;
    n_sum_point       NUMBER(10, 2) := 0;
    n_sum_deserve     NUMBER(10, 2) := 0;
    n_sum_act         NUMBER(10, 2) := 0;
    v_checkgroup_no   VARCHAR2(20) := '';
    n_max_sort        NUMBER(10) := 0;
  BEGIN
    prm_appcode := '1';
    SELECT to_char(current_timestamp(5), 'YYYYMMDDHH24MISSFF')
      INTO v_reportid
      FROM dual;
    prm_reportid := v_reportid;
    -- 1.根据majorcheck_id获得
    SELECT check_type, checkgroup_no
      INTO v_checktype, v_checkgroup_no
      FROM v_prj_majorcheck
     WHERE id = prm_majorcheck_id;
    -- 2.获取checklist
    FOR c IN (SELECT *
                FROM t_checklist_prj
               WHERE check_type = v_checktype
                 AND MEMBER = '1'
                 AND valid = '1'
               ORDER BY sort_number) LOOP
      -- 取上一项
      SELECT checkcontent || '(' || trunc(point) || '分)'
        INTO v_checkcontent_up
        FROM t_checklist_prj
       WHERE check_code = c.upper_code;
      -- 检查是否有评分
      BEGIN
        SELECT act_score, prj_progress, point
          INTO n_act_score, v_prj_progress, n_deserve_point
          FROM v_prj_check t
         WHERE t.checkgroup_no = v_checkgroup_no
           AND t.checkitem = c.check_code;
      EXCEPTION
        WHEN no_data_found THEN
          n_act_score     := 0;
          v_prj_progress  := '';
          n_deserve_point := 0;
        WHEN OTHERS THEN
          prm_appcode := '-1';
          prm_errmsg  := '检查项目:' || c.check_code || SQLERRM;
          raise_application_error(-20001, prm_errmsg);
      END;
      -- 插入报告表
      INSERT INTO prj_checkreport
        (id,
         checkcontent_up,
         checkcontent,
         point,
         deserve_point,
         act_score,
         prj_progress,
         report_id,
         checkgroup_no,
         sort_number)
      VALUES
        (to_char(current_timestamp(5), 'YYYYMMDDHH24MISSFF'),
         v_checkcontent_up,
         c.checkcontent,
         c.point,
         n_deserve_point,
         n_act_score,
         v_prj_progress,
         v_reportid,
         v_checkgroup_no,
         c.sort_number);
    END LOOP;
    -- 生成总计
    SELECT nvl(SUM(point), 0),
           nvl(SUM(deserve_point), 0),
           nvl(SUM(act_score), 0),
           nvl(MAX(sort_number), 0)
      INTO n_sum_point, n_sum_deserve, n_sum_act, n_max_sort
      FROM prj_checkreport
    -- 插入总计
     WHERE report_id = v_reportid;
    INSERT INTO prj_checkreport
      (id,
       checkcontent_up,
       checkcontent,
       point,
       deserve_point,
       act_score,
       prj_progress,
       report_id,
       checkgroup_no,
       sort_number)
    VALUES
      (to_char(current_timestamp(5), 'YYYYMMDDHH24MISSFF'),
       '',
       '总计',
       n_sum_point,
       n_sum_deserve,
       n_sum_act,
       '得分率:' || to_char(trunc(n_sum_act / n_sum_deserve, 2) * 100) || '%',
       v_reportid,
       v_checkgroup_no,
       n_max_sort + 1);
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := SQLERRM;
  END;
  /***************************************************************
  * 计算监理部检查单数据
  *
  *
  ***************************************************************/
  PROCEDURE prc_calcsuperchk(prm_checkgroup           IN VARCHAR2, --新检查单号
                             prm_batchno              IN VARCHAR2,
                             prm_prjid                IN VARCHAR2,
                             prm_deptid               IN VARCHAR2,
                             prm_checktime            IN VARCHAR2,
                             prm_checkuser            IN VARCHAR2,
                             prm_progress             IN VARCHAR2,
                             prm_memo                 IN VARCHAR2,
                             prm_construction_comment IN VARCHAR2,
                             prm_water_comment        IN VARCHAR2,
                             prm_electric_comment     IN VARCHAR2,
                             prm_safe_comment         IN VARCHAR2,
                             prm_appcode              OUT VARCHAR2,
                             prm_errmsg               OUT VARCHAR2,
                             v_progress               OUT VARCHAR2,
                             v_contructtype           OUT VARCHAR2,
                             v_actbegin               OUT VARCHAR2,
                             v_actend                 OUT VARCHAR2,
                             v_area                   OUT VARCHAR2,
                             v_prjlevel               OUT VARCHAR2,
                             n_ratio_construct        OUT NUMBER,
                             n_sum_construct          OUT NUMBER,
                             n_ratio_water            OUT NUMBER,
                             n_sum_water              OUT NUMBER,
                             n_ratio_electric         OUT NUMBER,
                             n_sum_electric           OUT NUMBER,
                             n_sum_safe               OUT NUMBER) IS
    n_count           NUMBER(10) := 0;
    n_count_construct NUMBER(10) := 0; -- 土建数量
    n_count_electric  NUMBER(10) := 0; -- 电气数量
    n_count_water     NUMBER(10) := 0; -- 水暖数量
  BEGIN
    prm_appcode := '1';
    -- 判断是否有水暖
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count_water
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_water
       AND t.join_type = def_jointype_join;
    -- 判断是否有电气
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count_electric
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_electric
       AND t.join_type = def_jointype_join;
    -- 1.3.如果有水暖，并且有电气
    IF n_count_water > 0 AND n_count_electric > 0 THEN
      n_ratio_electric  := 0.1;
      n_ratio_water     := 0.1;
      n_ratio_construct := 0.35;
    END IF;
    -- 如果有水暖，没电气
    IF n_count_water > 0 AND n_count_electric <= 0 THEN
      n_ratio_water     := 0.1;
      n_ratio_electric  := 0;
      n_ratio_construct := 0.45;
    END IF;
    -- 如果有电气没水暖
    IF n_count_water <= 0 AND n_count_electric > 0 THEN
      n_ratio_water     := 0;
      n_ratio_electric  := 0.1;
      n_ratio_construct := 0.45;
    END IF;
    -- 如果没电气没水暖
    IF n_count_water <= 0 AND n_count_electric <= 0 THEN
      n_ratio_water     := 0;
      n_ratio_electric  := 0;
      n_ratio_construct := 0.55;
    END IF;
    --2.获取结构类型
    BEGIN
      SELECT fun_getconstruct(to_number(prm_prjid))
        INTO v_contructtype
        FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '获取结构类型出错,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --3.获取实际开工日期
    BEGIN
      SELECT fun_getactbegin(to_number(prm_prjid))
        INTO v_actbegin
        FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '获取实际开工日期出错,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --4.获取计划结束日期
    BEGIN
      SELECT fun_getactend(to_number(prm_prjid)) INTO v_actend FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '获取计划结束日期出错,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    ---
    BEGIN
      SELECT fun_getimage(to_number(prm_prjid)) INTO v_progress FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '获取形象进度出错,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --5.获取项目面积--6.获取项目等级
    BEGIN
      SELECT to_char(t.prj_area), prj_level
        INTO v_area, v_prjlevel
        FROM v_prj_info t
       WHERE t.id = to_number(prm_prjid);
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '获取项目面积和项目等级出错,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --7.计算土建
    SELECT nvl(SUM(act_score), 0)
      INTO n_sum_construct
      FROM v_prj_check t
     WHERE t.prj_id = to_number(prm_prjid)
       AND EXISTS (SELECT 1 checkgroup_no
              FROM v_prj_majorcheck
             WHERE prj_id = to_number(prm_prjid)
               AND checkgroup_no = t.
             checkgroup_no
               AND batchno = to_number(prm_batchno)
               AND check_type = def_checktype_construct
               AND join_type = def_jointype_join);
    --8.计算水暖
    SELECT nvl(SUM(act_score), 0)
      INTO n_sum_water
      FROM v_prj_check t
     WHERE t.prj_id = to_number(prm_prjid)
       AND EXISTS (SELECT 1 checkgroup_no
              FROM v_prj_majorcheck
             WHERE prj_id = to_number(prm_prjid)
               AND checkgroup_no = t.
             checkgroup_no
               AND batchno = to_number(prm_batchno)
               AND check_type = def_checktype_water
               AND join_type = def_jointype_join);
    --9.计算电气
    SELECT nvl(SUM(act_score), 0)
      INTO n_sum_electric
      FROM v_prj_check t
     WHERE t.prj_id = to_number(prm_prjid)
       AND EXISTS (SELECT 1 checkgroup_no
              FROM v_prj_majorcheck
             WHERE prj_id = to_number(prm_prjid)
               AND checkgroup_no = t.
             checkgroup_no
               AND batchno = to_number(prm_batchno)
               AND check_type = def_checktype_electric
               AND join_type = def_jointype_join);
    --10.计算安全
    SELECT nvl(SUM(act_score), 0)
      INTO n_sum_safe
      FROM v_prj_check t
     WHERE t.prj_id = to_number(prm_prjid)
       AND EXISTS (SELECT 1 checkgroup_no
              FROM v_prj_majorcheck
             WHERE prj_id = to_number(prm_prjid)
               AND checkgroup_no = t.
             checkgroup_no
               AND batchno = to_number(prm_batchno)
               AND check_type = def_checktype_safe
               AND join_type = def_jointype_join);
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := '计算检查单出错。' || SQLERRM;
  END;
  ------------------------------------------------------------------
  /*项目监理部检查新建检查单
  *
  *
  ------------------------------------------------------------------*/
  PROCEDURE prc_newsuperchk(prm_checkgroup           IN VARCHAR2, --新检查单号
                            prm_batchno              IN VARCHAR2,
                            prm_prjid                IN VARCHAR2,
                            prm_deptid               IN VARCHAR2,
                            prm_checktime            IN VARCHAR2,
                            prm_checkuser            IN VARCHAR2,
                            prm_progress             IN VARCHAR2,
                            prm_memo                 IN VARCHAR2,
                            prm_construction_comment IN VARCHAR2,
                            prm_water_comment        IN VARCHAR2,
                            prm_electric_comment     IN VARCHAR2,
                            prm_safe_comment         IN VARCHAR2,
                            prm_checkitem1           IN VARCHAR2,
                            prm_itemchild1           IN VARCHAR2,
                            prm_child1               IN VARCHAR2,
                            prm_child1_sum           IN VARCHAR2,
                            prm_child1_comment       IN VARCHAR2,
                            prm_checkitem2           IN VARCHAR2,
                            prm_itemchild2           IN VARCHAR2,
                            prm_child2               IN VARCHAR2,
                            prm_child2_sum           IN VARCHAR2,
                            prm_child2_comment       IN VARCHAR2,
                            prm_checkitem3           IN VARCHAR2,
                            prm_itemchild3           IN VARCHAR2,
                            prm_child3               IN VARCHAR2,
                            prm_child3_sum           IN VARCHAR2,
                            prm_child3_comment       IN VARCHAR2,
                            prm_appcode              OUT VARCHAR2,
                            prm_errmsg               OUT VARCHAR2) IS
  
    n_count           NUMBER(10) := 0;
    n_ratio_construct NUMBER(5, 2) := 0; -- 土建占比
    n_ratio_electric  NUMBER(5, 2) := 0; -- 电气占比
    n_ratio_water     NUMBER(5, 2) := 0; -- 水暖占比
    n_ratio_safe      NUMBER(5, 2) := 0.35;
    n_count_construct NUMBER(10) := 0; -- 土建数量
    n_count_electric  NUMBER(10) := 0; -- 电气数量
    n_count_water     NUMBER(10) := 0; -- 水暖数量
    --------------
    v_contructtype VARCHAR2(200) := ''; -- 结构类型
    v_actbegin     VARCHAR2(20) := '';
    v_actend       VARCHAR2(20) := '';
    v_progress     VARCHAR2(200) := ''; -- 形象进度
    v_area         VARCHAR2(200) := ''; -- 项目面积
    v_prjlevel     VARCHAR2(3) := ''; -- 项目等级
    --------------
    n_sum_construct NUMBER(10, 2) := 0; -- 土建分数
    n_sum_electric  NUMBER(10, 2) := 0; -- 电气分数
    n_sum_water     NUMBER(10, 2) := 0; -- 水暖分数
    n_sum_safe      NUMBER(10, 2) := 0; -- 安全分数
  BEGIN
    prm_appcode := '1';
    IF to_number(prm_child1_sum) > to_number(prm_child1) OR
       to_number(prm_child1_sum) < 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '输入的检查项目1实得分数大于满分或实得分数小于0';
      RETURN;
    END IF;
    IF to_number(prm_child2_sum) > to_number(prm_child2) OR
       to_number(prm_child2_sum) < 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '输入的检查项目2实得分数大于满分或实得分数小于0';
      RETURN;
    END IF;
    IF to_number(prm_child3_sum) > to_number(prm_child3) OR
       to_number(prm_child3_sum) < 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '输入的检查项目3实得分数大于满分或实得分数小于0';
      RETURN;
    END IF;
    --1.检查轮次，是否完成了安全检查和质量检查
    IF prm_batchno = '' OR prm_batchno IS NULL THEN
      prm_appcode := '-1';
      prm_errmsg  := '没有输入有效的检查轮次号。';
      RETURN;
    END IF;
    -- 1.1.检查该轮次是否做过安全检查
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_safe
       AND t.join_type = def_jointype_join;
    IF n_count <= 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '该项目在检查轮次' || prm_batchno || '没有有效的参加评比的安全检查。';
      RETURN;
    END IF;
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_construct
       AND t.join_type = def_jointype_join;
    IF n_count <= 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '该项目在检查轮次' || prm_batchno || '没有有效的参加评比的土建检查。';
      RETURN;
    END IF;
    prc_calcsuperchk(prm_checkgroup,
                     prm_batchno,
                     prm_prjid,
                     prm_deptid,
                     prm_checktime,
                     prm_checkuser,
                     prm_progress,
                     prm_memo,
                     prm_construction_comment,
                     prm_water_comment,
                     prm_electric_comment,
                     prm_safe_comment,
                     prm_appcode,
                     prm_errmsg,
                     v_progress,
                     v_contructtype,
                     v_actbegin,
                     v_actend,
                     v_area,
                     v_prjlevel,
                     n_ratio_construct,
                     n_sum_construct,
                     n_ratio_water,
                     n_sum_water,
                     n_ratio_electric,
                     n_sum_electric,
                     n_sum_safe);
    IF prm_appcode <> '1' THEN
      RETURN;
    END IF;
    --12.插入
    INSERT INTO prj_supervisor_majorcheck
      (id,
       prj_id,
       dept_id,
       progress,
       batchno,
       checkdate,
       check_user,
       memo,
       construct,
       act_begin,
       act_end,
       prj_area,
       prj_level,
       checkgroup_no,
       construction,
       construction_sum,
       construction_comment,
       water,
       water_sum,
       water_comment,
       electric,
       electric_sum,
       electric_comment,
       security,
       security_sum,
       security_comment,
       construction_ratio,
       water_ratio,
       electric_ratio,
       security_ratio,
       total_sum,
       valid,
       checkitem1,
       itemchild1,
       child1,
       child1_sum,
       child1_comment,
       checkitem2,
       itemchild2,
       child2,
       child2_sum,
       child2_comment,
       checkitem3,
       itemchild3,
       child3,
       child3_sum,
       child3_comment)
    VALUES
      (to_number(to_char(current_timestamp(5), 'YYYYMMDDHH24MISSFF')),
       to_number(prm_prjid),
       prm_deptid,
       prm_progress || v_progress,
       to_number(prm_batchno),
       to_date(prm_checktime, 'yyyy-mm-dd'),
       prm_checkuser,
       prm_memo,
       v_contructtype,
       to_date(v_actbegin, 'yyyy-mm-dd'),
       to_date(v_actend, 'yyyy-mm-dd'),
       v_area,
       v_prjlevel,
       prm_checkgroup,
       '占总分比例为' || to_char(n_ratio_construct * 100) || '％',
       n_sum_construct,
       prm_construction_comment,
       '占总分比例为' || to_char(n_ratio_water * 100) || '％',
       n_sum_water,
       prm_water_comment,
       '占总分比例为' || to_char(n_ratio_electric * 100) || '％',
       n_sum_electric,
       prm_electric_comment,
       '占总分比例为35％',
       n_sum_safe,
       prm_safe_comment,
       n_ratio_construct,
       n_ratio_water,
       n_ratio_electric,
       n_ratio_safe, -- 安全比例
       n_sum_construct * n_ratio_construct +
       n_sum_electric * n_ratio_electric + n_sum_safe * n_ratio_safe +
       n_sum_water * n_ratio_water + nvl(to_number(prm_child1_sum), 0) +
       nvl(to_number(prm_child2_sum), 0) +
       nvl(to_number(prm_child3_sum), 0),
       '1',
       prm_checkitem1,
       prm_itemchild1,
       to_number(prm_child1),
       to_number(prm_child1_sum),
       prm_child1_comment,
       prm_checkitem2,
       prm_itemchild2,
       to_number(prm_child2),
       to_number(prm_child2_sum),
       prm_child2_comment,
       prm_checkitem3,
       prm_itemchild3,
       to_number(prm_child3),
       to_number(prm_child3_sum),
       prm_child3_comment);
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := SQLERRM;
  END;
  ------------------------------------------------------------------
  /*项目监理部检查保存检查单
  *
  *
  ------------------------------------------------------------------*/
  PROCEDURE prc_editsuperchk(prm_checkgroup           IN VARCHAR2, --新检查单号
                             prm_batchno              IN VARCHAR2,
                             prm_prjid                IN VARCHAR2,
                             prm_deptid               IN VARCHAR2,
                             prm_checktime            IN VARCHAR2,
                             prm_checkuser            IN VARCHAR2,
                             prm_progress             IN VARCHAR2,
                             prm_memo                 IN VARCHAR2,
                             prm_construction_comment IN VARCHAR2,
                             prm_water_comment        IN VARCHAR2,
                             prm_electric_comment     IN VARCHAR2,
                             prm_safe_comment         IN VARCHAR2,
                             prm_checkitem1           IN VARCHAR2,
                             prm_itemchild1           IN VARCHAR2,
                             prm_child1               IN VARCHAR2,
                             prm_child1_sum           IN VARCHAR2,
                             prm_child1_comment       IN VARCHAR2,
                             prm_checkitem2           IN VARCHAR2,
                             prm_itemchild2           IN VARCHAR2,
                             prm_child2               IN VARCHAR2,
                             prm_child2_sum           IN VARCHAR2,
                             prm_child2_comment       IN VARCHAR2,
                             prm_checkitem3           IN VARCHAR2,
                             prm_itemchild3           IN VARCHAR2,
                             prm_child3               IN VARCHAR2,
                             prm_child3_sum           IN VARCHAR2,
                             prm_child3_comment       IN VARCHAR2,
                             prm_appcode              OUT VARCHAR2,
                             prm_errmsg               OUT VARCHAR2) IS
  
    n_count           NUMBER(10) := 0;
    n_ratio_construct NUMBER(5, 2) := 0; -- 土建占比
    n_ratio_electric  NUMBER(5, 2) := 0; -- 电气占比
    n_ratio_water     NUMBER(5, 2) := 0; -- 水暖占比
    n_ratio_safe      NUMBER(5, 2) := 0.35;
    --------------
    v_contructtype VARCHAR2(200) := ''; -- 结构类型
    v_actbegin     VARCHAR2(20) := '';
    v_actend       VARCHAR2(20) := '';
    v_progress     VARCHAR2(200) := ''; -- 形象进度
    v_area         VARCHAR2(200) := ''; -- 项目面积
    v_prjlevel     VARCHAR2(3) := ''; -- 项目等级
    --------------
    n_sum_construct NUMBER(10, 2) := 0; -- 土建分数
    n_sum_electric  NUMBER(10, 2) := 0; -- 电气分数
    n_sum_water     NUMBER(10, 2) := 0; -- 水暖分数
    n_sum_safe      NUMBER(10, 2) := 0; -- 安全分数
  
  BEGIN
    prm_appcode := '1';
    IF to_number(prm_child1_sum) > to_number(prm_child1) OR
       to_number(prm_child1_sum) < 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '输入的检查项目1实得分数大于满分或实得分数小于0';
      RETURN;
    END IF;
    IF to_number(prm_child2_sum) > to_number(prm_child2) OR
       to_number(prm_child2_sum) < 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '输入的检查项目2实得分数大于满分或实得分数小于0';
      RETURN;
    END IF;
    IF to_number(prm_child3_sum) > to_number(prm_child3) OR
       to_number(prm_child3_sum) < 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '输入的检查项目3实得分数大于满分或实得分数小于0';
      RETURN;
    END IF;
    --1.检查轮次，是否完成了安全检查和质量检查
    IF prm_batchno = '' OR prm_batchno IS NULL THEN
      prm_appcode := '-1';
      prm_errmsg  := '没有输入有效的检查轮次号。';
      RETURN;
    END IF;
    -- 1.1.检查该轮次是否做过安全检查
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_safe
       AND t.join_type = def_jointype_join;
    IF n_count <= 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '该项目在检查轮次' || prm_batchno || '没有有效的参加评比的安全检查。';
      RETURN;
    END IF;
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_construct
       AND t.join_type = def_jointype_join;
    IF n_count <= 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '该项目在检查轮次' || prm_batchno || '没有有效的参加评比的土建检查。';
      RETURN;
    END IF;
    -- 获取监理部计分
    prc_calcsuperchk(prm_checkgroup,
                     prm_batchno,
                     prm_prjid,
                     prm_deptid,
                     prm_checktime,
                     prm_checkuser,
                     prm_progress,
                     prm_memo,
                     prm_construction_comment,
                     prm_water_comment,
                     prm_electric_comment,
                     prm_safe_comment,
                     prm_appcode,
                     prm_errmsg,
                     v_progress,
                     v_contructtype,
                     v_actbegin,
                     v_actend,
                     v_area,
                     v_prjlevel,
                     n_ratio_construct,
                     n_sum_construct,
                     n_ratio_water,
                     n_sum_water,
                     n_ratio_electric,
                     n_sum_electric,
                     n_sum_safe);
    IF prm_appcode <> '1' THEN
      RETURN;
    END IF;
    UPDATE v_prj_supervisor_majorcheck
       SET dept_id              = prm_deptid,
           progress             = v_progress,
           batchno              = to_number(prm_batchno),
           checkdate            = to_date(prm_checktime, 'yyyy-mm-dd'),
           check_user           = prm_checkuser,
           memo                 = prm_memo,
           construct            = v_contructtype,
           act_begin            = to_date(v_actbegin, 'yyyy-mm-dd'),
           act_end              = to_date(v_actend, 'yyyy-mm-dd'),
           prj_area             = v_area,
           prj_level            = v_prjlevel,
           construction         = '占总分比例为' ||
                                  to_char(n_ratio_construct * 100) || '％',
           construction_sum     = n_sum_construct,
           construction_comment = prm_construction_comment,
           water                = '占总分比例为' || to_char(n_ratio_water * 100) || '％',
           water_sum            = n_sum_water,
           water_comment        = prm_water_comment,
           electric             = '占总分比例为' ||
                                  to_char(n_ratio_electric * 100) || '％',
           electric_sum         = n_sum_electric,
           electric_comment     = prm_electric_comment,
           security_sum         = n_sum_safe,
           security_comment     = prm_safe_comment,
           construction_ratio   = n_ratio_construct,
           water_ratio          = n_ratio_water,
           electric_ratio       = n_ratio_electric,
           total_sum            = n_sum_construct * n_ratio_construct +
                                  n_sum_electric * n_ratio_electric +
                                  n_sum_safe * n_ratio_safe +
                                  n_sum_water * n_ratio_water +
                                  nvl(to_number(prm_child1_sum), 0) +
                                  nvl(to_number(prm_child2_sum), 0) +
                                  nvl(to_number(prm_child3_sum), 0),
           
           child1_sum     = to_number(prm_child1_sum),
           child1_comment = prm_child1_comment,
           child2_sum     = to_number(prm_child2_sum),
           child2_comment = prm_child2_comment,
           child3_sum     = to_number(prm_child3_sum),
           child3_comment = prm_child3_comment
     WHERE checkgroup_no = prm_checkgroup;
  
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := SQLERRM;
  END;

END pkg_prjcheck;
/

CREATE OR REPLACE PACKAGE pkg_prjcheck IS
  -- ���������Ϣ
  PROCEDURE prc_savepoint(prm_prjid          IN VARCHAR2,
                          prm_checkgroup     IN VARCHAR2, -- ��鵥���
                          prm_checkdate      IN VARCHAR2,
                          prm_checkitem      IN VARCHAR2,
                          prm_act_score      IN VARCHAR2,
                          prm_jsdw_id        IN VARCHAR2, -- ���赥λ
                          prm_sgdw_id        IN VARCHAR2, -- ʩ����λ
                          prm_construct_type IN VARCHAR2, -- �ṹ��ʽ
                          prm_prj_progress   IN VARCHAR2,
                          prm_memo           IN VARCHAR2,
                          prm_appcode        OUT VARCHAR2,
                          prm_errmsg         OUT VARCHAR2,
                          prm_checkgroup_out OUT VARCHAR2);
END pkg_prjcheck;
/
CREATE OR REPLACE PACKAGE BODY pkg_prjcheck IS
  -- ���������Ϣ
  PROCEDURE prc_savepoint(prm_prjid          IN VARCHAR2,
                          prm_checkgroup     IN VARCHAR2, -- ��鵥���
                          prm_checkdate      IN VARCHAR2,
                          prm_checkitem      IN VARCHAR2,
                          prm_act_score      IN VARCHAR2,
                          prm_jsdw_id        IN VARCHAR2, -- ���赥λ
                          prm_sgdw_id        IN VARCHAR2, -- ʩ����λ
                          prm_construct_type IN VARCHAR2, -- �ṹ��ʽ
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
    n_sum1      NUMBER(10, 2) := 0; -- �÷��ܼ�
    n_sum2      NUMBER(10, 2) := 0; -- Ӧ�÷��ܼ�
    n_sum3      NUMBER(10, 2) := 0; -- ʵ�÷��ܼ�
    n_ratio     NUMBER(10, 2) := 0; -- �÷���
  BEGIN
    prm_appcode := '1';
    -- 1.��ȡ��Ŀ��ţ������Ŀ����Ƿ��Ѿ����������ݿ�������
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
        prm_errmsg  := 'û���ҵ����Ϊ' || v_prjno || '����Ϣ';
        RETURN;
      WHEN too_many_rows THEN
        prm_appcode := '-1';
        prm_errmsg  := '���Ϊ' || v_prjno || '����Ϣ���ڶ���';
        RETURN;
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := SQLERRM;
        RETURN;
    END;
    -- 1.1.���۷��Ƿ�������
    BEGIN
      SELECT to_number(prm_act_score), to_date(prm_checkdate, 'yyyy-mm-dd')
        INTO n_score, d_checkdate
        FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '����Ŀ۷ֲ�������:' || prm_act_score || '����ʱ�䲻����������:' ||
                       prm_checkdate || SQLERRM;
        RETURN;
    END;
    -- 1.1.1.���۷��Ƿ񳬹������۷ֽ��
    BEGIN
      SELECT point - n_score, point
        INTO n_temp, n_point
        FROM t_checklist_prj
       WHERE check_code = prm_checkitem;
      IF n_score > n_point OR n_score < 0 THEN
        prm_appcode := '-1';
        prm_errmsg  := '����Ŀ۷�����:' || prm_act_score || '�������ɿ۷���' || n_point;
        RETURN;
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '���۷��Ƿ񳬹����ɿ۷�ֵʱ����' || SQLERRM;
        RETURN;
    END;
    -- 1.2.���ʱ���Ƿ�����Ŀ����Ч�ڷ�Χ��
    IF d_checkdate > d_enddate THEN
      prm_appcode := '-1';
      prm_errmsg  := '����������ڿ�������' || to_char(d_enddate, 'YYYY-MM-DD');
      RETURN;
    END IF;
    IF d_checkdate < d_startdate THEN
      prm_appcode := '-1';
      prm_errmsg  := '����������ڿ�������' || to_char(d_startdate, 'YYYY-MM-DD');
      RETURN;
    END IF;
    -- 1.3.�����Ŀ���Ƿ��й�����Ϣ
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_building
     WHERE prj_id = n_prjid;
    IF n_count <= 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '���' || v_prjno || '��û��¼����Ч����';
      RETURN;
    END IF;
    n_count := 0;
    -- 2.�����Ŀ�Ƿ��������ܼ࣬���û�������ܼ࣬��ʾȥ�����ܼ�
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_org
     WHERE prj_id = n_prjid
       AND prj_role =
           fun_getcodevalue(codetype => 'PRJ_ROLE', codedesc => '�ܼ�');
    IF n_count < 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '���' || v_prjno || '��û����Ч���ܼ�';
      RETURN;
    END IF;
    IF n_count > 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '���' || v_prjno || '�������˶����Ч���ܼ�';
      RETURN;
    END IF;
    SELECT emp_id
      INTO v_emp_id
      FROM v_prj_org
     WHERE prj_id = n_prjid
       AND prj_role =
           fun_getcodevalue(codetype => 'PRJ_ROLE', codedesc => '�ܼ�');
    n_count := 0;
    -- 3.�����Ŀ�Ƿ�¼����ʩ����λ�Ͳν���λ���������¼�룬��ʾ����
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_unit
     WHERE prj_id = n_prjid
       AND unit_type =
           fun_getcodevalue(codetype => 'UNIT_TYPE', codedesc => '���赥λ');
    IF n_count < 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '���' || v_prjno || '��û����Ч�Ľ��赥λ';
      RETURN;
    END IF;
    -- Ŀǰ��ʱֻ��һ�����赥λ
    IF n_count > 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '���' || v_prjno || '�������˶����Ч�Ľ��赥λ';
      RETURN;
    END IF;
    -- ����Ƿ���¼���˷ֹ�˾��Ϣ
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_unit_relate
     WHERE prj_id = n_prjid;
    IF n_count < 1 THEN
      prm_appcode := '-1';
      prm_errmsg  := '���' || v_prjno || '��û����Ч�ķֹ�˾��Ϣ';
      RETURN;
    END IF;
    -- 3.���Ƶ�ǰ��Ŀ�Ļ�����Ϣ�����е������ֶ�
    -- 3.1.��������λ�����
    -- ���û�м�����룬����Ϊ�ǵ�һ����Ȼ�󷵻ر���
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
  
    -- 4.����prj_majorcheck�Ļ���
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
    -- ���¼���
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

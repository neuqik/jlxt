CREATE OR REPLACE PACKAGE pkg_prjcheck IS
  def_checktype_safe      CONSTANT VARCHAR2(3) := '01';
  def_checktype_construct CONSTANT VARCHAR2(3) := '02';
  def_checktype_water     CONSTANT VARCHAR2(3) := '03';
  def_checktype_electric  CONSTANT VARCHAR2(3) := '04';
  ------
  def_jointype_join   CONSTANT VARCHAR2(3) := '1';
  def_jointype_nojoin CONSTANT VARCHAR2(3) := '0';
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
  -- ���ɼ�鱨��
  PROCEDURE prc_checkreport(prm_majorcheck_id IN VARCHAR2,
                            prm_appcode       OUT VARCHAR2,
                            prm_errmsg        OUT VARCHAR2,
                            prm_reportid      OUT VARCHAR2);
  ------------------------------------------------------------------
  /*��Ŀ��������½���鵥
  *
  *
  ------------------------------------------------------------------*/
  PROCEDURE prc_newsuperchk(prm_checkgroup           IN VARCHAR2,
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
                            prm_errmsg               OUT VARCHAR2);
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
    n_ratio     NUMBER(10, 2) := 0; -- 
    v_checktype VARCHAR2(3) := ''; -- �������
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
      prm_appcode := '-1';
      prm_errmsg  := '���' || v_prjno || 'û����Ч�ļ�鵥�š�';
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
  -- ���ɼ�鱨��
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
    -- 1.����majorcheck_id���
    SELECT check_type, checkgroup_no
      INTO v_checktype, v_checkgroup_no
      FROM v_prj_majorcheck
     WHERE id = prm_majorcheck_id;
    -- 2.��ȡchecklist
    FOR c IN (SELECT *
                FROM t_checklist_prj
               WHERE check_type = v_checktype
                 AND MEMBER = '1'
                 AND valid = '1'
               ORDER BY sort_number) LOOP
      -- ȡ��һ��
      SELECT checkcontent || '(' || trunc(point) || '��)'
        INTO v_checkcontent_up
        FROM t_checklist_prj
       WHERE check_code = c.upper_code;
      -- ����Ƿ�������
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
          prm_errmsg  := '�����Ŀ:' || c.check_code || SQLERRM;
          raise_application_error(-20001, prm_errmsg);
      END;
      -- ���뱨���
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
    -- �����ܼ�
    SELECT nvl(SUM(point), 0),
           nvl(SUM(deserve_point), 0),
           nvl(SUM(act_score), 0),
           nvl(MAX(sort_number), 0)
      INTO n_sum_point, n_sum_deserve, n_sum_act, n_max_sort
      FROM prj_checkreport
    -- �����ܼ�
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
       '�ܼ�',
       n_sum_point,
       n_sum_deserve,
       n_sum_act,
       '�÷���:' || to_char(trunc(n_sum_act / n_sum_deserve, 2) * 100) || '%',
       v_reportid,
       v_checkgroup_no,
       n_max_sort + 1);
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := SQLERRM;
  END;
  ------------------------------------------------------------------
  /*��Ŀ��������½���鵥
  *
  *
  ------------------------------------------------------------------*/
  PROCEDURE prc_newsuperchk(prm_checkgroup           IN VARCHAR2, --�¼�鵥��
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
                            prm_errmsg               OUT VARCHAR2) IS
  
    n_count           NUMBER(10) := 0;
    n_ratio_construct NUMBER(5, 2) := 0; -- ����ռ��
    n_ratio_electric  NUMBER(5, 2) := 0; -- ����ռ��
    n_ratio_water     NUMBER(5, 2) := 0; -- ˮůռ��
    n_count_construct NUMBER(10) := 0; -- ��������
    n_count_electric  NUMBER(10) := 0; -- ��������
    n_count_water     NUMBER(10) := 0; -- ˮů����
    --------------
    v_contructtype VARCHAR2(200) := ''; -- �ṹ����
    v_actbegin     VARCHAR2(20) := '';
    v_actend       VARCHAR2(20) := '';
    v_progress     VARCHAR2(200) := ''; -- �������
    v_area         VARCHAR2(200) := ''; -- ��Ŀ���
    v_prjlevel     VARCHAR2(3) := ''; -- ��Ŀ�ȼ�
    --------------
    n_sum_construct NUMBER(10, 2) := 0; -- ��������
    n_sum_electric  NUMBER(10, 2) := 0; -- ��������
    n_sum_water     NUMBER(10, 2) := 0; -- ˮů����
    n_sum_safe      NUMBER(10, 2) := 0; -- ��ȫ����
  BEGIN
    prm_appcode := '1';
    --1.����ִΣ��Ƿ�����˰�ȫ�����������
    IF prm_batchno = '' OR prm_batchno IS NULL THEN
      prm_appcode := '-1';
      prm_errmsg  := 'û��������Ч�ļ���ִκš�';
      RETURN;
    END IF;
    -- 1.1.�����ִ��Ƿ�������ȫ���
    SELECT COUNT(1)
      INTO n_count
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_safe
       AND t.join_type = def_jointype_join;
    IF n_count <= 0 THEN
      prm_appcode := '-1';
      prm_errmsg  := '����Ŀ�ڼ���ִ�' || prm_batchno || 'û����Ч�Ĳμ����ȵİ�ȫ��顣';
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
      prm_errmsg  := '����Ŀ�ڼ���ִ�' || prm_batchno || 'û����Ч�Ĳμ����ȵ�������顣';
      RETURN;
    END IF;
    -- �ж��Ƿ���ˮů
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count_water
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_water
       AND t.join_type = def_jointype_join;
    -- �ж��Ƿ��е���
    n_count := 0;
    SELECT COUNT(1)
      INTO n_count_electric
      FROM v_prj_majorcheck t
     WHERE t.prj_id = to_number(prm_prjid)
       AND t.batchno = to_number(prm_batchno)
       AND t.check_type = def_checktype_electric
       AND t.join_type = def_jointype_join;
    -- 1.3.�����ˮů�������е���
    IF n_count_water > 0 AND n_count_electric > 0 THEN
      n_ratio_electric  := 0.1;
      n_ratio_water     := 0.1;
      n_ratio_construct := 0.35;
    END IF;
    -- �����ˮů��û����
    IF n_count_water > 0 AND n_count_electric <= 0 THEN
      n_ratio_water     := 0.1;
      n_ratio_electric  := 0;
      n_ratio_construct := 0.45;
    END IF;
    -- ����е���ûˮů
    IF n_count_water <= 0 AND n_count_electric > 0 THEN
      n_ratio_water     := 0;
      n_ratio_electric  := 0.1;
      n_ratio_construct := 0.45;
    END IF;
    -- ���û����ûˮů
    IF n_count_water <= 0 AND n_count_electric <= 0 THEN
      n_ratio_water     := 0;
      n_ratio_electric  := 0;
      n_ratio_construct := 0.55;
    END IF;
    --2.��ȡ�ṹ����
    BEGIN
      SELECT fun_getconstruct(to_number(prm_prjid))
        INTO v_contructtype
        FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '��ȡ�ṹ���ͳ���,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --3.��ȡʵ�ʿ�������
    BEGIN
      SELECT fun_getactbegin(to_number(prm_prjid))
        INTO v_actbegin
        FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '��ȡʵ�ʿ������ڳ���,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --4.��ȡ�ƻ���������
    BEGIN
      SELECT fun_getactend(to_number(prm_prjid)) INTO v_actend FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '��ȡ�ƻ��������ڳ���,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    ---
    BEGIN
      SELECT fun_getimage(to_number(prm_prjid)) INTO v_progress FROM dual;
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '��ȡ������ȳ���,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --5.��ȡ��Ŀ���--6.��ȡ��Ŀ�ȼ�
    BEGIN
      SELECT to_char(t.prj_area), prj_level
        INTO v_area, v_prjlevel
        FROM v_prj_info t
       WHERE t.id = to_number(prm_prjid);
    EXCEPTION
      WHEN OTHERS THEN
        prm_appcode := '-1';
        prm_errmsg  := '��ȡ��Ŀ�������Ŀ�ȼ�����,PRJID:' || prm_prjid || SQLERRM;
        raise_application_error(-20001, prm_errmsg);
    END;
    --7.��������
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
    --8.����ˮů
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
    --9.�������
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
    --10.���㰲ȫ
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
    --11.�����ܷ�
    --12.����
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
       valid)
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
       'ռ�ֱܷ���Ϊ' || to_char(n_ratio_construct * 100) || '%',
       n_sum_construct,
       prm_construction_comment,
       'ռ�ֱܷ���Ϊ' || to_char(n_ratio_water * 100) || '%',
       n_sum_water,
       prm_water_comment,
       'ռ�ֱܷ���Ϊ' || to_char(n_ratio_electric * 100) || '%',
       n_sum_electric,
       prm_electric_comment,
       'ռ�ֱܷ���Ϊ35%',
       n_sum_safe,
       prm_safe_comment,
       n_ratio_construct,
       n_ratio_water,
       n_ratio_electric,
       0.35, -- ��ȫ����
       n_sum_construct + n_sum_electric + n_sum_safe + n_sum_water,
       '1');
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := SQLERRM;
  END;
END pkg_prjcheck;
/

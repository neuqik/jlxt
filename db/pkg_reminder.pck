CREATE OR REPLACE PACKAGE pkg_reminder IS
  -- 检查生日按月提醒
  PROCEDURE prc_birth(prm_id      IN VARCHAR2,
                      prm_appcode OUT VARCHAR2,
                      prm_errmsg  OUT VARCHAR2);
END pkg_reminder;
/
CREATE OR REPLACE PACKAGE BODY pkg_reminder IS

  -- 检查生日提醒每个月过生日人员，即按月提醒；
  PROCEDURE prc_birth(prm_id      IN VARCHAR2,
                      prm_appcode OUT VARCHAR2,
                      prm_errmsg  OUT VARCHAR2) IS
    v_result VARCHAR2(4000) := to_char(SYSDATE, 'MM') || '月过生日的人:';
    i        NUMBER := 0;
  BEGIN
    prm_appcode := '1';
    --
    FOR c IN (SELECT emp_name,
                     birth,
                     emp_id,
                     fun_getcodedesc('DEPT_ID', dept_id) dept_id
                FROM hrd_emp
               WHERE to_char(birth, 'MM') = to_char(SYSDATE, 'MM')) LOOP
      v_result := v_result || c.emp_name || '(' || c.dept_id ||
                  to_char(c.birth, 'YYYY-MM-DD') || '),';
      i        := i + 1;
    END LOOP;
    v_result := v_result || '共' || i || '人';
    UPDATE adm_remind SET RESULT = substrb(v_result,1,4000) WHERE id = to_number(prm_id);
  EXCEPTION
    WHEN OTHERS THEN
      prm_appcode := '-1';
      prm_errmsg  := SQLERRM;
      UPDATE adm_remind
         SET RESULT = prm_errmsg
       WHERE id = to_number(prm_id);
  END;

END pkg_reminder;
/

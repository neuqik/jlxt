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
    v_result VARCHAR2(4000) := '本月过生日的人:';
  BEGIN
    prm_appcode := '1';
    --
    FOR c IN (SELECT emp_name, birth, emp_id
                FROM hrd_emp
               WHERE to_char(birth, 'MM') = to_char(SYSDATE, 'MM')) LOOP
      v_result := v_result || c.emp_name || '(' || c.emp_id || '),';
    END LOOP;
    UPDATE adm_remind SET RESULT = v_result WHERE id = to_number(prm_id);
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

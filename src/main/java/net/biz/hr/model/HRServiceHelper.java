package net.biz.hr.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.biz.hr.vo.HRD_EMP;
import net.biz.hr.vo.HRD_EMP_CONTRACT;
import net.biz.hr.vo.RegQueryParam;
import net.biz.util.JDBCOracleUtil;

import org.springframework.stereotype.Service;

@Service("hrServiceHelper")
public class HRServiceHelper {
	/**
	 * 根据高级查询参数，生成SQL语句的WHERE 条件
	 * 
	 * @param qp
	 * @return
	 * @throws Exception
	 */
	public String getConditionByRegQueryParam(RegQueryParam qp)
			throws Exception {
		if (qp.isEmpty())
			return "";
		// 非空
		List<String> where = new ArrayList<String>();
		;
		// 如果录入了EMP_ID
		if (!"".equals(qp.getEMP_ID())) {
			where.add(" (EMP_ID LIKE '" + qp.getEMP_ID() + "$') ");
		}
		// 如果录入了姓名
		if (!"".equals(qp.getEMP_NAME())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP WHERE EMP_NAME LIKE '$"
					+ qp.getEMP_NAME() + "$')) ");
		}
		if (!"".equals(qp.getDEPT_ID())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP WHERE DEPT_ID = '"
					+ qp.getDEPT_ID() + "')) ");
		}
		if (!"".equals(qp.getMEMO())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE MEMO LIKE '$"
					+ qp.getMEMO() + "$')) ");
		}
		if (!"".equals(qp.getREGMAJOR1())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE REGMAJOR1 = '"
					+ qp.getREGMAJOR1() + "')) ");
		}
		if (!"".equals(qp.getREGMAJOR2())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE REGMAJOR2 = '"
					+ qp.getREGMAJOR2() + "')) ");
		}
		if (!"".equals(qp.getREGMAJOR3())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE REGMAJOR3 = '"
					+ qp.getREGMAJOR3() + "')) ");
		}
		if (!"".equals(qp.getCERTIFICATE())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE CERTIFICATE LIKE '$"
					+ qp.getCERTIFICATE() + "$')) ");
		}
		if (!"".equals(qp.getCERTNUMBER())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE CERTNUMBER LIKE '$"
					+ qp.getCERTNUMBER() + "$')) ");
		}
		if (!"".equals(qp.getCONTINUE_EDU())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE CONTINUE_EDU LIKE '$"
					+ qp.getCONTINUE_EDU() + "$')) ");
		}
		if (!"".equals(qp.getPERF_STUDY())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE PERF_STUDY LIKE '$"
					+ qp.getPERF_STUDY() + "$')) ");
		}
		if (!"".equals(qp.getREGNO())) {
			where.add(" (EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP_REG WHERE REGNO LIKE '$"
					+ qp.getREGNO() + "$')) ");
		}

		String wheres = where.toString().replaceAll("[,]", "AND");
		wheres = wheres.substring(1, wheres.length() - 1);
		return " WHERE " + wheres;
	}

	/**
	 * 保存劳动合同信息
	 * 
	 * @param inserts
	 * @param updates
	 * @param deletes
	 * @param empId
	 * @throws Exception
	 */
	public void saveEmpLabour(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception {
		// 1.执行插入
		String sql = "insert into hrd_emp_contract (ID,EMP_ID,CONTRACT_ID,CONTRACT_NAME,CONTRACTTYPE,CONTRACTPROP,BEGINDATE,ENDDATE,ADDITION,MEMO,VALID,ACCIDENT_START,ACCIDENT_END,INSU) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			HRD_EMP_CONTRACT row = (HRD_EMP_CONTRACT) it.next();
			List<Object> params = new ArrayList<Object>();
			String ID = JDBCOracleUtil.getID();
			params.add(ID);
			params.add(empId);
			params.add(row.getCONTRACT_ID());
			params.add(row.getCONTRACT_NAME());
			params.add(row.getCONTRACTTYPE());
			params.add(row.getCONTRACTPROP());
			params.add(row.getBEGINDATEForSqlDate());
			params.add(row.getENDDATEForSqlDate());
			params.add(row.getADDITION());
			params.add(row.getMEMO());
			params.add("1");
			params.add(row.getACCIDENT_STARTForSqlDate());
			params.add(row.getACCIDENT_ENDForSqlDate());
			params.add(row.getINSU());
			JDBCOracleUtil.ExecuteDML(sql.toUpperCase(), params);
		}
		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			HRD_EMP_CONTRACT row = (HRD_EMP_CONTRACT) it1.next();
			String id = row.getID();
			List<Object> params = new ArrayList<Object>();
			String sql1 = "update hrd_emp_contract set CONTRACT_ID=?,CONTRACT_NAME=?,CONTRACTTYPE=?,CONTRACTPROP=?,BEGINDATE=?,ENDDATE=?,ADDITION=?,MEMO=?,ACCIDENT_START=?,ACCIDENT_END=?,INSU=? where id="
					+ id;
			params.add(row.getCONTRACT_ID());
			params.add(row.getCONTRACT_NAME());
			params.add(row.getCONTRACTTYPE());
			params.add(row.getCONTRACTPROP());
			params.add(row.getBEGINDATEForSqlDate());
			params.add(row.getENDDATEForSqlDate());
			params.add(row.getADDITION());
			params.add(row.getMEMO());
			params.add(row.getACCIDENT_STARTForSqlDate());
			params.add(row.getACCIDENT_ENDForSqlDate());
			params.add(row.getINSU());

			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}
		// 3.执行删除
		Iterator<Object> it11 = deletes.iterator();

		while (it11.hasNext()) {
			HRD_EMP_CONTRACT row = (HRD_EMP_CONTRACT) it11.next();
			List<Object> params = new ArrayList<Object>();
			params.add(row.getID());
			String sql1 = "update hrd_emp_contract set valid='0' where id=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}

	}

	/**
	 * 保存员工劳动关系信息
	 * 
	 * @param emp
	 * @throws Exception
	 */
	public void saveEmpLabour(HRD_EMP emp) throws Exception {
		String sql = "	update hrd_emp set pension_no=?, medica_no=?, insustatus=? where emp_id='"
				+ emp.getEMP_ID() + "'";
		List<Object> params = new ArrayList<Object>();
		params.add(emp.getPENSION_NO());
		params.add(emp.getMEDICA_NO());
		params.add(emp.getINSUSTATUS());

		JDBCOracleUtil.ExecuteDML(sql, params);
	}
}

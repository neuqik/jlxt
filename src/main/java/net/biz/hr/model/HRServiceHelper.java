package net.biz.hr.model;

import java.util.ArrayList;
import java.util.List;

import net.biz.hr.vo.RegQueryParam;

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
		wheres = wheres.substring(1, wheres.length()-1);
		return " WHERE " + wheres;
	}
}

package net.biz.query.web;

import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;

import net.biz.component.BaseAction;
import net.biz.framework.codelist.CodeList;
import net.biz.hr.vo.HRD_EMP;
import net.biz.util.JDBCOracleUtil;

@Path("/query")
public class QueryAction extends BaseAction {
	/**
	 * 打开员工查询窗口
	 * 
	 * @return
	 */
	@Path("/queryEmp")
	@GET
	@POST
	public String toQueryEmp() {
		return "forward:query/view/queryEmp.jsp";
	}

	/**
	 * 查看员工基本信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpBase")
	@POST
	@GET
	public String toViewEmpBase(Map<String, Object> model) {
		String empId = MVC.ctx().getRequest().getParameter("empId");

		try {
			// 查询
			// 1.获取Codelist
			String code1 = "DEPT_ID|GENDER|EMPTYPE|ROLENAME|TITLE_ID|TITLENAME|TITLEWORK|INSUSTATUS|MARRIAGE|POLITIC|ARCHIVEKEEP|MASTER|LOCATION1|NATION";

			model.put("EMP_ID", empId);
			String sql = "SELECT id, emp_id, emp_name, nation, to_char(birth,'yyyy-mm-dd') birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, to_char(joindate,'yyyy-mm-dd') joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, to_char(graddate,'yyyy-mm-dd') graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep FROM HRD_EMP WHERE EMP_ID='"
					+ empId + "' AND ROWNUM=1";
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			if(result.size()<=0){
				return dwz.getFailedJson("未找到编号为"+empId+"的员工信息!").toString(); 
			}
			HRD_EMP emp = new HRD_EMP();
			// map转换成bean
			BeanUtils.populate(emp, result.get(0));
			model.put("emp", emp);

			// 代码值
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 获取LOCATION2和LOCATION3的CodeList值
			model.put("LOCATION2", CodeList.getLocation2(emp.getLOCATION1()));
			model.put("LOCATION3", CodeList.getLocation3(emp.getLOCATION2()));
			model.put("READONLY", true);
			return "forward:hr/view/editEmpBase.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 显示员工照片
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpPic")
	@POST
	@GET
	public String toViewEmpPic(Map<String, Object> model) {
		try {
			String empId = MVC.ctx().getRequest().getParameter("empId");
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT EMP_NAME,IDCARD,DEPT_ID FROM HRD_EMP WHERE EMP_ID='"
							+ empId + "'");
			model.put("EMP_ID", empId);
			model.put("EMP_NAME", (String) result.get(0).get("EMP_NAME"));
			model.put("IDCARD", (String) result.get(0).get("IDCARD"));
			model.put("DEPT_ID", CodeList.getCodeDesc("DEPT_ID",
					((String) result.get(0).get("DEPT_ID"))));
			model.put("READONLY", true);
			return "forward:hr/view/showEmpPic.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 显示员工绩效信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpPerf")
	@POST
	@GET
	public String toViewEmpPerf(Map<String, Object> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		model.put("READONLY", true);
		return "forward:query/view/viewEmpPerf.jsp";
	}

	/**
	 * 查看员工培训记录
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpTrans")
	@POST
	@GET
	public String toViewEmpTrans(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpTrans.jsp";
	}

	/**
	 * 查看员工家庭
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpFamily")
	@POST
	@GET
	public String toViewEmpFamily(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpFamily.jsp";
	}

	/**
	 * 查看员工劳动合同
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpJob")
	@POST
	@GET
	public String toViewEmpJob(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpJob.jsp";
	}

	/**
	 * 查看员工奖惩
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpReward")
	@POST
	@GET
	public String toViewEmpReward(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpReward.jsp";
	}

	/**
	 * 查看员工工作经历
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpWork")
	@POST
	@GET
	public String toViewEmpWork(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpWork.jsp";
	}

	/**
	 * 查看员工职称
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpProf")
	@POST
	@GET
	public String toViewEmpProf(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpProf.jsp";
	}

	/**
	 * 查看员工注册
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpReg")
	@POST
	@GET
	public String toViewEmpReg(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpReg.jsp";
	}

	/**
	 * 查看员工认证
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpCert")
	@POST
	@GET
	public String toViewEmpCert(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpCert.jsp";
	}

	/**
	 * 查看员工变动
	 * 
	 * @param model
	 * @return
	 */
	@Path("/viewEmpTransfer")
	@POST
	@GET
	public String toViewEmpTransfer(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:query/view/viewEmpTransfer.jsp";
	}
}

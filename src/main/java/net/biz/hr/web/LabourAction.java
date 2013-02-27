package net.biz.hr.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.hr.model.IHRService;
import net.biz.hr.vo.HRD_EMP_EDU;
import net.biz.hr.vo.HRD_EMP_REG;
import net.biz.util.BeanUtil;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;

@Path("/labour")
public class LabourAction extends BaseAction {
	@Resource(name = "hrServiceImpl")
	private IHRService myservice = (IHRService) BeanUtil
			.getBean("hrServiceImpl");

	@Path("/list")
	@GET
	@POST
	public String toList(Map<String, Object> model) {
		return "forward:hr/labour/view/showLabour.jsp";
	}

	@Path("/maintainLabour")
	@GET
	@POST
	/**
	 * 维护劳动关系打开界面
	 * @param model
	 * @return
	 */
	public String toMaintainLabour(Map<String, Object> model) {
		return "forward:hr/labour/view/maintainLabour.jsp";
	}

	/**
	 * 显示员工注册信息
	 * 
	 * @return
	 */
	@Path("/showRegEmployee")
	@GET
	@POST
	public String toShowRegEmployee() {
		return "forward:hr/reg/view/showRegEmployee.jsp";
	}

	/**
	 * 添加员工学历信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/addEmpEdu")
	@POST
	@GET
	public String toAddEmpEdu(Map<String, Object> model) {
		// 1.获取Codelist
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/reg/view/addEmpEdu.jsp";
	}

	@Path("/saveNewEmpEdu")
	@POST
	@GET
	public String toSaveNewEmpEdu(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			HRD_EMP_EDU edu = (HRD_EMP_EDU) parseRequest(req, new HRD_EMP_EDU());
			myservice.saveNewEmpEdu(edu);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", edu.getEMP_ID());
			return successJSONReload("添加员工学历信息成功，员工编号：" + edu.getEMP_ID(),
					"dialog", "labour/showEmpEdu", "tjxl");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 编辑员工学历信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editEmpEdu")
	@POST
	@GET
	public String toEditEmpEdu(Map<String, Object> model) {
		String empId = MVC.ctx().getRequest().getParameter("empId");
		String id = getParam("ID");
		try {
			// 查询

			model.put("EMP_ID", empId);
			String sql = "select ID,EMP_ID,GRADUATION,TO_CHAR(GRADUATEDATE,'YYYY-MM-DD') GRADUATEDATE,MAJOR,GRADUATENO,MEMO,VALID  from V_HRD_EMP_EDU WHERE ID="
					+ id;
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			HRD_EMP_EDU edu = new HRD_EMP_EDU();
			// map转换成bean
			BeanUtils.populate(edu, result.get(0));
			model.put("edu", edu);
			return "forward:hr/reg/view/editEmpEdu.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	@Path("/saveEditEmpEdu")
	@POST
	@GET
	public String toSaveEditEmpEdu(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			HRD_EMP_EDU edu = (HRD_EMP_EDU) parseRequest(req, new HRD_EMP_EDU());
			myservice.saveEditEmpEdu(edu);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", edu.getEMP_ID());
			model.put("empId", edu.getEMP_ID());
			return successJSONReload("修改员工学历信息成功，员工编号：" + edu.getEMP_ID(),
					"dialog", "labour/showEmpEdu", "xgxl");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 删除注册信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/dropEmpEdu")
	@POST
	@GET
	public String toDropEmpEdu(Map<String, String> model) {
		try {
			String empId = MVC.ctx().getRequest().getParameter("empId");
			String id = getParam("ID");

			myservice.dropEmpEdu(id);
			// 设置员工编号，供其他页面使用
			return successJSONReload("删除员工学历信息成功，员工编号：" + empId, "navTab",
					"labour/showEmpEdu", "scxl");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/*************************************************************************************************/
	/**
	 * 查询和修改员工学历信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpEdu")
	@POST
	@GET
	public String toShowEmpEdu(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/reg/view/showEmpEdu.jsp";
	}

	/**
	 * 添加员工执业注册信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/addEmpReg")
	@POST
	@GET
	public String toAddEmpReg(Map<String, Object> model) {
		// 1.获取Codelist
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		String code1 = "REGTYPE|REGLEVEL|REGMAJOR";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:hr/reg/view/addEmpReg.jsp";
	}

	@Path("/saveNewEmpReg1")
	@POST
	@GET
	public String toSaveNewEmpReg1(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			HRD_EMP_REG reg = (HRD_EMP_REG) parseRequest(req, new HRD_EMP_REG());
			myservice.saveNewEmpReg(reg);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", reg.getEMP_ID());
			return successJSONReload("添加员工注册信息成功，员工编号：" + reg.getEMP_ID(),
					"dialog", "labour/showEmpReg", "tjzc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 编辑员工注册信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editEmpReg")
	@POST
	@GET
	public String toEditEmpReg(Map<String, Object> model) {
		String empId = MVC.ctx().getRequest().getParameter("empId");
		String id = getParam("ID");
		try {
			// 查询
			// 1.获取Codelist
			String code1 = "REGTYPE|REGLEVEL|REGMAJOR";
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			model.put("EMP_ID", empId);
			String sql = "select ID,EMP_ID,REGTYPE,REGLEVEL, REGMAJOR1, REGMAJOR2,REGMAJOR3,REGNO，CERTIFICATE ，TO_CHAR(VALIDDATE,'YYYY-MM-DD') VALIDDATE,TO_CHAR(ISSUEDATE,'YYYY-MM-DD') ISSUEDATE,CERTNUMBER,TO_CHAR(CERTDATE,'YYYY-MM-DD') CERTDATE,TO_CHAR(CERTVALIDDATE,'YYYY-MM-DD') CERTVALIDDATE,MEMO,PERF_STUDY,CONTINUE_EDU,TO_CHAR(CONTINUE_DATE,'YYYY-MM-DD') CONTINUE_DATE,CONTINUE_NO from V_HRD_EMP_REG WHERE ID="
					+ id;
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			HRD_EMP_REG reg = new HRD_EMP_REG();
			// map转换成bean
			BeanUtils.populate(reg, result.get(0));
			model.put("reg", reg);
			return "forward:hr/reg/view/editEmpReg.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	@Path("/saveEditEmpReg")
	@POST
	@GET
	public String toSaveEditEmpReg(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			HRD_EMP_REG reg = (HRD_EMP_REG) parseRequest(req, new HRD_EMP_REG());
			myservice.saveEditEmpReg(reg);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", reg.getEMP_ID());
			model.put("empId", reg.getEMP_ID());
			return successJSONReload("修改员工注册信息成功，员工编号：" + reg.getEMP_ID(),
					"dialog", "labour/showEmpReg", "xgzc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 删除注册信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/dropEmpReg")
	@POST
	@GET
	public String toDropEmpReg(Map<String, String> model) {
		try {
			String empId = MVC.ctx().getRequest().getParameter("empId");
			String id = getParam("ID");

			myservice.dropEmpReg(id);
			// 设置员工编号，供其他页面使用
			return successJSONReload("删除员工注册信息成功，员工编号：" + empId, "navTab",
					"labour/showEmpReg", "sczc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/*************************************************************************************************/
	/**
	 * 查询和修改员工资质注册信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpReg")
	@POST
	@GET
	public String toShowEmpReg(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/reg/view/showEmpReg.jsp";
	}
}

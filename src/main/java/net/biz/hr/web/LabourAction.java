package net.biz.hr.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.hr.model.HRServiceHelper;
import net.biz.hr.model.IHRService;
import net.biz.hr.vo.HRD_EMP;
import net.biz.hr.vo.HRD_EMP_CONTRACT;
import net.biz.hr.vo.HRD_EMP_EDU;
import net.biz.hr.vo.HRD_EMP_REG;
import net.biz.hr.vo.LabourQueryParam;
import net.biz.hr.vo.RegQueryParam;
import net.biz.util.BeanUtil;
import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;

@Path("/labour")
public class LabourAction extends BaseAction {
	@Resource(name = "hrServiceImpl")
	private IHRService myservice = (IHRService) BeanUtil
			.getBean("hrServiceImpl");
	@Resource(name = "hrServiceHelper")
	private HRServiceHelper myhelper = (HRServiceHelper) BeanUtil
			.getBean("hrServiceHelper");

	@Path("/list")
	@GET
	@POST
	public String toList(Map<String, Object> model) {
		return "forward:hr/labour/view/showLabour.jsp";
	}

	/**
	 * 维护劳动关系打开界面
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpLabour")
	@GET
	@POST
	public String toShowEmpLabour(Map<String, Object> model) {
		return "forward:hr/labour/view/showEmpLabour.jsp";
	}

	/**
	 * 打开劳动关系编辑页面
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editEmpLabour")
	@GET
	@POST
	public String toEditEmpLabour(Map<String, Object> model) {
		try {
			String empId = getParam("empId");

			// 1.获取Codelist
			String code1 = "DEPT_ID|GENDER|EMPTYPE|ROLENAME|INSUSTATUS";
			model.put("EMP_ID", empId);
			String sql = "SELECT id, emp_id, emp_name, idcard, gender, to_char(birth,'yyyy-mm-dd') birth, age, emptype, dept_id, rolename, insustatus, memo, pension_no, medica_no FROM V_HRD_EMP WHERE EMP_ID='"
					+ empId + "' AND ROWNUM=1";
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			HRD_EMP emp = new HRD_EMP();
			// map转换成bean
			BeanUtils.populate(emp, result.get(0));
			model.put("emp", emp);
			// 代码值
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			return "forward:hr/labour/view/editEmpLabour.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 保存员工劳动关系信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpLabourGrid")
	@POST
	@GET
	public String toSaveEmpLabourGrid(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_CONTRACT.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_CONTRACT.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_CONTRACT.class);
			myhelper.saveEmpLabour(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 保存员工劳动关系信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpLabour")
	@POST
	@GET
	public String toSaveEmpLabour(Map<String, String> model) {
		try {
			HRD_EMP emp = (HRD_EMP) parseRequest(new HRD_EMP());
			myhelper.saveEmpLabour(emp);
			// 成功的json，清空后继续打开
			return successJSON("修改劳动关系成功，员工编号：" + emp.getEMP_ID(), "dialog",
					"labour/showEmpLabour", "ldgxwh");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 显示员工学历注册管理信息
	 * 
	 * @return
	 */
	@Path("/showRegEmployee")
	@GET
	@POST
	public String toShowRegEmployee(Map<String, Object> model) {
		model.put("regwhere", ""); // 清空初始查询条件
		return "forward:hr/reg/view/showRegEmployee.jsp";
	}
	/**
	 * 显示员工资质注册管理信息
	 * 
	 * @return
	 */
	@Path("/showReg")
	@GET
	@POST
	public String toShowReg(Map<String, Object> model) {
		model.put("regwhere", ""); // 清空初始查询条件
		return "forward:hr/reg/view/showEmpReg.jsp";
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

	/*************************************************************************************************/
	/**
	 * 显示高级查询窗口
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showAdvanceQuery")
	@POST
	@GET
	public String toShowAdvanceQuery(Map<String, Object> model) {
		try {
			// 生成codelist
			String code1 = "DEPT_ID|REGTYPE|REGLEVEL|REGMAJOR";
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			return "forward:hr/reg/view/queryAdvance.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	/**
	 * 根据输入查询信息
	 * 
	 * @return
	 */
	@Path("/queryByInput")
	@GET
	@POST
	public String toQueryByInput(Map<String, Object> model) {
		try {
			// 获取查询条件，保存到bean中
			RegQueryParam qp = (RegQueryParam) parseRequest(new RegQueryParam());
			// 拼SQL条件，生成SQL语句，供界面检查
			String where = myhelper.getConditionByRegQueryParam(qp);
			model.put("regwhere", where);
			model.put("qp", qp);
			return "forward:hr/reg/view/showRegEmployee.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/*************************************************************************************************/
	/**
	 * 显示劳动关系维护高级查询窗口
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showLabourQuery")
	@POST
	@GET
	public String toShowLabourQuery(Map<String, Object> model) {
		try {
			// 生成codelist
			String code1 = "DEPT_ID|INSUSTATUS";
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			model.put("currentDate", DateUtils.format(new Date()));
			return "forward:hr/labour/view/labourQuery.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	/**
	 * 根据输入查询信息
	 * 
	 * @return
	 */
	@Path("/queryLabourByInput")
	@GET
	@POST
	public String toQueryLabourByInput(Map<String, Object> model) {
		try {
			// 获取查询条件，保存到bean中
			LabourQueryParam qp = (LabourQueryParam) parseRequest(new LabourQueryParam());
			// 拼SQL条件，生成SQL语句，供界面检查
			String where = myhelper.getConditionByLabourQueryParam(qp);
			model.put("labourwhere", where);
			model.put("qp", qp);
			return "forward:hr/labour/view/showEmpLabour.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}
}

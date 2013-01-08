package net.biz.hr.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.component.Const;
import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import net.biz.framework.codelist.CodeList;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;
import net.biz.grid.gt.server.GridServerHandler;
import net.biz.hr.model.IHRService;
import net.biz.hr.vo.HRD_EMP_CERT;
import net.biz.hr.vo.HRD_EMP_FAMILY;
import net.biz.hr.vo.HRD_EMP_JOB;
import net.biz.hr.vo.HRD_EMP_PERF;
import net.biz.hr.vo.HRD_EMP_PROF;
import net.biz.hr.vo.HRD_EMP_REG;
import net.biz.hr.vo.HRD_EMP_REWARD;
import net.biz.hr.vo.HRD_EMP_TRAIN;
import net.biz.hr.vo.HRD_EMP_TRANSFER;
import net.biz.hr.vo.HRD_EMP_WORK;
import net.biz.hr.vo.HRD_Emp;
import net.biz.util.BeanUtil;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.config.ConfigConstant;
import org.eweb4j.mvc.MVC;
import org.eweb4j.mvc.upload.UploadFile;
import org.eweb4j.util.FileUtil;

@Path("/hrs")
public class HRAction extends BaseAction {

	@Resource(name = "hrServiceImpl")
	private IHRService myservice = (IHRService) BeanUtil
			.getBean("hrServiceImpl");

	@Path("/test1")
	@GET
	@POST
	public String doList(Map<String, Object> model) {
		return "forward:hr/view/test1.jsp";
	}

	@Path("/list")
	@GET
	@POST
	public String doTest1(Map<String, Object> model) {
		try {
			GridServerHandler handler = new GridServerHandler(MVC.ctx()
					.getRequest(), MVC.ctx().getResponse());
			int totalRowNum = 0;
			List<Map<String, Object>> result = myservice.queryList();
			totalRowNum = result.size();
			handler.setTotalRowNum(totalRowNum);
			handler.setData(result);
			return "out:" + handler.getLoadResponseText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 复杂表格的Action 支持： 1.服务器端分页 2.服务器端排序 3.服务器端过滤
	 * 
	 * @param model
	 * @return
	 */
	@Path("/queryAllList")
	@GET
	@POST
	public String toQueryAllList(Map<String, Object> model) {
		// 1.初始化参数对象和返回结果对象
		RequestInfo request = new RequestInfo();
		AppInfo app = new AppInfo();
		try {
			// 2.取过滤对象和排序对象
			List<FilterInfo> filters = handler.getFilterInfo();
			List<SortInfo> sorts = handler.getSortInfo();
			// 3.设置参数
			request.setFilters(filters);
			request.setSorts(sorts);
			request.setStartRow(handler.getStartRowNum());
			request.setPageSize(handler.getPageSize());
			request.setRowCount(-1);
			String sql = "SELECT ORDER_NO,EMPLOYEE,COUNTRY,CUSTOMER,ORDER2005,ORDER2006,ORDER2007,ORDER2008,TO_CHAR(DELIVERY_DATE,'YYYY-MM-DD') DELIVERY_DATE FROM ORDERS";
			request.setSQL(sql);
			// 4.执行服务
			app = myservice.queryListByPage(request);
			// 5.获取返回结果
			int totalCount = app.getRowCount();
			List<Map<String, Object>> result = app.getResultData();
			// 6.设置返回内容
			handler.setTotalRowNum(totalCount);
			handler.setData(result);

			return "out:" + handler.getLoadResponseText();
		} catch (Exception e) {
			app.setFail(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	@Path("/saveOrder")
	@GET
	@POST
	public String saveOrder(Map<String, Object> model) {
		List<Map> insertList = handler.getInsertedRecords();
		List<Map> updateList = handler.getUpdatedRecords();
		List<Map> deleteList = handler.getDeletedRecords();
		return null;
	}

	/**
	 * 做前后台交互的分页查询表格
	 * 
	 * @param model
	 * @return
	 */
	@Path("/test2")
	@GET
	@POST
	public String doTest2(Map<String, Object> model) {
		return "forward:hr/view/test2.jsp";
	}

	@Path("/getRsQryEventTypeList")
	@GET
	@POST
	public void getRsQryEventTypeList() {

		try {
			MVC.ctx().getResponse().setContentType("text/xml;charset=utf-8");
			MVC.ctx().getRequest().setCharacterEncoding("UTF-8");
			PrintWriter pw = new PrintWriter(MVC.ctx().getResponse()
					.getOutputStream());
			String xml = "<EFSFRAME efsframe=\"urn=www-efsframe-cn\" version=\"1.0\"><QUERYINFO totalpages=\"1\" records=\"1\"><ROW><EVENTTYPEID>0907000006</EVENTTYPEID><EVENTTYPENAME>张谦</EVENTTYPENAME><AFFAIRTYPENAME>42011819850604024X</AFFAIRTYPENAME><DISABLED>2</DISABLED><VISIBLE>zhangqian@163.com</VISIBLE></ROW></QUERYINFO><ERRORINFO><ERRORRESULT>00</ERRORRESULT></ERRORINFO></EFSFRAME>";
			pw.write(xml);
			pw.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 显示员工管理页面
	 */
	@Path("/showEmployee")
	@GET
	@POST
	public String toShowEmployee() {
		return "forward:hr/view/showEmployee.jsp";
	}

	/**
	 * 显示员工管理页面
	 */
	@Path("/queryEmployee")
	@GET
	@POST
	public String toQueryEmployee() {
		try {
			String sql = "SELECT ID,EMP_ID,EMP_NAME,EMPTYPE,TO_CHAR(BIRTH,'YYYY-MM-DD') BIRTH,DEPT_ID,GENDER,IDCARD,ROLENAME,WORKDATE,JOINDATE,TEL,EMERGENCY,LOCATION1,LOCATION2,LOCATION3,ARCHIVEKEEP,MEMO FROM V_HRD_EMP";
			// 1.初始化参数对象和返回结果对象
			RequestInfo request = wrapRequest(sql);
			// 2.得到返回结果
			AppInfo app = myservice.queryListByPage(request);
			// 3.返回json
			return "out:" + wrapResponse(app);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 校验身份证号码是否唯一
	 * 
	 * @param model
	 * @return
	 */
	@Path("/validIDCard")
	@POST
	@GET
	public String validIDCard(Map model) {
		String idCard = getParam("IDCARD");
		try {
			int rowcount = JDBCOracleUtil.executeTotalCount(
					"SELECT 1 FROM HRD_EMP WHERE IDCARD='" + idCard + "'", -1);
			if (rowcount != 0) {
				return "out:false";
			} else {
				return "out:true";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return "out:true";
	}

	/**
	 * 添加新员工基本信息 codelist只能forward传递一次
	 * 
	 * @param model
	 * @return
	 */
	@Path("/addEmpBase")
	@POST
	@GET
	public String toAddEmpBase(Map<String, List> model) {
		// 1.获取Codelist
		String code1 = "DEPT_ID|GENDER|EMPTYPE|ROLENAME|TITLE_ID|TITLENAME|TITLEWORK|INSUSTATUS|MARRIAGE|POLITIC|ARCHIVEKEEP|MASTER|LOCATION1|NATION";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:hr/view/addEmpBase.jsp";
	}

	/**
	 * 保存新员工信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveNewEmp")
	@POST
	@GET
	public String toSaveNewEmp(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			HRD_Emp emp = (HRD_Emp) parseRequest(req, new HRD_Emp());
			String empId = myservice.saveNewEmp(emp);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", empId);
			// TODO:成功的json，清空后继续打开
			return successJSON("添加员工基本信息成功，员工编号：" + empId, "dialog",
					"hrs/addEmpBase", "ygxxwh");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 编辑员工基本信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editEmpBase")
	@POST
	@GET
	public String toEditEmpBase(Map<String, Object> model) {
		String empId = MVC.ctx().getRequest().getParameter("empId");

		try {
			// 查询
			// 1.获取Codelist
			String code1 = "DEPT_ID|GENDER|EMPTYPE|ROLENAME|TITLE_ID|TITLENAME|TITLEWORK|INSUSTATUS|MARRIAGE|POLITIC|ARCHIVEKEEP|MASTER|LOCATION1|NATION";

			model.put("EMP_ID", empId);
			String sql = "SELECT id, emp_id, emp_name, nation, to_char(birth,'yyyy-mm-dd') birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, to_char(joindate,'yyyy-mm-dd') joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, to_char(graddate,'yyyy-mm-dd') graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep FROM V_HRD_EMP WHERE EMP_ID='"
					+ empId + "' AND ROWNUM=1";
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			HRD_Emp emp = new HRD_Emp();
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
			return "forward:hr/view/editEmpBase.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	@Path("/saveEditEmp")
	@POST
	@GET
	public String toSaveEditEmp(Map<String, String> model) {
		try {
			HRD_Emp emp = (HRD_Emp) parseRequest(new HRD_Emp());
			myservice.saveEditEmp(emp);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", emp.getEMP_ID());
			// 成功的json，清空后继续打开
			return successJSON("修改员工基本信息成功，员工编号：" + emp.getEMP_ID(), "dialog",
					"hrs/showEmployee", "ygxxwh");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 打开员工绩效和培训页面
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpTransPerf")
	@POST
	@GET
	public String toShowEmpTrainPerf(Map<String, String> model) {
		// TODO:未完成

		try {
			String empId = MVC.ctx().getRequest().getParameter("empId");
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT EMP_NAME,IDCARD,DEPT_ID FROM V_HRD_EMP WHERE EMP_ID='"
							+ empId + "'");
			model.put("EMP_ID", empId);
			model.put("EMP_NAME", (String) result.get(0).get("EMP_NAME"));
			model.put("IDCARD", (String) result.get(0).get("IDCARD"));
			model.put("DEPT_ID", CodeList.getCodeDesc("DEPT_ID",
					((String) result.get(0).get("DEPT_ID"))));
			return "forward:hr/view/showEmpTransPerf.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	/**
	 * 显示和修改员工绩效信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpPerf")
	@POST
	@GET
	public String toShowEmpPerf(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpPerf.jsp";
	}

	/**
	 * 显示和修改员工培训信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpTrans")
	@POST
	@GET
	public String toShowEmpTrans(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpTrans.jsp";
	}

	/**
	 * 保存员工绩效信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpPerf")
	@POST
	@GET
	public String toSaveEmpPerf(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_PERF.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_PERF.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_PERF.class);
			myservice.saveEmpPerf(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 保存员工培训信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpTrans")
	@POST
	@GET
	public String toSaveEmpTrans(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_TRAIN.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_TRAIN.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_TRAIN.class);
			myservice.saveEmpTrans(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 打开员工个人资料
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpExt")
	@POST
	@GET
	public String toShowEmpExt(Map<String, String> model) {
		// TODO:未完成

		try {
			String empId = MVC.ctx().getRequest().getParameter("empId");
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT EMP_NAME,IDCARD,DEPT_ID FROM V_HRD_EMP WHERE EMP_ID='"
							+ empId + "'");
			model.put("EMP_ID", empId);
			model.put("EMP_NAME", (String) result.get(0).get("EMP_NAME"));
			model.put("IDCARD", (String) result.get(0).get("IDCARD"));
			model.put("DEPT_ID", CodeList.getCodeDesc("DEPT_ID",
					((String) result.get(0).get("DEPT_ID"))));
			return "forward:hr/view/showEmpExt.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 显示和修改员工家庭信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpFamily")
	@POST
	@GET
	public String toShowEmpFamily(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpFamily.jsp";
	}

	/**
	 * 显示和修改员工工作信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpJob")
	@POST
	@GET
	public String toShowEmpJob(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpJob.jsp";
	}

	/**
	 * 显示和修改员工奖励信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpReward")
	@POST
	@GET
	public String toShowEmpReward(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpReward.jsp";
	}

	/**
	 * 显示和修改员工工作经历
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpWork")
	@POST
	@GET
	public String toShowEmpWork(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpWork.jsp";
	}

	/**
	 * 保存员工家庭信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpFamily")
	@POST
	@GET
	public String toSaveEmpFamily(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_FAMILY.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_FAMILY.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_FAMILY.class);
			myservice.saveEmpFamily(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 保存员工工作合同信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpJob")
	@POST
	@GET
	public String toSaveEmpJob(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_JOB.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_JOB.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_JOB.class);
			myservice.saveEmpJob(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 保存奖惩信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpReward")
	@POST
	@GET
	public String toSaveEmpReward(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_REWARD.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_REWARD.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_REWARD.class);
			myservice.saveEmpReward(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 保存员工工作经历
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpWork")
	@POST
	@GET
	public String toSaveEmpWork(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_WORK.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_WORK.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_WORK.class);
			myservice.saveEmpWork(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	@Path("/showEmpProfCert")
	@POST
	@GET
	public String toShowEmpProfCert(Map<String, String> model) {
		// TODO:未完成

		try {
			String empId = MVC.ctx().getRequest().getParameter("empId");
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT EMP_NAME,IDCARD,DEPT_ID FROM V_HRD_EMP WHERE EMP_ID='"
							+ empId + "'");
			model.put("EMP_ID", empId);
			model.put("EMP_NAME", (String) result.get(0).get("EMP_NAME"));
			model.put("IDCARD", (String) result.get(0).get("IDCARD"));
			model.put("DEPT_ID", CodeList.getCodeDesc("DEPT_ID",
					((String) result.get(0).get("DEPT_ID"))));
			return "forward:hr/view/showEmpProfCert.jsp";
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
		return "forward:hr/view/showEmpReg.jsp";
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
		return "forward:hr/view/addEmpReg.jsp";
	}

	@Path("/saveNewEmpReg")
	@POST
	@GET
	public String toSaveNewEmpReg(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			HRD_EMP_REG reg = (HRD_EMP_REG) parseRequest(req, new HRD_EMP_REG());
			myservice.saveNewEmpReg(reg);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", reg.getEMP_ID());
			return successJSONReload("添加员工注册信息成功，员工编号：" + reg.getEMP_ID(),
					"dialog", "hrs/showEmpReg", "tjzc");
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
			String sql = "select ID,EMP_ID,REGTYPE,REGLEVEL, REGMAJOR1, REGMAJOR2,REGMAJOR3,REGNO，CERTIFICATE ，TO_CHAR(VALIDDATE,'YYYY-MM-DD') VALIDDATE,TO_CHAR(ISSUEDATE,'YYYY-MM-DD') ISSUEDATE,CERTNUMBER,TO_CHAR(CERTDATE,'YYYY-MM-DD') CERTDATE,TO_CHAR(CERTVALIDDATE,'YYYY-MM-DD') CERTVALIDDATE,MEMO from V_HRD_EMP_REG WHERE ID="
					+ id;
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			HRD_EMP_REG reg = new HRD_EMP_REG();
			// map转换成bean
			BeanUtils.populate(reg, result.get(0));
			model.put("reg", reg);
			return "forward:hr/view/editEmpReg.jsp";
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
					"dialog", "hrs/showEmpReg", "xgzc");
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
					"hrs/showEmpReg", "sczc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 显示和修改员工职称信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpProf")
	@POST
	@GET
	public String toShowEmpProf(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpProf.jsp";
	}

	/**
	 * 保存员工职称信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpProf")
	@POST
	@GET
	public String toSaveEmpProf(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_PROF.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_PROF.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_PROF.class);
			myservice.saveEmpProf(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 显示和修改员工其他认证信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpCert")
	@POST
	@GET
	public String toShowEmpCert(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);
		return "forward:hr/view/showEmpCert.jsp";
	}

	/**
	 * 保存员工认证信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpCert")
	@POST
	@GET
	public String toSaveEmpCert(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(HRD_EMP_CERT.class);
			List<Object> updateList = handler
					.getUpdatedRecords(HRD_EMP_CERT.class);
			List<Object> deleteList = handler
					.getDeletedRecords(HRD_EMP_CERT.class);
			myservice.saveEmpCert(insertList, updateList, deleteList, empId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 显示和修改员工照片
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpPic")
	@POST
	@GET
	public String toShowEmpPic(Map<String, String> model) {
		try {
			String empId = MVC.ctx().getRequest().getParameter("empId");
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT EMP_NAME,IDCARD,DEPT_ID FROM V_HRD_EMP WHERE EMP_ID='"
							+ empId + "'");
			model.put("EMP_ID", empId);
			model.put("EMP_NAME", (String) result.get(0).get("EMP_NAME"));
			model.put("IDCARD", (String) result.get(0).get("IDCARD"));
			model.put("DEPT_ID", CodeList.getCodeDesc("DEPT_ID",
					((String) result.get(0).get("DEPT_ID"))));
			return "forward:hr/view/showEmpPic.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 保存员工照片信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpPic")
	@POST
	@GET
	public String toSaveEmpPic(Map<String, String> model) {

		try {

			String empId = getParam("empId");
			String path = ConfigConstant.ROOT_PATH + "pictures/emp/" + empId
					+ ".jpg";
			model.put("EMP_ID", empId);
			String randFileName = empId + "_"
					+ String.valueOf(Math.round(Math.random() * 10000));
			model.put("RANDOMFILE", randFileName);
			Map<String, List<UploadFile>> result = MVC.ctx().getUploadMap();
			if (result.size() <= 0)
				return dwz.getFailedJson("没有上传文件").toString();
			UploadFile file = result.get("file1").get(0);
			FileUtil.copy(file.getTmpFile(), new File(path));
//			FileUtil.copy(file.getTmpFile(), new File(ConfigConstant.ROOT_PATH
//					+ "pictures/emp/tmp/" + randFileName));
			return successJSONReload("保存员工照片成功，员工编号：" + empId, "navTab",
					"hrs/showEmpPic", "ygzp");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 显示员工调转页面
	 * 
	 * @param model
	 * @return
	 */
	@Path("/showEmpTransfer")
	@POST
	@GET
	public String toShowEmpTransfer(Map<String, Object> model) {
		try {
			// 查询
			// 1.获取Codelist
			String code1 = "DEPT_ID|TRANSFERTYPE";

			// 代码值
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			return "forward:hr/view/editEmpTransfer.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	/**
	 * 保存员工调转信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveEmpTransfer")
	@POST
	@GET
	public String toSaveEmpTransfer(Map<String, Object> model) {

		try {
			// 1.判断是否是
			HRD_EMP_TRANSFER emptrans = (HRD_EMP_TRANSFER) parseRequest(new HRD_EMP_TRANSFER());
			// 1.1.如果是内部调转，则判断是否有新单位选择，且新单位和老单位不一样
			if (Const.TRANSFERTYPE_INTER.equals(emptrans.getTRANSFERTYPE())) {
				if ("".equals(emptrans.getNEWDEPT_ID())) {
					return dwz.getFailedJson("内部调转的新部门不能为空。").toString();
				}
				if ((emptrans.getDEPT_IDValue()).equals(emptrans
						.getNEWDEPT_ID())) {
					return dwz.getFailedJson("内部调转的新部门不能与原部门相同。").toString();
				}
			}
			emptrans.setPREVDEPT_ID(emptrans.getDEPT_IDValue());
			myservice.doEmpTransfer(emptrans);
			// 重新刷新
			return successJSONForward("员工调转成功，员工编号：" + emptrans.getEMP_ID(),
					"navTab", "hrs/showEmpTransfer", "");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 删除员工信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/deleteEmp")
	@POST
	@GET
	public String toDeleteEmp(Map<String, String> model) {
		String empId = getParam("empId");
		model.put("EMP_ID", empId);

		try {
			String sql = "UPDATE HRD_EMP SET VALID='0' WHERE EMP_ID=?";
			List<Object> params = new ArrayList<Object>();
			params.add(empId);
			JDBCOracleUtil.ExecuteDML(sql, params);
			return successJSONForward("成功删除", "navTab", "/hrs/showEmployee",
					"yggl");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}
}

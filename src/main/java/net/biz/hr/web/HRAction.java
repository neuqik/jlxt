package net.biz.hr.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import net.biz.framework.codelist.CodeList;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;
import net.biz.grid.gt.server.GridServerHandler;
import net.biz.hr.model.IHRService;
import net.biz.hr.vo.HRD_EMP_PERF;
import net.biz.hr.vo.HRD_EMP_TRAIN;
import net.biz.hr.vo.HRD_Emp;
import net.biz.util.BeanUtil;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;

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
			PrintWriter pw = MVC.ctx().getResponse().getWriter();
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
		// TODO:校验身份证号码
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
			HttpServletRequest req = MVC.ctx().getRequest();
			HRD_Emp emp = (HRD_Emp) parseRequest(req, new HRD_Emp());
			myservice.saveEditEmp(emp);
			// 设置员工编号，供其他页面使用
			model.put("EMP_ID", emp.getEMP_ID());
			// TODO:成功的json，清空后继续打开
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
	public String toShowEmpTrans(Map model) {
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
		}
		return null;
	}
}

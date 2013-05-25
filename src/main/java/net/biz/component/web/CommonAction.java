package net.biz.component.web;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.component.Const;
import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import net.biz.component.model.CommonService;
import net.biz.component.vo.CJDWLOOKUP;
import net.biz.component.vo.EMPLOOKUP;
import net.biz.component.vo.JGLXLOOKUP;
import net.biz.component.vo.PROJECTLOOKUP;
import net.biz.util.BeanUtil;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;
import org.eweb4j.mvc.view.DataAssemUtil;
import org.eweb4j.mvc.view.DivPageComp;
import org.eweb4j.mvc.view.ListPage;
import org.eweb4j.mvc.view.SearchForm;

@Path("/common")
public class CommonAction extends BaseAction {

	CommonService _service = (CommonService) BeanUtil.getBean("CommonService");

	/**
	 * 通用分页查询Action，用于sigma grid 必须在sigma gird的参数中提供基础SQL语句
	 * 
	 * @return
	 */
	@Path("/doPageQuery")
	@GET
	@POST
	public String doPageQuery() {
		try {
			String sql = (String) MVC.ctx().getRequest()
					.getParameter(Const.SQL).toUpperCase();
			RequestInfo request = wrapRequest(sql);
			AppInfo app = _service.queryListByPage(request);
			return "out:" + wrapResponse(app);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Path("/doExport")
	@GET
	@POST
	public void doExport() {
		try {
			// 重新初始化handler，export的request不一样

			String sql = (String) MVC.ctx().getRequest()
					.getParameter(Const.SQL).toUpperCase();
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(9999);
			request.setStartRow(1);
			AppInfo app = _service.queryListByPage(request);
			MVC.ctx().getResponse().reset();
			handler.exportXLSfromMaps(app.getResultData());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 省市县级联，查询市
	 * 
	 * @return
	 */
	@Path("/doGetCity")
	@GET
	@POST
	public String doGetCity() {
		try {
			// 获取选中的省
			String value = (String) MVC.ctx().getRequest()
					.getParameter("location1");
			// 查询下属的市
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("select 'LOCATION2' CODE_TYPE,region_code CODE_VALUE,location CODE_DESC from t_loc where UPPER_CODE='"
							+ value + "' order by region_code".toUpperCase());

			return "out:" + BeanUtil.cascadeComboxList2JSArray(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 省市县级联，查询区
	 * 
	 * @return
	 */
	@Path("/doGetArea")
	@GET
	@POST
	public String doGetArea() {
		try {
			// 获取选中的省
			String value = (String) MVC.ctx().getRequest()
					.getParameter("location2");
			// 查询下属的市
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("select 'LOCATION2' CODE_TYPE,region_code CODE_VALUE,location CODE_DESC from t_loc where UPPER_CODE='"
							+ value + "' order by region_code".toUpperCase());

			return "out:" + BeanUtil.cascadeComboxList2JSArray(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 执行查找带回的分页查询
	 * 
	 * @return
	 */
	@Path("/doEmpLookupPageQuery")
	@GET
	@POST
	public String doEmpLookupPageQuery(Map<String, Object> model) {

		String empId = getParam("EMP_ID");
		String empName = getParam("EMP_NAME");
		String idCard = getParam("IDCARD");
		String deptID = getParam("DEPT_ID");
		String insuStatus = getParam("INSUSTATUS");
		String where = "";
		if (!"".equalsIgnoreCase(empId)) {
			where += " AND EMP_ID LIKE '" + empId + "%' ";
		}
		if (!"".equalsIgnoreCase(empName)) {
			where += " AND EMP_NAME LIKE '" + empName + "%' ";
		}
		if (!"".equalsIgnoreCase(idCard)) {
			where += " AND IDCARD LIKE '" + idCard + "%' ";
		}
		if (!"".equalsIgnoreCase(deptID)) {
			where += " AND DEPT_ID = '" + deptID + "'";
		}
		if (!"".equalsIgnoreCase(insuStatus)) {
			where += " AND INSUSTATUS = '" + insuStatus + "'";
		}
		if (where.length() > 0) {
			where = " WHERE " + where;
			where = where.replaceFirst("AND", "");
		}

		// 声明分页查询
		String pn = getParam("pageNum");
		String size = getParam("numPerPage");

		int pageNum = Integer.parseInt(pn == null ? "1" : pn);
		int numPerPage = Integer.parseInt(size == null ? "20" : size);

		long allCount = 0;
		List<EMPLOOKUP> pojos = new ArrayList<EMPLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doEmpLookupPageQuery",
				"");
		String sql = ("SELECT ID,EMP_ID,EMP_NAME,IDCARD,FUN_GETCODEDESC('GENDER',GENDER) GENDER,AGE,FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_ID,FUN_GETCODEDESC('INSUSTATUS',INSUSTATUS) INSUSTATUS,FUN_GETCODEDESC('ROLENAME',ROLENAME) ROLENAME,TEL,FUN_GETLOC(LOCATION1) LOCATION1,FUN_GETLOC(LOCATION2) LOCATION2,MEMO FROM V_HRD_EMP" + where)
				.toUpperCase();

		// 1.查询界面的下拉列表框
		String code1 = "DEPT_ID|INSUSTATUS";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow((pageNum - 1) * numPerPage + 1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				EMPLOOKUP emp = new EMPLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(emp, row);
				pojos.add(emp);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/EmpLookup.jsp";
	}

	/**
	 * 打开员工查询窗口
	 * 
	 * @return
	 */
	@Path("/doEmpLookup")
	@GET
	@POST
	public String doEmpLookup(Map<String, Object> model) {
		// 声明分页查询
		int pageNum = 1;
		int numPerPage = 20;

		long allCount = 0;
		List<EMPLOOKUP> pojos = new ArrayList<EMPLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doEmpLookupPageQuery",
				"");

		String sql = "SELECT ID,EMP_ID,EMP_NAME,IDCARD,FUN_GETCODEDESC('GENDER',GENDER) GENDER,AGE,FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_ID,FUN_GETCODEDESC('INSUSTATUS',INSUSTATUS) INSUSTATUS,FUN_GETCODEDESC('ROLENAME',ROLENAME) ROLENAME,TEL,FUN_GETLOC(LOCATION1) LOCATION1,FUN_GETLOC(LOCATION2) LOCATION2,MEMO FROM V_HRD_EMP"
				.toUpperCase();

		// 1.查询界面的下拉列表框
		String code1 = "DEPT_ID|INSUSTATUS";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow(1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				EMPLOOKUP emp = new EMPLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(emp, row);
				pojos.add(emp);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/EmpLookup.jsp";
	}

	/**
	 * 打开建设单位查询窗口
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doJSDWLookup")
	@GET
	@POST
	public String doJSDWLookup(Map<String, Object> model) {
		String prjId = "".equals(getParam("PRJ_ID")) ? "0" : getParam("PRJ_ID");
		String prjNo = getParam("PRJNO");
		// 声明分页查询
		int pageNum = 1;
		int numPerPage = 20;

		long allCount = 0;
		List<CJDWLOOKUP> pojos = new ArrayList<CJDWLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doJSDWLookupPageQuery",
				"");

		String sql = "SELECT ID ,UNIT_NAME,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,GROUP_NAME,FUN_GETCODEDESC('UNIT_TYPE',UNIT_TYPE) UNIT_TYPE,FUN_GETCODEDESC('QUALI_LEVEL',QUALI_LEVEL) QUALI_LEVEL,CONTRACTOR,MEMO FROM V_PRJ_UNIT WHERE PRJ_ID="
				+ prjId;

		// 1.查询界面的下拉列表框
		String code1 = "UNIT_TYPE|QUALI_LEVEL";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow(1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				CJDWLOOKUP prj = new CJDWLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
			model.put("PRJ_ID", prjId);
			model.put("PRJ_NO", prjNo);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/JSDWLookup.jsp";
	}

	/**
	 * 执行施工单位查找带回
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doSGDWLookupPageQuery")
	@GET
	@POST
	public String doSGDWLookupPageQuery(Map<String, Object> model) {

		String prjId = getParam("PRJ_ID");
		String unitType = getParam("UNIT_TYPE");
		String unitName = getParam("UNIT_NAME");
		String quaLevel = getParam("QUALI_LEVEL");
		String memo = getParam("MEMO");

		String where = "";
		if (!"".equalsIgnoreCase(prjId)) {
			where += " AND PRJ_ID = " + prjId + " ";
		}
		if (!"".equalsIgnoreCase(unitName)) {
			where += " AND UNIT_NAME LIKE '" + unitName + "%' ";
		}
		if (!"".equalsIgnoreCase(quaLevel)) {
			where += " AND QUALI_LEVEL = '" + quaLevel + "' ";
		}
		if (!"".equalsIgnoreCase(unitType)) {
			where += " AND UNIT_TYPE = '" + unitType + "'";
		}
		if (!"".equalsIgnoreCase(memo)) {
			where += " AND MEMO LIKE '%" + memo + "%'";
		}
		if (where.length() > 0) {
			where = " WHERE " + where;
			where = where.replaceFirst("AND", "");
		}

		// 声明分页查询
		String pn = getParam("pageNum");
		String size = getParam("numPerPage");

		int pageNum = Integer.parseInt(pn == null ? "1" : pn);
		int numPerPage = Integer.parseInt(size == null ? "20" : size);

		long allCount = 0;
		List<CJDWLOOKUP> pojos = new ArrayList<CJDWLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doSGDWLookupPageQuery",
				"");
		String sql = "SELECT ID ,UNIT_NAME,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,GROUP_NAME,FUN_GETCODEDESC('UNIT_TYPE',UNIT_TYPE) UNIT_TYPE,FUN_GETCODEDESC('QUALI_LEVEL',QUALI_LEVEL) QUALI_LEVEL,CONTRACTOR,MEMO FROM V_PRJ_UNIT "
				+ where;

		// 1.查询界面的下拉列表框
		String code1 = "UNIT_TYPE|QUALI_LEVEL";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow((pageNum - 1) * numPerPage + 1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				CJDWLOOKUP prj = new CJDWLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
			model.put("PRJ_ID", prjId);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/SGDWLookup.jsp";
	}

	/**
	 * 打开结构类型查询窗口
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doJGLXLookup")
	@GET
	@POST
	public String doJGLXLookup(Map<String, Object> model) {
		String prjId = "".equals(getParam("PRJ_ID")) ? "0" : getParam("PRJ_ID");
		// 声明分页查询
		int pageNum = 1;
		int numPerPage = 20;

		long allCount = 0;
		List<JGLXLOOKUP> pojos = new ArrayList<JGLXLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doJGLXLookupPageQuery",
				"");

		String sql = "SELECT DISTINCT (SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,CONSTRUCT_TYPE,FUN_GETCODEDESC('CONSTRUCT_TYPE',CONSTRUCT_TYPE) CONSTRUCT_TYPE_NAME FROM V_PRJ_BUILDING WHERE PRJ_ID="
				+ prjId;

		try {
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow(1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				JGLXLOOKUP prj = new JGLXLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
			model.put("PRJ_ID", prjId);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/JGLXLookup.jsp";
	}

	/**
	 * 执行结构类型查找带回
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doJGLXLookupPageQuery")
	@GET
	@POST
	public String doJGLXLookupPageQuery(Map<String, Object> model) {

		String prjId = getParam("PRJ_ID");

		String where = "";
		if (!"".equalsIgnoreCase(prjId)) {
			where += " AND PRJ_ID = " + prjId + " ";
		}

		if (where.length() > 0) {
			where = " WHERE " + where;
			where = where.replaceFirst("AND", "");
		}

		// 声明分页查询
		String pn = getParam("pageNum");
		String size = getParam("numPerPage");

		int pageNum = Integer.parseInt(pn == null ? "1" : pn);
		int numPerPage = Integer.parseInt(size == null ? "20" : size);

		long allCount = 0;
		List<JGLXLOOKUP> pojos = new ArrayList<JGLXLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doJGLXLookupPageQuery",
				"");
		String sql = "SELECT DISTINCT (SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,CONSTRUCT_TYPE,FUN_GETCODEDESC('CONSTRUCT_TYPE',CONSTRUCT_TYPE) CONSTRUCT_TYPE_NAME FROM V_PRJ_BUILDING "
				+ where;

		// 1.查询界面的下拉列表框

		try {
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow((pageNum - 1) * numPerPage + 1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				JGLXLOOKUP prj = new JGLXLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
			model.put("PRJ_ID", prjId);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/JGLXLookup.jsp";
	}

	/**
	 * 打开施工单位查询窗口
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doSGDWLookup")
	@GET
	@POST
	public String doSGDWLookup(Map<String, Object> model) {
		String prjId = "".equals(getParam("PRJ_ID")) ? "0" : getParam("PRJ_ID");
		String prjNo = getParam("PRJNO");
		// 声明分页查询
		int pageNum = 1;
		int numPerPage = 20;

		long allCount = 0;
		List<CJDWLOOKUP> pojos = new ArrayList<CJDWLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doSGDWLookupPageQuery",
				"");

		String sql = "SELECT ID ,UNIT_NAME,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,GROUP_NAME,FUN_GETCODEDESC('UNIT_TYPE',UNIT_TYPE) UNIT_TYPE,FUN_GETCODEDESC('QUALI_LEVEL',QUALI_LEVEL) QUALI_LEVEL,CONTRACTOR,MEMO FROM V_PRJ_UNIT WHERE PRJ_ID="
				+ prjId;

		// 1.查询界面的下拉列表框
		String code1 = "UNIT_TYPE|QUALI_LEVEL";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow(1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				CJDWLOOKUP prj = new CJDWLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
			model.put("PRJ_ID", prjId);
			model.put("PRJ_NO", prjNo);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/SGDWLookup.jsp";
	}

	/**
	 * 执行建设单位查找带回
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doJSDWLookupPageQuery")
	@GET
	@POST
	public String doJSDWLookupPageQuery(Map<String, Object> model) {

		String prjId = getParam("PRJ_ID");
		String unitType = getParam("UNIT_TYPE");
		String unitName = getParam("UNIT_NAME");
		String quaLevel = getParam("QUALI_LEVEL");
		String memo = getParam("MEMO");

		String where = "";
		if (!"".equalsIgnoreCase(prjId)) {
			where += " AND PRJ_ID = " + prjId + " ";
		}
		if (!"".equalsIgnoreCase(unitName)) {
			where += " AND UNIT_NAME LIKE '" + unitName + "%' ";
		}
		if (!"".equalsIgnoreCase(quaLevel)) {
			where += " AND QUALI_LEVEL = '" + quaLevel + "' ";
		}
		if (!"".equalsIgnoreCase(unitType)) {
			where += " AND UNIT_TYPE = '" + unitType + "'";
		}
		if (!"".equalsIgnoreCase(memo)) {
			where += " AND MEMO LIKE '%" + memo + "%'";
		}
		if (where.length() > 0) {
			where = " WHERE " + where;
			where = where.replaceFirst("AND", "");
		}

		// 声明分页查询
		String pn = getParam("pageNum");
		String size = getParam("numPerPage");

		int pageNum = Integer.parseInt(pn == null ? "1" : pn);
		int numPerPage = Integer.parseInt(size == null ? "20" : size);

		long allCount = 0;
		List<CJDWLOOKUP> pojos = new ArrayList<CJDWLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doJSDWLookupPageQuery",
				"");
		String sql = "SELECT ID ,UNIT_NAME,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,GROUP_NAME,FUN_GETCODEDESC('UNIT_TYPE',UNIT_TYPE) UNIT_TYPE,FUN_GETCODEDESC('QUALI_LEVEL',QUALI_LEVEL) QUALI_LEVEL,CONTRACTOR,MEMO FROM V_PRJ_UNIT "
				+ where;

		// 1.查询界面的下拉列表框
		String code1 = "UNIT_TYPE|QUALI_LEVEL";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow((pageNum - 1) * numPerPage + 1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				CJDWLOOKUP prj = new CJDWLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
			model.put("PRJ_ID", prjId);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/JSDWLookup.jsp";
	}

	/**
	 * 获取检查扣分细项
	 * 
	 * @return
	 */
	@Path("/doGetCheckItem")
	@GET
	@POST
	public String doGetCheckItem() {
		try {
			// 获取选中的省
			String value = getParam("item");
			// 查询下属的市
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("select 'CHECKITEM' CODE_TYPE,check_code CODE_VALUE,checkcontent CODE_DESC from t_checklist_prj where UPPER_CODE='"
							+ value + "' order by check_code".toUpperCase());

			return "out:" + BeanUtil.cascadeComboxList2JSArray(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 打开项目查询窗口
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doProjectLookup")
	@GET
	@POST
	public String doProjectLookup(Map<String, Object> model) {
		// 声明分页查询
		int pageNum = 1;
		int numPerPage = 20;

		long allCount = 0;
		List<PROJECTLOOKUP> pojos = new ArrayList<PROJECTLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm(
				"common/doProjectLookupPageQuery", "");

		String sql = "SELECT ID PRJ_ID,PRJNO,PRJ_NAME,FUN_GETCODEDESC('PRJ_LEVEL',PRJ_LEVEL) PRJ_LEVEL,FUN_GETCODEDESC('PRJ_TYPE',PRJ_TYPE) PRJ_TYPE,FUN_GETLOC(LOCATION1) LOCATION1,FUN_GETLOC(LOCATION2) LOCATION2,FUN_GETLOC(LOCATION3) LOCATION3,LOCATION4,MEMO FROM V_PRJ_INFO"
				.toUpperCase();

		// 1.查询界面的下拉列表框
		String code1 = "PRJ_LEVEL|PRJ_TYPE";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow(1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				PROJECTLOOKUP prj = new PROJECTLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/ProjectLookup.jsp";
	}

	/**
	 * 执行查找带回
	 * 
	 * @param model
	 * @return
	 */
	@Path("/doProjectLookupPageQuery")
	@GET
	@POST
	public String doProjectLookupPageQuery(Map<String, Object> model) {

		String prjNo = getParam("PRJNO");
		String prjName = getParam("PRJ_NAME");
		String prjLevel = getParam("PRJ_LEVEL");
		String prjType = getParam("PRJ_TYPE");
		String where = "";
		if (!"".equalsIgnoreCase(prjNo)) {
			where += " AND PRJ_NO LIKE '" + prjNo + "%' ";
		}
		if (!"".equalsIgnoreCase(prjName)) {
			where += " AND PRJ_NAME LIKE '" + prjName + "%' ";
		}
		if (!"".equalsIgnoreCase(prjLevel)) {
			where += " AND PRJ_LEVEL = '" + prjLevel + "' ";
		}
		if (!"".equalsIgnoreCase(prjType)) {
			where += " AND PRJ_TYPE = '" + prjType + "'";
		}
		if (where.length() > 0) {
			where = " WHERE " + where;
			where = where.replaceFirst("AND", "");
		}

		// 声明分页查询
		String pn = getParam("pageNum");
		String size = getParam("numPerPage");

		int pageNum = Integer.parseInt(pn == null ? "1" : pn);
		int numPerPage = Integer.parseInt(size == null ? "20" : size);

		long allCount = 0;
		List<PROJECTLOOKUP> pojos = new ArrayList<PROJECTLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm(
				"common/doProjectLookupPageQuery", "");
		String sql = ("SELECT ID PRJ_ID,PRJNO,PRJ_NAME,FUN_GETCODEDESC('PRJ_LEVEL',PRJ_LEVEL) PRJ_LEVEL,FUN_GETCODEDESC('PRJ_TYPE',PRJ_TYPE) PRJ_TYPE,FUN_GETLOC(LOCATION1) LOCATION1,FUN_GETLOC(LOCATION2) LOCATION2,FUN_GETLOC(LOCATION3) LOCATION3,LOCATION4,MEMO FROM V_PRJ_INFO" + where)
				.toUpperCase();

		// 1.查询界面的下拉列表框
		String code1 = "PRJ_LEVEL|PRJ_TYPE";
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 2.进行分页查询构成页面
			// pageMod = service.getListPage(pageNum, numPerPage);
			RequestInfo request = wrapRequest(sql);
			request.setPageSize(numPerPage);
			request.setRowCount(-1);
			request.setStartRow((pageNum - 1) * numPerPage + 1);
			request.setSQL(sql);

			AppInfo app = _service.queryListByPage(request);
			allCount = app.getLongRowCount();

			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				PROJECTLOOKUP prj = new PROJECTLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(prj, row);
				pojos.add(prj);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("", searchForm, pojos, dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos, null);

			model.put("listPage", listPage);
			model.put("random", Math.random());
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/ProjectLookup.jsp";
	}
}

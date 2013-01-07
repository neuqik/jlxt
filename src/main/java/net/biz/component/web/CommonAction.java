package net.biz.component.web;

import java.util.ArrayList;
import java.util.HashMap;
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
import net.biz.component.vo.EMPLOOKUP;
import net.biz.util.BeanUtil;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;
import org.eweb4j.mvc.view.DataAssemUtil;
import org.eweb4j.mvc.view.DivPageComp;
import org.eweb4j.mvc.view.ListPage;
import org.eweb4j.mvc.view.PageMod;
import org.eweb4j.mvc.view.SearchForm;
import org.eweb4j.solidbase.user.model.UserActivityLogCons;

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
			String sql = (String) MVC.ctx().getRequest()
					.getParameter(Const.SQL).toUpperCase();
			RequestInfo request = wrapRequest(sql);
			AppInfo app = _service.queryListByPage(request);
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
			request.setStartRow((pageNum - 1) * numPerPage);
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

}

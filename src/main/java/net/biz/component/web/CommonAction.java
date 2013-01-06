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

	CommonService service = (CommonService) BeanUtil.getBean("CommonService");

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
			AppInfo app = service.queryListByPage(request);
			return "out:" + wrapResponse(app);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
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

		PageMod<EMPLOOKUP> pageMod = null;
		long allCount = 0;
		List<EMPLOOKUP> pojos = new ArrayList<EMPLOOKUP>();
		DivPageComp dpc = null;
		ListPage listPage = null;
		SearchForm searchForm = new SearchForm("common/doEmpLookup", "");
		String sql = "";

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
			AppInfo app = service.queryListByPage(request);
			allCount = app.getRowCount();
			List<Map<String, Object>> result = app.getResultData();
			Iterator<Map<String, Object>> it = result.iterator();
			while (it.hasNext()) {
				EMPLOOKUP emp = new EMPLOOKUP();
				Map<String, Object> row = (Map<String, Object>) it.next();
				BeanUtils.populate(emp, row);
				pojos.add(emp);
			}
			dpc = new DivPageComp(pageNum, numPerPage, allCount, 10);

			listPage = new ListPage("common/doEmpLookup", searchForm, pojos,
					dpc);
			listPage = DataAssemUtil.assemHead(listPage, pojos,
					UserActivityLogCons.getMap());

			model.put("listPage", listPage);
			model.put("random", Math.random());
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

		return "forward:component/view/EmpLookup.jsp";
	}

}

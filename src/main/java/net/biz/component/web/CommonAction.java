package net.biz.component.web;

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
import net.biz.util.BeanUtil;
import net.biz.util.JDBCOracleUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.eweb4j.mvc.MVC;

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
}

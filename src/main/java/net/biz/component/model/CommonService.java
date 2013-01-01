package net.biz.component.model;

import java.util.List;

import org.springframework.stereotype.Component;

import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;
import net.biz.grid.gt.util.SQLUtils;
import net.biz.util.JDBCOracleUtil;

@Component("CommonService")
public class CommonService {
	/**
	 * 分页查询，根据传入对象方式
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public AppInfo queryListByPage(RequestInfo request) throws Exception {
		List<FilterInfo> filters = request.getFilters();
		List<SortInfo> sorts = request.getSorts();
		String sql = request.getSQL();
		String where = SQLUtils.splitFilter(filters);
		if (sql.indexOf("WHERE") > 0) {
			// 如果SQL中已经包括了WHERE，则添加AND
			where = where.length() > 1 ? " AND "
					+ where.replaceFirst("AND", "") : where;
		} else {
			where = where.length() > 1 ? " WHERE "
					+ where.replaceFirst("AND", "") : where;
		}
		sql = sql + where;
		String order = SQLUtils.splitSort(sorts);
		order = order.length() > 1 ? order.replaceFirst("[,]", "") : order;
		sql = sql + order;
		request.setSQL(sql);
		// TODO:用log替换
		System.out.println(sql);
		AppInfo app = JDBCOracleUtil.executeQuery(request);
		return app;
	}
}

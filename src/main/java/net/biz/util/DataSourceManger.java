package net.biz.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.eweb4j.orm.jdbc.JdbcUtil;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service("DataSourceManger")
@Component("DataSourceManger")
@Scope("singleton")
public class DataSourceManger {

	private static DataSourceBean db = null;

	@Resource(name = "dataSource")
	private DataSource ds;

	public static DataSourceBean getDb() {
		return db;
	}

	public static void setDb(DataSourceBean db) {
		DataSourceManger.db = db;
	}

	// @Override
	// public void postProcessBeanFactory(ConfigurableListableBeanFactory arg0)
	// throws BeansException { implements BeanFactoryPostProcessor
	// // TODO Auto-generated method stub
	// // this.init();
	// }

	/**
	 * 初始化
	 * 
	 * @throws Exception
	 */
	public void init() {
		try {
			queryAllDataSource();
		} catch (Exception e) {
			e.printStackTrace();
			// throw new Exception("获取业务库数据库信息失败",e);
		}
	}

	private void queryAllDataSource() throws SQLException {
		// TODO Auto-generated method stub
		db = new DataSourceBean();
		String sql = "select dbtype, dburl, dsid, dsname, dstype, password, servername, username from t_datasource";
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		Connection con = null;
		con = ds.getConnection();
		list = JdbcUtil.getListWithSql(con, sql, null);
		for (HashMap<String, String> map : list) {
			db.setDbtype(map.get("DBTYPE"));
			db.setDburl(map.get("DBURL"));
			db.setDsid(map.get("DSID"));
			db.setDsname(map.get("DSNAME"));
			db.setDstype(map.get("DSTYEP"));
			db.setPassword(map.get("PASSWORD"));
			db.setServername(map.get("SERVERNAME"));
			db.setUsername(map.get("USERNAME"));
		}
	}
}

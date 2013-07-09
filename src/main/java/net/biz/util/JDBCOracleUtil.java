package net.biz.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class JDBCOracleUtil {
	// 日志记录标志
	private static boolean LOG_ENABLE = false;

	/**
	 * 获取spring配置的connection @ lef2371@gmail.com 201212修改原来的连接方式
	 * 
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public static Connection getConnection() throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		DataSourceBean db = DataSourceManger.getDb();
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = db.getDburl();

		Class.forName(driver).newInstance();
		Connection conn = DriverManager.getConnection(url, db.getUsername(),
				db.getPassword());

		conn.setAutoCommit(false);
		return conn;
	}

	/**
	 * 获取业务库数据库连接
	 * 
	 * @lef2371@gmail.com
	 * @return
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws Exception
	 */
	public static Connection getYWConnection() throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		DataSourceBean db = DataSourceManger.getDb();
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = db.getDburl();

		Class.forName(driver).newInstance();
		Connection conn = DriverManager.getConnection(url, db.getUsername(),
				db.getPassword());

		conn.setAutoCommit(false);
		return conn;

	}

	/**
	 * 获取连接
	 * 
	 * @param user
	 * @param password
	 * @param host
	 * @param sid
	 * @param port
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static Connection getConnection(String user, String password,
			String host, String sid, String port)
			throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@".concat(host).concat(":").concat(port)
				.concat(":").concat(sid);

		Class.forName(driver).newInstance();
		Connection conn = DriverManager.getConnection(url, user, password);

		conn.setAutoCommit(false);
		return conn;
	}

	/**
	 * 获取连接
	 * 
	 * @param user
	 * @param password
	 * @param url
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static Connection getConnection(String user, String password,
			String url) throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		Class.forName(driver).newInstance();
		Connection conn = DriverManager.getConnection(url, user, password);

		conn.setAutoCommit(false);
		return conn;
	}

	/**
	 * 关闭连接，建议在finally中使用
	 * 
	 * @param conn
	 * @throws SQLException
	 */
	public static void closeConnection(Connection conn) throws SQLException {
		if (conn != null) {
			conn.rollback();
			conn.close();
		}
	}

	/**
	 * 调用存储过程
	 * 
	 * @param inList
	 * 
	 * @param outList
	 * 
	 * @param procName
	 * 
	 * @param conn
	 *            jdbcl
	 * @return
	 * @throws SQLException
	 * @throws Exception
	 */
	public static List<String> callProc(List inList, List outList,
			String procName, Connection conn) throws SQLException {
		String sql = String.valueOf("");
		String in = String.valueOf("");
		String out = String.valueOf("");
		List<String> retList = new ArrayList<String>();

		int n = 0;
		n = inList.size();

		conn.setAutoCommit(false);

		if (inList.size() > 0) {
			for (int i = 0; i < inList.size(); i++) {
				in = in + "?,";
			}
		}
		if (outList.size() > 0) {
			n = inList.size();
			for (int i = 0; i < outList.size(); i++) {
				out = out + "?,";
			}
		}
		if (in.length() > 0) {
			in = (in.concat(out)).substring(0, in.length() + out.length() - 1);
		}
		sql = "{call " + procName + "(" + in + ")}";
		CallableStatement cstat = conn.prepareCall(sql);
		if (inList.size() > 0) {
			for (int i = 0; i < inList.size(); i++) {
				cstat.setObject(i + 1, inList.get(i));
			}
		}
		if (outList.size() > 0) {

			for (int i = n + 1; i < n + 1 + outList.size(); i++) {
				cstat.registerOutParameter(i, OracleTypes.VARCHAR);
			}
		}

		cstat.executeUpdate();
		OracleCallableStatement ocstat = (OracleCallableStatement) cstat;

		for (int i = 0; i < outList.size(); i++) {
			retList.add(i, ocstat.getString(i + n + 1));
		}

		cstat.close();
		ocstat.close();
		LogUtil.debug(sql);
		LogUtil.debug("入参:" + inList);
		LogUtil.debug("结果:" + retList);
		return retList;

	}

	/**
	 * 使用非dml语句 不设置是否自动提交 如果结果是ORA-00942，没有表或视图，则跳过
	 * 
	 * @param dml
	 * @param conn
	 * @throws Exception
	 * @throws BIException
	 */
	public static void executeDML(String dml, Connection conn) throws Exception {

		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(dml);

		} catch (SQLException e) {
			String m = e.getMessage();
			if (m.indexOf("RA-00942") > 0) {

			} else {
				throw new Exception(m);
			}
		} finally {
			stmt.close();
		}
	}

	/**
	 * 查询语句，返回Map
	 * 
	 * @param sql
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public static List<Map<String, Object>> executeQuery(String sql)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		return executeQuery(sql, getConnection());
	}

	/**
	 * 查询语句，分页
	 * 
	 * @param sql
	 * @param startRow
	 *            本次查询的起始行
	 * @param pageSize
	 *            本次查询的页大小
	 * @param totalCount
	 *            传输总行数，当totalCount为0时，查询总数，否则不查询
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public static List<Map<String, Object>> executeQueryPage(String sql,
			int startRow, int pageSize) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		String localSql = "";
		localSql = "SELECT * FROM (SELECT PAGESET.*, ROWNUM RN FROM (" + sql
				+ ") PAGESET WHERE ROWNUM <= " + startRow + pageSize
				+ ")	WHERE RN >= " + startRow;
		return executeQuery(localSql);
	}

	/**
	 * 分页查询，对象参数和对象返回
	 * 
	 * @param request
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public static AppInfo executeQuery(RequestInfo request)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		AppInfo app = new AppInfo();
		String sql = request.getSQL();
		int totalCount = request.getRowCount();
		int startRow = request.getStartRow();
		int pageSize = request.getPageSize();
		// 1.执行count
		totalCount = executeTotalCount(sql, totalCount);
		app.setRowCount(totalCount);
		// 2.执行SQL
		List<Map<String, Object>> result = executeQueryPage(sql, startRow,
				pageSize);
		app.setResultData(result);
		app.setSuccess("");
		return app;
	}

	/**
	 * 查询总行数，如果查询过则不查询
	 * 
	 * @param sql
	 * @param totalCount
	 *            如果没查询过必须是-1
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public static int executeTotalCount(String sql, int totalCount)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		String localSql = "";
		int localTotalCount = 0;
		if (totalCount < 0) {
			localSql = "SELECT COUNT(1) ROWCOUNT FROM (" + sql + ")";
			List<Map<String, Object>> countMap = executeQuery(localSql);
			localTotalCount = Integer.parseInt(String.valueOf(countMap.get(0)
					.get("ROWCOUNT")));
		} else {
			localTotalCount = totalCount;
		}

		return localTotalCount;
	}

	/**
	 * 查询行数
	 * 
	 * @param sql
	 * @param totalCount
	 * @param conn
	 * @return
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static int executeTotalCount(String sql, int totalCount,
			Connection conn) throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		String localSql = "";
		int localTotalCount = 0;
		if (totalCount < 0) {
			localSql = "SELECT COUNT(1) ROWCOUNT FROM (" + sql + ")";
			List<Map<String, Object>> countMap = executeQuery(localSql, conn);
			localTotalCount = Integer.parseInt(String.valueOf(countMap.get(0)
					.get("ROWCOUNT")));
		} else {
			localTotalCount = totalCount;
		}

		return localTotalCount;
	}

	/**
	 * 查询结果，不使用prepare的方式 从0开始 如果是null，设置为空字符
	 * 
	 * @param sql
	 * @param conn
	 * @return
	 * @throws SQLException
	 */
	public static List<Map<String, Object>> executeQuery(String sql,
			Connection conn) throws SQLException {
		List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		try {
			LogUtil.debug("执行sql:" + sql.toUpperCase());
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				Map<String, Object> row = new HashMap<String, Object>();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					row.put(rsmd.getColumnName(i), rs.getObject(i) == null ? ""
							: rs.getObject(i));
				}
				data.add(row);
			}
		} finally {
			rs.close();
			stmt.close();
			conn.close();
		}
		return data;
	}

	/**
	 * 根据表名查询其注释
	 * 
	 * @param tableName
	 * @param conn
	 * @return
	 * @throws SQLException
	 * @throws BIException
	 */
	public static String getTableComment(String tableName, Connection conn)
			throws Exception {
		String sql = "select comments from user_tab_comments where table_name = '"
				+ tableName.toUpperCase() + "'".toUpperCase();

		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
				conn);
		if (result.size() <= 0) {
			throw new Exception("没有找到" + tableName + "的注释，请检查表输入是否正确!");
		}
		if (result.size() != 1) {
			throw new Exception("找到" + tableName + "多条的注释，请检查表输入是否正确!");
		}
		// 如果找到的不是空字符，则正常
		if (!"".equals(result.get(0).get("COMMENTS").toString())) {
			// 设置注释内容
			return result.get(0).get("COMMENTS").toString();
		} else {
			throw new Exception("找到" + tableName + "没有写注释，请检查表!");
		}
	}

	/**
	 * 查询表的主键
	 * 
	 * @param tableName
	 * @param conn
	 * @return
	 * @throws SQLException
	 * @throws BIException
	 */
	public static String getTablePK(String tableName, Connection conn)
			throws Exception {
		String sql = "SELECT k.column_name FROM user_constraints t, user_cons_columns k WHERE t.table_name = k.table_name AND t.constraint_name = k.constraint_name AND t.table_name = '"
				+ tableName + "' AND t.constraint_type = 'P'".toUpperCase();
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
				conn);
		if (result.size() <= 0) {
			throw new Exception("没有找到" + tableName + "的主键");
		}
		if (result.size() != 1) {
			throw new Exception("找到" + tableName + "多条的联合主键。");
		}
		// 如果找到的不是空字符，则正常
		if (!"".equals(result.get(0).get("COLUMN_NAME").toString())) {
			// 设置注释内容
			return result.get(0).get("COLUMN_NAME").toString();
		} else {
			throw new Exception("找到" + tableName + "主键为空");
		}
	}

	/**
	 * 判断某个表是否是视图
	 * 
	 * @param tableName
	 * @param conn
	 * @return
	 * @throws SQLException
	 * @throws BIException
	 */
	public static boolean isView(String tableName, Connection conn)
			throws Exception {
		String sql = "select object_type from user_objects where object_name = '"
				+ tableName + "'".toUpperCase();
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
				conn);
		if (result.size() <= 0) {
			throw new Exception("没有找到" + tableName + "的对象");
		}
		if (result.size() != 1) {
			throw new Exception("找到" + tableName + "多个对象");
		}
		// 如果找到的不是空字符，则正常
		if (!"".equals(result.get(0).get("OBJECT_TYPE").toString())) {
			// 设置注释内容
			return "VIEW".equals(result.get(0).get("OBJECT_TYPE").toString());
		} else {
			throw new Exception("找到" + tableName + "对象类型不正确");
		}
	}

	/**
	 * 获取某个字段的注释
	 * 
	 * @param tableName
	 * @param col
	 * @param conn
	 * @return
	 * @throws SQLException
	 * @throws BIException
	 */
	public static String getColumnComment(String tableName, String col,
			Connection conn) throws Exception {
		String sql = "select comments from user_col_comments where table_name = '"
				+ tableName + "' and column_name='" + col + "'".toUpperCase();
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
				conn);
		if (result.size() <= 0) {
			throw new Exception("没有找到" + tableName + "." + col + "的注释，请检查!");
		}
		if (result.size() != 1) {
			throw new Exception("找到" + tableName + "." + col + "多条的注释，请检查!");
		}
		// 如果找到的不是空字符，则正常
		if (!"".equals(result.get(0).get("COMMENTS").toString())) {
			// 设置注释内容
			return result.get(0).get("COMMENTS").toString();
		} else {
			throw new Exception("找到" + tableName + "." + col + "没有写注释，请检查!");
		}
	}

	/**
	 * 调用标准存储过程
	 * 
	 * 输入参数若干 输出参数2个,一个number,一个varchar2
	 * 
	 * @return
	 * @throws SQLException
	 * @throws Exception
	 */
	public static void callProcduce(List inList, List<Object> outList,
			String procName, Connection conn) throws SQLException {
		String sql = String.valueOf("");
		String in = String.valueOf("");
		int n = 0;
		n = inList.size();

		conn.setAutoCommit(false);

		// 计算存储过程的参数个数（输入参数个数+2），用?表示
		if (inList.size() > 0) {
			for (int i = 0; i < inList.size() + 2; i++) {
				in = in + "?,";
			}
			in = in.substring(0, in.length() - 1);// 去掉in后面最后的逗号
		} else// 没有输入参数，只有两个输出参数
		{
			in = "?,?";
		}

		sql = "{call " + procName + "(" + in + ")}";
		CallableStatement cstat = conn.prepareCall(sql);
		if (inList.size() > 0) {
			for (int i = 0; i < inList.size(); i++) {
				cstat.setObject(i + 1, inList.get(i));
			}
		}
		// 注册两个输出，存储过程的输出
		cstat.registerOutParameter(inList.size() + 1, OracleTypes.NUMBER);
		cstat.registerOutParameter(inList.size() + 2, OracleTypes.VARCHAR);

		cstat.executeUpdate();
		// OracleCallableStatement ocstat = (OracleCallableStatement) cstat;

		// 获取两个输出内容
		for (int i = 0; i < 2; i++) {
			outList.add(i, cstat.getObject(i + n + 1));
		}
		cstat.close();
		// ocstat.close();
		LogUtil.info(sql);
		LogUtil.info("入参:" + inList);
		LogUtil.info("结果:" + outList);

	}

	/**
	 * 获取序列号值
	 * 
	 * @param seqName
	 * @return
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws SQLException
	 */
	public static String getSequence(String seqName) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		String sql = "SELECT " + seqName + ".nextval SEQNAME from dual";
		List<Map<String, Object>> result = executeQuery(sql.toUpperCase());
		return result.get(0).get("SEQNAME").toString();
	}

	/**
	 * 获取ID
	 * 
	 * @return
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static String getID() throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		return getSequence("SEQ_ID");
	}

	/**
	 * 自动提交，执行DML操作
	 * 
	 * @param sql
	 * @param params
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static void executeDML(String sql, Object[] params)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement st = null;

		try {
			conn = getConnection();
			if (LOG_ENABLE) {
				st = new LoggableStatement(conn, sql);
			} else {
				st = conn.prepareStatement(sql);
			}
			for (int i = 0; i < params.length; i++) {
				System.out.println("正在set：" + i);
				st.setObject(i + 1, params[i]);

			}
			if (LOG_ENABLE) {
				System.out.println("执行查询："
						+ ((LoggableStatement) st).getQueryString());
			}
			st.execute();
			conn.commit();
		} finally {
			if (st != null)
				st.close();
			if (conn != null) {
				conn.rollback();
				conn.close();
			}
		}
	}

	/**
	 * 绑定变量方式执行SQL，用于外部统一控制事务，conn应在外面提交、回滚和关闭
	 * 
	 * @param sql
	 * @param params
	 * @param conn
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static void executeDML(String sql, Object[] params, Connection conn)
			throws SQLException {
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				st.setObject(i + 1, params[i]);
			}
			st.execute();
		} finally {
			if (st != null)
				st.close();
		}
	}

	/**
	 * 使用绑定变量方式执行DML语句 内部事务
	 * 
	 * @param sql
	 * @param params
	 *            参数集合
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static void ExecuteDML(String sql, List<Object> params)
			throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		Object[] param = new Object[params.size()];
		for (int i = 0; i < params.size(); i++) {
			param[i] = params.get(i);
		}
		executeDML(sql, param);
	}

	/**
	 * 绑定变量方式执行SQL，外部控制连接打开、关闭、提交
	 * 
	 * @param sql
	 * @param params
	 * @param conn
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static void ExecuteDML(String sql, List<Object> params,
			Connection conn) throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		Object[] param = new Object[params.size()];
		for (int i = 0; i < params.size(); i++) {
			param[i] = params.get(i);
		}
		executeDML(sql, param, conn);
	}

	/**
	 * 获取数据库级的毫秒
	 * 
	 * @return
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static String getSYSDATEMS() throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		List<Map<String, Object>> result = JDBCOracleUtil
				.executeQuery("SELECT to_char(current_timestamp(5),'YYYYMMDDHH24MISSFF') RESULT FROM DUAL"
						.toUpperCase());
		return String.valueOf(result.get(0).get("RESULT"));
	}
}

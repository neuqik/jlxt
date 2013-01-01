package org.eweb4j.orm.dao.select;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.biz.util.JDBCOracleUtil;

import org.eweb4j.orm.dao.DAOException;
import org.eweb4j.orm.jdbc.JdbcUtil;
import org.eweb4j.orm.sql.SqlFactory;

public class DivPageDAOImpl implements DivPageDAO {
	private DataSource ds;
	private String dbType;

	public DivPageDAOImpl(DataSource ds, String dbType) {
		this.ds = ds;
		this.dbType = dbType;
	}

	public <T> T nextOne(T t) throws DAOException {
		if (t != null) {
			@SuppressWarnings("unchecked")
			Class<T> clazz = (Class<T>) t.getClass();
			Connection con = null;
			try {
				con = ds.getConnection();
				List<T> list = JdbcUtil.getList(con, clazz, SqlFactory
						.getSelectSql(t, dbType).nextOne());
				return list != null && !list.isEmpty() ? list.get(0) : null;
			} catch (Exception e) {
				throw new DAOException("nextOne exception ", e);
			}
		}
		return null;
	}

	public <T> T nextOne(Class<T> clazz, String column, int value)
			throws DAOException {
		if (clazz != null) {
			Connection con = null;
			try {
				con = ds.getConnection();
				List<T> list = JdbcUtil.getList(con, clazz,
						SqlFactory.getSelectSql(clazz.newInstance(), dbType)
								.nextOne(column, value));
				return list != null && !list.isEmpty() ? list.get(0) : null;
			} catch (Exception e) {
				throw new DAOException("nextOne exception ", e);
			}
		}
		return null;
	}

	public <T> T preOne(T t) throws DAOException {
		if (t != null) {
			Connection con = null;
			try {
				con = ds.getConnection();
				@SuppressWarnings("unchecked")
				List<T> list = JdbcUtil.getList(con, (Class<T>) t.getClass(),
						SqlFactory.getSelectSql(t, dbType).preOne());
				return list != null && !list.isEmpty() ? list.get(0) : null;
			} catch (Exception e) {
				throw new DAOException("preOne exception ", e);
			}
		}
		return null;
	}

	public <T> T preOne(Class<T> clazz, String column, int value)
			throws DAOException {
		if (clazz != null) {
			Connection con = null;
			try {
				con = ds.getConnection();
				List<T> list = JdbcUtil.getList(con, clazz,
						SqlFactory.getSelectSql(clazz.newInstance(), dbType)
								.preOne(column, value));
				return list != null && !list.isEmpty() ? list.get(0) : null;
			} catch (Exception e) {

				throw new DAOException("preOne exception ", e);
			}
		}
		return null;
	}

	public <T> List<T> divPageByWhere(Class<T> clazz, int currPage,
			int numPerPage, String orderField, int orderType, String condition,
			Object[] args) throws DAOException {
		List<T> list = null;
		Connection con = null;
		if (clazz != null) {
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(clazz.newInstance(),
						dbType).divPage(currPage, numPerPage, orderField,
						orderType, condition);
				list = JdbcUtil.getListWithArgs(con, clazz, sql, args);
			} catch (Exception e) {
				throw new DAOException("divPageByWhere exception ", e);
			}
		}
		return list;
	}

	/**
	 * @author lef2371@gmail.com
	 * @param clazz
	 * @param currPage
	 * @param numPerPage
	 * @param orderField
	 * @param orderType
	 * @param condition
	 * @param args
	 * @return
	 * @throws DAOException
	 */
	public <T> List<HashMap<String, String>> queryBySql(int currPage,
			int numPerPage, String orderField, int orderType, String condition,
			Object[] args, String sql) throws DAOException {
		List<HashMap<String, String>> list = null;
		Connection con = null;
		try {
			con = ds.getConnection();
			list = JdbcUtil.getListWithSql(con, sql, args);
		} catch (Exception e) {
			throw new DAOException("queryBySQL exception ", e);
		}
		return list;
	}

	/**
	 * @author lef2371@gmail.com
	 * @param clazz
	 * @param currPage
	 * @param numPerPage
	 * @param orderField
	 * @param orderType
	 * @param condition
	 * @param args
	 * @return
	 * @throws DAOException
	 */
	public <T> Map<String, Object> divPageBySqlMap(int currPage,
			int numPerPage, String orderField, String orderType,
			String condition, Object[] args, String sql) throws DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, String>> list = null;
		String allcount = "";
		Connection con = null;
		try {
			// con = ds.getConnection();
			con = JDBCOracleUtil.getConnection();
			Map<String, String> sql_map = getSQL(sql, currPage, numPerPage,
					orderField, orderType); // 获取执行sql
			list = JdbcUtil.getListWithSql(con,
					String.valueOf(sql_map.get("sql_e")), args);
			allcount = getAllCount(sql_map);
			map.put("list", list);
			map.put("allCount", allcount);
		} catch (Exception e) {
			throw new DAOException("divPageBySqlMap exception ", e);
		}
		return map;
	}

	/**
	 * 获取记录数
	 * 
	 * @lef2371@gmail.com
	 * @param sql_map
	 * @return
	 * @throws DAOException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public String getAllCount(Map<String, String> sql_map) throws DAOException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		String allcount = "";
		Connection con = null;
		try {
			con = JDBCOracleUtil.getConnection();
			allcount = String.valueOf(JdbcUtil.getObject(con,
					String.valueOf(sql_map.get("sql_c"))));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allcount;

	}

	/**
	 * 根据前台分页信息获取执行sql
	 * 
	 * @author lef2371@gmail.com
	 * @param sql
	 * @param currPage
	 * @param numPerPage
	 * @param orderField
	 * @param orderType
	 * @return map_sql
	 * @throws Exception
	 */
	public Map<String, String> getSQL(String sql, int currPage, int numPerPage,
			String orderField, String orderType) throws Exception {
		Map<String, String> map_sql = new HashMap<String, String>();
		int max = currPage * numPerPage;
		int min = (currPage - 1) * numPerPage + 1;
		String sql_e = sql;
		String sql_c = "SELECT count(*) FROM (" + sql + ") A ";

		sql_e = "SELECT * from (SELECT B.*, ROWNUM RN FROM ((SELECT * FROM ("
				+ sql + ") A %s ) B) WHERE ROWNUM <= " + max + ") WHERE RN >= "
				+ min + "";

		if (((!"".equals(orderField)) && (!"null".equals(orderField)))
				&& ((!"".equals(orderType)) && (!"null".equals(orderType)))) {
			sql_e = String.format(sql_e, "ORDER BY A." + orderField + " "
					+ orderType + "");
		} else {
			sql_e = String.format(sql_e, "");
		}
		map_sql.put("sql_e", sql_e);
		map_sql.put("sql_c", sql_c);
		return map_sql;
	}

	public <T> List<T> divPage(Class<T> clazz, int currPage, int numPerPage,
			String orderField, int orderType) throws DAOException {
		return this.divPageByWhere(clazz, currPage, numPerPage, orderField,
				orderType, null, null);
	}

	public <T> List<T> divPage(Class<T> clazz, int currPage, int numPerPage,
			int orderType) throws DAOException {
		return this.divPageByWhere(clazz, currPage, numPerPage, null,
				orderType, null, null);
	}

	public <T> List<T> divPageByWhere(Class<T> clazz, int currPage,
			int numPerPage, int orderType, String condition, Object[] args)
			throws DAOException {
		return this.divPageByWhere(clazz, currPage, numPerPage, null,
				orderType, condition, args);
	}

	public <T> List<T> divPage(Class<T> clazz, int currPage, int numPerPage)
			throws DAOException {
		return this.divPageByWhere(clazz, currPage, numPerPage, null, -1, null,
				null);
	}

	public <T> List<T> divPageByWhere(Class<T> clazz, int currPage,
			int numPerPage, String condition, Object[] args)
			throws DAOException {
		return this.divPageByWhere(clazz, currPage, numPerPage, null, -1,
				condition, args);
	}

	public <T> List<T> divPageByFieldIsValue(Class<T> clazz, String[] fields,
			String[] values, String orderField, int orderType, int currPage,
			int numPerPage, boolean isOR) throws DAOException {
		List<T> list = null;
		if (clazz != null) {
			Connection con = null;
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(clazz.newInstance(),
						dbType).selectWhere(fields, values, -2, false, false,
						isOR, orderField, orderType, currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldIsValue exception ", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldNotIsValue(Class<T> clazz,
			String[] fields, String[] values, String orderField, int orderType,
			int currPage, int numPerPage, boolean isOR) throws DAOException {
		List<T> list = null;
		if (clazz != null) {
			Connection con = null;
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(clazz.newInstance(),
						dbType).selectWhere(fields, values, -2, false, true,
						isOR, orderField, orderType, currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldNotIsValue exception ", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldIsValue(T t, String[] fields,
			String orderField, int orderType, int currPage, int numPerPage,
			boolean isOR) throws DAOException {
		List<T> list = null;
		if (t != null) {
			Connection con = null;
			@SuppressWarnings("unchecked")
			Class<T> clazz = (Class<T>) t.getClass();
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(t, dbType).selectWhere(
						fields, null, -2, false, false, isOR, orderField,
						orderType, currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldIsValue exception ", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldNotIsValue(T t, String[] fields,
			String orderField, int orderType, int currPage, int numPerPage,
			boolean isOR) throws DAOException {
		List<T> list = null;
		if (t != null) {
			@SuppressWarnings("unchecked")
			Class<T> clazz = (Class<T>) t.getClass();
			Connection con = null;
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(t, dbType).selectWhere(
						fields, null, -2, false, true, isOR, orderField,
						orderType, currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldNotIsValue exception ", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldIsValue(Class<T> clazz, String[] fields,
			String[] values, int orderType, int currPage, int numPerPage,
			boolean isOR) throws DAOException {
		return this.divPageByFieldIsValue(clazz, fields, values, null,
				orderType, currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldNotIsValue(Class<T> clazz,
			String[] fields, String[] values, int orderType, int currPage,
			int numPerPage, boolean isOR) throws DAOException {
		return this.divPageByFieldNotIsValue(clazz, fields, values, null,
				orderType, currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldIsValues(T t, String[] fields,
			int orderType, int currPage, int numPerPage, boolean isOR)
			throws DAOException {
		List<T> list = null;
		if (t != null) {
			@SuppressWarnings("unchecked")
			Class<T> clazz = (Class<T>) t.getClass();
			Connection con = null;
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(t, dbType).selectWhere(
						fields, null, -2, false, false, isOR, null, orderType,
						currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldIsValues exception", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldNotIsValues(T t, String[] fields,
			int orderType, int currPage, int numPerPage, boolean isOR)
			throws DAOException {
		List<T> list = null;
		if (t != null) {
			@SuppressWarnings("unchecked")
			Class<T> clazz = (Class<T>) t.getClass();
			Connection con = null;
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(t, dbType).selectWhere(
						fields, null, -2, false, true, isOR, null, orderType,
						currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldNotIsValues exception ",
						e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldIsValue(Class<T> clazz, String[] fields,
			String[] values, int currPage, int numPerPage, boolean isOR)
			throws DAOException {
		return this.divPageByFieldIsValue(clazz, fields, values, null, -1,
				currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldNotIsValue(Class<T> clazz,
			String[] fields, String[] values, int currPage, int numPerPage,
			boolean isOR) throws DAOException {
		return this.divPageByFieldNotIsValue(clazz, fields, values, null, -1,
				currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldIsValue(T t, String[] fields,
			int currPage, int numPerPage, boolean isOR) throws DAOException {
		return this.divPageByFieldIsValue(t, fields, null, -1, currPage,
				numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldNotIsValue(T t, String[] fields,
			int currPage, int numPerPage, boolean isOR) throws DAOException {
		return this.divPageByFieldNotIsValue(t, fields, null, -1, currPage,
				numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldLikeValue(Class<T> clazz, String[] fields,
			String[] values, int likeType, String orderField, int orderType,
			int currPage, int numPerPage, boolean isOR) throws DAOException {
		List<T> list = null;
		if (clazz != null) {
			Connection con = null;
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(clazz.newInstance(),
						dbType).selectWhere(fields, values, likeType, true,
						false, isOR, orderField, orderType, currPage,
						numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldLikeValue exception ", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldNotLikeValue(Class<T> clazz,
			String[] fields, String[] values, int likeType, String orderField,
			int orderType, int currPage, int numPerPage, boolean isOR)
			throws DAOException {
		List<T> list = null;
		if (clazz != null) {
			Connection con = null;
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(clazz.newInstance(),
						dbType)
						.selectWhere(fields, values, likeType, true, true,
								isOR, orderField, orderType, currPage,
								numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {

				throw new DAOException("divPageByFieldNotLikeValue exception ",
						e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldLikeValue(T t, String[] fields,
			int likeType, String orderField, int orderType, int currPage,
			int numPerPage, boolean isOR) throws DAOException {
		List<T> list = null;
		if (t != null) {
			Connection con = null;
			@SuppressWarnings("unchecked")
			Class<T> clazz = (Class<T>) t.getClass();
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(t, dbType).selectWhere(
						fields, null, likeType, true, false, isOR, orderField,
						orderType, currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("divPageByFieldLikeValue exception", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldNotLikeValue(T t, String[] fields,
			int likeType, String orderField, int orderType, int currPage,
			int numPerPage, boolean isOR) throws DAOException {
		List<T> list = null;
		if (t != null) {
			Connection con = null;
			@SuppressWarnings("unchecked")
			Class<T> clazz = (Class<T>) t.getClass();
			try {
				con = ds.getConnection();
				String sql = SqlFactory.getSelectSql(t, dbType).selectWhere(
						fields, null, likeType, true, true, isOR, orderField,
						orderType, currPage, numPerPage);
				list = JdbcUtil.getList(con, clazz, sql);
			} catch (Exception e) {
				throw new DAOException("", e);
			}
		}
		return list;
	}

	public <T> List<T> divPageByFieldLikeValue(Class<T> clazz, String[] fields,
			String[] values, int likeType, int orderType, int currPage,
			int numPerPage, boolean isOR) throws DAOException {
		return this.divPageByFieldLikeValue(clazz, fields, values, likeType,
				null, orderType, currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldNotLikeValue(Class<T> clazz,
			String[] fields, String[] values, int likeType, int orderType,
			int currPage, int numPerPage, boolean isOR) throws DAOException {
		return this.divPageByFieldNotLikeValue(clazz, fields, values, likeType,
				null, orderType, currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldLikeValue(T t, String[] fields,
			int likeType, int orderType, int currPage, int numPerPage,
			boolean isOR) throws DAOException {
		return this.divPageByFieldLikeValue(t, fields, likeType, null,
				orderType, currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldNotLikeValue(T t, String[] fields,
			int likeType, int orderType, int currPage, int numPerPage,
			boolean isOR) throws DAOException {
		return this.divPageByFieldNotLikeValue(t, fields, likeType, null,
				orderType, currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldLikeValue(Class<T> clazz, String[] fields,
			String[] values, int likeType, int currPage, int numPerPage,
			boolean isOR) throws DAOException {
		return this.divPageByFieldLikeValue(clazz, fields, values, likeType,
				-1, currPage, numPerPage, isOR);
	}

	public <T> List<T> divPageByFieldNotLikeValue(Class<T> clazz,
			String[] fields, String[] values, int likeType, int currPage,
			int numPerPage, boolean isOR) throws DAOException {
		return this.divPageByFieldNotLikeValue(clazz, fields, values, likeType,
				-1, currPage, numPerPage, isOR);
	}

	public String getDbType() {
		return dbType;
	}

	public void setDbType(String dbType) {
		this.dbType = dbType;
	}

	public DataSource getDs() {
		return ds;
	}

	public void setDs(DataSource ds) {
		this.ds = ds;
	}
}

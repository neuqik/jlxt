package net.codegenerate;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.biz.util.JDBCOracleUtil;

/**
 * 生成SQL
 * 
 * @author kuqi
 * 
 */
public class GenerateSQL {
	/**
	 * 生成SELECT的SQL代码
	 * @return 返回原始的列列表
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static List<String> generateCode() throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		List<String> cols = new ArrayList<String>();
		List<String> originalCols = new ArrayList<String>(); // 保存原始的列名
		// 根据表，得到全部列，拼写SQL
		String tableName = Generator.getParam().get("data.table").toUpperCase();
		Connection conn = JDBCOracleUtil.getConnection("jlxt", "jlxt",
				"192.168.56.101", "ORCL", "1521");
		List<Map<String, Object>> result = JDBCOracleUtil
				.executeQuery(
						"select column_name,data_type,data_length from user_tab_cols where table_name = '"
								.toUpperCase()
								+ tableName
								+ "' order by column_name".toUpperCase(), conn);

		// var sql =
		// "SELECT ID,EMP_ID,EMP_NAME,fun_getcodedesc('EMPTYPE',EMPTYPE) EMPTYPE,TO_CHAR(BIRTH,'YYYY-MM-DD') BIRTH,AGE,fun_getcodedesc('DEPT_ID',DEPT_ID) DEPT_ID,fun_getcodedesc('GENDER',GENDER) GENDER,IDCARD,fun_getcodedesc('ROLENAME',ROLENAME) ROLENAME,TO_CHAR(WORKDATE,'YYYY-MM-DD') WORKDATE,TO_CHAR(JOINDATE,'YYYY-MM-DD') JOINDATE,TEL,EMERGENCY,fun_getloc(LOCATION1) LOCATION1,fun_getloc(LOCATION2) LOCATION2,fun_getloc(LOCATION3) LOCATION3,fun_getcodedesc('ARCHIVEKEEP',ARCHIVEKEEP) ARCHIVEKEEP,PENSION_NO,MEDICA_NO,MEMO FROM V_HRD_EMP";
		// 循环生成上述类型的SQL
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = it.next();
			String colName = (String) row.get("COLUMN_NAME");
			String dType = (String) row.get("DATA_TYPE");
			int dLength = Integer.parseInt(String.valueOf(row
					.get("DATA_LENGTH")));
			cols.add(colName);
			originalCols.add(colName);
			// 如果是Varchar2(3)，则首先考虑是否是CodeList
			if (dType.equals("VARCHAR2") && dLength == 3) {
				conn = JDBCOracleUtil.getConnection("jlxt", "jlxt",
						"192.168.56.101", "ORCL", "1521");
				int rc = JDBCOracleUtil.executeTotalCount(
						"SELECT 1 FROM T_CODELIST WHERE CODE_TYPE='" + colName
								+ "'", -1, conn);
				if (rc > 0) {
					cols.add("fun_getcodedesc('" + colName + "'," + colName
							+ ") " + colName + "");
					cols.remove(colName);
				}
			}
			// 如果是日期类型
			if (dType.equals("DATE")) {
				cols.add("TO_CHAR(" + colName + ",'YYYY-MM-DD') " + colName
						+ "");
				cols.remove(colName);
			}
			// 如果包含LOCATION，则转换一下
			if (colName.contains("LOCATION")) {
				cols.add("fun_getloc(" + colName + ") " + colName + "");
				cols.remove(colName);
			}
		}
		// 根据生成的列产生SQL
		String sql = cols.toString().toUpperCase();
		sql = "SELECT " + sql.substring(1, sql.length() - 1) + " FROM V_"
				+ tableName;
		Generator.getParam().put("data.sql", sql);
		System.out.println("生成的SQL:" + sql);
		return originalCols;
	}

	public static void main(String[] args) {
		Generator.getParam().put("data.table", "HRD_EMP");
		GenerateSQL gs = new GenerateSQL();
		try {
			GenerateSQL.generateCode();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}

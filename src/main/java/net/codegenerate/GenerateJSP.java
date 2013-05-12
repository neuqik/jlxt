package net.codegenerate;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.biz.util.JDBCOracleUtil;

import org.apache.commons.io.FileUtils;

public class GenerateJSP {
	public static void generateCode() throws IOException {
		// 获取路径
		String path = Generator.getParam().get("path.web.jsp");
		path = path.replaceAll("[.]", "/");
		String tempPath = Generator.getParam().get("path.temp");
		path = tempPath + path;
		File dir = new File(path);
		// 删除前备份
		if (dir.exists()) {
			FileUtils.copyDirectoryToDirectory(dir, new File(tempPath
					+ "resources_bak"));
			FileUtils.deleteDirectory(dir);
		}

		boolean isDirCreated = dir.mkdirs();
		if (isDirCreated)
			System.out.println("jsp目录已经创建." + path);
		else
			System.out.println("创建jsp目录失败");
		// 创建web 下面的Action文件
		String javaTemp = generateJSP();
		// 获取jsp的名字
		String jspName = Generator.getParam().get("path.web.rest");
		FileUtils.writeStringToFile(new File(path + "/" + jspName + ".jsp"),
				javaTemp, "UTF-8");
		System.out.println("写入jsp。目录:" + path + "/" + jspName + ".jsp");
	}

	// 生成JSP代码
	private static String generateJSP() throws IOException {

		File file = new File(
				"D:/eclipse/workspace/building/src/main/webapp/WEB-INF/classes/net/codegenerate/template/jsp.temp");

		String javaTemp = FileUtils.readFileToString(file, "UTF-8");
		// 替换内容
		Iterator<String> it = Generator.getParam().keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			javaTemp = javaTemp.replaceAll("@@" + key + "@@", Generator
					.getParam().get(key));
		}
		return javaTemp;
	}

	/**
	 * 根据数据库表生成表单代码片段
	 * 
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public static String generateFormFlagByTable(String tableName,
			String valueObjectName) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException {
		String flag = "";
		String sql = "SELECT column_name, data_type, data_length  FROM user_tab_columns WHERE table_name = '"
				+ tableName + "'";
		Connection conn = JDBCOracleUtil.getConnection("jlxt", "jlxt",
				"192.168.56.101", "ORCL", "1521");
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(
				sql.toUpperCase(), conn);
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = it.next();
			String dataType = String.valueOf(row.get("DATA_TYPE"));
			int dataLength = Integer.parseInt(String.valueOf(row
					.get("DATA_LENGTH")));
			String columnName = String.valueOf(row.get("COLUMN_NAME"));
			conn = JDBCOracleUtil.getConnection("jlxt", "jlxt",
					"192.168.56.101", "ORCL", "1521");
			String comments = String.valueOf(JDBCOracleUtil
					.executeQuery(
							"select comments from user_col_comments where table_name = '"
									+ tableName + "' and column_name = '"
									+ columnName + "'", conn).get(0)
					.get("COMMENTS"));
			// 1.日期类型
			if ("DATE".equals(dataType)) {
				flag = flag
						+ "<p><label>"
						+ comments
						+ "：</label> <input type=\"text\" name=\""
						+ columnName
						+ "\" class=\"date\" size=\"30\" yearstart=\"-80\" yearend=\"5\" "
						+ writeValue(valueObjectName, columnName)
						+ "/><a	class=\"inputDateButton\" href=\"javascript:;\">选择</a></p>"+"\n";
				continue;
			}
			// 2.LOCATION类
			if ("LOCATION1".equals(columnName)) {
				flag = flag
						+ "<p><label>"
						+ comments
						+ "：</label> <select id=\"LOCATION1\" name=\"LOCATION1\" class=\"combox\" ref=\"LOCATION2\" refUrl=\"${BaseURL}common/doGetCity?location1={value}\"><option value=\"\">请选择...</option><c:forEach var=\"item\" items=\"${LOCATION1}\"><option value=\"${item.codeValue}\""
						+ writeValueOption(valueObjectName, "LOCATION1")
						+ ">${item.codeDesc}</option></c:forEach></select></p>"+"\n";
				continue;
			}
			if ("LOCATION2".equals(columnName)) {
				flag = flag
						+ "<p><label>"
						+ comments
						+ "：</label> <select id=\"LOCATION2\" name=\"LOCATION2\" class=\"combox\" ref=\"LOCATION3\" refUrl=\"${BaseURL}common/doGetArea?location2={value}\"><option value=\"\">请选择...</option><c:forEach var=\"item\" items=\"${LOCATION2}\"><option value=\"${item.codeValue}\""
						+ writeValueOption(valueObjectName, "LOCATION2")
						+ ">${item.codeDesc}</option></c:forEach></select></p>"+"\n";
				continue;
			}
			if ("LOCATION3".equals(columnName)) {
				flag = flag
						+ "<p><label>"
						+ comments
						+ "：</label> <select id=\"LOCATION3\" name=\"LOCATION3\" class=\"combox\"><option value=\"\">请选择...</option><c:forEach var=\"item\" items=\"${LOCATION3}\"><option value=\"${item.codeValue}\""
						+ writeValueOption(valueObjectName, "LOCATION3")
						+ ">${item.codeDesc}</option></c:forEach></select></p>"+"\n";
				continue;
			}
			// 3.下拉框
			if ("VARCHAR2".equals(dataType) & dataLength == 3) {
				flag = flag
						+ "<p><label>"
						+ comments
						+ "：</label> <select name=\""
						+ columnName
						+ "\" class=\"combox\"><option value=\"\">请选择...</option><c:forEach var=\"item\" items=\"${"
						+ columnName
						+ "}\"><option value=\"${item.codeValue}\" "
						+ writeValueOption(valueObjectName, columnName)
						+ ">${item.codeDesc}</option></c:forEach></select></p>"+"\n";
				continue;
			}
			// 4.其他类型
			flag = flag + "<p><label>" + comments
					+ "：</label><input type=\"text\" size=\"30\" name=\""
					+ columnName + "\" "
					+ writeValue(valueObjectName, columnName) + " maxlength=\""
					+ dataLength + "\" /></p>"+"\n";
		}
		return flag;
	}

	/**
	 * 生成非option的value值
	 * 
	 * @param valueObjectName
	 * @param columnName
	 * @return
	 */
	private static String writeValue(String valueObjectName, String columnName) {
		if (valueObjectName == null || "".equals(valueObjectName)) {
			return "";
		} else {
			return "value=\"${" + valueObjectName + "." + columnName + "}\" ";
		}
	}
	/**
	 * 写value Option的选择
	 * @param valueObjectName
	 * @param columnName
	 * @return
	 */
	private static String writeValueOption(String valueObjectName,
			String columnName) {
		if (valueObjectName == null || "".equals(valueObjectName)) {
			return "";
		} else {
			return "<c:if test=\"${item.codeValue == " + valueObjectName + "."
					+ columnName + "}\"> 	selected=\"selected\"</c:if>";
		}
	}
	public static void main(String[] args) {
		try {
			String result = GenerateJSP.generateFormFlagByTable("PRJ_UNIT", "prj");
			System.out.println(result);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

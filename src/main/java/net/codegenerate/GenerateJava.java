package net.codegenerate;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.io.FileUtils;

public class GenerateJava {
	public static void generateCode() throws IOException {
		// 获取路径
		String path = Generator.getParam().get("path.package");
		path = path.replaceAll("[.]", "/");
		String tempPath = Generator.getParam().get("path.temp");
		path = tempPath + path;
		File dir = new File(path);
		// 删除前备份
		if (dir.exists()) {
			FileUtils.copyDirectoryToDirectory(dir, new File(tempPath
					+ "net_bak"));
			FileUtils.deleteDirectory(dir);
		}
		boolean isDirCreated = dir.mkdirs();
		dir = new File(path + "/web");
		dir.mkdirs();
		dir = new File(path + "/vo");
		dir.mkdirs();
		dir = new File(path + "/model");
		dir.mkdirs();
		if (isDirCreated)
			System.out.println("java目录已经创建." + path);
		else
			System.out.println("创建java目录失败");
		// 创建web 下面的Action文件
		String javaTemp = generateAction();
		// 获取Action的名字
		String actionName = Generator.getParam().get("name.action");
		FileUtils.writeStringToFile(new File(path + "/web/" + actionName
				+ ".java"), javaTemp, "UTF-8");
		System.out.println("写入Action。目录:" + path + "/" + actionName + ".java");
	}

	// 生成Action类
	private static String generateAction() throws IOException {

		File file = new File(
				"D:/eclipse/workspace/building/src/main/webapp/WEB-INF/classes/net/codegenerate/template/java.temp");

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
	 * 根据表名生成VO对象
	 * 
	 * @param tableName
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 * @throws IOException
	 */
	public static void generateVO(String tableName, String path)
			throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException, IOException {
		String code = "";
		// 1.获取表的所有列，循环生成对象
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
			String declare = "private String " + columnName
					+ ("VALID".equals(columnName) ? "=\"1\"" : "") + ";\n";
			String set = "public void set" + columnName + "(String the"
					+ columnName + "){\n" + columnName + "=the" + columnName
					+ ";\n}\n";
			String get = "public String get" + columnName + "(){\n return "
					+ columnName + "; \n }\n";
			if ("DATE".equals(dataType)) {
				get = get
						+ "public Date get"
						+ columnName
						+ "ForSqlDate(){\n return DateUtils.parseFormerSqlDate(get"
						+ columnName + "());\n}\n";
			}
			code = code + declare + set + get;
		}
		code = "public class " + tableName + " {\n" + code + "}";
		FileUtils.writeStringToFile(new File(path + tableName + ".java"), code);
		System.out.println("生成VO成功：" + path + tableName + ".java");
	}

	public static void main(String[] args) {
		try {
			// 1.生成VO的代码
			// GenerateJava
			// .generateVO("ADM_REMIND",
			// "D:\\eclipse\\workspace\\building\\src\\main\\java\\net\\biz\\mgr\\vo\\");
			// 2.生成service中保存新对象的代码
			GenerateJava.generateINSERTMethod("ADM_REMIND", "row");
			GenerateJava.generateUPDATEMethod("ADM_REMIND", "row");
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成service中的insertnew方法的内容
	 * 
	 * @param tableName
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throw ClassNotFoundException
	 * @throw IllegalAccessException
	 * @throws InstantiationExceptio
	 */
	public static void generateINSERTMethod(String tableName, String pre)
			throws InstantiationException, IllegalAccessException,
			SQLException, ClassNotFoundException, IOException {
		String cols = "";
		String asks = "";
		String sets = "";
		int i = 0;
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
			cols = cols + "," + columnName;
			asks = asks + "," + "?";
			if ("DATE".equals(dataType)) {
				sets = sets + "params.add(" + i++ + "," + pre + ".get"
						+ columnName + "ForSqlDate());\n";
			} else {
				if ("ID".equals(columnName)) {
					sets = sets + "params.add(" + i++
							+ ",JDBCOracleUtil.getID());\n";
				} else {
					sets = sets + "params.add(" + i++ + "," + pre + ".get"
							+ columnName + "());\n";
				}
			}
		}
		System.out.println("------------------输出方法内容-----------------------");
		String insert = "String sql = \"INSERT INTO V_" + tableName + "("
				+ cols.substring(1) + ") VALUES(" + asks.substring(1)
				+ ")\";\n";
		System.out.println(insert);
		String content = "List<Object> params = new ArrayList<Object>();\n"
				+ sets + "JDBCOracleUtil.ExecuteDML(sql, params);\n";
		System.out.println(content);
		System.out.println("------------------输出方法结束-----------------------");
	}

	/**
	 * 生成UPDATE的参考方法
	 * 
	 * @param tableName
	 * @param pre
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IOException
	 */
	public static void generateUPDATEMethod(String tableName, String pre)
			throws InstantiationException, IllegalAccessException,
			SQLException, ClassNotFoundException, IOException {
		String cols = "";
		String sets = "";
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
			cols = cols + "," + columnName + "=?";

			if ("DATE".equals(dataType)) {
				sets = sets + "params.add(" + pre + ".get" + columnName
						+ "ForSqlDate());\n";
			} else {
				if ("ID".equals(columnName)) {
					sets = sets + "params.add(JDBCOracleUtil.getID());\n";
				} else {
					sets = sets + "params.add(" + pre + ".get" + columnName
							+ "());\n";
				}
			}
		}
		System.out.println("------------------输出方法内容-----------------------");
		String update = "String sql = \"UPDATE V_" + tableName + " SET "
				+ cols.substring(1) + ";\n";
		System.out.println(update);
		String content = "List<Object> params = new ArrayList<Object>();\n"
				+ sets + "JDBCOracleUtil.ExecuteDML(sql, params);\n";
		System.out.println(content);
		System.out.println("------------------输出方法结束-----------------------");
	}
}

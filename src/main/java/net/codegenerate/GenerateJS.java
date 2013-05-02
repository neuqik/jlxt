package net.codegenerate;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FileUtils;

import net.biz.util.JDBCOracleUtil;
import net.sf.json.JSONArray;

public class GenerateJS {
	public static void generateCode() throws IOException {
		// 获取路径
		String path = Generator.getParam().get("path.web.js");
		path = path.replaceAll("[.]", "/");
		String tempPath = Generator.getParam().get("path.temp");
		path = tempPath + path;
		File dir = new File(path);
		// 删除前备份
		if (dir.exists()) {
			FileUtils.copyDirectoryToDirectory(dir, new File(tempPath
					+ "pages_bak"));
			FileUtils.deleteDirectory(dir);
		}

		boolean isDirCreated = dir.mkdirs();
		if (isDirCreated)
			System.out.println("js目录已经创建." + path);
		else
			System.out.println("创建js目录失败");
		// 创建web 下面的Action文件
		String javaTemp = generateJSP();
		// 获取jsp的名字
		String jsName = Generator.getParam().get("path.web.rest");
		FileUtils.writeStringToFile(new File(path + "/" + jsName + ".js"),
				javaTemp, "UTF-8");
		System.out.println("写入js。目录:" + path + "/" + jsName + ".js");
	}

	// 生成JSP代码
	private static String generateJSP() throws IOException {

		File file = new File(
				"D:/eclipse/workspace/building/src/main/webapp/WEB-INF/classes/net/codegenerate/template/js.temp");

		String javaTemp = FileUtils.readFileToString(file, "GBK");
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
	 * 生成js的fields段内容
	 * 
	 * @param cols
	 */
	public static void generateFields(List<String> cols) {
		List<JSONField> fields = new ArrayList<JSONField>();
		Iterator<String> it = cols.iterator();
		while (it.hasNext()) {
			String name = (String) it.next();
			fields.add(new JSONField(name, ""));
		}
		JSONArray json = JSONArray.fromObject(fields);
		String fieldString = json.toString().replaceAll("\"name\"", "name");
		fieldString = fieldString.replaceAll(",\"type\":\"\"", "");
		Generator.getParam().put("data.fileds", fieldString);
		System.out.println("生成的JSON Fields:" + fieldString);
	}

	public static void generateCols(List<String> cols)
			throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		String tableName = Generator.getParam().get("data.table");
		List<JSONCols> dsCols = new ArrayList<JSONCols>();
		Iterator<String> it = cols.iterator();
		while (it.hasNext()) {
			String name = (String) it.next();
			Connection conn = JDBCOracleUtil.getConnection("jlxt", "jlxt",
					"192.168.56.101", "ORCL", "1521");
			String header = String.valueOf(JDBCOracleUtil
					.executeQuery(
							"select comments from user_col_comments where table_name = '"
									+ tableName + "' and column_name = '"
									+ name + "'", conn).get(0).get("COMMENTS"));
			dsCols.add(new JSONCols(name, header, 100, false));
		}
		JSONArray json = JSONArray.fromObject(dsCols);
		String colsString = json.toString().replaceAll("\"id\"", "id");
		colsString = colsString.replaceAll("\"width\"", "width");
		colsString = colsString.replaceAll("\"editable\"", "editable");
		colsString = colsString.replaceAll("\"header\"", "header");
		colsString = colsString.replaceFirst("[{]",
				"{id:\"chk\",isCheckColumn:true,frozen:true},{");
		Generator.getParam().put("data.colsoption", colsString);
		System.out.println("生成的JSON Cols:" + colsString);
	}
}

package net.codegenerate;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class Client {

	/**
	 * 调用代码生成工具
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			// path.package
			Generator.getParam().put("path.package", "net.biz.project");
			// 设置临时路径
			Generator.getParam().put("path.temp", "e:/temp/");
			// path.web
			Generator.getParam().put("path.web", "prj");
			Generator.getParam().put("path.web.jsp", "resources.prj.view");
			Generator.getParam().put("path.web.js", "pages.prj");
			// path.web.rest
			Generator.getParam().put("path.web.rest", "editorg");
			// path.web.rest.init首字母大写
			Generator.getParam().put("path.web.rest.init", "EditOrg");
			// ActionClassName
			Generator.getParam().put("name.action", "PRJAction");
			// ---------------js-----------------
			// data.table 要查询的表
			Generator.getParam().put("data.table", "PRJ_ORG");
			// data.sql SQL语句，自动转换成大写，先生成SQL
			List<String> originalCols = GenerateSQL.generateCode();
			// ${data.fileds}，数据列的内容
			GenerateJS.generateFields(originalCols);
			// data.uniqueField 唯一列的名字，大小写敏感
			Generator.getParam().put("data.uniqueField", "ID");
			// data.colsoption 列显示的内容
			GenerateJS.generateCols(originalCols);
			// /////////////////////准备参数完成//////////////////////////
			// 开始模板替换工作
			// 替换java
			GenerateJava.generateCode();
			// 替换JSP
			GenerateJSP.generateCode();
			// 替换JS
			GenerateJS.generateCode();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

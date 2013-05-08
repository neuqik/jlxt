package net.codegenerate;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

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
}

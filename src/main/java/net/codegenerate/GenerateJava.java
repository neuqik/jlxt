package net.codegenerate;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;

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
}

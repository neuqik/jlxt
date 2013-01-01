package net.biz.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.eweb4j.mvc.MVC;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class BeanUtil {
	/**
	 * 根据Bean名字查询Bean Bean使用@Service定义
	 * 
	 * @param beanName
	 * @return
	 * @throws Exception
	 */
	public static Object getBean(String beanName) {
		return WebApplicationContextUtils.getWebApplicationContext(
				MVC.ctx().getServletContext()).getBean(beanName);
	}
	/**
	 * 用于生成js array的级联CodeList菜单
	 * @param list
	 * @return
	 */
	public static String cascadeComboxList2JSArray(
			List<Map<String, Object>> list) {
		Iterator<Map<String, Object>> it = list.iterator();
		String str = "";
		while (it.hasNext()) {
			Map<String, Object> row = (Map<String, Object>) it.next();
			String codeValue = (String) row.get("CODE_VALUE");
			String codeDesc = (String) row.get("CODE_DESC");
			String cur = "[\"" + codeValue + "\",\"" + codeDesc + "\"]";
			str = str + "," + cur;
		}
		str = str.length() > 0 ? "[" + str.replaceFirst(",", "") + "]" : "";
		return str;
	}
}

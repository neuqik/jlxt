package net.biz.framework.codelist;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.biz.util.JDBCOracleUtil;

import org.springframework.stereotype.Service;

@Service("CodeList")
public class CodeList {

	private static Map<String, List<Code>> codeMap;

	public static Map<String, List<Code>> getCodeMap() {
		return codeMap;
	}

	// @Resource(name = "dataSource")
	// private DataSource ds;

	public void init() throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		// 初始化对象
		codeMap = new HashMap<String, List<Code>>();
		List<Code> codes = new ArrayList<Code>();
		String sql = "SELECT CODE_TYPE,CODE_VALUE,CODE_DESC FROM T_CODELIST WHERE VALID='1' ORDER BY CODE_TYPE,CODE_VALUE";
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
				JDBCOracleUtil.getConnection());
		String lastCodeType = "";
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = (Map<String, Object>) it.next();

			Code code = new Code();
			String codeType = (String) row.get("CODE_TYPE");
			String codeValue = (String) row.get("CODE_VALUE");
			String codeDesc = (String) row.get("CODE_DESC");
			if ("".equals(lastCodeType)) {
				lastCodeType = codeType;
			}
			code.setCodeType(codeType);
			code.setCodeValue(codeValue);
			code.setCodeDesc(codeDesc);
			// 如果还是在这个里面，则添加到list中
			if (lastCodeType.equals(codeType)) {
				codes.add(code);
				if (!it.hasNext()) {
					System.out.println("装载代码:" + lastCodeType);
					codeMap.put(lastCodeType, codes);
				}
			} else {
				System.out.println("装载代码:" + lastCodeType);
				codeMap.put(lastCodeType, codes);
				codes = new ArrayList<Code>();
				codes.add(code);
				lastCodeType = codeType;
			}
		}
		initLocation();
		initItem();
	}

	/**
	 * 初始化省行政区的codelist
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	private void initLocation() throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		// 初始化对象
		List<Code> codes = new ArrayList<Code>();
		String sql = "select 'LOCATION1' CODE_TYPE,region_code CODE_VALUE,location CODE_DESC from t_loc where member='0' order by region_code"
				.toUpperCase();
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
				JDBCOracleUtil.getConnection());
		String lastCodeType = "";
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = (Map<String, Object>) it.next();

			Code code = new Code();
			String codeType = (String) row.get("CODE_TYPE");
			String codeValue = (String) row.get("CODE_VALUE");
			String codeDesc = (String) row.get("CODE_DESC");
			if ("".equals(lastCodeType)) {
				lastCodeType = codeType;
			}
			code.setCodeType(codeType);
			code.setCodeValue(codeValue);
			code.setCodeDesc(codeDesc);
			// 如果还是在这个里面，则添加到list中
			if (lastCodeType.equals(codeType)) {
				codes.add(code);
				if (!it.hasNext()) {
					System.out.println("装载代码:" + lastCodeType);
					codeMap.put(lastCodeType, codes);
				}
			} else {
				System.out.println("装载代码:" + lastCodeType);
				codeMap.put(lastCodeType, codes);
				codes = new ArrayList<Code>();
				codes.add(code);
				lastCodeType = codeType;
			}
		}
	}

	/**
	 * 初始化检查扣分大项
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	private void initItem() throws SQLException, InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		// 初始化对象
		List<Code> codes = new ArrayList<Code>();
		String sql = "select 'ITEM' CODE_TYPE,check_code CODE_VALUE,checkcontent CODE_DESC from t_checklist_prj where member='0' and valid='1' order by check_code"
				.toUpperCase();
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
				JDBCOracleUtil.getConnection());
		String lastCodeType = "";
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = (Map<String, Object>) it.next();

			Code code = new Code();
			String codeType = (String) row.get("CODE_TYPE");
			String codeValue = (String) row.get("CODE_VALUE");
			String codeDesc = (String) row.get("CODE_DESC");
			if ("".equals(lastCodeType)) {
				lastCodeType = codeType;
			}
			code.setCodeType(codeType);
			code.setCodeValue(codeValue);
			code.setCodeDesc(codeDesc);
			// 如果还是在这个里面，则添加到list中
			if (lastCodeType.equals(codeType)) {
				codes.add(code);
				if (!it.hasNext()) {
					System.out.println("装载代码:" + lastCodeType);
					codeMap.put(lastCodeType, codes);
				}
			} else {
				System.out.println("装载代码:" + lastCodeType);
				codeMap.put(lastCodeType, codes);
				codes = new ArrayList<Code>();
				codes.add(code);
				lastCodeType = codeType;
			}
		}
	}

	/**
	 * 获取CodeList
	 * 
	 * @param codeType
	 * @return
	 */
	public static List<Code> getCodeList(String codeType) {
		return getCodeMap().get(codeType);
	}

	/**
	 * 获取某个特定的代码值的中文名称
	 * 
	 * @param codeType
	 *            代码类型 DEPT_ID
	 * @param codeValue
	 *            代码描述 如A01
	 * @return
	 */
	public static String getCodeDesc(String codeType, String codeValue) {
		String desc = "";
		List<Code> list = getCodeList(codeType);
		if (list == null || list.size() <= 0) {
			return codeValue;
		}
		Iterator<Code> it = list.iterator();
		while (it.hasNext()) {
			Code type = (Code) it.next();
			if (codeValue.equalsIgnoreCase(type.getCodeValue())) {
				desc = type.getCodeDesc();
				return desc;
			}
		}
		return desc;
	}

	/**
	 * 根据代码描述获得代码值，用于反向查
	 * 
	 * @param codeType
	 * @param codeValue
	 * @return
	 */
	public static String getCodeValue(String codeType, String codeDesc) {
		String value = codeDesc;
		List<Code> list = getCodeList(codeType);
		if (list == null || list.size() <= 0) {
			return codeDesc;
		}
		Iterator<Code> it = list.iterator();
		while (it.hasNext()) {
			Code type = (Code) it.next();
			if (codeDesc.equalsIgnoreCase(type.getCodeDesc())) {
				value = type.getCodeValue();
				return value;
			}
		}
		return value;
	}

	/**
	 * 根据省获取市的下拉列表
	 * 
	 * @param loc1
	 * @return
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static List<Code> getLocation2(String loc1) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		List<Code> loc2 = new ArrayList<Code>();
		String sql = "select 'LOCATION2' CODE_TYPE,region_code CODE_VALUE,location CODE_DESC from t_loc where member='1' and upper_code='"
				+ loc1 + "' order by region_code";
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(
				sql.toUpperCase(), JDBCOracleUtil.getConnection());
		String lastCodeType = "";
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = (Map<String, Object>) it.next();

			Code code = new Code();
			String codeType = (String) row.get("CODE_TYPE");
			String codeValue = (String) row.get("CODE_VALUE");
			String codeDesc = (String) row.get("CODE_DESC");
			if ("".equals(lastCodeType)) {
				lastCodeType = codeType;
			}
			code.setCodeType(codeType);
			code.setCodeValue(codeValue);
			code.setCodeDesc(codeDesc);
			// 如果还是在这个里面，则添加到list中
			if (lastCodeType.equals(codeType)) {
				loc2.add(code);
				if (!it.hasNext()) {
					System.out.println("装载代码:" + lastCodeType);
					codeMap.put(lastCodeType, loc2);
				}
			} else {
				System.out.println("装载代码:" + lastCodeType);
				loc2 = new ArrayList<Code>();
				loc2.add(code);
				lastCodeType = codeType;
			}
		}
		return loc2;
	}

	/**
	 * 根据市获取县区的下拉列表
	 * 
	 * @param loc2
	 * @return
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws ClassNotFoundException
	 */
	public static List<Code> getLocation3(String loc2) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		List<Code> loc3 = new ArrayList<Code>();
		String sql = "select 'LOCATION3' CODE_TYPE,region_code CODE_VALUE,location CODE_DESC from t_loc where member='2' and upper_code='"
				+ loc2 + "' order by region_code";
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(
				sql.toUpperCase(), JDBCOracleUtil.getConnection());
		String lastCodeType = "";
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = (Map<String, Object>) it.next();

			Code code = new Code();
			String codeType = (String) row.get("CODE_TYPE");
			String codeValue = (String) row.get("CODE_VALUE");
			String codeDesc = (String) row.get("CODE_DESC");
			if ("".equals(lastCodeType)) {
				lastCodeType = codeType;
			}
			code.setCodeType(codeType);
			code.setCodeValue(codeValue);
			code.setCodeDesc(codeDesc);
			// 如果还是在这个里面，则添加到list中
			if (lastCodeType.equals(codeType)) {
				loc3.add(code);
				if (!it.hasNext()) {
					System.out.println("装载代码:" + lastCodeType);
					codeMap.put(lastCodeType, loc3);
				}
			} else {
				System.out.println("装载代码:" + lastCodeType);
				loc3 = new ArrayList<Code>();
				loc3.add(code);
				lastCodeType = codeType;
			}
		}
		return loc3;
	}

	public static List<Code> getCheckItem(String item) throws SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		List<Code> items = new ArrayList<Code>();
		String sql = "select 'CHECKITEM' CODE_TYPE,check_code CODE_VALUE,checkcontent CODE_DESC from t_checklist_prj where member='1' and upper_code='"
				+ item + "' order by check_code";
		List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(
				sql.toUpperCase(), JDBCOracleUtil.getConnection());
		String lastCodeType = "";
		Iterator<Map<String, Object>> it = result.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = (Map<String, Object>) it.next();

			Code code = new Code();
			String codeType = (String) row.get("CODE_TYPE");
			String codeValue = (String) row.get("CODE_VALUE");
			String codeDesc = (String) row.get("CODE_DESC");
			if ("".equals(lastCodeType)) {
				lastCodeType = codeType;
			}
			code.setCodeType(codeType);
			code.setCodeValue(codeValue);
			code.setCodeDesc(codeDesc);
			// 如果还是在这个里面，则添加到list中
			if (lastCodeType.equals(codeType)) {
				items.add(code);
				if (!it.hasNext()) {
					System.out.println("装载代码:" + lastCodeType);
					codeMap.put(lastCodeType, items);
				}
			} else {
				System.out.println("装载代码:" + lastCodeType);
				items = new ArrayList<Code>();
				items.add(code);
				lastCodeType = codeType;
			}
		}
		return items;
	}
}

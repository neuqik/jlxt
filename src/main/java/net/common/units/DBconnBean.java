package net.common.units;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eweb4j.orm.dao.DAOFactory;
import org.eweb4j.orm.dao.select.DivPageDAO;
/**
 * 
 * @author lef2371@gmail.com
 * 
 */
public class DBconnBean {

	private static DivPageDAO divPageDAO;


	/**
	 * 执行更新
	 * 
	 * @param sql
	 * @throws Exception
	 */
	public void executeUpdate(String sql) throws Exception {

	}

	/**
	 * 执行查询
	 * @author lef2371@gmail.com
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public  <T> List<HashMap<String,String>>  executeQuery(String sql,Object[] args,Map<String,String> pageMap) throws Exception
	    {
		    divPageDAO = DAOFactory.getDivPageDAO();
	    	List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
	    	int pageNum = Integer.valueOf(pageMap.get("pageNum"));
	    	int numPerPage = Integer.valueOf(pageMap.get("numPerPage"));	    	
	    	list = divPageDAO.queryBySql(pageNum,numPerPage, "", 1, "", args, sql);
	    	return list;
	    }
	

	/**
	 * @author lef2371@gmail.com
	 * @param sql
	 * @param args 查询条件
	 * @param pageMap 分页信息
	 * @return
	 * @throws Exception
	 */
	public static Map<String, Object> executeQueryMap(String sql,Object[] args,Map<String,String> pageMap) throws Exception
    {
	    divPageDAO = DAOFactory.getDivPageDAO();
    	Map<String,Object> map = new HashMap<String, Object>();
    	int pageNum = Integer.valueOf(pageMap.get("pageNum"));
    	int numPerPage = Integer.valueOf(pageMap.get("numPerPage"));
    	String orderFiled = String.valueOf(pageMap.get("orderField"));
    	String orderDirection = String.valueOf(pageMap.get("orderDirection"));
    	
    	map = divPageDAO.divPageBySqlMap(pageNum,numPerPage, orderFiled, orderDirection, "", args, sql);
    	return map;
    }	
	
	/*
	 * @Action(value = "/groupconditioninfo") public String groupConditionInfo()
	 * throws Exception { String groupid = (String) this.getParam("groupid");
	 * String menuid = (String) this.getParam("menuid"); String sql =
	 * "SELECT * FROM custom_query_middle a WHERE a.menu_id = " + menuid +
	 * " AND a.group_id = " + groupid; CInfo info = new CInfo(); try {
	 * ArrayList<HashMap<String, String>> list = sqlResultTOList(sql);
	 * info.data("list", list); info.success();
	 * 
	 * } catch (Exception e) { info.fault("获取条件组下条件出错：" + e.getMessage());
	 * e.printStackTrace(); } wrapJsonResponse(info); return null; }
	 * 
	 * @Action(value = "/saveconditioninfo") public String saveConditioninfo()
	 * throws Exception {
	 * 
	 * CInfo info = new CInfo(); Connection conn = null; OraclePreparedStatement
	 * pstat = null; CallableStatement proc = null; String expr_id = ""; String
	 * menu_id = ""; String expr_name = ""; String expr_inuse = ""; String
	 * expr_desc = ""; try { conn = JDBCOracleUtil.getConnection(SIPropertyUtil
	 * .getValueByName("jdbc.username"), SIPropertyUtil
	 * .getValueByName("jdbc.password"), SIPropertyUtil
	 * .getValueByName("jdbc.url")); JSONArray js =
	 * getBodyForJSON().getJSONArray("arraylist"); String groupid = (String)
	 * getParam("groupid"); String menuid = (String) getParam("menuid"); pstat =
	 * (OraclePreparedStatement) conn
	 * .prepareStatement("DELETE custom_query_middle WHERE group_id =" + groupid
	 * + " and menu_id =" + menuid); pstat.executeUpdate(); conn.commit(); //
	 * 保存表custom_query_middle 和 custom_query_main 多对一 for (Object js_o : js) {
	 * JSONArray js_a = (JSONArray) js_o; expr_id =
	 * js_a.getJSONObject(0).getString("EXPR_ITEM_ID"); menu_id =
	 * js_a.getJSONObject(0).getString("MENU_ID"); expr_name =
	 * js_a.getJSONObject(0).getString("EXPR_ITEM_NAME"); expr_inuse =
	 * js_a.getJSONObject(1).toString(); expr_desc =
	 * js_a.getJSONObject(2).toString(); pstat = (OraclePreparedStatement) conn
	 * .prepareStatement(
	 * "INSERT INTO custom_query_middle(EXPR_ID,MENU_ID,EXPR_DESC,EXPR_NAME,EXPR_INUSE,GROUP_ID) VALUES (?,?,?,?,?,?)"
	 * ); pstat.setInt(1, new Integer(expr_id)); // 条件ID pstat.setInt(2, new
	 * Integer(menu_id)); // 菜单ID pstat.setString(3, expr_desc); // 条件描述
	 * pstat.setString(4, expr_name); // 条件名称 pstat.setString(5, expr_inuse); //
	 * 在用条件 pstat.setInt(6, new Integer(groupid)); // 条件组ID
	 * pstat.executeUpdate(); conn.commit(); }
	 * 
	 * // 保存表custom_query_main if ("0".equals(groupid)) {
	 * 
	 * proc = conn
	 * .prepareCall("{call pkg_解析json存储.PRC_保存定制条件(?,?,?,?,?,?,?,?)}");
	 * proc.setInt(1, new Integer(expr_id)); proc.setInt(2, new
	 * Integer(menu_id)); proc.setInt(3, new Integer(groupid));
	 * proc.setString(4, expr_name); proc.setString(5, expr_inuse);
	 * proc.setString(6, expr_desc); proc.registerOutParameter(7,
	 * Types.VARCHAR); proc.registerOutParameter(8, Types.VARCHAR);
	 * proc.executeUpdate(); String prm_appcode =
	 * String.valueOf(proc.getString(7)); String prm_appmsg =
	 * String.valueOf(proc.getString(8)); if ("0".equals(prm_appcode)) {
	 * info.success(); conn.commit(); } else { info.fault(prm_appmsg);
	 * conn.rollback(); } } else { info.success(); conn.commit(); }
	 * wrapJsonResponse(info);
	 * 
	 * } catch (Exception e) { conn.rollback(); e.printStackTrace();
	 * info.fault("应用定制条件保存数据库时出错：" + e.getMessage()); } finally { try {
	 * pstat.close(); proc.close(); JDBCOracleUtil.closeConnection(conn); }
	 * catch (SQLException e) { e.printStackTrace(); } } return null; }
	 */
}

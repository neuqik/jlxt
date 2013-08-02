package net.biz.project.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.framework.codelist.CodeList;
import net.biz.project.model.IPRJService;
import net.biz.project.vo.PRJ_BUILDING;
import net.biz.project.vo.PRJ_CHECK;
import net.biz.project.vo.PRJ_INFO;
import net.biz.project.vo.PRJ_INFO_EXT;
import net.biz.project.vo.PRJ_MAJORCHECK;
import net.biz.project.vo.PRJ_ORG;
import net.biz.project.vo.PRJ_UNIT;
import net.biz.project.vo.PRJ_UNIT_RELATE;
import net.biz.project.vo.ProjectQueryParam;
import net.biz.util.BeanUtil;
import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.config.ConfigConstant;
import org.eweb4j.mvc.MVC;
import org.eweb4j.mvc.upload.UploadFile;
import org.eweb4j.util.FileUtil;

@Path("/prj")
public class PRJAction extends BaseAction {
	@Resource(name = "prjServiceImpl")
	private IPRJService myservice = (IPRJService) BeanUtil
			.getBean("prjServiceImpl");

	/**
	 * 打开页面
	 */
	@Path("/showproject")
	@GET
	@POST
	public String toShowProject() {
		return "forward:prj/view/showproject.jsp";
	}

	/**
	 * 打开添加项目的页面
	 * 
	 * @return
	 */
	@Path("/addproject")
	@GET
	@POST
	public String toAddProject(Map<String, List> model) {
		String code1 = "DEPT_ID|PRJ_LEVEL|PRJ_TYPE|WEEKMEETING|WEEKMEETINGTIME|PRJ_ARCHIVE|LOCATION1|QUALITY_TARGET";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addproject.jsp";
	}

	/**
	 * 保存新项目
	 * 
	 * @return
	 */
	@Path("/savenewproject")
	@GET
	@POST
	public String toSaveNewProject(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_INFO prjInfo = (PRJ_INFO) parseRequest(req, new PRJ_INFO());
			String prjNo = myservice.saveNewProject(prjInfo);
			model.put("PRJNO", prjNo);
			return successJSONReload("添加项目成功，请继续补充项目其他信息，项目编号：" + prjNo,
					"dialog", "prj/addproject", "xzxm");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 修改项目信息，打开多个tab页
	 * 
	 * @return
	 */
	@Path("/editproject")
	@GET
	@POST
	public String toEditProject(Map<String, String> model) {
		String prjId = MVC.ctx().getRequest().getParameter("PRJ_ID");
		model.put("PRJ_ID", prjId);
		return "forward:prj/view/editprojectall.jsp";
	}

	/**
	 * 编辑项目信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editprojectinfo")
	@GET
	@POST
	public String toEditProjectInfo(Map<String, Object> model) {
		String[] ms = null;
		String prjId = MVC.ctx().getRequest().getParameter("PRJ_ID");
		try {
			ms = MVC.ctx().getRequest().getParameterMap().get("method");
			// 如果有上一个下一个
			if (ms != null && ms.length > 0) {
				String m = ms[0];
				if ("next".equals(m)) {
					String[] prjno = MVC.ctx().getRequest().getParameterMap()
							.get("prjno");
					List<Map<String, Object>> r1 = JDBCOracleUtil
							.executeQuery("SELECT ID FROM V_PRJ_INFO WHERE PRJNO>'"
									+ prjno[0] + "' AND ROWNUM=1 ");
					if (r1.size() == 1) {
						prjId = String.valueOf(r1.get(0).get("ID"));
					}
				}
				if ("up".equals(m)) {
					String[] prjno = MVC.ctx().getRequest().getParameterMap()
							.get("prjno");
					List<Map<String, Object>> r1 = JDBCOracleUtil
							.executeQuery("SELECT ID FROM V_PRJ_INFO WHERE PRJNO<'"
									+ prjno[0]
									+ "' AND ROWNUM=1 ORDER BY PRJNO DESC");
					if (r1.size() == 1) {
						prjId = String.valueOf(r1.get(0).get("ID"));
					}
				}
			}
			// 查询内容
			String sql = "SELECT BUILDINGCOUNT, CONTRACTAREA, CONTRACTNO, ID, LOCATION1, LOCATION2, LOCATION3, LOCATION4, MEMO, PRJNO, PRJ_ARCHIVE, PRJ_ARCHIVETIME, PRJ_AREA, PRJ_ENDTIME, PRJ_INVEST, PRJ_LEVEL, PRJ_MAP, PRJ_NAME, PRJ_PIC, PRJ_PROGRESS, PRJ_REGION, PRJ_STARTTIME, ROUND((PRJ_ENDTIME-PRJ_STARTTIME)/30,2) PRJ_TIME, PRJ_TYPE, QUALITY_TARGET, VALID, WEEKMEETING, WEEKMEETINGTIME FROM V_PRJ_INFO WHERE ID="
					+ prjId;
			String code1 = "DEPT_ID|PRJ_LEVEL|PRJ_TYPE|WEEKMEETING|WEEKMEETINGTIME|PRJ_ARCHIVE|LOCATION1|QUALITY_TARGET";
			Map a = CodeList.getCodeMap();

			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			PRJ_INFO prj = new PRJ_INFO();
			BeanUtils.populate(prj, result.get(0));
			model.put("prj", prj);
			// 获取辅助显示信息
			sql = "SELECT fun_getconstruct(ID) CONSTRUCT_TYPE,fun_getheight(ID) HEIGHT,fun_getfloor(ID) FLOOR, fun_getseclevel(ID) SECURITY_LEVEL ,fun_getactbegin(ID) ACT_BEGIN, fun_getactend(ID) ACT_END, ROUND(fun_getacttime(ID)/30,2) ACT_TIME, fun_getdept(ID) DEPT_ID, fun_getimage(ID) IMAGE_PROGRESS FROM V_PRJ_INFO WHERE ID="
					+ prjId;
			List<Map<String, Object>> result1 = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			PRJ_INFO_EXT prj1 = new PRJ_INFO_EXT();
			BeanUtils.populate(prj1, result1.get(0));
			model.put("prjExt", prj1);
			// 获取LOCATION2和LOCATION3的CodeList值
			model.put("LOCATION2", CodeList.getLocation2(prj.getLOCATION1()));
			model.put("LOCATION3", CodeList.getLocation3(prj.getLOCATION2()));
			model.put("PRJ_ID", prjId);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		if (ms != null && ms.length > 0) {
			return "forward:prj/view/editprojectall.jsp";
		} else {
			return "forward:prj/view/editprojectinfo.jsp";
		}
	}

	/**
	 * 保存编辑项目
	 * 
	 * @return
	 */
	@Path("/saveeditproject")
	@GET
	@POST
	public String toSaveEditProject(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_INFO prjInfo = (PRJ_INFO) parseRequest(req, new PRJ_INFO());
			String prjNo = myservice.saveEditProject(prjInfo);
			model.put("PRJNO", prjNo);
			return successJSON("修改项目成功，项目编号：" + prjNo, "dialog",
					"prj/editprojectinfo", "xmxm");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 删除项目
	 * 
	 * @param model
	 * @return
	 */
	@Path("/delproject")
	@GET
	@POST
	public String toDelProject(Map<String, String> model) {
		try {
			String Id = getParam("ID");
			String prjId = getParam("PRJ_ID");
			myservice.delProject(Id);
			model.put("PRJ_ID", prjId);
			return successJSON("删除项目成功", "dialog", "prj/showproject", "scxm");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 打开编辑工程窗口
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editbuilding")
	@GET
	@POST
	public String toEditBuilding(Map<String, String> model) {
		model.put("PRJ_ID", getParam("PRJ_ID"));
		return "forward:prj/view/editbuilding.jsp";
	}

	/**
	 * 保存工程信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/savebuilding")
	@POST
	@GET
	public String toSaveBuilding(Map<String, String> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);

		try {
			List<Object> insertList = handler
					.getInsertedRecords(PRJ_BUILDING.class);
			List<Object> updateList = handler
					.getUpdatedRecords(PRJ_BUILDING.class);
			List<Object> deleteList = handler
					.getDeletedRecords(PRJ_BUILDING.class);
			myservice.saveBuilding(insertList, updateList, deleteList, prjId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 编辑单位和项目的关系
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editrelate")
	@GET
	@POST
	public String toEditRelate(Map<String, String> model) {
		model.put("PRJ_ID", getParam("PRJ_ID"));
		return "forward:prj/view/editrelate.jsp";
	}

	/**
	 * 保存工程信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saverelate")
	@POST
	@GET
	public String toSaveRelate(Map<String, String> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);
		try {
			List<Object> insertList = handler
					.getInsertedRecords(PRJ_UNIT_RELATE.class);
			List<Object> updateList = handler
					.getUpdatedRecords(PRJ_UNIT_RELATE.class);
			List<Object> deleteList = handler
					.getDeletedRecords(PRJ_UNIT_RELATE.class);
			myservice.saveRelate(insertList, updateList, deleteList, prjId);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}

	/**
	 * 编辑参建单位信息
	 * 
	 * @return
	 */
	@Path("/editunitall")
	@GET
	@POST
	public String toEditUnitAll(Map<String, String> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);
		return "forward:prj/view/editunitall.jsp";
	}

	/**
	 * 打开添加新的参建单位界面
	 * 
	 * @param model
	 * @return
	 */
	@Path("/addunit")
	@GET
	@POST
	public String toAddUnit(Map<String, Object> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);
		String code1 = "UNIT_TYPE|QUALI_LEVEL";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addunit.jsp";
	}

	/**
	 * 编辑参建单位信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editunit")
	@GET
	@POST
	public String toEditUnit(Map<String, Object> model) {
		String prjId = getParam("PRJ_ID");
		String Id = getParam("ID");
		String sql = "select id,prj_id,unit_name,group_name,unit_type,quali_level,unit_address,contractor,title,contract_tel,memo,valid from v_prj_unit WHERE ID="
				+ Id;
		model.put("PRJ_ID", prjId);

		String code1 = "UNIT_TYPE|QUALI_LEVEL";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			PRJ_UNIT prj = new PRJ_UNIT();
			BeanUtils.populate(prj, result.get(0));
			model.put("prj", prj);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addunit.jsp";
	}

	/**
	 * 保存新建的参建单位信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/savenewunit")
	@GET
	@POST
	public String toSaveNewUnit(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_UNIT prjInfo = (PRJ_UNIT) parseRequest(req, new PRJ_UNIT());
			myservice.saveNewUnit(prjInfo);
			model.put("PRJ_ID", prjInfo.getPRJ_ID());
			return successJSON("添加参建单位成功", "dialog", "prj/editunit", "zjcjdw");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 删除参建单位信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/delunit")
	@GET
	@POST
	public String toDelUnit(Map<String, String> model) {
		try {
			String Id = getParam("ID");
			String prjId = getParam("PRJ_ID");
			myservice.delUnit(Id);
			model.put("PRJ_ID", prjId);
			return successJSON("删除参建单位成功", "dialog", "prj/editunitall",
					"sccjdw");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 编辑组织角色
	 * 
	 * @return
	 */
	@Path("/editorg")
	@GET
	@POST
	public String toEditOrg(Map<String, String> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);
		return "forward:prj/view/editorg.jsp";
	}

	/**
	 * 添加项目中的角色
	 * 
	 * @param model
	 * @return
	 */
	@Path("/addprjorg")
	@GET
	@POST
	public String toAddPrjOrg(Map<String, Object> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);
		String code1 = "PRJ_ROLE";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addprjorg.jsp";
	}

	/**
	 * 保存人员项目角色
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveneworg")
	@GET
	@POST
	public String toSaveNewOrg(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_ORG prjInfo = (PRJ_ORG) parseRequest(req, new PRJ_ORG());
			myservice.saveNewOrg(prjInfo);

			return successJSONReload("保存项目角色成功", "dialog", "prj/editprjorg",
					"xzjs");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 编辑角色信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editprjorg")
	@GET
	@POST
	public String toEditPrjOrg(Map<String, Object> model) {
		String prjId = getParam("PRJ_ID");
		String Id = getParam("ID");
		String sql = "select id,emp_id,(select emp_name from hrd_emp where emp_id=a.emp_id) emp_name,prj_role,prj_id,entertime,leavetime,responsbility,memo,valid from v_prj_org a WHERE ID="
				+ Id;
		model.put("PRJ_ID", prjId);

		String code1 = "PRJ_ROLE";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql
					.toUpperCase());
			PRJ_ORG prj = new PRJ_ORG();
			BeanUtils.populate(prj, result.get(0));
			model.put("prj", prj);
			model.put("EMP_ID", prj.getEMP_ID());
			model.put("EMP_NAME", prj.getEMP_NAME());
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addprjorg.jsp";
	}

	/**
	 * 删除项目角色信息
	 * 
	 * @param model
	 * @return
	 */
	@Path("/delprjorg")
	@GET
	@POST
	public String toDelPrjOrg(Map<String, String> model) {
		try {
			String Id = getParam("ID");
			String prjId = getParam("PRJ_ID");
			myservice.delOrg(Id);
			model.put("PRJ_ID", prjId);
			return successJSON("删除角色成功", "dialog", "prj/editprjorg", "scjs");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	// //////////////////////////////////////////高级查询////////////////////////////////////////
	/**
	 * 高级查询项目
	 * 
	 * @param model
	 * @return
	 */
	@Path("/queryproject")
	@POST
	@GET
	public String toQueryProject(Map<String, Object> model) {
		try {
			// 生成codelist
			String code1 = "DEPT_ID|PRJ_LEVEL|PRJ_TYPE|WEEKMEETING|WEEKMEETINGTIME|LOCATION1|UNIT_TYPE|QUALI_LEVEL|PRJ_ROLE";
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			model.put("currentDate", DateUtils.format(new Date()));
			return "forward:prj/view/queryproject.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 根据输入查询信息
	 * 
	 * @return
	 */
	@Path("/queryprojectbyinput")
	@GET
	@POST
	public String toQueryProjectByInput(Map<String, Object> model) {
		try {
			// 获取查询条件，保存到bean中
			ProjectQueryParam qp = (ProjectQueryParam) parseRequest(new ProjectQueryParam());
			// 拼SQL条件，生成SQL语句，供界面检查
			String where = myservice.getConditionByProjectQueryParam(qp);
			model.put("projectwhere", where);
			model.put("prj", qp);
			return "forward:prj/view/showproject.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 打开地图定位
	 */
	@Path("/showmap")
	@GET
	@POST
	public String toShowMap() {
		return "forwardtopage:prj/mapclick.jsp";
	}

	/**
	 * 保存新项目
	 * 
	 * @return
	 */
	@Path("/savemap")
	@GET
	@POST
	public String toSaveMap(Map<String, String> model) {
		try {
			String PRJNO = getParam("PRJNO");
			String PRJMAP = getParam("PRJ_MAP");
			String prjName = myservice.saveMap(PRJNO, PRJMAP);
			model.put("PRJNO", PRJNO);
			return successJSON("修改项目地图成功。项目编号：" + PRJNO + "项目名称：" + prjName,
					"dialog", "prj/showmap", "dtdw");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 项目评分检查
	 * 
	 * @return
	 */
	@Path("/projectcheckall")
	@GET
	@POST
	public String toProjectCheckAll() {
		return "forward:prj/view/projectcheckall.jsp";
	}

	/**
	 * 项目评分检查
	 * 
	 * @return
	 */
	@Path("/projectcheck")
	@GET
	@POST
	public String toProjectCheck() {
		return "forward:prj/view/projectcheck.jsp";
	}

	/**
	 * 土建检查
	 * 
	 * @return
	 */
	@Path("/projectcheck_building")
	@GET
	@POST
	public String toProjectCheck_Building() {
		return "forward:prj/view/projectcheck_building.jsp";
	}

	/**
	 * 水暖检查
	 * 
	 * @return
	 */
	@Path("/projectcheck_water")
	@GET
	@POST
	public String toProjectCheck_Water() {
		return "forward:prj/view/projectcheck_water.jsp";
	}

	/**
	 * 水暖检查
	 * 
	 * @return
	 */
	@Path("/projectcheck_electric")
	@GET
	@POST
	public String toProjectCheck_Electric() {
		return "forward:prj/view/projectcheck_electric.jsp";
	}

	/**
	 * 增加检查单
	 * 
	 * @param model
	 * @return
	 */
	@Path("/addscore")
	@GET
	@POST
	public String toAddScore(Map<String, Object> model) {
		String checkType = getParamByData("CHECK_TYPE")[0];
		String code1 = "CHECK_TYPE|JOIN_TYPE";

		// 获取对应的PRJ_ID

		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			PRJ_MAJORCHECK prj = new PRJ_MAJORCHECK();
			prj.setCHECK_USER(getCurrentUserName());
			prj.setCHECK_TYPE(checkType);
			prj.setJOIN_TYPE("1"); // 默认参加

			model.put("prj", prj);
			model.put("SaveForm", "savenewscore"); // 保存的url
			model.put("WRITE", true);
			return "forward:prj/view/addmajorcheck.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	/**
	 * 保存新评分结果
	 * 
	 * @param model
	 * @return
	 */
	@Path("/savenewscore")
	@GET
	@POST
	public String toSaveNewScore(Map<String, Object> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_MAJORCHECK prjInfo = (PRJ_MAJORCHECK) parseRequest(req,
					new PRJ_MAJORCHECK());
			String checkgroup = myservice.saveNewScore(prjInfo);
			PRJ_MAJORCHECK newPrj = new PRJ_MAJORCHECK();
			newPrj.setCHECKGROUP_NO(checkgroup);
			model.put("prj", newPrj);
			return successJSON("保存检查单成功", "dialog", "prj/showcheckgroup",
					"aqjc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 保存扣分项
	 * 
	 * @param model
	 * @return
	 */
	@Path("/savecheckitem")
	@GET
	@POST
	public String toSaveCheckItem(Map<String, Object> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_CHECK prjInfo = (PRJ_CHECK) parseRequest(req, new PRJ_CHECK());
			String checkgroup = myservice.saveCheckItem(prjInfo);
			return successJSONReload("保存评分成功", "dialog", "prj/projectcheckall",
					"zljc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 保存新评分结果
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveeditscore")
	@GET
	@POST
	public String toSaveEditScore(Map<String, Object> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_MAJORCHECK prjInfo = (PRJ_MAJORCHECK) parseRequest(req,
					new PRJ_MAJORCHECK());
			String checkgroup = myservice.saveEditScore(prjInfo);
			PRJ_MAJORCHECK newPrj = new PRJ_MAJORCHECK();
			newPrj.setCHECKGROUP_NO(checkgroup);
			model.put("prj", newPrj);
			return successJSON("保存检查单成功", "dialog", "prj/showcheckgroup",
					"aqjc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 删除评分
	 * 
	 * @param model
	 * @return
	 */
	@Path("/delscore")
	@GET
	@POST
	public String toDelScore(Map<String, String> model) {
		try {
			String Id = getParam("ID");
			myservice.delScore(Id);
			return successJSON("删除评分成功", "dialog", "prj/showcheckgroup", "sckf");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 删除检查单
	 * 
	 * @param model
	 * @return
	 */
	@Path("/delcheckgroup")
	@GET
	@POST
	public String toDelCheckgroup(Map<String, String> model) {
		try {
			String Id = getParam("ID");
			myservice.delCheckgroup(Id);
			return successJSON("删除检查单成功", "dialog", "prj/projectcheck", "aqjc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 得到项目对应的建设单位下拉列表
	 * 
	 * @param model
	 * @return
	 */
	@Path("/constructunit")
	@GET
	@POST
	public String toConstructUnit(Map<String, String> model) {
		try {
			String prjId = getParam("PRJ_ID");
			// 查询建设单位
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT 'JSDW_ID' CODE_TYPE, TO_CHAR(ID) CODE_VALUE,UNIT_NAME CODE_DESC FROM V_PRJ_UNIT WHERE PRJ_ID="
							+ prjId + " AND UNIT_TYPE='01' ORDER BY UNIT_NAME ");
			return "out:" + BeanUtil.cascadeComboxList2JSArray(result);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 显示检查项目信息
	 * 
	 * @return
	 */
	@Path("/editcheckitem")
	@GET
	@POST
	public String toEditCheckItem(Map<String, Object> model) {
		String id = getParam("ID");
		String sql = "select ID,PRJ_ID,(SELECT PRJ_NAME FROM PRJ_INFO WHERE ID = PRJ_ID) PRJ_NAME,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,DEPT_ID,FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_NAME,PROGRESS,TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE,CHECK_USER,TESTER,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID=TESTER) TESTER_NAME,MEMO,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID=V_PRJ_MAJORCHECK.EMP_ID) EMP_ID,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID=EMP_ID_2) EMP_ID_2,SUM1,RATIO1,CHECKGROUP_NO,SUM2,SUM3,CHECK_TYPE FROM V_PRJ_MAJORCHECK WHERE ID="
				+ id;
		String code1 = "CHECK_TYPE|";

		// 获取对应的PRJ_ID

		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql);
			PRJ_MAJORCHECK prj = new PRJ_MAJORCHECK();
			BeanUtils.populate(prj, result.get(0));
			model.put("prj", prj);
			model.put("CHECKGROUP_NO", prj.getCHECKGROUP_NO());
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/showcheckgroup.jsp";
	}

	/**
	 * 增加扣分
	 * 
	 * @param model
	 * @return
	 */
	@Path("/addscorebygroup")
	@GET
	@POST
	public String toAddScoreByGroup(Map<String, Object> model) {
		// 获取检查单编号
		String checkgroupNo = getParam("CHECKGROUP_NO");
		String checkType = getParamByData("CHECK_TYPE")[0];
		String code1 = "ITEM_" + checkType + "|CHECK_TYPE";

		// 获取对应的PRJ_ID

		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			model.put("ITEM", getCodeList("ITEM_" + checkType));
			// 获取项目编号
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT PRJ_ID,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,(SELECT PRJ_NAME FROM PRJ_INFO WHERE ID = PRJ_ID) PRJ_NAME,TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE FROM V_PRJ_MAJORCHECK WHERE CHECKGROUP_NO='"
							+ checkgroupNo + "' AND ROWNUM = 1");

			PRJ_CHECK prjCheck = new PRJ_CHECK();
			prjCheck.setCHECKGROUP_NO(checkgroupNo);
			prjCheck.setPRJ_ID(String.valueOf(result.get(0).get("PRJ_ID")));
			prjCheck.setPRJNO(String.valueOf(result.get(0).get("PRJNO")));
			prjCheck.setPRJ_NAME(String.valueOf(result.get(0).get("PRJ_NAME")));
			prjCheck.setCHECKDATE(String
					.valueOf(result.get(0).get("CHECKDATE")));
			model.put("CHECKGROUP_NO", checkgroupNo);
			model.put("prj", prjCheck);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addscore.jsp";
	}

	/**
	 * 编辑扣分
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editscore")
	@GET
	@POST
	public String toEditScore(Map<String, Object> model) {
		// 获取检查单编号
		String id = getParam("ID");

		String sql = "select ID,PRJ_ID,(SELECT PRJ_NAME FROM PRJ_INFO WHERE ID = PRJ_ID) PRJ_NAME,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,DEPT_ID,FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_NAME,PROGRESS,TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE,CHECK_USER,TESTER,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID=TESTER) TESTER_NAME,MEMO,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID=V_PRJ_MAJORCHECK.EMP_ID) EMP_ID,(SELECT EMP_NAME FROM HRD_EMP WHERE EMP_ID=EMP_ID_2) EMP_ID_2,SUM1,RATIO1,CHECKGROUP_NO,SUM2,SUM3,CHECK_TYPE,JOIN_TYPE,BATCHNO FROM V_PRJ_MAJORCHECK WHERE ID="
				+ id;
		String code1 = "CHECK_TYPE|JOIN_TYPE";

		// 获取对应的PRJ_ID

		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 获取对应的PRJ_ID
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql);
			PRJ_MAJORCHECK prj = new PRJ_MAJORCHECK();
			BeanUtils.populate(prj, result.get(0));
			model.put("prj", prj);
			model.put("SaveForm", "saveeditscore");
			model.put("WRITE", false);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addmajorcheck.jsp";
	}

	/**
	 * 查询下一个项目
	 * 
	 * @param model
	 * @return
	 */
	@Path("/nextproject")
	@GET
	@POST
	public String toNextProject(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_UNIT prjInfo = (PRJ_UNIT) parseRequest(req, new PRJ_UNIT());
			myservice.saveNewUnit(prjInfo);
			model.put("PRJ_ID", prjInfo.getPRJ_ID());
			return successJSON("添加参建单位成功", "dialog", "prj/editunit", "zjcjdw");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 查询上一个项目
	 * 
	 * @param model
	 * @return
	 */
	@Path("/upproject")
	@GET
	@POST
	public String toUpProject(Map<String, String> model) {
		try {
			HttpServletRequest req = MVC.ctx().getRequest();
			PRJ_UNIT prjInfo = (PRJ_UNIT) parseRequest(req, new PRJ_UNIT());
			myservice.saveNewUnit(prjInfo);
			model.put("PRJ_ID", prjInfo.getPRJ_ID());
			return successJSON("添加参建单位成功", "dialog", "prj/editunit", "zjcjdw");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 编辑项目照片
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editprojectphoto")
	@GET
	@POST
	public String toEditProjectPhoto(Map<String, Object> model) {
		try {
			String prjId = getParam("PRJ_ID");
			List<Map<String, Object>> rs = JDBCOracleUtil
					.executeQuery("SELECT PRJNO,PRJ_NAME FROM V_PRJ_INFO WHERE ID="
							+ prjId);
			model.put("PRJ_ID", prjId);
			model.put("PRJ_NAME", rs.get(0).get("PRJ_NAME"));
			model.put("PRJNO", rs.get(0).get("PRJNO"));
			return "forward:prj/view/editprojectphoto.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 保存项目照片
	 * 
	 * @param model
	 * @return
	 */
	@Path("/saveprojectphoto")
	@POST
	@GET
	public String toSaveProjectPhoto(Map<String, String> model) {

		try {

			String prjId = getParam("PRJ_ID");
			String prjNo = String.valueOf(JDBCOracleUtil
					.executeQuery(
							"SELECT PRJNO FROM V_PRJ_INFO WHERE ID=" + prjId)
					.get(0).get("PRJNO"));
			String path = ConfigConstant.ROOT_PATH + "pictures/prj/" + prjNo
					+ ".jpg";
			model.put("PRJNO", prjNo);
			String randFileName = prjNo + "_"
					+ String.valueOf(Math.round(Math.random() * 10000));
			model.put("RANDOMFILE", randFileName);
			Map<String, List<UploadFile>> result = MVC.ctx().getUploadMap();
			if (result.size() <= 0)
				return dwz.getFailedJson("没有上传文件").toString();
			UploadFile file = result.get("file1").get(0);
			FileUtil.copy(file.getTmpFile(), new File(path));
			// FileUtil.copy(file.getTmpFile(), new
			// File(ConfigConstant.ROOT_PATH
			// + "pictures/emp/tmp/" + randFileName));
			return successJSONReload("保存项目照片成功，项目编号：" + prjNo, "navTab",
					"prj/editprojectphoto", "xmtp");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 检查员工的甘特图
	 * 
	 * @return
	 */
	@Path("/empgantt")
	@GET
	@POST
	public String toEmpGantt() {
		return "forward:prj/view/empgantt.jsp";
	}

	/**
	 * 查询员工的甘特图
	 * 
	 * @return
	 */
	@Path("/querygantt")
	@GET
	@POST
	public String toQueryGantt() {
		try {
			String beginDate = getParam("BEGINDATE");
			String endDate = getParam("ENDDATE");
			String empId = getParam("EMPNO");
			String xml = myservice.generateGantt(beginDate, endDate, empId);
			successXML(xml);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}
}

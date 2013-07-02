package net.biz.project.web;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import net.biz.project.vo.PRJ_ORG;
import net.biz.project.vo.PRJ_UNIT;
import net.biz.project.vo.PRJ_UNIT_RELATE;
import net.biz.project.vo.ProjectQueryParam;
import net.biz.util.BeanUtil;
import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;

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
		try {
			String prjId = MVC.ctx().getRequest().getParameter("PRJ_ID");
			String m = MVC.ctx().getRequest().getParameterMap().get("method")[0];
			// 如果有上一个下一个
			if ("next".equals(m)) {
				List<Map<String, Object>> r1 = JDBCOracleUtil
						.executeQuery("SELECT ID FROM V_PRO_INFO WHERE ID>"
								+ prjId + " AND ROWNUM =1");
				if (r1.size() == 1) {
					prjId = String.valueOf(r1.get(0).get("ID"));
				}
			}
			if ("up".equals(m)) {
				List<Map<String, Object>> r1 = JDBCOracleUtil
						.executeQuery("SELECT ID FROM V_PRO_INFO WHERE ID>"
								+ prjId + " AND ROWNUM =1");
				if (r1.size() == 1) {
					prjId = String.valueOf(r1.get(0).get("ID"));
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
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/editprojectinfo.jsp";
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
	@Path("/projectcheck")
	@GET
	@POST
	public String toProjectCheck() {
		return "forward:prj/view/projectcheck.jsp";
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
	public String toAddScore(Map<String, List> model) {
		String code1 = "ITEM|";
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
		return "forward:prj/view/addscore.jsp";
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
			PRJ_CHECK prjInfo = (PRJ_CHECK) parseRequest(req, new PRJ_CHECK());
			String checkgroup = myservice.saveNewScore(prjInfo);
			PRJ_CHECK newPrj = new PRJ_CHECK();
			newPrj.setCHECKGROUP_NO(checkgroup);
			model.put("prj", newPrj);
			return successJSONReload("保存评分成功", "dialog", "prj/showcheckgroup",
					"bjpf");
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
	 * 显示检查单信息
	 * 
	 * @return
	 */
	@Path("/showcheckgroup")
	@GET
	@POST
	public String toShowCheckGroup(Map<String, String> model) {
		String prjId = getParam("PRJ_ID");
		String checkgroupNo = getParam("CHECKGROUP_NO");
		model.put("PRJ_ID", prjId);
		model.put("CHECKGROUP_NO", checkgroupNo);
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
		String code1 = "ITEM|";

		// 获取对应的PRJ_ID

		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			// 获取项目编号
			List<Map<String, Object>> result = JDBCOracleUtil
					.executeQuery("SELECT PRJ_ID,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,(SELECT PRJ_NAME FROM PRJ_INFO WHERE ID = PRJ_ID) PRJ_NAME FROM V_PRJ_CHECK WHERE CHECKGROUP_NO='"
							+ checkgroupNo + "' AND ROWNUM = 1");

			PRJ_CHECK prjCheck = new PRJ_CHECK();
			prjCheck.setCHECKGROUP_NO(checkgroupNo);
			prjCheck.setPRJ_ID(String.valueOf(result.get(0).get("PRJ_ID")));
			prjCheck.setPRJNO(String.valueOf(result.get(0).get("PRJNO")));
			prjCheck.setPRJ_NAME(String.valueOf(result.get(0).get("PRJ_NAME")));
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

		String sql = "SELECT ACT_SCORE, TO_CHAR(BEGINDATE,'YYYY-MM-DD') BEGINDATE, TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE, CHECKGROUP_NO, (SELECT UPPER_CODE FROM T_CHECKLIST_PRJ WHERE CHECK_CODE = CHECKITEM) ITEM, CHECKITEM, CONSTRUCT_TYPE,FUN_GETCODEDESC('CONSTRUCT_TYPE',CONSTRUCT_TYPE) CONSTRUCT_TYPE_NAME, FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_ID, (SELECT EMP_NAME FROM HRD_EMP A WHERE A.EMP_ID=C.EMP_ID) EMP_ID, TO_CHAR(ENDDATE,'YYYY-MM-DD') ENDDATE, ID, (SELECT UNIT_NAME FROM PRJ_UNIT B WHERE B.ID=JSDW_ID) UNIT_NAME, JSDW_ID, MEMO, (SELECT PRJNO FROM PRJ_INFO WHERE ID = C.PRJ_ID) PRJNO,(SELECT PRJ_NAME FROM PRJ_INFO WHERE ID = C.PRJ_ID) PRJ_NAME, PRJ_ID, PRJ_PROGRESS, (SELECT UNIT_NAME FROM PRJ_UNIT B WHERE B.ID=SGDW_ID) SGDW_NAME, SGDW_ID, FUN_GETCODEDESC('VALID',VALID) VALID FROM V_PRJ_CHECK C WHERE  ID="
				+ id;
		// 获取对应的PRJ_ID
		String code1 = "ITEM|";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql);
			PRJ_CHECK prj = new PRJ_CHECK();
			BeanUtils.populate(prj, result.get(0));

			model.put("CHECKGROUP_NO", prj.getCHECKGROUP_NO());
			model.put("CHECKITEM", CodeList.getCheckItem(prj.getITEM()));
			model.put("prj", prj);
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return "forward:prj/view/addscore.jsp";
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
}

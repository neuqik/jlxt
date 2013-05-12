package net.biz.project.web;

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
import net.biz.project.vo.PRJ_INFO;
import net.biz.project.vo.PRJ_UNIT_RELATE;
import net.biz.util.BeanUtil;
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
		String prjId = MVC.ctx().getRequest().getParameter("PRJ_ID");
		String sql = "SELECT BUILDINGCOUNT, CONTRACTAREA, CONTRACTNO, ID, LOCATION1, LOCATION2, LOCATION3, LOCATION4, MEMO, PRJNO, PRJ_ARCHIVE, PRJ_ARCHIVETIME, PRJ_AREA, PRJ_ENDTIME, PRJ_INVEST, PRJ_LEVEL, PRJ_MAP, PRJ_NAME, PRJ_PIC, PRJ_PROGRESS, PRJ_REGION, PRJ_STARTTIME, PRJ_TIME, PRJ_TYPE, QUALITY_TARGET, VALID, WEEKMEETING, WEEKMEETINGTIME FROM V_PRJ_INFO WHERE ID="
				+ prjId;
		String code1 = "DEPT_ID|PRJ_LEVEL|PRJ_TYPE|WEEKMEETING|WEEKMEETINGTIME|PRJ_ARCHIVE|LOCATION1|QUALITY_TARGET";
		Map a = CodeList.getCodeMap();
		try {
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql);
			PRJ_INFO prj = new PRJ_INFO();
			BeanUtils.populate(prj, result.get(0));
			model.put("prj", prj);
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
	@Path("/editunit")
	@GET
	@POST
	public String toEditUnit(Map<String, String> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);
		return "forward:prj/view/editunit.jsp";
	}
	/**
	 * 打开添加新的参建单位界面
	 * @param model
	 * @return
	 */
	@Path("/addunit")
	@GET
	@POST
	public String toAddUnit(Map<String, String> model) {
		String prjId = getParam("PRJ_ID");
		model.put("PRJ_ID", prjId);
		return "forward:prj/view/editunit.jsp";
	}
}

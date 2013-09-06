package net.biz.project.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.apache.commons.beanutils.BeanUtils;
import org.eweb4j.mvc.MVC;

import net.biz.component.BaseAction;
import net.biz.project.model.IPRJService;
import net.biz.project.vo.PRJ_MAJORCHECK;
import net.biz.project.vo.PRJ_SUPERVISOR_MAJORCHECK;
import net.biz.util.BeanUtil;
import net.biz.util.JDBCOracleUtil;

@Path("/chk")
public class CheckAction extends BaseAction {
	@Resource(name = "prjServiceImpl")
	private IPRJService myservice = (IPRJService) BeanUtil
			.getBean("prjServiceImpl");

	/**
	 * 打开项目监理部检查页面
	 * 
	 * @return
	 */
	@Path("/showdepartcheck")
	@GET
	@POST
	public String toShowDepartCheck() {
		return "forward:chk/view/showdepartcheck.jsp";
	}

	/**
	 * 打开新建项目监理部检查页面
	 * 
	 * @return
	 */
	@Path("/adddepartcheck")
	@GET
	@POST
	public String toAddDepartCheck(Map<String, Object> model) {
		try {
			String code1 = "PRJ_LEVEL";
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			PRJ_SUPERVISOR_MAJORCHECK psm = new PRJ_SUPERVISOR_MAJORCHECK();
			psm.setCHECK_USER(getCurrentUserName());
			model.put("chk", psm);
			model.put("SaveForm", "savenewsupervisorcheck");
			model.put("WRITE", true);
			return "forward:chk/view/adddepartcheck.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 编辑检查单
	 * 
	 * @param model
	 * @return
	 */
	@Path("/editdepartcheck")
	@GET
	@POST
	public String toEditDepartCheck(Map<String, Object> model) {
		try {
			String id = getParam("ID");
			String sql = "SELECT ID,(SELECT PRJ_NAME FROM PRJ_INFO WHERE ID = PRJ_ID) PRJ_NAME,(SELECT PRJNO FROM PRJ_INFO WHERE ID = PRJ_ID) PRJNO,FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_NAME,PRJ_ID,DEPT_ID,PROGRESS,BATCHNO,CHECKDATE,CHECK_USER,MEMO,CONSTRUCT,ACT_BEGIN,ACT_END,PRJ_AREA,PRJ_LEVEL,CHECKGROUP_NO,CONSTRUCTION,CONSTRUCTION_SUM,CONSTRUCTION_COMMENT,WATER,WATER_SUM,WATER_COMMENT,ELECTRIC,ELECTRIC_SUM,ELECTRIC_COMMENT,SECURITY,SECURITY_SUM,SECURITY_COMMENT,CONSTRUCTION_RATIO,WATER_RATIO,ELECTRIC_RATIO,SECURITY_RATIO,TOTAL_SUM,CHILD1_SUM,CHILD1_COMMENT,CHILD2_SUM,CHILD2_COMMENT,CHILD3_SUM,CHILD3_COMMENT FROM V_PRJ_SUPERVISOR_MAJORCHECK WHERE ID="
					+ id;
			String code1 = "PRJ_LEVEL";
			String[] codes = code1.split("[|]");
			for (int i = 0; i < codes.length; i++) {
				model.put(codes[i], getCodeList(codes[i]));
			}
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql);

			PRJ_SUPERVISOR_MAJORCHECK psm = new PRJ_SUPERVISOR_MAJORCHECK();
			BeanUtils.populate(psm, result.get(0));
			model.put("chk", psm);
			model.put("SaveForm", "savesupervisorcheck");
			model.put("WRITE", false);
			return "forward:chk/view/adddepartcheck.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 保存新的监理部检查单
	 * 
	 * @param model
	 * @return
	 */
	@Path("/savenewsupervisorcheck")
	@GET
	@POST
	public String toSaveNewSupervisorCheck(Map<String, Object> model) {
		try {

			PRJ_SUPERVISOR_MAJORCHECK prjInfo = (PRJ_SUPERVISOR_MAJORCHECK) parseRequest(new PRJ_SUPERVISOR_MAJORCHECK());
			myservice.saveNewSupervisorCheck(prjInfo);
			return successJSON("保存检查单成功", "dialog", "prj/showdepartcheck",
					"xmjlbjc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	/**
	 * 保存监理部检查单
	 * 
	 * @param model
	 * @return
	 */
	@Path("/savesupervisorcheck")
	@GET
	@POST
	public String toSaveSupervisorCheck(Map<String, Object> model) {
		try {

			PRJ_SUPERVISOR_MAJORCHECK prjInfo = (PRJ_SUPERVISOR_MAJORCHECK) parseRequest(new PRJ_SUPERVISOR_MAJORCHECK());
			myservice.saveEditSupervisorCheck(prjInfo);
			return successJSON("保存检查单成功", "dialog", "prj/showdepartcheck",
					"xmjlbjc");
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
	@Path("/deldepartcheckgroup")
	@GET
	@POST
	public String toDelDepartCheckgroup(Map<String, String> model) {
		try {
			String Id = getParam("ID");
			myservice.delDepartCheckgroup(Id);
			return successJSON("删除检查单成功", "dialog", "chk/showdepartcheck",
					"xmjlbjc");
		} catch (Exception e) {
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}
}

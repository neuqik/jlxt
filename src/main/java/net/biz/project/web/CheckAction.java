package net.biz.project.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.eweb4j.mvc.MVC;

import net.biz.component.BaseAction;
import net.biz.project.model.IPRJService;
import net.biz.project.vo.PRJ_MAJORCHECK;
import net.biz.project.vo.PRJ_SUPERVISOR_MAJORCHECK;
import net.biz.util.BeanUtil;

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
}

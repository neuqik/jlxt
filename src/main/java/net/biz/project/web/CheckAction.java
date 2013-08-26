package net.biz.project.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.project.model.IPRJService;
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
		model.put("WRITE", true);
		return "forward:chk/view/adddepartcheck.jsp";
	}
}

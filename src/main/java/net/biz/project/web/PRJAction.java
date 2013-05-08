package net.biz.project.web;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;

@Path("/prj")
public class PRJAction extends BaseAction {

	/**
	 * 打开页面
	 */
	@Path("/showproject")
	@GET
	@POST
	public String toShowProject() {
		return "forward:prj/view/showproject.jsp";
	}
}

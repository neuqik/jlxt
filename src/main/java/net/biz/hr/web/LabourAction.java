package net.biz.hr.web;

import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;

@Path("/labour")
public class LabourAction extends BaseAction {
	@Path("/list")
	@GET
	@POST
	public String doTest1(Map<String, Object> model) {
		return "forward:hr/labour/view/showLabour.jsp";
	}
}

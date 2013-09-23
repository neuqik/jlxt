package net.biz.mgr.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.component.BaseAction;
import net.biz.mgr.model.IMgrService;
import net.biz.mgr.vo.T_CODELIST;
import net.biz.util.BeanUtil;

@Path("/mgr")
public class MgrAction extends BaseAction {
	@Resource(name = "mgrServiceImpl")
	private IMgrService myservice = (IMgrService) BeanUtil
			.getBean("mgrServiceImpl");

	/**
	 * 
	 */
	@Path("/showcodelist")
	@GET
	@POST
	public String toShowCodeList() {
		return "forward:mgr/view/showcodelist.jsp";
	}

	/**
	 * 保存修改的codelist
	 * 
	 * @param model
	 * @return
	 */
	@Path("/savecodelist")
	@POST
	@GET
	public String toSaveCodelist(Map<String, String> model) {

		try {
			List<Object> insertList = handler
					.getInsertedRecords(T_CODELIST.class);
			List<Object> updateList = handler
					.getUpdatedRecords(T_CODELIST.class);
			List<Object> deleteList = handler
					.getDeletedRecords(T_CODELIST.class);
			myservice.saveCodelist(insertList, updateList, deleteList);
			handler.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			handler.setSuccess(false);
			return dwz.getFailedJson(e.getMessage()).toString();
		}
		return null;
	}
}

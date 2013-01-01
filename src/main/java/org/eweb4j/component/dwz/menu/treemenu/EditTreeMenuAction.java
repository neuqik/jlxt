package org.eweb4j.component.dwz.menu.treemenu;

import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.mvc.action.annotation.ShowValMess;
import org.eweb4j.mvc.view.EditPage;

@Path("${TreeMenuConstant.MODEL_NAME}")
public class EditTreeMenuAction extends TreeMenuBaseAction {
	@GET
	@POST
	@Path("/{id}/edit")
	@ShowValMess("dwzJson")
	public String doEdit(Map<String, EditPage> model) {
		try {
			model.put("editPage", this.service.getEditPage(this.id));
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

		return TreeMenuCons.EDIT_ACTION_RESULT();
	}

	@PUT
	@Path("/{treeMenuId}")
	@ShowValMess("dwzJson")
	public String doUpdate(
			@QueryParam("navmenus.dwz_navMenu.navMenuId") Long navMenuId,
			@QueryParam("treemenus.dwz_treeMenu.treeMenuId") Long pid,
			@PathParam("treeMenuId") long treeMenuId) {
		try {
			this.treeMenu.setTreeMenuId(Long.valueOf(treeMenuId));
			this.service.updateWithCascade(this.treeMenu, navMenuId, pid);

			return TreeMenuCons.DWZ_SUCCESS_JSON_CLOSE_CURRENT();
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

	}
}

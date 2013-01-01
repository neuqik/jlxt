package org.eweb4j.component.dwz.menu.treemenu;

import javax.ws.rs.DELETE;
import javax.ws.rs.Path;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.mvc.action.annotation.ShowValMess;

@Path("${TreeMenuConstant.MODEL_NAME}")
public class RemoveTreeMenuAction extends TreeMenuBaseAction {
	@DELETE
	@Path("/batchRemove")
	@ShowValMess("dwzJson")
	public String doBatchRemove() {
		try {
			this.service.batchRemove(this.ids);
			return TreeMenuCons.DWZ_SUCCESS_JSON_RELOAD_NAVTAB();
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	@DELETE
	@Path("/{id}")
	@ShowValMess("dwzJson")
	public String doRemoveOne() {
		try {
			this.service.removeOne(this.id);
			return TreeMenuCons.DWZ_SUCCESS_JSON_RELOAD_NAVTAB();
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

	}
}

package org.eweb4j.component.dwz.menu.navmenu;

import javax.ws.rs.DELETE;
import javax.ws.rs.Path;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.mvc.action.annotation.ShowValMess;
import org.eweb4j.mvc.validator.annotation.Validate;

@Path("${NavMenuConstant.MODEL_NAME}")
public class RemoveNavMenuAction extends NavMenuBaseAction {
	@DELETE
	@Path("/batchRemove")
	@ShowValMess("dwzJson")
	public String doRemoveMulti() {
		try {
			this.service.batchRemove(this.ids);

			return NavMenuCons.DWZ_SUCCESS_JSON_RELOAD_NAVTAB();
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

	}

	@DELETE
	@Path("/{id}")
	@Validate({ "id" })
	public String doRemoveOne() {
		try {
			this.service.removeOne(this.id);
			return NavMenuCons.DWZ_SUCCESS_JSON_RELOAD_NAVTAB();
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

	}
}

package org.eweb4j.component.dwz.menu.treemenu;

import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.mvc.view.ListPage;

@Path("${TreeMenuConstant.MODEL_NAME}")
public class LookupTreeMenuParentsAction extends TreeMenuBaseAction {
	@GET
	@POST
	@Path("/{navMenuId}/lookup")
	public String doLookup(Map<String, ListPage> model) {
		try {
			model.put("listPage", this.service.getParentsSearchResult(
					this.navMenuId, this.treeMenuId, this.keyword,
					this.pageNum, this.numPerPage));
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

		return TreeMenuCons.LOOKUP_ACTION_RESULT();
	}

	@GET
	@POST
	@Path("/{navMenuId}/lookupSearch")
	public String doLookupSearch(Map<String, ListPage> model) {
		return doLookup(model);
	}
}

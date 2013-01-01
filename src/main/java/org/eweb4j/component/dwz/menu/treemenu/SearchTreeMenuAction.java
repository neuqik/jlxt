package org.eweb4j.component.dwz.menu.treemenu;

import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.eweb4j.mvc.view.ListPage;

@Path("${TreeMenuConstant.MODEL_NAME}")
public class SearchTreeMenuAction extends TreeMenuBaseAction {
	@GET
	@POST
	@Path("/search")
	public String doSearch(Map<String, ListPage> model) {
		try {
			model.put("listPage", this.service.getSearchResult(this.keyword,
					this.pageNum, this.numPerPage));
		} catch (Exception e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

		return TreeMenuCons.PAGING_ACTION_RESULT();
	}
}

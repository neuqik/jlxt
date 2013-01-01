package org.eweb4j.component.dwz.menu.treemenu;

import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.mvc.view.ListPage;

@Path("${TreeMenuConstant.MODEL_NAME}")
public class PagingTreeMenuAction extends TreeMenuBaseAction {
	@GET
	@POST
	@Path("/list")
	public String doPaging(Map<String, Object> model) {
		try {
			ListPage list = this.service.getPageWithCascade(this.pageNum,
					this.numPerPage);
			model.put("listPage", list);
			model.put("random", Double.valueOf(Math.random()));
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

		return TreeMenuCons.PAGING_ACTION_RESULT();
	}
}

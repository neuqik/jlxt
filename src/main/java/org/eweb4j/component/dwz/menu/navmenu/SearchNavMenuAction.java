package org.eweb4j.component.dwz.menu.navmenu;

import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.mvc.action.annotation.Result;
import org.eweb4j.mvc.view.ListPage;

@Path("${NavMenuConstant.MODEL_NAME}")
public class SearchNavMenuAction extends NavMenuBaseAction {
	@GET
	@POST
	@Path("/search")
	@Result({ "${NavMenuConstant.PAGING_ACTION_RESULT}" })
	public String doSearchAndPaging(Map<String, ListPage> model) {
		try {
			model.put("listPage", this.service.getSearchResult(this.keyword,
					this.pageNum, this.numPerPage));
		} catch (MenuException e) {
			return this.dwz.getFailedJson(e.getMessage()).toString();
		}

		return "success";
	}

	@GET
	@POST
	@Path("/lookupSearch")
	@Result({ "${NavMenuConstant.LOOKUP_ACTION_RESULT}" })
	public String doLookupSearch(Map<String, ListPage> model) {
		return doSearchAndPaging(model);
	}
}

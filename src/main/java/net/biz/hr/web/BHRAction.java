package net.biz.hr.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import net.biz.util.BeanUtil;
import net.common.action.CommBaseAction;

import org.eweb4j.mvc.view.DivPageComp;

@Path("/hrs_b")
public class BHRAction extends CommBaseAction {


	private DivPageComp dpc;

	private long allCount = 0;

	@Resource(name = "iHRBiImpl")
	private IHRBiz ihrBiz = (IHRBiz) BeanUtil
			.getBean("iHRBiImpl");

	@Path("/list")
	@GET
	@POST
	public String doList(Map<String, Object> model) {
		try {
			Map<String, Object> map = ihrBiz.queryAllEmp(doPage());
			allCount = Integer.valueOf(String.valueOf(map.get("allCount")));
			dpc = new DivPageComp(Integer.valueOf(getPageNum()),
					Integer.valueOf(getNumPerPage()), allCount, 10,
					getOrderField(), getOrderAE());
			model.put("listPage", map.get("list"));
			model.put("dpc", dpc);

			model.put("random", Math.random());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return dwz.getFailedJson(e.getMessage()).toString();

		}

		return "forward:hr/view/hrlist.jsp";
	}


	public IHRBiz getIhrBiz() {
		return ihrBiz;
	}


	public void setIhrBiz(IHRBiz ihrBiz) {
		if(ihrBiz == null)
		this.ihrBiz = ihrBiz;
	}

}

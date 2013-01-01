package net.biz.hr.web;

import java.util.Map;

import net.common.units.DBconnBean;

import org.springframework.stereotype.Service;

@Service("iHRBiImpl")

public class IHRBiImpl implements IHRBiz {

	
	@Override
	public Map<String, Object> queryAllEmp(Map<String, String> pageMap)
			throws Exception {
		// TODO Auto-generated method stub

		String sql = "SELECT id, name, resource_id, type, remark, add_time, modify_time FROM t_test_pengxf";
		Map<String, Object> map = DBconnBean.executeQueryMap(sql, null, pageMap);

		return map;
	}

}

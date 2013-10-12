package net.biz.mgr.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.biz.mgr.vo.ADM_REMIND;
import net.biz.mgr.vo.T_CODELIST;
import net.biz.util.JDBCOracleUtil;

import org.springframework.stereotype.Service;

@Service("mgrServiceImpl")
public class MgrServiceImpl implements IMgrService {

	@Override
	public void saveCodelist(List<Object> inserts, List<Object> updates,
			List<Object> deletes) throws Exception {
		// 1.执行插入
		String sql = "INSERT INTO T_CODELIST(ID,CODE_TYPE,CODE_VALUE,CODE_TYPE_DESC,CODE_DESC,VALID,MEMO) VALUES(?,?,?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			T_CODELIST row = (T_CODELIST) it.next();
			List<Object> params = new ArrayList<Object>();
			params.add(0, JDBCOracleUtil.getID());
			params.add(1, row.getCODE_TYPE());
			params.add(2, row.getCODE_VALUE());
			params.add(3, row.getCODE_TYPE_DESC());
			params.add(4, row.getCODE_DESC());
			params.add(5, row.getVALID());
			params.add(6, row.getMEMO());
			JDBCOracleUtil.ExecuteDML(sql.toUpperCase(), params);
		}
		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			T_CODELIST row = (T_CODELIST) it1.next();
			List<Object> params = new ArrayList<Object>();
			String sql1 = "UPDATE T_CODELIST SET CODE_TYPE=?,CODE_VALUE=?,CODE_TYPE_DESC=?,CODE_DESC=?,VALID=?,MEMO=? WHERE ID=?";

			params.add(row.getCODE_TYPE());
			params.add(row.getCODE_VALUE());
			params.add(row.getCODE_TYPE_DESC());
			params.add(row.getCODE_DESC());
			params.add(row.getVALID());
			params.add(row.getMEMO());
			params.add(row.getID());

			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}
		// 3.执行删除
		Iterator<Object> it11 = deletes.iterator();

		while (it11.hasNext()) {
			T_CODELIST row = (T_CODELIST) it11.next();
			List<Object> params = new ArrayList<Object>();
			params.add(row.getID());
			String sql1 = "UPDATE T_CODELIST SET VALID='0' WHERE ID=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}

	}

	@Override
	public void saveReminder(List<Object> inserts, List<Object> updates,
			List<Object> deletes) throws Exception {
		// 1.执行插入
		String sql = "INSERT INTO ADM_REMIND(ID,MAIL,PROGRAM,PARAM,RESULT,MEMO,VALID,SUBJECT) VALUES(?,?,?,?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			ADM_REMIND row = (ADM_REMIND) it.next();
			List<Object> params = new ArrayList<Object>();
			params.add(0, JDBCOracleUtil.getID());
			params.add(1, row.getMAIL());
			params.add(2, row.getPROGRAM());
			params.add(3, row.getPARAM());
			params.add(4, row.getRESULT());
			params.add(5, row.getMEMO());
			params.add(6, row.getVALID());
			params.add(7, row.getSUBJECT());
			JDBCOracleUtil.ExecuteDML(sql, params);
		}
		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			ADM_REMIND row = (ADM_REMIND) it1.next();
			List<Object> params = new ArrayList<Object>();
			String sql1 = "UPDATE ADM_REMIND SET MAIL=?,PROGRAM=?,MEMO=?,VALID=?,SUBJECT=? WHERE ID="
					+ row.getID();

			params.add(row.getMAIL());
			params.add(row.getPROGRAM());
			params.add(row.getMEMO());
			params.add(row.getVALID());
			params.add(row.getSUBJECT());
			JDBCOracleUtil.ExecuteDML(sql1, params);
		}
		// 3.执行删除
		Iterator<Object> it11 = deletes.iterator();

		while (it11.hasNext()) {
			ADM_REMIND row = (ADM_REMIND) it11.next();
			List<Object> params = new ArrayList<Object>();
			params.add(row.getID());
			String sql1 = "UPDATE ADM_REMIND SET VALID='0' WHERE ID=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}
	}
}

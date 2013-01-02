package net.biz.hr.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.biz.component.appinfo.AppInfo;
import net.biz.component.appinfo.RequestInfo;
import net.biz.grid.gt.model.FilterInfo;
import net.biz.grid.gt.model.SortInfo;
import net.biz.grid.gt.util.SQLUtils;
import net.biz.hr.vo.HRD_EMP_FAMILY;
import net.biz.hr.vo.HRD_EMP_PERF;
import net.biz.hr.vo.HRD_EMP_TRAIN;
import net.biz.hr.vo.HRD_Emp;
import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

import org.springframework.stereotype.Service;

@Service("hrServiceImpl")
public class HRServiceImpl implements IHRService {

	public List<Map<String, Object>> queryAllList() throws Exception {
		List<Map<String, Object>> result = JDBCOracleUtil
				.executeQuery("SELECT ORDER_NO,EMPLOYEE,COUNTRY,CUSTOMER,ORDER2005,ORDER2006,ORDER2007,ORDER2008,TO_CHAR(DELIVERY_DATE,'YYYY-MM-DD') DELIVERY_DATE FROM ORDERS");
		return result;
	}

	@Override
	public List<Map<String, Object>> queryList() throws Exception {
		List<Map<String, Object>> result = JDBCOracleUtil
				.executeQuery("SELECT ORDER_NO,EMPLOYEE,COUNTRY,CUSTOMER,ORDER2005,ORDER2006,ORDER2007,ORDER2008,TO_CHAR(DELIVERY_DATE,'YYYY-MM-DD') DELIVERY_DATE FROM ORDERS WHERE ROWNUM < 4");
		return result;
	}

	@Override
	public List<Map<String, Object>> queryAllListByPage(int startRow,
			int pageSize) throws Exception {
		List<Map<String, Object>> result = JDBCOracleUtil
				.executeQueryPage(
						"SELECT ORDER_NO,EMPLOYEE,COUNTRY,CUSTOMER,ORDER2005,ORDER2006,ORDER2007,ORDER2008,TO_CHAR(DELIVERY_DATE,'YYYY-MM-DD') DELIVERY_DATE FROM ORDERS",
						startRow, pageSize);
		return result;
	}

	@Override
	public int queryRowCount(int totalCount) throws Exception {
		return JDBCOracleUtil
				.executeTotalCount(
						"SELECT ORDER_NO,EMPLOYEE,COUNTRY,CUSTOMER,ORDER2005,ORDER2006,ORDER2007,ORDER2008,TO_CHAR(DELIVERY_DATE,'YYYY-MM-DD') DELIVERY_DATE FROM ORDERS",
						totalCount);
	}

	@Override
	public List<Map<String, Object>> queryListByPage(List<FilterInfo> filters,
			List<SortInfo> sorts, int startRow, int pageSize) throws Exception {
		String sql = "SELECT ORDER_NO,EMPLOYEE,COUNTRY,CUSTOMER,ORDER2005,ORDER2006,ORDER2007,ORDER2008,TO_CHAR(DELIVERY_DATE,'YYYY-MM-DD') DELIVERY_DATE FROM ORDERS";
		String where = SQLUtils.splitFilter(filters);
		where = where.length() > 1 ? " WHERE " + where.replaceFirst("AND", "")
				: where;
		sql = sql + where;
		String order = SQLUtils.splitSort(sorts);
		order = order.length() > 1 ? order.replaceFirst("[,]", "") : order;
		sql = sql + order;
		List<Map<String, Object>> result = JDBCOracleUtil.executeQueryPage(sql,
				startRow, pageSize);
		return result;
	}

	/**
	 * 传入对象的方式
	 */
	public AppInfo queryListByPage(RequestInfo request) throws Exception {
		List<FilterInfo> filters = request.getFilters();
		List<SortInfo> sorts = request.getSorts();
		String sql = request.getSQL();
		String where = SQLUtils.splitFilter(filters);
		where = where.length() > 1 ? " WHERE " + where.replaceFirst("AND", "")
				: where;
		sql = sql + where;
		String order = SQLUtils.splitSort(sorts);
		order = order.length() > 1 ? order.replaceFirst("[,]", "") : order;
		sql = sql + order;
		request.setSQL(sql);
		AppInfo app = JDBCOracleUtil.executeQuery(request);
		return app;

	}

	@Override
	public int queryFilterRowCount(List<FilterInfo> filters, int totalCount)
			throws Exception {
		String sql = "SELECT ORDER_NO,EMPLOYEE,COUNTRY,CUSTOMER,ORDER2005,ORDER2006,ORDER2007,ORDER2008,TO_CHAR(DELIVERY_DATE,'YYYY-MM-DD') DELIVERY_DATE FROM ORDERS";
		String where = SQLUtils.splitFilter(filters);
		where = where.length() > 1 ? " WHERE " + where.replaceFirst("AND", "")
				: where;
		sql = sql + where;
		return JDBCOracleUtil.executeTotalCount(sql, totalCount);
	}

	@Override
	public String saveNewEmp(HRD_Emp emp) throws Exception {
		String id = "";
		String sql = "INSERT INTO HRD_EMP(id, emp_id,emp_name, nation,birth,age,education,marriage, gender,politic,idcard, native,workdate,workage,emptype,joindate,joinage,dept_id,rolename,title_id,titlename,titlework,insustatus,tel,telehome,emergency,graduate,master,graddate,location1,reglocation,winterloc,picture,memo,valid,location2,location3,location4,archivekeep) values (?, ?, ?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
				.toUpperCase();
		Connection conn = null;
		try {
			conn = JDBCOracleUtil.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);
			id = genNewEmpID(emp);
			ps.setObject(1, JDBCOracleUtil.getSequence("SEQ_ID"));// ID
			ps.setObject(2, id);
			ps.setObject(3, emp.getEMP_NAME());
			ps.setObject(4, emp.getNATION());
			ps.setDate(5, DateUtils.parseFormerSqlDate(emp.getBIRTH()));
			ps.setObject(6, emp.getAGE());
			ps.setObject(7, emp.getEDUCATION());
			ps.setObject(8, emp.getMARRIAGE());
			ps.setObject(9, emp.getGENDER());
			ps.setObject(10, emp.getPOLITIC());
			ps.setObject(11, emp.getIDCARD());
			ps.setObject(12, emp.getNATIVE());
			ps.setObject(13, DateUtils.parseFormerSqlDate(emp.getWORKDATE()));
			ps.setObject(14, emp.getWORKAGE());
			ps.setObject(15, emp.getEMPTYPE());
			ps.setObject(16, DateUtils.parseFormerSqlDate(emp.getJOINDATE()));
			ps.setObject(17, emp.getJOINAGE());
			ps.setObject(18, emp.getDEPT_ID());
			ps.setObject(19, emp.getROLENAME());
			ps.setObject(20, emp.getTITLE_ID());
			ps.setObject(21, emp.getTITLENAME());
			ps.setObject(22, emp.getTITLEWORK());
			ps.setObject(23, emp.getINSUSTATUS());
			ps.setObject(24, emp.getTEL());
			ps.setObject(25, emp.getTELEHOME());
			ps.setObject(26, emp.getEMERGENCY());
			ps.setObject(27, DateUtils.parseFormerSqlDate(emp.getGRADUATE()));
			ps.setObject(28, emp.getMASTER());
			ps.setObject(29, emp.getGRADDATE());
			ps.setObject(30, emp.getLOCATION1());
			ps.setObject(31, emp.getREGLOCATION());
			ps.setObject(32, emp.getWINTERLOC());
			ps.setObject(33, ""); // picture
			ps.setObject(34, emp.getMEMO());
			ps.setObject(35, "1");// valid
			ps.setObject(36, emp.getLOCATION2());
			ps.setObject(37, emp.getLOCATION3());
			ps.setObject(38, emp.getLOCATION4());
			ps.setObject(39, emp.getARCHIVEKEEP());
			ps.execute();

			conn.commit();
			ps.close();
			return id;
		} catch (SQLException e) {
			if (conn != null)
				conn.rollback();
			e.printStackTrace();
			throw e;
		} catch (InstantiationException e) {
			e.printStackTrace();
			throw e;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw e;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
	}

	@Override
	public String genNewEmpID(HRD_Emp emp) throws Exception {
		// 生成新的员工编号，员工编号规则
		String pre = emp.getDEPT_ID().substring(0, 1); // 取前缀
		String num = JDBCOracleUtil.getSequence("SEQ_A_EMPID");
		return pre + num;
	}

	@Override
	public void saveEmpPerf(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception {
		// 1.执行插入
		String sql = "insert into hrd_emp_perf(ID,EMP_ID,PERIOD,PERFORMANCE,PROF_PERF,WORK_PERF,MANAGE_PERF,MEMO,VALID) values(?,?,?,?,?,?,?,?,?)";
		Iterator it = inserts.iterator();
		Object[] params = new Object[9];
		int i = 0;
		while (it.hasNext()) {
			HRD_EMP_PERF row = (HRD_EMP_PERF) it.next();
			String ID = JDBCOracleUtil.getID();
			params[i] = ID;
			i++;
			params[i] = empId;
			i++;
			params[i] = row.getPERIOD();
			i++;
			params[i] = row.getPERFORMANCE();
			i++;
			params[i] = row.getPROF_PERF();
			i++;
			params[i] = row.getWORK_PERF();
			i++;
			params[i] = row.getMANAGE_PERF();
			i++;
			params[i] = row.getMEMO();
			i++;
			params[i] = "1";
			JDBCOracleUtil.executeDML(sql.toUpperCase(), params);
		}
		// 2.执行更新

		Iterator it1 = updates.iterator();
		Object[] params1 = new Object[6];
		int i1 = 0;
		while (it1.hasNext()) {
			HRD_EMP_PERF row = (HRD_EMP_PERF) it1.next();
			String id = row.getID();

			params1[i1] = row.getPERIOD();
			i1++;

			params1[i1] = row.getPERFORMANCE();
			i1++;

			params1[i1] = row.getPROF_PERF();
			i1++;

			params1[i1] = row.getWORK_PERF();
			i1++;

			params1[i1] = row.getMANAGE_PERF();
			i1++;

			params1[i1] = row.getMEMO();
			String sql1 = "update hrd_emp_perf set PERIOD=?,PERFORMANCE=?,PROF_PERF=?,WORK_PERF=?,MANAGE_PERF=?,MEMO=? where id="
					+ id;
			JDBCOracleUtil.executeDML(sql1.toUpperCase(), params1);
		}
		// 3.执行删除
		Iterator it11 = deletes.iterator();
		Object[] params11 = new Object[1];

		while (it11.hasNext()) {
			HRD_EMP_PERF row = (HRD_EMP_PERF) it11.next();
			params11[0] = row.getID();
			String sql1 = "update hrd_emp_perf set valid='0' where id=?";
			JDBCOracleUtil.executeDML(sql1.toUpperCase(), params11);
		}
	}

	@Override
	public void saveEmpTrans(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception {
		// 1.执行插入
		String sql = "insert into hrd_emp_train(ID,EMP_ID,TRAININGDATE,TRAINING,KNOWLEDGE,TRAININGDEPT,FEE,INTERTRAINING,MEMO,VALID ) values(?,?,?,?,?,?,?,?,?,?)";
		Iterator it = inserts.iterator();
		Object[] params = new Object[10];
		int i = 0;
		while (it.hasNext()) {
			HRD_EMP_TRAIN row = (HRD_EMP_TRAIN) it.next();
			String ID = JDBCOracleUtil.getID();
			params[i] = ID;
			i++;
			params[i] = empId;
			i++;
			params[i] = row.getTRAINDATEForSQL();
			i++;
			params[i] = row.getTRAINING();
			i++;
			params[i] = row.getKNOWLEDGE();
			i++;
			params[i] = row.getTRAININGDEPT();
			i++;
			params[i] = row.getFEE();
			i++;
			params[i] = row.getINTERTRAINING();
			i++;
			params[i] = row.getMEMO();
			i++;
			params[i] = "1";
			JDBCOracleUtil.executeDML(sql.toUpperCase(), params);
		}
		// 2.执行更新

		Iterator it1 = updates.iterator();
		Object[] params1 = new Object[7];
		int i1 = 0;
		while (it1.hasNext()) {
			HRD_EMP_TRAIN row = (HRD_EMP_TRAIN) it1.next();
			String id = row.getID();

			params1[i1] = row.getTRAINDATEForSQL();
			i1++;

			params1[i1] = row.getTRAINING();
			i1++;

			params1[i1] = row.getKNOWLEDGE();
			i1++;

			params1[i1] = row.getTRAININGDEPT();
			i1++;

			params1[i1] = row.getFEE();
			i1++;
			params1[i1] = row.getINTERTRAINING();
			i1++;
			params1[i1] = row.getMEMO();
			String sql1 = "update hrd_emp_train set TRAININGDATE=?,TRAINING=?,KNOWLEDGE=?,TRAININGDEPT=?,FEE=?,INTERTRAINING=?,MEMO=? where id="
					+ id;
			JDBCOracleUtil.executeDML(sql1.toUpperCase(), params1);
		}
		// 3.执行删除
		Iterator it11 = deletes.iterator();
		Object[] params11 = new Object[1];

		while (it11.hasNext()) {
			HRD_EMP_TRAIN row = (HRD_EMP_TRAIN) it11.next();
			params11[0] = row.getID();
			String sql1 = "update hrd_emp_train set valid='0' where id=?";
			JDBCOracleUtil.executeDML(sql1.toUpperCase(), params11);
		}
	}

	@Override
	public void saveEditEmp(HRD_Emp emp) throws Exception {
		String sql = "	update hrd_emp set emp_name=?, nation=?, birth=?, age=?, education=?, marriage=?, gender=?, politic=?, idcard=?, native=?, workdate=?, workage=?, emptype=?,  joindate=?, joinage=?, dept_id=?, rolename=?, title_id=?, titlename=?, titlework=?, insustatus=?, tel=?, telehome=?, emergency=?, graduate=?, master=?, graddate=?, location1=?, reglocation=?, winterloc=?,memo=?, location2=?, location3=?, location4=?, archivekeep=? where emp_id='"
				+ emp.getEMP_ID() + "'";
		List<Object> params = new ArrayList<Object>();
		params.add(emp.getEMP_NAME());
		params.add(emp.getNATION());
		params.add(emp.getBIRTHForSqlDate());
		params.add(emp.getAGE());
		params.add(emp.getEDUCATION());
		params.add(emp.getMARRIAGE());
		params.add(emp.getGENDER());
		params.add(emp.getPOLITIC());
		params.add(emp.getIDCARD());
		params.add(emp.getNATIVE());
		params.add(emp.getWORKDATEForSqlDate());
		params.add(emp.getWORKAGE());
		params.add(emp.getEMPTYPE());
		params.add(emp.getJOINDATEForSqlDate());
		params.add(emp.getJOINAGE());
		params.add(emp.getDEPT_ID());
		params.add(emp.getROLENAME());
		params.add(emp.getTITLE_ID());
		params.add(emp.getTITLENAME());
		params.add(emp.getTITLEWORK());
		params.add(emp.getINSUSTATUS());
		params.add(emp.getTEL());
		params.add(emp.getTELEHOME());
		params.add(emp.getEMERGENCY());
		params.add(emp.getGRADUATE());
		params.add(emp.getMASTER());
		params.add(emp.getGRADDATEForSqlDate());
		params.add(emp.getLOCATION1());
		params.add(emp.getREGLOCATION());
		params.add(emp.getWINTERLOC());
		params.add(emp.getMEMO());
		params.add(emp.getLOCATION2());
		params.add(emp.getLOCATION3());
		params.add(emp.getLOCATION4());
		params.add(emp.getARCHIVEKEEP());
		JDBCOracleUtil.ExecuteDML(sql, params);
	}

	@Override
	public void saveEmpFamily(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String empId) throws Exception {
		// 1.执行插入
		String sql = "insert into hrd_emp_family(ID,EMP_ID,RELATION_NAME,RELATION_TYPE,RELATION_TEL,WORKDEPT,WORKROLE,MEMO,VALID ) values(?,?,?,?,?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			HRD_EMP_FAMILY row = (HRD_EMP_FAMILY) it.next();
			List<Object> params = new ArrayList<Object>();
			String ID = JDBCOracleUtil.getID();
			params.add(ID);
			params.add(empId);
			params.add(row.getRELATION_NAME());
			params.add(row.getRELATION_TYPE());
			params.add(row.getRELATION_TEL());
			params.add(row.getWORKDEPT());
			params.add(row.getWORKROLE());
			params.add(row.getMEMO());
			params.add("1");
			JDBCOracleUtil.ExecuteDML(sql.toUpperCase(), params);
		}
		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			HRD_EMP_FAMILY row = (HRD_EMP_FAMILY) it1.next();
			String id = row.getID();
			List<Object> params = new ArrayList<Object>();
			String sql1 = "update hrd_emp_family set RELATION_NAME=?,RELATION_TYPE=?,RELATION_TEL=?,WORKDEPT=?,WORKROLE=?,MEMO=? where id="
					+ id;
			params.add(row.getRELATION_NAME());
			params.add(row.getRELATION_TYPE());
			params.add(row.getRELATION_TEL());
			params.add(row.getWORKDEPT());
			params.add(row.getWORKROLE());
			params.add(row.getMEMO());

			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}
		// 3.执行删除
		Iterator<Object> it11 = deletes.iterator();

		while (it11.hasNext()) {
			HRD_EMP_FAMILY row = (HRD_EMP_FAMILY) it11.next();
			List<Object> params = new ArrayList<Object>();
			params.add(row.getID());
			String sql1 = "update hrd_emp_family set valid='0' where id=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}

	}
}

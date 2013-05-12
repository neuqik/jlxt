package net.biz.project.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.biz.hr.vo.HRD_EMP_JOB;
import net.biz.project.vo.PRJ_BUILDING;
import net.biz.project.vo.PRJ_INFO;
import net.biz.project.vo.PRJ_UNIT_RELATE;
import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

import org.springframework.stereotype.Service;

@Service("prjServiceImpl")
public class PRJServiceImpl implements IPRJService {

	/**
	 * 保存新项目
	 */
	public String saveNewProject(PRJ_INFO prjInfo) throws Exception {
		// 项目编号
		String prjNo = genNewPRJNO(prjInfo);
		String sql = "INSERT INTO PRJ_INFO(BUILDINGCOUNT,CONTRACTAREA,PRJ_LEVEL,PRJ_TYPE,PRJ_INVEST,WEEKMEETING,PRJ_MAP,PRJ_REGION,PRJ_ARCHIVE,WEEKMEETINGTIME,PRJ_ARCHIVETIME,LOCATION4,ID,PRJNO,CONTRACTNO,PRJ_NAME,PRJ_AREA,QUALITY_TARGET,PRJ_STARTTIME,PRJ_ENDTIME,PRJ_TIME,PRJ_PIC,PRJ_PROGRESS,LOCATION1,MEMO,VALID,LOCATION2,LOCATION3) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		params.add(0, prjInfo.getBUILDINGCOUNT());
		params.add(1, prjInfo.getCONTRACTAREA());
		params.add(2, prjInfo.getPRJ_LEVEL());
		params.add(3, prjInfo.getPRJ_TYPE());
		params.add(4, prjInfo.getPRJ_INVEST());
		params.add(5, prjInfo.getWEEKMEETING());
		params.add(6, prjInfo.getPRJ_MAP());
		params.add(7, prjInfo.getPRJ_REGION());
		params.add(8, prjInfo.getPRJ_ARCHIVE());
		params.add(9, prjInfo.getWEEKMEETINGTIME());
		params.add(10, prjInfo.getPRJ_ARCHIVETIMEForSqlDate());
		params.add(11, prjInfo.getLOCATION4());
		params.add(12, JDBCOracleUtil.getID());
		params.add(13, prjNo);
		params.add(14, prjInfo.getCONTRACTNO());
		params.add(15, prjInfo.getPRJ_NAME());
		params.add(16, prjInfo.getPRJ_AREA());
		params.add(17, prjInfo.getQUALITY_TARGET());
		params.add(18, prjInfo.getPRJ_STARTTIMEForSqlDate());
		params.add(19, prjInfo.getPRJ_ENDTIMEForSqlDate());
		params.add(20, prjInfo.getPRJ_TIME());
		params.add(21, prjInfo.getPRJ_PIC());
		params.add(22, prjInfo.getPRJ_PROGRESS());
		params.add(23, prjInfo.getLOCATION1());
		params.add(24, prjInfo.getMEMO());
		params.add(25, "1");
		params.add(26, prjInfo.getLOCATION2());
		params.add(27, prjInfo.getLOCATION3());
		JDBCOracleUtil.ExecuteDML(sql, params);
		return prjNo;
	}

	/**
	 * 生成新的项目编号
	 * 
	 * @param prjInfo
	 * @return
	 * @throws Exception
	 */
	public String genNewPRJNO(PRJ_INFO prjInfo) throws Exception {
		// TODO: 生成新的项目编号，项目编号规则待定 P2013-001
		String pre = "P";
		int year = DateUtils.getYear(new Date());
		List<Map<String, Object>> num = JDBCOracleUtil
				.executeQuery("SELECT lpad(nvl(MAX(substr(prjno, 7, 3)), '0') + 1, 3, '0') prjno FROM prj_info WHERE prjno LIKE '"
						+ pre + year + "-%'");
		return pre + year + "-" + num.get(0).get("PRJNO");
	}

	/**
	 * 保存编辑的项目
	 */
	public String saveEditProject(PRJ_INFO prjInfo) throws Exception {
		String sql = "UPDATE PRJ_INFO SET BUILDINGCOUNT=?,CONTRACTAREA=?,PRJ_LEVEL=?,PRJ_TYPE=?,PRJ_INVEST=?,WEEKMEETING=?,PRJ_MAP=?,PRJ_REGION=?,PRJ_ARCHIVE=?,WEEKMEETINGTIME=?,PRJ_ARCHIVETIME=?,LOCATION4=?,PRJNO=?,CONTRACTNO=?,PRJ_NAME=?,PRJ_AREA=?,QUALITY_TARGET=?,PRJ_STARTTIME=?,PRJ_ENDTIME=?,PRJ_TIME=?,PRJ_PIC=?,PRJ_PROGRESS=?,LOCATION1=?,MEMO=?,LOCATION2=?,LOCATION3=? WHERE ID="
				+ prjInfo.getID();

		List<Object> params = new ArrayList<Object>();
		params.add(0, prjInfo.getBUILDINGCOUNT());
		params.add(1, prjInfo.getCONTRACTAREA());
		params.add(2, prjInfo.getPRJ_LEVEL());
		params.add(3, prjInfo.getPRJ_TYPE());
		params.add(4, prjInfo.getPRJ_INVEST());
		params.add(5, prjInfo.getWEEKMEETING());
		params.add(6, prjInfo.getPRJ_MAP());
		params.add(7, prjInfo.getPRJ_REGION());
		params.add(8, prjInfo.getPRJ_ARCHIVE());
		params.add(9, prjInfo.getWEEKMEETINGTIME());
		params.add(10, prjInfo.getPRJ_ARCHIVETIMEForSqlDate());
		params.add(11, prjInfo.getLOCATION4());
		params.add(12, prjInfo.getPRJNO());
		params.add(13, prjInfo.getCONTRACTNO());
		params.add(14, prjInfo.getPRJ_NAME());
		params.add(15, prjInfo.getPRJ_AREA());
		params.add(16, prjInfo.getQUALITY_TARGET());
		params.add(17, prjInfo.getPRJ_STARTTIMEForSqlDate());
		params.add(18, prjInfo.getPRJ_ENDTIMEForSqlDate());
		params.add(19, prjInfo.getPRJ_TIME());
		params.add(20, prjInfo.getPRJ_PIC());
		params.add(21, prjInfo.getPRJ_PROGRESS());
		params.add(22, prjInfo.getLOCATION1());
		params.add(23, prjInfo.getMEMO());
		params.add(24, prjInfo.getLOCATION2());
		params.add(25, prjInfo.getLOCATION3());
		JDBCOracleUtil.ExecuteDML(sql, params);
		return prjInfo.getPRJNO();
	}

	@Override
	public void saveBuilding(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String prjId) throws Exception {
		// 1.执行插入
		String sql = "INSERT INTO PRJ_BUILDING(LICENSE_DATE,SECURITY_LEVEL,CONSTRUCT_TYPE,ACT_TIME,PROGRESS,BUILDER_LICENSE,BUILDING_TYPE,IMAGE_PROGRESS,MEMO,VALID,ACT_BEGIN,ACT_END,ID,PRJ_ID,BUILDING_ID,UNDERFLOOR,ABOVEFLOOR,HEIGHT,BUILDING_AREA) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			PRJ_BUILDING row = (PRJ_BUILDING) it.next();
			List<Object> params = new ArrayList<Object>();
			params.add(0, row.getLICENSE_DATEForSqlDate());
			params.add(1, row.getSECURITY_LEVEL());
			params.add(2, row.getCONSTRUCT_TYPE());
			params.add(3, row.getACT_TIME());
			params.add(4, row.getPROGRESS());
			params.add(5, row.getBUILDER_LICENSE());
			params.add(6, row.getBUILDING_TYPE());
			params.add(7, row.getIMAGE_PROGRESS());
			params.add(8, row.getMEMO());
			params.add(9, row.getVALID());
			params.add(10, row.getACT_BEGINForSqlDate());
			params.add(11, row.getACT_ENDForSqlDate());
			params.add(12, JDBCOracleUtil.getID());
			params.add(13, prjId);
			params.add(14, row.getBUILDING_ID());
			params.add(15, row.getUNDERFLOOR());
			params.add(16, row.getABOVEFLOOR());
			params.add(17, row.getHEIGHT());
			params.add(18, row.getBUILDING_AREA());
			JDBCOracleUtil.ExecuteDML(sql, params);
		}

		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			PRJ_BUILDING row = (PRJ_BUILDING) it1.next();
			String id = row.getID();
			sql = "UPDATE PRJ_BUILDING SET LICENSE_DATE=?,SECURITY_LEVEL=?,CONSTRUCT_TYPE=?,ACT_TIME=?,PROGRESS=?,BUILDER_LICENSE=?,BUILDING_TYPE=?,IMAGE_PROGRESS=?,MEMO=?,ACT_BEGIN=?,ACT_END=?,BUILDING_ID=?,UNDERFLOOR=?,ABOVEFLOOR=?,HEIGHT=?,BUILDING_AREA=? WHERE PRJ_ID = "
					+ prjId;

			List<Object> params = new ArrayList<Object>();
			params.add(row.getLICENSE_DATEForSqlDate());
			params.add(row.getSECURITY_LEVEL());
			params.add(row.getCONSTRUCT_TYPE());
			params.add(row.getACT_TIME());
			params.add(row.getPROGRESS());
			params.add(row.getBUILDER_LICENSE());
			params.add(row.getBUILDING_TYPE());
			params.add(row.getIMAGE_PROGRESS());
			params.add(row.getMEMO());
			params.add(row.getACT_BEGINForSqlDate());
			params.add(row.getACT_ENDForSqlDate());
			params.add(row.getBUILDING_ID());
			params.add(row.getUNDERFLOOR());
			params.add(row.getABOVEFLOOR());
			params.add(row.getHEIGHT());
			params.add(row.getBUILDING_AREA());
			JDBCOracleUtil.ExecuteDML(sql, params);
		}

		// 3.执行删除
		Iterator<Object> it11 = deletes.iterator();

		while (it11.hasNext()) {
			PRJ_BUILDING row = (PRJ_BUILDING) it11.next();
			List<Object> params = new ArrayList<Object>();
			params.add(row.getID());
			String sql1 = "update prj_building set valid='0' where id=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}

	}

	/**
	 * 保存PRJ_UNIT_RELATE
	 */
	public void saveRelate(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String prjId) throws Exception {
		// 1.执行插入
		String sql = "INSERT INTO PRJ_UNIT_RELATE(ID,PRJ_ID,DEPT_ID,MEMO,VALID) VALUES(?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			PRJ_UNIT_RELATE row = (PRJ_UNIT_RELATE) it.next();
			List<Object> params = new ArrayList<Object>();
			params.add(0, JDBCOracleUtil.getID());
			params.add(1, prjId);
			params.add(2, row.getDEPT_ID());
			params.add(3, row.getMEMO());
			params.add(4, row.getVALID());
			JDBCOracleUtil.ExecuteDML(sql, params);
		}

		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			PRJ_UNIT_RELATE row = (PRJ_UNIT_RELATE) it1.next();
			String id = row.getID();
			sql = "UPDATE PRJ_UNIT_RELATE SET DEPT_ID=?,MEMO=? WHERE PRJ_ID="
					+ prjId;

			List<Object> params = new ArrayList<Object>();
			params.add(row.getDEPT_ID());
			params.add(row.getMEMO());
			JDBCOracleUtil.ExecuteDML(sql, params);
		}

		// 3.执行删除
		Iterator<Object> it11 = deletes.iterator();

		while (it11.hasNext()) {
			PRJ_UNIT_RELATE row = (PRJ_UNIT_RELATE) it11.next();
			List<Object> params = new ArrayList<Object>();
			params.add(row.getID());
			String sql1 = "delete from  prj_unit_relate where id=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}

	}
}

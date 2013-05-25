package net.biz.project.model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.biz.framework.codelist.CodeList;
import net.biz.framework.exception.AppException;
import net.biz.project.vo.PRJ_BUILDING;
import net.biz.project.vo.PRJ_CHECK;
import net.biz.project.vo.PRJ_INFO;
import net.biz.project.vo.PRJ_ORG;
import net.biz.project.vo.PRJ_UNIT;
import net.biz.project.vo.PRJ_UNIT_RELATE;
import net.biz.project.vo.ProjectQueryParam;
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
		String sql = "INSERT INTO V_PRJ_INFO(CONTRACTAREA,PRJ_LEVEL,PRJ_TYPE,PRJ_INVEST,WEEKMEETING,PRJ_MAP,PRJ_REGION,PRJ_ARCHIVE,WEEKMEETINGTIME,PRJ_ARCHIVETIME,LOCATION4,ID,PRJNO,CONTRACTNO,PRJ_NAME,QUALITY_TARGET,PRJ_STARTTIME,PRJ_ENDTIME,PRJ_TIME,PRJ_PIC,PRJ_PROGRESS,LOCATION1,MEMO,VALID,LOCATION2,LOCATION3) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		params.add(prjInfo.getCONTRACTAREA());
		params.add(prjInfo.getPRJ_LEVEL());
		params.add(prjInfo.getPRJ_TYPE());
		params.add(prjInfo.getPRJ_INVEST());
		params.add(prjInfo.getWEEKMEETING());
		params.add(prjInfo.getPRJ_MAP());
		params.add(prjInfo.getPRJ_REGION());
		params.add(prjInfo.getPRJ_ARCHIVE());
		params.add(prjInfo.getWEEKMEETINGTIME());
		params.add(prjInfo.getPRJ_ARCHIVETIMEForSqlDate());
		params.add(prjInfo.getLOCATION4());
		params.add(JDBCOracleUtil.getID());
		params.add(prjNo);
		params.add(prjInfo.getCONTRACTNO());
		params.add(prjInfo.getPRJ_NAME());
		params.add(prjInfo.getQUALITY_TARGET());
		params.add(prjInfo.getPRJ_STARTTIMEForSqlDate());
		params.add(prjInfo.getPRJ_ENDTIMEForSqlDate());
		params.add(prjInfo.getPRJ_TIME());
		params.add(prjInfo.getPRJ_PIC());
		params.add(prjInfo.getPRJ_PROGRESS());
		params.add(prjInfo.getLOCATION1());
		params.add(prjInfo.getMEMO().toUpperCase());
		params.add(prjInfo.getVALID());
		params.add(prjInfo.getLOCATION2());
		params.add(prjInfo.getLOCATION3());
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
		String sql = "UPDATE V_PRJ_INFO SET CONTRACTAREA=?,PRJ_LEVEL=?,PRJ_TYPE=?,PRJ_INVEST=?,WEEKMEETING=?,PRJ_MAP=?,PRJ_REGION=?,PRJ_ARCHIVE=?,WEEKMEETINGTIME=?,PRJ_ARCHIVETIME=?,LOCATION4=?,PRJNO=?,CONTRACTNO=?,PRJ_NAME=?,QUALITY_TARGET=?,PRJ_STARTTIME=?,PRJ_ENDTIME=?,PRJ_TIME=?,PRJ_PIC=?,PRJ_PROGRESS=?,LOCATION1=?,MEMO=?,LOCATION2=?,LOCATION3=? WHERE ID="
				+ prjInfo.getID();

		List<Object> params = new ArrayList<Object>();
		params.add(prjInfo.getCONTRACTAREA());
		params.add(prjInfo.getPRJ_LEVEL());
		params.add(prjInfo.getPRJ_TYPE());
		params.add(prjInfo.getPRJ_INVEST());
		params.add(prjInfo.getWEEKMEETING());
		params.add(prjInfo.getPRJ_MAP());
		params.add(prjInfo.getPRJ_REGION());
		params.add(prjInfo.getPRJ_ARCHIVE());
		params.add(prjInfo.getWEEKMEETINGTIME());
		params.add(prjInfo.getPRJ_ARCHIVETIMEForSqlDate());
		params.add(prjInfo.getLOCATION4());
		params.add(prjInfo.getPRJNO());
		params.add(prjInfo.getCONTRACTNO());
		params.add(prjInfo.getPRJ_NAME());
		params.add(prjInfo.getQUALITY_TARGET());
		params.add(prjInfo.getPRJ_STARTTIMEForSqlDate());
		params.add(prjInfo.getPRJ_ENDTIMEForSqlDate());
		params.add(prjInfo.getPRJ_TIME());
		params.add(prjInfo.getPRJ_PIC());
		params.add(prjInfo.getPRJ_PROGRESS());
		params.add(prjInfo.getLOCATION1());
		params.add(prjInfo.getMEMO().toUpperCase());
		params.add(prjInfo.getLOCATION2());
		params.add(prjInfo.getLOCATION3());
		JDBCOracleUtil.ExecuteDML(sql, params);
		return prjInfo.getPRJNO();
	}

	@Override
	public void saveBuilding(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String prjId) throws Exception {
		// 1.执行插入
		String sql = "INSERT INTO V_PRJ_BUILDING(LICENSE_DATE,SECURITY_LEVEL,CONSTRUCT_TYPE,ACT_TIME,PROGRESS,BUILDER_LICENSE,BUILDING_TYPE,IMAGE_PROGRESS,MEMO,VALID,ACT_BEGIN,ACT_END,ID,PRJ_ID,BUILDING_ID,UNDERFLOOR,ABOVEFLOOR,HEIGHT,BUILDING_AREA) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			PRJ_BUILDING row = (PRJ_BUILDING) it.next();
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
			params.add(row.getVALID());
			params.add(row.getACT_BEGINForSqlDate());
			params.add(row.getACT_ENDForSqlDate());
			params.add(JDBCOracleUtil.getID());
			params.add(prjId);
			params.add(row.getBUILDING_ID());
			params.add(row.getUNDERFLOOR());
			params.add(row.getABOVEFLOOR());
			params.add(row.getHEIGHT());
			params.add(row.getBUILDING_AREA());
			JDBCOracleUtil.ExecuteDML(sql, params);
		}

		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			PRJ_BUILDING row = (PRJ_BUILDING) it1.next();
			String id = row.getID();
			sql = "UPDATE V_PRJ_BUILDING SET LICENSE_DATE=?,SECURITY_LEVEL=?,CONSTRUCT_TYPE=?,ACT_TIME=?,PROGRESS=?,BUILDER_LICENSE=?,BUILDING_TYPE=?,IMAGE_PROGRESS=?,MEMO=?,ACT_BEGIN=?,ACT_END=?,BUILDING_ID=?,UNDERFLOOR=?,ABOVEFLOOR=?,HEIGHT=?,BUILDING_AREA=? WHERE PRJ_ID = "
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
			String sql1 = "update v_prj_building set valid='0' where id=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}

	}

	/**
	 * 保存PRJ_UNIT_RELATE
	 */
	public void saveRelate(List<Object> inserts, List<Object> updates,
			List<Object> deletes, String prjId) throws Exception {
		// 1.执行插入
		String sql = "INSERT INTO V_PRJ_UNIT_RELATE(ID,PRJ_ID,DEPT_ID,MEMO,VALID) VALUES(?,?,?,?,?)";
		Iterator<Object> it = inserts.iterator();
		while (it.hasNext()) {
			PRJ_UNIT_RELATE row = (PRJ_UNIT_RELATE) it.next();
			List<Object> params = new ArrayList<Object>();
			params.add(JDBCOracleUtil.getID());
			params.add(prjId);
			params.add(row.getDEPT_ID());
			params.add(row.getMEMO());
			params.add(row.getVALID());
			JDBCOracleUtil.ExecuteDML(sql, params);
		}

		// 2.执行更新

		Iterator<Object> it1 = updates.iterator();
		while (it1.hasNext()) {

			PRJ_UNIT_RELATE row = (PRJ_UNIT_RELATE) it1.next();
			String id = row.getID();
			sql = "UPDATE V_PRJ_UNIT_RELATE SET DEPT_ID=?,MEMO=? WHERE PRJ_ID="
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
			String sql1 = "delete from  v_prj_unit_relate where id=?";
			JDBCOracleUtil.ExecuteDML(sql1.toUpperCase(), params);
		}

	}

	/**
	 * 保存新参建单位信息
	 */
	public void saveNewUnit(PRJ_UNIT prjInfo) throws Exception {
		String sql = "";
		// 如果ID不为空，则说明是更新
		if (!"".equals(prjInfo.getID())) {
			sql = "UPDATE V_PRJ_UNIT SET PRJ_ID=?,UNIT_NAME=?,GROUP_NAME=?,UNIT_TYPE=?,QUALI_LEVEL=?,UNIT_ADDRESS=?,CONTRACTOR=?,TITLE=?,CONTRACT_TEL=?,MEMO=? WHERE ID="
					+ prjInfo.getID();

			List<Object> params = new ArrayList<Object>();
			params.add(prjInfo.getPRJ_ID());
			params.add(prjInfo.getUNIT_NAME());
			params.add(prjInfo.getGROUP_NAME());
			params.add(prjInfo.getUNIT_TYPE());
			params.add(prjInfo.getQUALI_LEVEL());
			params.add(prjInfo.getUNIT_ADDRESS());
			params.add(prjInfo.getCONTRACTOR());
			params.add(prjInfo.getTITLE());
			params.add(prjInfo.getCONTRACT_TEL());
			params.add(prjInfo.getMEMO());
			JDBCOracleUtil.ExecuteDML(sql, params);
			return;
		}
		// 1.检查参建单位名称和项目编号是否有重复，如果重复则报错
		String prjId = prjInfo.getPRJ_ID();
		String name = prjInfo.getUNIT_NAME();
		sql = "select 1 from v_prj_unit where prj_id=" + prjId
				+ " and unit_name = '" + name + "'";
		int rowcount = JDBCOracleUtil.executeTotalCount(sql.toUpperCase(), -1);
		if (rowcount >= 1) {
			throw new AppException("单位:" + name + "在同一个项目中不能重复。");
		}
		sql = "INSERT INTO PRJ_UNIT(ID,PRJ_ID,UNIT_NAME,GROUP_NAME,UNIT_TYPE,QUALI_LEVEL,UNIT_ADDRESS,CONTRACTOR,TITLE,CONTRACT_TEL,MEMO,VALID) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		params.add(JDBCOracleUtil.getID());
		params.add(prjInfo.getPRJ_ID());
		params.add(prjInfo.getUNIT_NAME());
		params.add(prjInfo.getGROUP_NAME());
		params.add(prjInfo.getUNIT_TYPE());
		params.add(prjInfo.getQUALI_LEVEL());
		params.add(prjInfo.getUNIT_ADDRESS());
		params.add(prjInfo.getCONTRACTOR());
		params.add(prjInfo.getTITLE());
		params.add(prjInfo.getCONTRACT_TEL());
		params.add(prjInfo.getMEMO());
		params.add(prjInfo.getVALID());
		JDBCOracleUtil.ExecuteDML(sql, params);

	}

	/**
	 * 删除参建单位信息
	 */
	public void delUnit(String id) throws Exception {
		String sql = "UPDATE V_PRJ_UNIT SET VALID='0' WHERE ID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		JDBCOracleUtil.ExecuteDML(sql, params);
	}

	/**
	 * 保存新建的组织角色
	 */
	public void saveNewOrg(PRJ_ORG prjInfo) throws Exception {
		String role = prjInfo.getPRJ_ROLE();
		String sql = "";
		// 0.如果ID不为空，则说明是更新
		if (!"".equals(prjInfo.getID())) {

			// 如果是总监或总代，则不能重复
			if (role.equals(CodeList.getCodeValue("PRJ_ROLE", "总监"))
					|| role.equals(CodeList.getCodeValue("PRJ_ROLE", "总代"))) {
				// 如果是相同的人，则只需要校验要改的角色是否有重复的
				// 要改的角色是否有非本人的，如果有非本人则不行
				sql = "SELECT 1 FROM V_PRJ_ORG WHERE PRJ_ID="
						+ prjInfo.getPRJ_ID() + " AND PRJ_ROLE='"
						+ prjInfo.getPRJ_ROLE() + "' AND EMP_ID <> '"
						+ prjInfo.getEMP_ID() + "'";
				int rowcount = JDBCOracleUtil.executeTotalCount(sql, -1);
				if (rowcount >= 1) {
					throw new AppException("同一个项目中总监总代只能有一个");
				}
			}

			sql = "UPDATE V_PRJ_ORG SET EMP_ID=?,PRJ_ROLE=?,ENTERTIME=?,LEAVETIME=?,RESPONSBILITY=?,MEMO=? WHERE ID="
					+ prjInfo.getID();

			List<Object> params = new ArrayList<Object>();
			params.add(prjInfo.getEMP_ID());
			params.add(prjInfo.getPRJ_ROLE());
			params.add(prjInfo.getENTERTIMEForSqlDate());
			params.add(prjInfo.getLEAVETIMEForSqlDate());
			params.add(prjInfo.getRESPONSBILITY());
			params.add(prjInfo.getMEMO());
			JDBCOracleUtil.ExecuteDML(sql, params);
			return;
		}

		// 1.判断组织角色是否重复，如果重复则报错

		// 如果是总监或总代，则不能重复
		if (role.equals(CodeList.getCodeValue("PRJ_ROLE", "总监"))
				|| role.equals(CodeList.getCodeValue("PRJ_ROLE", "总代"))) {
			sql = "SELECT 1 FROM V_PRJ_ORG WHERE PRJ_ID=" + prjInfo.getPRJ_ID()
					+ " AND PRJ_ROLE='" + prjInfo.getPRJ_ROLE() + "'";
			int rowcount = JDBCOracleUtil.executeTotalCount(sql, -1);
			if (rowcount > 0) {
				throw new AppException("同一个项目中总监总代只能有一个");
			}
		}
		// 2.保存
		sql = "INSERT INTO V_PRJ_ORG(ID,EMP_ID,PRJ_ROLE,PRJ_ID,ENTERTIME,LEAVETIME,RESPONSBILITY,MEMO,VALID) VALUES(?,?,?,?,?,?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		params.add(JDBCOracleUtil.getID());
		params.add(prjInfo.getEMP_ID());
		params.add(prjInfo.getPRJ_ROLE());
		params.add(prjInfo.getPRJ_ID());
		params.add(prjInfo.getENTERTIMEForSqlDate());
		params.add(prjInfo.getLEAVETIMEForSqlDate());
		params.add(prjInfo.getRESPONSBILITY());
		params.add(prjInfo.getMEMO());
		params.add(prjInfo.getVALID());
		JDBCOracleUtil.ExecuteDML(sql, params);
	}

	/**
	 * 删除组织角色信息
	 */
	public void delOrg(String id) throws Exception {
		String sql = "UPDATE V_PRJ_ORG SET VALID='0' WHERE ID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		JDBCOracleUtil.ExecuteDML(sql, params);
	}

	/**
	 * 删除项目信息
	 */
	public void delProject(String id) throws Exception {
		String sql = "UPDATE V_PRJ_INFO SET VALID='0' WHERE ID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		JDBCOracleUtil.ExecuteDML(sql, params);
	}

	/**
	 * 根据项目查询条件获取SQL
	 */
	public String getConditionByProjectQueryParam(ProjectQueryParam qp)
			throws Exception {
		if (qp.isEmpty())
			return "";
		// 非空
		List<String> where = new ArrayList<String>();

		// 如果录入了合同编号
		if (!"".equals(qp.getCONTRACTNO())) {
			where.add(" (CONTRACTNO LIKE '" + qp.getCONTRACTNO() + "$') ");
		}

		// 如果录入了部门
		if (!"".equals(qp.getDEPT_ID())) {
			where.add(" (ID IN (SELECT PRJ_ID FROM V_PRJ_UNIT_RELATE WHERE DEPT_ID = '"
					+ qp.getDEPT_ID() + "')) ");
		}

		// 如果录入了姓名
		if (!"".equals(qp.getEMP_NAME())) {
			where.add(" (ID IN (SELECT PRJ_ID FROM V_PRJ_ORG WHERE EMP_ID IN (SELECT EMP_ID FROM V_HRD_EMP WHERE EMP_NAME LIKE '$"
					+ qp.getEMP_NAME() + "$'))) ");
		}
		// 如果录入省
		if (!"".equals(qp.getLOCATION1())) {
			where.add(" (LOCATION1 = '" + qp.getLOCATION1() + "') ");
		}
		// 如果录入市
		if (!"".equals(qp.getLOCATION2())) {
			where.add(" (LOCATION2 = '" + qp.getLOCATION2() + "') ");
		}
		// 如果录入区
		if (!"".equals(qp.getLOCATION3())) {
			where.add(" (LOCATION3 = '" + qp.getLOCATION3() + "') ");
		}
		// 如果录入地址
		if (!"".equals(qp.getLOCATION4())) {
			where.add(" (LOCATION4 LIKE '" + qp.getLOCATION4() + "$') ");
		}
		// 如果录入项目进度
		if (!"".equals(qp.getPRJ_PROGRESS())) {
			where.add(" (PRJ_PROGRESS LIKE '$" + qp.getPRJ_PROGRESS() + "$') ");
		}
		// 如果录入备注
		if (!"".equals(qp.getMEMO())) {
			where.add(" (MEMO LIKE '$" + qp.getMEMO() + "$') ");
		}
		// 如果录入项目等级
		if (!"".equals(qp.getPRJ_LEVEL())) {
			where.add(" (PRJ_LEVEL = '" + qp.getPRJ_LEVEL() + "') ");
		}
		// 如果录入项目名称
		if (!"".equals(qp.getPRJ_NAME())) {
			where.add(" (PRJ_NAME LIKE '$" + qp.getPRJ_NAME() + "$') ");
		}
		// 如果录入项目角色
		if (!"".equals(qp.getPRJ_ROLE())) {
			where.add(" (ID IN (SELECT PRJ_ID FROM V_PRJ_ORG WHERE PRJ_ROLE = '"
					+ qp.getPRJ_ROLE() + "')) ");
		}
		// 如果录入项目类型
		if (!"".equals(qp.getPRJ_TYPE())) {
			where.add(" (PRJ_TYPE = '" + qp.getPRJ_TYPE() + "') ");
		}
		// 如果录入项目编号
		if (!"".equals(qp.getPRJNO())) {
			where.add(" (PRJNO LIKE '" + qp.getPRJNO() + "$') ");
		}
		// 如果录入资质等级
		if (!"".equals(qp.getQUALI_LEVEL())) {
			where.add(" (ID IN (SELECT PRJ_ID FROM V_PRJ_UNIT WHERE QUALI_LEVEL = '"
					+ qp.getQUALI_LEVEL() + "')) ");
		}
		// 录入参建单位名称
		if (!"".equals(qp.getUNIT_NAME())) {
			where.add(" (ID IN (SELECT PRJ_ID FROM V_PRJ_UNIT WHERE UNIT_NAME LIKE '"
					+ qp.getUNIT_NAME() + "$')) ");
		}
		// 录入参建单位类型
		if (!"".equals(qp.getUNIT_TYPE())) {
			where.add(" (ID IN (SELECT PRJ_ID FROM V_PRJ_UNIT WHERE UNIT_TYPE = '"
					+ qp.getUNIT_TYPE() + "')) ");
		}
		// 录入周会星期
		if (!"".equals(qp.getWEEKMEETING())) {
			where.add(" ( WEEKMEETING = '" + qp.getWEEKMEETING() + "') ");
		}
		// 录入周会时间
		if (!"".equals(qp.getWEEKMEETINGTIME())) {
			where.add(" ( WEEKMEETINGTIME = '" + qp.getWEEKMEETINGTIME()
					+ "') ");
		}
		// 录入项目开始截至时间
		if (!"".equals(qp.getPRJ_STARTTIME())) {
			where.add(" ( PRJ_STARTTIME <= TO_DATE('" + qp.getPRJ_STARTTIME()
					+ "','YYYY-MM-DD') AND (PRJ_ENDTIME >=TO_DATE('"
					+ qp.getPRJ_STARTTIME()
					+ "','YYYY-MM-DD') OR PRJ_ENDTIME IS NULL)) ");
		}
		String wheres = where.toString().replaceAll("[,]", "AND");
		wheres = wheres.replaceAll("'AND'YYYY-MM-DD'", "','YYYY-MM-DD'");
		wheres = wheres.substring(1, wheres.length() - 1);

		return wheres.trim().length() > 0 ? " WHERE " + wheres.toUpperCase()
				: "";
	}

	/**
	 * 保存地图
	 */
	public String saveMap(String pRJNO, String pRJMAP) throws Exception {
		String prjName = String.valueOf(JDBCOracleUtil
				.executeQuery(
						"SELECT PRJ_NAME FROM V_PRJ_INFO WHERE PRJNO='" + pRJNO
								+ "'").get(0).get("PRJ_NAME"));

		List<Object> params = new ArrayList<Object>();
		params.add(pRJMAP);
		params.add(pRJNO);
		String sql = "UPDATE V_PRJ_INFO SET PRJ_MAP=? WHERE PRJNO=?";
		JDBCOracleUtil.ExecuteDML(sql, params);
		return prjName;
	}

	/**
	 * 保存新的评分记录
	 */
	public String saveNewScore(PRJ_CHECK prjInfo) throws Exception {
		Connection conn = null;
		try {
			conn = JDBCOracleUtil.getConnection();
			List<String> inList = new ArrayList<String>();
			List<String> outList = new ArrayList<String>();
			inList.add(prjInfo.getPRJ_ID());
			inList.add(prjInfo.getCHECKGROUP_NO());
			inList.add(prjInfo.getCHECKDATE());
			inList.add(prjInfo.getCHECKITEM());
			inList.add(prjInfo.getACT_SCORE());
			inList.add(prjInfo.getJSDW_ID());
			inList.add(prjInfo.getSGDW_ID());
			inList.add(prjInfo.getCONSTRUCT_TYPE());
			inList.add(prjInfo.getPRJ_PROGRESS());
			inList.add(prjInfo.getMEMO());
			// 输出参数
			outList.add("");
			outList.add("");
			outList.add("");
			List<String> resultList = JDBCOracleUtil.callProc(inList, outList,
					"pkg_prjcheck.prc_savepoint", conn);
			// 如果保存成功
			if ("1".equals(resultList.get(0))) {
				conn.commit();
				return resultList.get(2);
			} else {
				conn.rollback();
				throw new AppException("保存失败，" + resultList.get(1));
			}

		} finally {
			if (conn != null) {
				conn.close();
			}
		}
	}
}

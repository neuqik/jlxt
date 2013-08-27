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
import net.biz.project.vo.PRJ_MAJORCHECK;
import net.biz.project.vo.PRJ_ORG;
import net.biz.project.vo.PRJ_SUPERVISOR_MAJORCHECK;
import net.biz.project.vo.PRJ_UNIT;
import net.biz.project.vo.PRJ_UNIT_RELATE;
import net.biz.project.vo.ProjectQueryParam;
import net.biz.util.DateUtils;
import net.biz.util.JDBCOracleUtil;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
			sql = "UPDATE V_PRJ_BUILDING SET LICENSE_DATE=?,SECURITY_LEVEL=?,CONSTRUCT_TYPE=?,ACT_TIME=?,PROGRESS=?,BUILDER_LICENSE=?,BUILDING_TYPE=?,IMAGE_PROGRESS=?,MEMO=?,ACT_BEGIN=?,ACT_END=?,BUILDING_ID=?,UNDERFLOOR=?,ABOVEFLOOR=?,HEIGHT=?,BUILDING_AREA=? WHERE ID = "
					+ id;

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
			sql = "UPDATE V_PRJ_UNIT_RELATE SET DEPT_ID=?,MEMO=? WHERE ID="
					+ id;

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
	public String saveCheckItem(PRJ_CHECK prjInfo) throws Exception {
		if (!"".equals(prjInfo.getID())) {
			// 如果是编辑
			String sql = "UPDATE V_PRJ_CHECK SET CHECKITEM=?,CHECKDATE=?,ACT_SCORE=?,MEMO=?,JSDW_ID=?,SGDW_ID=?,PRJ_PROGRESS=?,CONSTRUCT_TYPE=?,CHECKGROUP_NO=? WHERE ID="
					+ prjInfo.getID();

			List<Object> params = new ArrayList<Object>();

			params.add(prjInfo.getCHECKITEM());
			params.add(prjInfo.getCHECKDATEForSqlDate());
			params.add(prjInfo.getACT_SCORE());
			params.add(prjInfo.getMEMO());
			params.add(prjInfo.getJSDW_ID());
			params.add(prjInfo.getSGDW_ID());
			params.add(prjInfo.getPRJ_PROGRESS());
			params.add(prjInfo.getCONSTRUCT_TYPE());
			params.add(prjInfo.getCHECKGROUP_NO());
			JDBCOracleUtil.ExecuteDML(sql, params);
			return prjInfo.getCHECKGROUP_NO();
		}

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

	/**
	 * 删除评分
	 */
	public void delScore(String id) throws Exception {
		String sql = "UPDATE V_PRJ_CHECK SET VALID='0' WHERE ID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		JDBCOracleUtil.ExecuteDML(sql, params);
	}

	/**
	 * 保存
	 */
	public String saveNewScore(PRJ_MAJORCHECK prjInfo) throws Exception {
		// 查询总代、总监
		List<Map<String, Object>> result;
		result = JDBCOracleUtil
				.executeQuery("SELECT EMP_ID FROM V_PRJ_ORG WHERE PRJ_ID="
						+ prjInfo.getPRJ_ID() + " AND PRJ_ROLE='1'");
		if (result.size() != 1) {
			throw new AppException("查询工程" + prjInfo.getPRJNO()
					+ "总监信息出错。查询到的总监数量为：" + result.size());
		} else {
			prjInfo.setEMP_ID(String.valueOf(result.get(0).get("EMP_ID")));
		}
		result.clear();
		result = JDBCOracleUtil
				.executeQuery("SELECT EMP_ID FROM V_PRJ_ORG WHERE PRJ_ID="
						+ prjInfo.getPRJ_ID() + " AND PRJ_ROLE='2'");
		if (result.size() != 1) {
			throw new AppException("查询工程" + prjInfo.getPRJNO()
					+ "总代信息出错。查询到的总代数量为：" + result.size());
		} else {
			prjInfo.setEMP_ID_2(String.valueOf(result.get(0).get("EMP_ID")));
		}
		// 自动生成轮次号，以自然年为标准
		// 根据输入的项目ID和检查类型，检查当前年的最早的批次，如果没有，则生成当前年01的数值，如果有则当前年批次加1
		String sql1 = "select nvl(min(batchno),0) BATCHNO,to_char(sysdate,'YYYY') YEAR from v_prj_majorcheck a where a.PRJ_ID = "
				+ prjInfo.getPRJ_ID()
				+ " and a.CHECK_TYPE='"
				+ prjInfo.getCHECK_TYPE()
				+ "' AND batchno > to_number(to_char(SYSDATE, 'YYYY') || '00')";
		List<Map<String, Object>> res1 = JDBCOracleUtil.executeQuery(sql1
				.toUpperCase());
		String batchNo = String.valueOf(res1.get(0).get("BATCHNO"));
		String year = String.valueOf(res1.get(0).get("YEAR"));
		if ("0".equals(batchNo)) {
			prjInfo.setBATCHNO(year + "01");
		} else {
			prjInfo.setBATCHNO(String.valueOf(Integer.parseInt(batchNo) + 1));
		}
		// 执行插入
		String sql = "INSERT INTO V_PRJ_MAJORCHECK(SUM3,ID,PRJ_ID,DEPT_ID,PROGRESS,CHECKDATE,CHECK_USER,TESTER,EMP_ID,EMP_ID_2,SUM1,RATIO1,CHECKGROUP_NO,MEMO,VALID,SUM2,CHECK_TYPE,JOIN_TYPE,BATCHNO) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		List<Object> params = new ArrayList<Object>();
		params.add(0, prjInfo.getSUM3());
		params.add(1, JDBCOracleUtil.getID());
		params.add(2, prjInfo.getPRJ_ID());
		params.add(3, prjInfo.getDEPT_ID());
		params.add(4, prjInfo.getPROGRESS());
		params.add(5, prjInfo.getCHECKDATEForSqlDate());
		params.add(6, prjInfo.getCHECK_USER());
		params.add(7, prjInfo.getTESTER());
		params.add(8, prjInfo.getEMP_ID());
		params.add(9, prjInfo.getEMP_ID_2());
		params.add(10, prjInfo.getSUM1());
		params.add(11, prjInfo.getRATIO1());
		params.add(12, prjInfo.getCHECKGROUP_NO());
		params.add(13, prjInfo.getMEMO());
		params.add(14, prjInfo.getVALID());
		params.add(15, prjInfo.getSUM2());
		params.add(16, prjInfo.getCHECK_TYPE());
		params.add(17, prjInfo.getJOIN_TYPE());
		params.add(18, prjInfo.getBATCHNO());
		JDBCOracleUtil.ExecuteDML(sql, params);
		return prjInfo.getCHECKGROUP_NO();

	}

	@Override
	public String saveEditScore(PRJ_MAJORCHECK prjInfo) throws Exception {

		String sql = "UPDATE V_PRJ_MAJORCHECK SET DEPT_ID=?,PROGRESS=?,CHECKDATE=?,CHECK_USER=?,TESTER=?,MEMO=?,JOIN_TYPE=?,BATCHNO=? WHERE ID=?";

		List<Object> params = new ArrayList<Object>();

		params.add(prjInfo.getDEPT_ID());
		params.add(prjInfo.getPROGRESS());
		params.add(prjInfo.getCHECKDATEForSqlDate());
		params.add(prjInfo.getCHECK_USER());
		params.add(prjInfo.getTESTER());
		params.add(prjInfo.getMEMO());
		params.add(prjInfo.getJOIN_TYPE());
		params.add(prjInfo.getBATCHNO());
		params.add(prjInfo.getID());
		JDBCOracleUtil.ExecuteDML(sql, params);
		return prjInfo.getCHECKGROUP_NO();
	}

	/**
	 * 删除检查单及检查项
	 */
	public void delCheckgroup(String id) throws Exception {
		Connection conn = JDBCOracleUtil.getConnection();
		String sql = "UPDATE V_PRJ_CHECK SET VALID='0' WHERE CHECKGROUP_NO=(SELECT CHECKGROUP_NO FROM V_PRJ_MAJORCHECK WHERE ID=?)";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		JDBCOracleUtil.ExecuteDML(sql, params, conn);
		params.clear();
		sql = "UPDATE V_PRJ_MAJORCHECK SET VALID='0' WHERE ID=?";
		params.add(id);
		JDBCOracleUtil.ExecuteDML(sql, params, conn);
		conn.commit();
		conn.close();
	}

	/**
	 * 生成人员使用情况的甘特图xml数据
	 */
	public String generateGantt(String beginDate, String endDate, String empNo)
			throws Exception {
		String projects = "<projects>";
		String sql = "";
		String sql2 = "";
		if ("".equals(endDate) || endDate == null) {
			sql = "SELECT distinct row_number() over(ORDER BY emp_id) ID, emp_id, (SELECT emp_name FROM v_hrd_emp WHERE emp_id = v_prj_org.emp_id) emp_name, min(entertime) entertime, (MAX(leavetime) - MIN(entertime)) * 8 hours FROM v_prj_org WHERE entertime >= to_date('"
					+ beginDate
					+ "', 'YYYY-MM-DD') group by emp_id ORDER BY entertime";
			sql2 = "SELECT a.id, a.entertime,  (a.leavetime - a.entertime) * 8 hours, b.prjno || ' ' || b.prj_name || '(' ||fun_getcodedesc('PRJ_ROLE', prj_role) || ')' TASK  FROM v_prj_org a, v_prj_info b WHERE a.prj_id = b.id AND emp_id = ?  AND entertime >= to_date('"
					+ beginDate + "', 'YYYY-MM-DD') ORDER BY entertime";
			if (!"".equals(empNo)) {
				// 如果有员工编号
				sql = "SELECT distinct row_number() over(ORDER BY emp_id) ID, emp_id, (SELECT emp_name FROM v_hrd_emp WHERE emp_id = v_prj_org.emp_id) emp_name, min(entertime) entertime, (MAX(leavetime) - MIN(entertime)) * 8 hours FROM v_prj_org WHERE emp_id ='"
						+ empNo
						+ "' AND entertime >= to_date('"
						+ beginDate
						+ "', 'YYYY-MM-DD') group by emp_id ORDER BY entertime";
			}
		} else {
			sql = "SELECT distinct row_number() over(ORDER BY emp_id) ID, emp_id, (SELECT emp_name FROM v_hrd_emp WHERE emp_id = v_prj_org.emp_id) emp_name, min(entertime) entertime, (MAX(leavetime) - MIN(entertime)) * 8 hours  FROM v_prj_org WHERE entertime >= to_date('"
					+ beginDate
					+ "', 'YYYY-MM-DD') AND entertime <= to_date('"
					+ endDate
					+ "','YYYY-MM-DD') group by emp_id ORDER BY entertime, emp_id";
			sql2 = "SELECT a.id, a.entertime,  (a.leavetime - a.entertime) * 8 hours, b.prjno || ' ' || b.prj_name || '(' ||fun_getcodedesc('PRJ_ROLE', prj_role) || ')' TASK  FROM v_prj_org a, v_prj_info b WHERE a.prj_id = b.id AND emp_id = ?  AND entertime >= to_date('"
					+ beginDate
					+ "', 'YYYY-MM-DD') AND entertime <= to_date('"
					+ endDate + "','YYYY-MM-DD') ORDER BY entertime";
			if (!"".equals(empNo)) {
				// 如果有员工编号
				sql = "SELECT distinct row_number() over(ORDER BY emp_id) ID, emp_id, (SELECT emp_name FROM v_hrd_emp WHERE emp_id = v_prj_org.emp_id) emp_name, min(entertime) entertime, (MAX(leavetime) - MIN(entertime)) * 8 hours FROM v_prj_org WHERE emp_id ='"
						+ empNo
						+ "' AND entertime >= to_date('"
						+ beginDate
						+ "', 'YYYY-MM-DD') AND entertime <= to_date('"
						+ endDate
						+ "','YYYY-MM-DD') group by emp_id ORDER BY entertime, emp_id";
			}
		}
		// 1.根据时间范围获取有效的人v_prj_org，根据个人编号排序
		List<Map<String, Object>> result1 = JDBCOracleUtil.executeQuery(sql
				.toUpperCase());
		// 2.根据每个人循环，按照enter时间升序排列
		Iterator<Map<String, Object>> it = result1.iterator();
		while (it.hasNext()) {
			Map<String, Object> row = it.next();
			String empId = String.valueOf(row.get("EMP_ID"));
			String empName = String.valueOf(row.get("EMP_NAME"));
			String startTime = String.valueOf(row.get("ENTERTIME"));
			String id = String.valueOf(row.get("ID"));
			String duration = String.valueOf(row.get("HOURS"));
			String project = "<project id=\""
					+ id
					+ "\" name=\""
					+ empName
					+ "\" startdate=\""
					+ startTime.replaceAll("-", ",")
					+ "\"><task id=\""
					+ id
					+ "\"><name>"
					+ empName
					+ "("
					+ empId
					+ ")"
					+ "</name><est>"
					+ startTime.replaceAll("-", ",")
					+ "</est><duration>"
					+ duration
					+ "</duration><percentcompleted>100</percentcompleted><predecessortasks></predecessortasks><childtasks>";
			// 查此人的项目情况
			List<Object> params = new ArrayList<Object>();
			params.add(empId);
			List<Map<String, Object>> result2 = JDBCOracleUtil.executeQuery(
					sql2.toUpperCase(), params);
			Iterator<Map<String, Object>> it2 = result2.iterator();
			while (it2.hasNext()) {
				Map<String, Object> row2 = it2.next();
				id = String.valueOf(row2.get("ID"));
				String enterTime = String.valueOf(row2.get("ENTERTIME"));
				String hours = String.valueOf(row2.get("HOURS"));
				String taskName = String.valueOf(row2.get("TASK"));
				String task = "<task id=\""
						+ id
						+ "\"><name>"
						+ taskName
						+ "</name><est>"
						+ enterTime.replaceAll("-", ",")
						+ "</est><duration>"
						+ hours
						+ "</duration><percentcompleted>100</percentcompleted><predecessortasks></predecessortasks></task>";
				project = project + task;
			}
			project = project + "</childtasks></task></project>";
			projects = projects + project;
		}
		projects = projects + "</projects>";
		return projects;
	}

	/**
	 * 生成检查单
	 */
	public HSSFWorkbook exportCheckReport(String id) throws Exception {
		// 1.取工程名称，取分公司，取总监，取总代，取形象进度，取检查时间，取受检人员，取检查人员
		String reportID = "";
		// 执行存储过程，生成对应的报告形式
		Connection conn = null;
		HSSFWorkbook wb = null;
		try {
			String sql = "SELECT PRJ_NAME,FUN_GETCODEDESC('DEPT_ID',DEPT_ID) DEPT_ID,fun_getempname(EMP_ID) EMP_ID,fun_getempname(EMP_ID_2) EMP_ID_2,PROGRESS,TO_CHAR(CHECKDATE,'YYYY-MM-DD') CHECKDATE,fun_getempname(TESTER) TESTER,CHECK_USER,BATCHNO FROM V_PRJ_MAJORCHECK WHERE ID=?"
					.toUpperCase();
			List<Object> param = new ArrayList<Object>();
			param.add(id);
			List<Map<String, Object>> result = JDBCOracleUtil.executeQuery(sql,
					param);
			conn = JDBCOracleUtil.getConnection();
			List<String> inList = new ArrayList<String>();
			List<String> outList = new ArrayList<String>();
			inList.add(id);

			// 输出参数
			outList.add("");
			outList.add("");
			outList.add("");
			List<String> resultList = JDBCOracleUtil.callProc(inList, outList,
					"pkg_prjcheck.prc_checkreport", conn);
			// 如果保存成功
			if ("1".equals(resultList.get(0))) {
				conn.commit();
				reportID = resultList.get(2);
			} else {
				conn.rollback();
				throw new AppException("生成报告失败，" + resultList.get(1));
			}
			sql = "SELECT * FROM PRJ_CHECKREPORT WHERE REPORT_ID=? ORDER BY SORT_NUMBER";
			param.clear();
			param.add(reportID);
			List<Map<String, Object>> report = JDBCOracleUtil.executeQuery(sql,
					param);
			// 使用poi生成excel
			wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet();
			HSSFRow row1 = sheet.createRow((int) 0);
			// 0,1
			HSSFCell cell01 = row1.createCell(1);
			cell01.setCellValue("监理检查评分表");
			// ///////////////////第二行
			HSSFRow row2 = sheet.createRow((int) 1);
			// 1,1
			HSSFCell cell11 = row2.createCell(1);
			cell11.setCellValue("工程名称:");
			HSSFCell cell12 = row2.createCell(2);
			cell12.setCellValue(String.valueOf(result.get(0).get("PRJ_NAME")));
			// 1,3
			HSSFCell cell13 = row2.createCell(3);
			cell13.setCellValue("分公司:");
			// 1,4
			HSSFCell cell14 = row2.createCell(4);
			cell14.setCellValue(String.valueOf(result.get(0).get("DEPT_ID")));
			// 1,5
			HSSFCell cell15 = row2.createCell(5);
			cell15.setCellValue("总监:");
			// 1,6
			HSSFCell cell16 = row2.createCell(6);
			cell16.setCellValue(String.valueOf(result.get(0).get("EMP_ID")));
			// 3
			HSSFRow row3 = sheet.createRow((int) 2);
			// 3,1
			HSSFCell cell31 = row3.createCell(1);
			cell31.setCellValue("形象进度:");
			// 3,2
			HSSFCell cell32 = row3.createCell(2);
			cell32.setCellValue(String.valueOf(result.get(0).get("PROGRESS")));
			// 3,3
			HSSFCell cell33 = row3.createCell(3);
			cell33.setCellValue("检查时间:");
			// 3,4
			HSSFCell cell34 = row3.createCell(4);
			cell34.setCellValue(String.valueOf(result.get(0).get("CHECKDATE")));
			// 3,5
			HSSFCell cell35 = row3.createCell(5);
			cell35.setCellValue("总代:");
			// 3,6
			HSSFCell cell36 = row3.createCell(6);
			cell36.setCellValue(String.valueOf(result.get(0).get("EMP_ID_2")));
			// 4
			HSSFRow row4 = sheet.createRow((int) 3);
			// 4,1
			HSSFCell cell41 = row4.createCell(1);
			cell41.setCellValue("序号");
			// 4,2-4,7
			HSSFCell cell42 = row4.createCell(2);
			cell42.setCellValue("检查项目");
			HSSFCell cell43 = row4.createCell(3);
			cell43.setCellValue("检查子项");
			HSSFCell cell44 = row4.createCell(4);
			cell44.setCellValue("满分");
			HSSFCell cell45 = row4.createCell(5);
			cell45.setCellValue("应得");
			HSSFCell cell46 = row4.createCell(6);
			cell46.setCellValue("实得");
			HSSFCell cell47 = row4.createCell(7);
			cell47.setCellValue("存在问题");
			// /////////////////////生成下面的行/////////////////////
			int i = 4;
			int j = 1;
			Iterator<Map<String, Object>> it = report.iterator();
			while (it.hasNext()) {
				Map<String, Object> data = it.next();
				HSSFRow row = sheet.createRow(i);
				i++;
				HSSFCell cell1 = row.createCell(j);
				cell1.setCellValue(String.valueOf(data.get("SORT_NUMBER")));
				j++;
				HSSFCell cell2 = row.createCell(j);
				cell2.setCellValue(String.valueOf(data.get("CHECKCONTENT_UP")));
				j++;
				HSSFCell cell3 = row.createCell(j);
				cell3.setCellValue(String.valueOf(data.get("CHECKCONTENT")));
				j++;
				HSSFCell cell4 = row.createCell(j);
				cell4.setCellValue(String.valueOf(data.get("POINT")));
				j++;
				HSSFCell cell5 = row.createCell(j);
				cell5.setCellValue(String.valueOf(data.get("DESERVE_POINT")));
				j++;
				HSSFCell cell6 = row.createCell(j);
				cell6.setCellValue(String.valueOf(data.get("ACT_SCORE")));
				j++;
				HSSFCell cell7 = row.createCell(j);
				cell7.setCellValue(String.valueOf(data.get("PRJ_PROGRESS")));
				j = 1;
			}

			HSSFRow rowx = sheet.createRow(i);
			HSSFCell cellx1 = rowx.createCell(1);
			cellx1.setCellValue("检查人员:");
			HSSFCell cellx2 = rowx.createCell(2);
			cellx2.setCellValue(String.valueOf(result.get(0).get("CHECK_USER")));
			HSSFCell cellx3 = rowx.createCell(3);
			cellx3.setCellValue("轮次:");
			HSSFCell cellx4 = rowx.createCell(4);
			cellx4.setCellValue(String.valueOf(result.get(0).get("BATCHNO")));
			HSSFCell cellx6 = rowx.createCell(6);
			cellx6.setCellValue("受检人员:");
			HSSFCell cellx7 = rowx.createCell(7);
			cellx7.setCellValue(String.valueOf(result.get(0).get("TESTER")));

		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		return wb;
	}

	/**
	 * 保存新建的项目监理部检查单
	 */
	public void saveNewSupervisorCheck(PRJ_SUPERVISOR_MAJORCHECK prj)
			throws Exception {
		Connection conn = null;
		try {
			conn = JDBCOracleUtil.getConnection();
			List<String> inList = new ArrayList<String>();
			List<String> outList = new ArrayList<String>();
			inList.add(prj.getCHECKGROUP_NO());
			inList.add(prj.getBATCHNO());
			inList.add(prj.getPRJ_ID());
			inList.add(prj.getDEPT_ID());
			inList.add(prj.getCHECKDATE());
			inList.add(prj.getCHECK_USER());
			inList.add(prj.getPROGRESS());
			inList.add(prj.getMEMO());
			inList.add(prj.getCONSTRUCTION_COMMENT());
			inList.add(prj.getWATER_COMMENT());
			inList.add(prj.getELECTRIC_COMMENT());
			inList.add(prj.getSECURITY_COMMENT());

			// 输出参数
			outList.add("");
			outList.add("");
			List<String> resultList = JDBCOracleUtil.callProc(inList, outList,
					"pkg_prjcheck.prc_newsuperchk", conn);
			// 如果保存成功
			if ("1".equals(resultList.get(0))) {
				conn.commit();
			} else {
				conn.rollback();
				throw new AppException("保存项目监理部检查单失败，" + resultList.get(1));
			}
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
	}
}

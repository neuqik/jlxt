package net.biz.project.model;

import java.util.List;

import net.biz.project.vo.PRJ_CHECK;
import net.biz.project.vo.PRJ_INFO;
import net.biz.project.vo.PRJ_MAJORCHECK;
import net.biz.project.vo.PRJ_ORG;
import net.biz.project.vo.PRJ_UNIT;
import net.biz.project.vo.ProjectQueryParam;

public interface IPRJService {
	/**
	 * 保存新建的project
	 * 
	 * @param prjInfo
	 * @return
	 */
	public String saveNewProject(PRJ_INFO prjInfo) throws Exception;

	/**
	 * 保存编辑的project
	 * 
	 * @param prjInfo
	 * @return
	 * @throws Exception
	 */
	public String saveEditProject(PRJ_INFO prjInfo) throws Exception;

	/**
	 * 保存工程信息
	 * 
	 * @param insertList
	 * @param updateList
	 * @param deleteList
	 * @param prjId
	 * @throws Exception
	 */
	public void saveBuilding(List<Object> insertList, List<Object> updateList,
			List<Object> deleteList, String prjId) throws Exception;

	/**
	 * 保存分公司和项目的关系
	 * 
	 * @param insertList
	 * @param updateList
	 * @param deleteList
	 * @param prjId
	 * @throws Exception
	 */
	public void saveRelate(List<Object> insertList, List<Object> updateList,
			List<Object> deleteList, String prjId) throws Exception;

	/**
	 * 保存新的参建单位信息
	 * 
	 * @param prjInfo
	 * @throws Exception
	 */
	public void saveNewUnit(PRJ_UNIT prjInfo) throws Exception;

	/**
	 * 删除参建单位信息
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void delUnit(String id) throws Exception;

	/**
	 * 保存新建的组织角色信息
	 * 
	 * @param prjInfo
	 * @return
	 * @throws Exception
	 */
	public void saveNewOrg(PRJ_ORG prjInfo) throws Exception;

	/**
	 * 删除组织角色信息
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void delOrg(String id) throws Exception;

	/**
	 * 删除项目
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void delProject(String id) throws Exception;

	/**
	 * 根据项目查询参数获取条件
	 * 
	 * @param qp
	 * @return
	 * @throws Exception
	 */
	public String getConditionByProjectQueryParam(ProjectQueryParam qp)
			throws Exception;

	/**
	 * 保存地图点
	 * 
	 * @param pRJNO
	 * @param pRJMAP
	 * @return 项目名称
	 * @throws Exception
	 */
	public String saveMap(String pRJNO, String pRJMAP) throws Exception;

	/**
	 * 保存新的检查单
	 * 
	 * @param prjInfo
	 * @return 返回检查单编号
	 * @throws Exception
	 */
	public String saveNewScore(PRJ_MAJORCHECK prjInfo) throws Exception;

	/**
	 * 保存评分记录
	 * 
	 * @param prjInfo
	 * @return
	 * @throws Exception
	 */
	public String saveCheckItem(PRJ_CHECK prjInfo) throws Exception;

	/**
	 * 删除评分记录
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void delScore(String id) throws Exception;

	/**
	 * 保存编辑检查表
	 * 
	 * @param prjInfo
	 * @return
	 * @throws Exception
	 */
	public String saveEditScore(PRJ_MAJORCHECK prjInfo) throws Exception;

	/**
	 * 删除检查单信息，包括下面的检查项
	 * 
	 * @param id
	 * @throws Exception
	 */
	public void delCheckgroup(String id) throws Exception;

	/**
	 * 生成人员使用情况甘特图的XML数据
	 * 
	 * @param beginDate
	 * @param endDate
	 * @param empNo 
	 * @return
	 * @throws Exception
	 */
	public String generateGantt(String beginDate, String endDate, String empNo)
			throws Exception;

}

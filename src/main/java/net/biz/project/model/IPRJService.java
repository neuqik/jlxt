package net.biz.project.model;

import java.util.List;

import net.biz.project.vo.PRJ_INFO;
import net.biz.project.vo.PRJ_UNIT;

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

}

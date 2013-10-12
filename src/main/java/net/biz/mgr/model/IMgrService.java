package net.biz.mgr.model;

import java.util.List;

public interface IMgrService {
	/**
	 * 保存codelist修改
	 * 
	 * @param insertList
	 * @param updateList
	 * @param deleteList
	 * @throws Exception
	 */
	public void saveCodelist(List<Object> insertList, List<Object> updateList,
			List<Object> deleteList) throws Exception;
	/**
	 * 保存reminder修改
	 * @param insertList
	 * @param updateList
	 * @param deleteList
	 * @throws Exception
	 */
	public void saveReminder(List<Object> insertList, List<Object> updateList,
			List<Object> deleteList) throws Exception;

}

package org.eweb4j.component.dwz.menu.treemenu;

import java.util.List;

import org.eweb4j.component.dwz.menu.MenuException;

public abstract interface TreeMenuDAO {
	public abstract long countAll() throws MenuException;

	public abstract List<TreeMenu> getPageWithCascade(int paramInt1,
			int paramInt2) throws MenuException;

	public abstract long countSearch(String paramString) throws MenuException;

	public abstract List<TreeMenu> getSearchResult(String paramString,
			int paramInt1, int paramInt2) throws MenuException;

	public abstract TreeMenu getOne(Long paramLong) throws MenuException;

	public abstract void update(TreeMenu paramTreeMenu) throws MenuException;

	public abstract List<TreeMenu> getParent(Long paramLong1, Long paramLong2)
			throws MenuException;

	public abstract List<TreeMenu> getParentSearchResult(int paramInt1,
			int paramInt2, String paramString, Long paramLong1, Long paramLong2)
			throws MenuException;

	public abstract long countParentSearchResult(String paramString,
			Long paramLong1, Long paramLong2) throws MenuException;

	public abstract void create(TreeMenu paramTreeMenu) throws MenuException;

	public abstract void deleteOne(Long paramLong) throws MenuException;

	public abstract TreeMenu getOneByName(String paramString)
			throws MenuException;

	public abstract TreeMenu getOtherByName(Long paramLong, String paramString)
			throws MenuException;

	public abstract List<TreeMenu> getTopParentOrderByRankASC(Long paramLong)
			throws MenuException;

	public abstract List<TreeMenu> getChildrenOrderByRankASC(Long paramLong)
			throws MenuException;

	public abstract long insert(String[] paramArrayOfString,
			Object[] paramArrayOfObject) throws MenuException;

	public abstract void update(String[] paramArrayOfString,
			Object[] paramArrayOfObject) throws MenuException;

	public abstract void cascadeSelectNavMenu(TreeMenu paramTreeMenu)
			throws MenuException;
}


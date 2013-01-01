package org.eweb4j.component.dwz.menu.treemenu;

import java.util.List;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.component.dwz.menu.navmenu.NavMenu;
import org.eweb4j.mvc.view.EditPage;
import org.eweb4j.mvc.view.ListPage;

public abstract interface TreeMenuService {
	public abstract NavMenu findNavMenuByTreeMenuId(Long paramLong)
			throws Exception;

	public abstract ListPage getPageWithCascade(int paramInt1, int paramInt2)
			throws MenuException;

	public abstract ListPage getSearchResult(String paramString, int paramInt1,
			int paramInt2) throws MenuException;

	public abstract ListPage getParentsSearchResult(Long paramLong1,
			Long paramLong2, String paramString, int paramInt1, int paramInt2)
			throws MenuException;

	public abstract ListPage getParentsPage(Long paramLong1, Long paramLong2,
			int paramInt1, int paramInt2) throws MenuException;

	public abstract String getParentsFormatJson(Long paramLong1, Long paramLong2)
			throws MenuException;

	public abstract void batchRemove(Long[] paramArrayOfLong)
			throws MenuException;

	public abstract void removeOne(Long paramLong) throws MenuException;

	public abstract void addWithCascade(TreeMenu paramTreeMenu,
			Long paramLong1, Long paramLong2) throws MenuException;

	public abstract EditPage<TreeMenu> getEditPage(Long paramLong)
			throws MenuException;

	public abstract void updateWithCascade(TreeMenu paramTreeMenu,
			Long paramLong1, Long paramLong2) throws MenuException;

	public abstract List<TreeMenu> getTopParent(Long paramLong)
			throws MenuException;

	public abstract List<TreeMenu> getChildren(Long paramLong)
			throws MenuException;
}


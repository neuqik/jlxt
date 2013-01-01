package org.eweb4j.component.dwz.menu.navmenu;

import java.util.List;
import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.mvc.view.EditPage;
import org.eweb4j.mvc.view.ListPage;

public abstract interface NavMenuService {
	public abstract void add(NavMenu paramNavMenu) throws MenuException;

	public abstract NavMenu getOne(Long paramLong) throws MenuException;

	public abstract EditPage<NavMenu> getEditPage(Long paramLong)
			throws MenuException;

	public abstract void update(NavMenu paramNavMenu) throws MenuException;

	public abstract String getAllFormatJson() throws MenuException;

	public abstract void batchRemove(Long[] paramArrayOfLong)
			throws MenuException;

	public abstract void removeOne(Long paramLong) throws MenuException;

	public abstract ListPage getPage(int paramInt1, int paramInt2)
			throws MenuException;

	public abstract ListPage getSearchResult(String paramString, int paramInt1,
			int paramInt2) throws MenuException;

	public abstract NavMenu getOneByName(String paramString)
			throws MenuException;

	public abstract NavMenu createDefaultNavMenu(String paramString)
			throws MenuException;

	public abstract List<NavMenu> findAllOrderBy(String paramString,
			int paramInt) throws MenuException;
}

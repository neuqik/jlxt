package org.eweb4j.component.dwz.menu.navmenu;

import java.util.List;
import org.eweb4j.component.dwz.menu.MenuException;

public abstract interface NavMenuDAO {
	public abstract NavMenu getOneByName(String paramString)
			throws MenuException;

	public abstract NavMenu getOtherByName(Long paramLong, String paramString)
			throws MenuException;

	public abstract long countAll() throws MenuException;

	public abstract List<NavMenu> getPage(int paramInt1, int paramInt2)
			throws MenuException;

	public abstract NavMenu getOne(Long paramLong) throws MenuException;

	public abstract void update(NavMenu paramNavMenu) throws MenuException;

	public abstract void create(NavMenu paramNavMenu) throws MenuException;

	public abstract List<NavMenu> getAll() throws MenuException;

	public abstract void deleteOne(Long paramLong) throws MenuException;

	public abstract List<NavMenu> searchAndPaging(String paramString,
			int paramInt1, int paramInt2) throws MenuException;

	public abstract long countSearch(String paramString) throws MenuException;

	public abstract long insert(String[] paramArrayOfString,
			Object[] paramArrayOfObject) throws MenuException;

	public abstract List<NavMenu> selectAllOrderBy(String paramString,
			int paramInt) throws MenuException;
}

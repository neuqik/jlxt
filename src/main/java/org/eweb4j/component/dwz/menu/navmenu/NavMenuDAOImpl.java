package org.eweb4j.component.dwz.menu.navmenu;

import java.util.List;

import org.eweb4j.component.dwz.menu.MenuException;
import org.eweb4j.orm.dao.DAO;
import org.eweb4j.orm.dao.DAOException;
import org.eweb4j.orm.dao.DAOFactory;
import org.eweb4j.orm.dao.delete.DeleteDAO;
import org.eweb4j.orm.dao.insert.InsertDAO;
import org.eweb4j.orm.dao.select.DivPageDAO;
import org.eweb4j.orm.dao.select.SearchDAO;
import org.eweb4j.orm.dao.select.SelectDAO;
import org.eweb4j.orm.dao.update.UpdateDAO;

public class NavMenuDAOImpl implements NavMenuDAO {
	private SelectDAO selectDAO = null;
	private UpdateDAO updateDAO = null;
	private DeleteDAO deleteDAO = null;
	private DivPageDAO divPageDAO = null;
	private SearchDAO searchDAO = null;
	private InsertDAO insertDAO = null;
	private DAO dao = null;

	public void setDsName(String dsName) {
		this.selectDAO = DAOFactory.getSelectDAO(dsName);
		this.updateDAO = DAOFactory.getUpdateDAO(dsName);
		this.deleteDAO = DAOFactory.getDeleteDAO(dsName);
		this.divPageDAO = DAOFactory.getDivPageDAO(dsName);
		this.searchDAO = DAOFactory.getSearchDAO(dsName);
		this.insertDAO = DAOFactory.getInsertDAO(dsName);
		this.dao = DAOFactory.getDAO(NavMenu.class, dsName);
	}

	public NavMenu getOneByName(String name) throws MenuException {
		NavMenu navMenu = null;
		try {
			navMenu = this.selectDAO.selectOne(NavMenu.class,
					new String[] { "name" }, new String[] { name });
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}

		return navMenu;
	}

	public NavMenu getOtherByName(Long id, String name) throws MenuException {
		try {
			String condition = "id <> ? and name = ?";
			List<NavMenu> navMenus = this.selectDAO.selectWhere(NavMenu.class,
					condition, new Object[] { id, name });

			return navMenus == null ? null : navMenus.get(0);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}

	}

	public long countAll() throws MenuException {
		long allCount = 0L;
		try {
			allCount = this.selectDAO.selectCount(NavMenu.class);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
		return allCount;
	}

	public List<NavMenu> getPage(int p, int n) throws MenuException {
		List<NavMenu> list = null;
		try {
			list = this.divPageDAO.divPage(NavMenu.class, p, n);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
		return list;
	}

	public NavMenu getOne(Long id) throws MenuException {
		NavMenu navMenu = null;
		try {
			navMenu = this.selectDAO.selectOneById(NavMenu.class, id);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}

		return navMenu;
	}

	public void update(NavMenu navMenu) throws MenuException {
		try {
			this.updateDAO.update(navMenu);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
	}

	public void create(NavMenu navMenu) throws MenuException {
		try {
			Number id = this.insertDAO.insert(navMenu);
			navMenu.setNavMenuId(Long.valueOf(Long.parseLong("" + id)));
			String href = navMenu.getHref();
			if ((!href.endsWith(".html")) && (!href.endsWith(".jsp"))) {
				navMenu.setHref(NavMenuCons.DEFAULT_NAV_MENU_HREF().replace(
						"{id}", id + ""));
			}
			this.updateDAO.updateByFields(navMenu, new String[] { "href" });
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
	}

	public List<NavMenu> getAll() throws MenuException {
		List<NavMenu> list = null;
		try {
			list = this.selectDAO.selectAll(NavMenu.class);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
		return list;
	}

	public void deleteOne(Long id) throws MenuException {
		try {
			/* 124 */this.deleteDAO.deleteById(NavMenu.class, id);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
	}

	public List<NavMenu> searchAndPaging(String keyword, int p, int n)
			throws MenuException {
		List<NavMenu> list = null;
		try {
			String[] fields = { "name" };
			String[] values = { keyword };
			boolean isOR = true;
			list = this.searchDAO.searchByLikeAndOrderByIdFieldDESC(
					NavMenu.class, fields, values, 0, isOR);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
		return list;
	}

	public long countSearch(String keyword) throws MenuException {
		long count = 0L;
		try {
			String condition = "name like '%" + keyword + "%'";
			count = this.selectDAO.selectCount(NavMenu.class, condition);
		} catch (DAOException e) {
			throw new MenuException(e.getMessage());
		}
		return count;
	}

	public long insert(String[] fields, Object[] values) throws MenuException {
		this.dao.clear();

		return this.dao.insert(fields).values(values).execute();
	}

	public List<NavMenu> selectAllOrderBy(String orderField, int orderType)
			throws MenuException {
		return this.selectDAO.selectAll(NavMenu.class, orderField, orderType);
	}
}

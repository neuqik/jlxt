package org.eweb4j.component.dwz.menu.treemenu;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.eweb4j.component.dwz.menu.navmenu.NavMenu;

@Entity
@Table(name = "t_tree_menu")
public class TreeMenu implements Serializable {
	private static final long serialVersionUID = 5264149396283615258L;

	@Id
	@Column(name = "id")
	private Long treeMenuId = Long.valueOf(0L);
	private String name;
	private String target = "navTab";
	private String rel;

	@Column(name = "reload_flag")
	private String reloadFlag = "1";

	private String external = "false";
	private int width;
	private int height;
	private String href;
	private int rank;

	@OneToOne
	@JoinColumn(name = "pid")
	private TreeMenu parent;

	@OneToOne
	@JoinColumn(name = "nav_menu_id")
	private NavMenu navMenu;

	@OneToMany(mappedBy = "pid")
	private List<TreeMenu> children = new ArrayList<TreeMenu>();

	public Long getTreeMenuId() {
		return this.treeMenuId;
	}

	public void setTreeMenuId(Long treeMenuId) {
		this.treeMenuId = treeMenuId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public TreeMenu getParent() {
		return this.parent;
	}

	public void setParent(TreeMenu parent) {
		this.parent = parent;
	}

	public int getWidth() {
		return this.width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return this.height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getRank() {
		return this.rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getTarget() {
		return this.target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getRel() {
		return this.rel;
	}

	public void setRel(String rel) {
		this.rel = rel;
	}

	public String getReloadFlag() {
		return this.reloadFlag;
	}

	public void setReloadFlag(String reloadFlag) {
		this.reloadFlag = reloadFlag;
	}

	public String getHref() {
		return this.href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public NavMenu getNavMenu() {
		return this.navMenu;
	}

	public void setNavMenu(NavMenu navMenu) {
		this.navMenu = navMenu;
	}

	public List<TreeMenu> getChildren() {
		return this.children;
	}

	public void setChildren(List<TreeMenu> children) {
		this.children = children;
	}

	public String getExternal() {
		return this.external;
	}

	public void setExternal(String external) {
		this.external = external;
	}

	public String toString() {
		Long pid = Long.valueOf(this.parent == null ? TreeMenuCons
				.TOP_TREE_MENU_ID() : this.parent.treeMenuId.longValue());
		return "{\"treeMenuId\":\"" + this.treeMenuId + "\",\"navMenuId\":\""
				+ this.navMenu.getNavMenuId() + "\",\"pid\":\"" + pid
				+ "\",\"name\":\"" + this.name + "\",\"href\":\"" + this.href
				+ "\"}";
	}
}

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageHeader">
	<form rel="pagerForm" method="post"
		action="${BaseURL}${listPage.searchForm.action}"
		onsubmit="return dwzSearch(this, 'dialog');">
		<div class="searchBar">
			<table>
				<tr>
					<th><label>员工编号：</label></th>
					<td><input name="EMP_ID"
						value="${listPage.searchForm.keyword}" type="text" /></td>
					<th><label>姓名：</label></th>
					<td><input name="EMP_NAME"
						value="${listPage.searchForm.keyword}" type="text" /></td>
					<th><label>部门/分公司：</label></th>
					<td><select name="DEPT_ID" class="combox"><option
								value="">请选择...</option>
							<c:forEach var="item" items="${DEPT_ID}">
								<option value="${item.codeValue}">${item.codeDesc}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th><label>身份证号：</label></th>
					<td><input name="IDCARD"
						value="${listPage.searchForm.keyword}" type="text" /></td>

					<th><label>保险状态：</label></th>
					<td><select name="INSUSTATUS" class="combox"><option
								value="">请选择...</option>
							<c:forEach var="item" items="${INSUSTATUS}">
								<option value="${item.codeValue}">${item.codeDesc}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">查询</button>
							</div>
						</div></li>
					<li><div class="button">
							<div class="buttonContent">
								<button type="button">清空</button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" layoutH="140" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th width="80">查找带回</th>
				<th align="center">员工编号</th>
				<th align="center">姓名</th>
				<th align="center">身份证号码</th>
				<th align="center">性别</th>
				<th align="center">年龄</th>
				<th align="center">部门/分公司</th>
				<th align="center">保险状态</th>
				<th align="center">岗位</th>
				<th align="center">联系电话</th>
				<th align="center">常住地址(省)</th>
				<th align="center">常住地址(市)</th>
				<th align="center">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pojo" items="${listPage.pojos}">
				<tr>
					<td><a class="btnSelect"
						href="javascript:$.bringBack({navMenuId:'${pojo.navMenu.navMenuId}', pid:'${pojo.parent.treeMenuId}', treeMenuId:'${pojo.treeMenuId}', name:'${pojo.name}'})"
						title="查找带回">选择</a></td>
					<td>${pojo.treeMenuId}</td>
					<td>${pojo.navMenu.name}</td>
					<td>${pojo.parent.name}</td>
					<td>${pojo.name}</td>
					<td>${pojo.href}</td>
					<td>${pojo.href}</td>
					<td>${pojo.href}</td>
					<td>${pojo.href}</td>
					<td>${pojo.href}</td>
					<td>${pojo.href}</td>
					<td>${pojo.href}</td>
					<td>${pojo.href}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="panelBar">
		<div class="pages">
			<span>每页</span> <select name="numPerPage"
				onchange="lookupPageBreak(this.value)">
				<option selected="selected" value="1">调整</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select> <span>条，共${listPage.dpc.allCount}条记录，每页${listPage.dpc.numPerPage}条，当前第${listPage.dpc.currentPage}/${listPage.dpc.pageCount}页</span>
		</div>
		<div class="pagination" targetType="dialog"
			totalCount="${listPage.dpc.allCount}"
			numPerPage="${listPage.dpc.numPerPage}" pageNumShown="10"
			currentPage="${listPage.dpc.currentPage}"></div>
		<form id="pagerForm" method="get"
			action="${BaseURL}${listPage.searchForm.action}">
			<input type="hidden" name="pageNum" value="1" /> <input
				type="hidden" name="numPerPage" value="${listPage.dpc.numPerPage}" />
			<input type="hidden" name="keyword"
				value="${listPage.searchForm.keyword}" />
		</form>
	</div>
</div>
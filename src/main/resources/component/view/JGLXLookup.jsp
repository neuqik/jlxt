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
					<th><label>项目ID：</label></th>
					<td><input name="PRJ_ID" value="${PRJ_ID}" type="text"
						readonly="readonly" /></td>
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
<div class="pageContent" width="100%">
	<table class="table" layoutH="140" targetType="dialog">
		<thead>
			<tr>
				<th width="40" align="center">选定</th>
				<th width="100" align="left">项目编号</th>
				<th width="100" align="left">结构类型代码</th>
				<th width="250" align="left">结构类型名称</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pojo" items="${listPage.pojos}">
				<tr>
					<td align="center"><a class="btnSelect"
						href="javascript:$.bringBack({CONSTRUCT_TYPE:${pojo.CONSTRUCT_TYPE},CONSTRUCT_TYPE_NAME:'${pojo.CONSTRUCT_TYPE_NAME}'})"
						title="查找带回">选择</a></td>
					<td>${pojo.PRJNO}</td>
					<td>${pojo.CONSTRUCT_TYPE}</td>
					<td>${pojo.CONSTRUCT_TYPE_NAME}</td>
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
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
					<td><input name="EMP_ID" value="${EMP_ID}" type="text" /></td>
					<th><label>姓名：</label></th>
					<td><input name="EMP_NAME"
						value="${listPage.searchForm.keyword}" type="text" /></td>
					<th><label>分公司：</label></th>
					<td><select name="DEPT_ID" class="combox"><option
								value="">请选择...</option>
							<c:forEach var="item" items="${DEPT_ID}">
								<option value="${item.codeValue}">${item.codeDesc}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th><label>身份证号：</label></th>
					<td><input name="IDCARD" value="${IDCARD}" type="text" /></td>

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
<div class="pageContent" width="100%">
	<table class="table" layoutH="140" targetType="dialog">
		<thead>
			<tr>
				<th width="40" align="center">选定</th>
				<th width="90" align="center">员工编号</th>
				<th width="100" align="center">姓名</th>
				<th width="150" align="center">身份证号码</th>
				<th width="40" align="center">性别</th>
				<th width="40" align="center">年龄</th>
				<th width="120" align="center">分公司</th>
				<th width="120" align="center">保险状态</th>
				<th width="120" align="center">岗位</th>
				<th width="120" align="center">联系电话</th>
				<th width="120" align="center">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pojo" items="${listPage.pojos}">
				<tr>
					<td align="center"><a class="btnSelect"
						href="javascript:$.bringBack({EMP_ID:'${pojo.EMP_ID}',ID:${pojo.ID},EMP_NAME:'${pojo.EMP_NAME}', IDCARD:'${pojo.IDCARD}', DEPT_ID:'${pojo.DEPT_ID}',GENDER:'${pojo.GENDER}',AGE:'${pojo.AGE}'})"
						title="查找带回">选择</a></td>
					<td align="left">${pojo.EMP_ID}</td>
					<td>${pojo.EMP_NAME}</td>
					<td>${pojo.IDCARD}</td>
					<td>${pojo.GENDER}</td>
					<td>${pojo.AGE}</td>
					<td>${pojo.DEPT_ID}</td>
					<td>${pojo.INSUSTATUS}</td>
					<td>${pojo.ROLENAME}</td>
					<td>${pojo.TEL}</td>
					<td>${pojo.MEMO}</td>
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
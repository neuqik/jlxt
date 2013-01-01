<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="hrs_b/list" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					&nbsp;&nbsp;关键词：<input name="keyword" value="" class="required" type="text"/>
				</td>
                <td>
                    <div class="subBar" style="margin-top:-4px;">
                        <ul style="float:left;">
                            <li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
                        </ul>
                    </div>
                </td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" width="100%" layoutH="112" asc="asc" desc="desc">
		<thead>
			<tr>
				<th width="20"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
                <th width="120" orderField="ID" class="${dpc.orderDirection}">序号</th>  
                <th width="100" >名字</th>  
                <th width="100" >真实姓名</th>  
                <th width="80" >性别</th>   
				<th width="60">操作</th>      
			</tr>
		</thead>		
		<tbody>
		<c:if test="${listPage == null}">
	    	<tr><td><center>抱歉，没有任何记录。</center></td></tr>
	    </c:if>
		<c:forEach var="dataItem" items="${listPage}">
			<tr target="pojo_id" rel="${dataItem.ID}">
				<td><input id="${random}${dataItem.ID}" name="ids" value="${dataItem.ID}" type="checkbox"></td>
                <td>${dataItem.ID}</td>  
                <td>${dataItem.NAME}</td>  
                <td>${dataItem.TYPE}</td>  
                <td>${dataItem.REMARK}</td> 	
                <td>
					<a title="删除" target="ajaxTodo" href="${BaseURL}${dataItem.ID}?_method=delete" class="btnDel">删除</a>
					<a title="编辑" target="dialog" href="${BaseURL}${dataItem.ID}/edit" class="btnEdit">编辑</a>
				</td> 
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div class="panelBar">
		<div class="pages">
			<span>每页</span>
			<select class="combox" name="numPerPage" change="navTabPageBreak" param="numPerPage">
				<option value="1">调整</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${dpc.allCount}条记录，每页${dpc.numPerPage}条，当前第${dpc.currentPage}/${dpc.pageCount}页</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${dpc.allCount}" numPerPage="${dpc.numPerPage}" pageNumShown="10" currentPage="${dpc.currentPage}"></div>	
	<form id="pagerForm" method="post" action="hrs_b/list">
			<input type="hidden" id="pageNum" name="pageNum" value="${dpc.currentPage}" />
			<input type="hidden" id="numPerPage" name="numPerPage" value="${dpc.numPerPage}" />
			<input type="hidden" id="orderField" name="orderField" value="${dpc.orderField}"/>
			<input type="hidden" id="orderDirection" name="orderDirection" value="${dpc.orderDirection}"/>
	</form>

	</div>	
</div>

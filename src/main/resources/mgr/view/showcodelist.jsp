<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${BaseURL}pages/mgr/showcodelist.js"></script>

<script type="text/javascript">

</script>

<div class="pageContent" id="showcodelist_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${BaseURL}hrs/addEmpBase"
				target="navTab" title="添加员工"><span>添加员工</span></a></li>
			<li><a class="edit" onclick="doEditEmpBase();" rel="xgjbxx"><span>基本信息</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:;"><span>导入EXCEL</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showcodelist"></div>
	</div>
</div>
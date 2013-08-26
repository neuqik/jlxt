<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${BaseURL}pages/chk/showdepartcheck.js"></script>

<script type="text/javascript">
	
</script>

<div class="pageContent" id="showdepartcheck_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${BaseURL}chk/adddepartcheck"
				target="navTab" title="新建监理部检查"><span>新建监理部检查</span></a></li>
			<li><a class="edit" onclick="doEditEmpBase();" rel="xgjbxx"><span>基本信息</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:;"><span>导入EXCEL</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showdepartcheck"></div>
	</div>
</div>

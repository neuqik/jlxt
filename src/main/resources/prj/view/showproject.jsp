<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${BaseURL}pages/prj/showproject.js"></script>

<script type="text/javascript">

</script>

<div class="pageContent" id="showproject_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${BaseURL}prj/addProject"
				target="navTab" title="新增项目"><span>新增项目</span></a></li>
			<li><a class="edit" onclick="doEditProject();" rel="whxm"><span>维护项目</span></a></li>
			<li><a class="edit" onclick="doEditProject();" rel="scxm"><span>删除项目</span></a></li>
			<li><a class="edit" onclick="doEditProject();" rel="xmwg"><span>项目竣工</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:;"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_showproject"></div>
	</div>
</div>

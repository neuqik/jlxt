<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var prjId = "${PRJ_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/prj/editunitall.js"></script>

<div class="pageContent" id="editunitall_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${BaseURL}prj/addunit?PRJ_ID=${PRJ_ID}"
				target="dialog" title="添加参建单位" width="440" height="400"
				mask="true"><span>添加参建单位</span></a></li>
			<li><a class="delete" onclick="" rel="sccjdw"><span>删除参建单位</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_editunitall"></div>
	</div>
</div>

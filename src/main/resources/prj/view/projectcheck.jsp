<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var prjId = "${PRJ_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/prj/projectcheck.js"></script>

<script type="text/javascript">
	//添加评分
	function doAddScore() {
		// 如果只有一条
		navTab.openTab("xzpf", MyURL + "prj/addscore", {
			title : "添加新检查单",
			fresh : false,
			data : {},
			close : function() {
				// 对话框关闭时执行刷新
				projectcheck_grid.reload();
				projectcheck_grid.checkedRows = {};
				return true;
			}
		});
	}
</script>

<div class="pageContent" id="projectcheck_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddScore();" rel="xzpf"><span>添加新检查单</span></a></li>
			<li><a class="edit" onclick="doEditEmpBase();" rel="ckpfmx"><span>查看检查单</span></a></li>
			<li><a class="delete" onclick="doEditEmpBase();" rel="ckpfmx"><span>删除检查单</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_projectcheck"></div>
	</div>
</div>

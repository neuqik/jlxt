<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var prjId = "${PRJ_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/prj/editunitall.js">
	
</script>
<script type="text/javascript">
	//检查是否只有一条记录
	function doCheckIsOnlyRowForProjUnit() {
		var empIdsForProjUnit = new Array();
		var i = 0;
		$.each(editunitall_grid.checkedRows, function(key, value) {
			empIdsForProjUnit[i] = key;
			i++;
		});
		if (empIdsForProjUnit.length != 1) {
			return -1;
		} else {
			return empIdsForProjUnit[0];
		}
	}
	// 添加参建单位
	function doAddUnit() {
		// 如果只有一条
		$.pdialog.open("${BaseURL}prj/addunit?PRJ_ID=${PRJ_ID}", 'tjcjdw',
				"添加参建单位", {
					width : 640,
					height : 480,
					max : false,
					mask : true,
					mixable : true,
					minable : true,
					resizable : true,
					drawable : true,
					fresh : true,
					close : function() {
						// 对话框关闭时执行刷新
						editunitall_grid.reload();
						return true;
					}
				});
	}
	//checkbox编辑参建单位
	function doEditUnit() {
		var id1 = doCheckIsOnlyRowForProjUnit();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			// 如果只有一条
			$.pdialog.open('${BaseURL}prj/editunit?PRJ_ID=${PRJ_ID}&ID=' + id1,
					'xgcjdw', "修改参建单位信息", {
						width : 640,
						height : 480,
						max : false,
						mask : true,
						mixable : true,
						minable : true,
						resizable : true,
						drawable : true,
						fresh : true,
						close : function() {
							// 对话框关闭时执行刷新
							editunitall_grid.reload();
							editunitall_grid.checkedRows = {};
							return true;
						}
					});

		}
	}
	//checkbox删除参建单位
	function doDelUnit() {
		var id1 = doCheckIsOnlyRowForProjUnit();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息删除！");
		} else {

			// 如果只有一条
			alertMsg.confirm("是否确定删除该信息？", {
				okCall : function() {
					$.post('${BaseURL}prj/delunit?PRJ_ID=${PRJ_ID}&ID=' + id1, {
						empId : ''
					}, function() {
						DWZ.ajaxDone;
						editunitall_grid.reload();
						editunitall_grid.checkedRows = {};
					}, "json");
				}
			});
		}
	}
</script>
<div class="pageContent" id="editunitall_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddUnit();" rel="tjcjdw"><span>添加参建单位</span></a></li>
			<li><a class="edit" onclick="doEditUnit();" rel="xgcjdw"><span>编辑参建单位</span></a></li>
			<li><a class="delete" onclick="doDelUnit();" rel="sccjdw"><span>删除参建单位</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_editunitall"></div>
	</div>
</div>

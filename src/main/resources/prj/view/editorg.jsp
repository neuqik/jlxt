<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var prjId = "${PRJ_ID}";
</script>
<script type="text/javascript" src="${BaseURL}pages/prj/editorg.js"></script>

<script type="text/javascript">
	//检查是否只有一条记录
	function doCheckIsOnlyRowForOrg() {
		var empIdsForOrg = new Array();
		var i = 0;
		$.each(editorg_grid.checkedRows, function(key, value) {
			empIdsForOrg[i] = key;
			i++;
		});
		if (empIdsForOrg.length != 1) {
			return -1;
		} else {
			return empIdsForOrg[0];
		}
	}
	// 添加参建单位
	function doAddOrg() {
		// 如果只有一条
		$.pdialog.open("${BaseURL}prj/addprjorg?PRJ_ID=${PRJ_ID}", 'tjjs',
				"添加角色", {
					width : 500,
					height : 400,
					max : false,
					mask : true,
					mixable : true,
					minable : true,
					resizable : true,
					drawable : true,
					fresh : true,
					close : function() {
						// 对话框关闭时执行刷新
						editorg_grid.reload();
						return true;
					}
				});
	}
	//checkbox编辑参建单位
	function doEditOrg() {
		var id1 = doCheckIsOnlyRowForOrg();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息编辑！");
		} else {
			// 如果只有一条
			$.pdialog.open('${BaseURL}prj/editprjorg?PRJ_ID=${PRJ_ID}&ID='
					+ id1, 'xgjs', "修改角色", {
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
					editorg_grid.reload();
					editorg_grid.checkedRows = {};
					return true;
				}
			});

		}
	}
	//checkbox删除参建单位
	function doDelOrg() {
		var id1 = doCheckIsOnlyRowForOrg();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息删除！");
		} else {

			// 如果只有一条
			alertMsg.confirm("是否确定删除该信息？", {
				okCall : function() {
					$.post(
							'${BaseURL}prj/delprjorg?PRJ_ID=${PRJ_ID}&ID='
									+ id1, {
								empId : ''
							}, function() {
								DWZ.ajaxDone;
								editorg_grid.reload();
								editorg_grid.checkedRows = {};
							}, "json");
				}
			});
		}
	}
</script>

<div class="pageContent" id="editorg_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="doAddOrg();" rel="zjjs"><span>增加角色</span></a></li>
			<li><a class="edit" onclick="doEditOrg();" rel="xgjs"><span>修改角色</span></a></li>
			<li><a class="delete" onclick="doDelOrg();" rel="scjs"><span>删除角色</span></a></li>
		</ul>
	</div>
	<div>
		<div id="gridbox_editorg"></div>
	</div>
</div>

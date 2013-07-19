<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var checkgroupNo = "${CHECKGROUP_NO}";
</script>
<script type="text/javascript"
	src="${BaseURL}pages/prj/showcheckgroup.js"></script>
<script type="text/javascript">
	//检查是否只有一条记录
	function doCheckIsOnlyRowForPrjCheck() {
		var empIdsForPrjCheck = new Array();
		var i = 0;
		$.each(showcheckgroup_grid.checkedRows, function(key, value) {
			empIdsForPrjCheck[i] = key;
			i++;
		});
		//console.log(empIdsForPrj);
		if (empIdsForPrjCheck.length != 1) {
			return -1;
		} else {
			return empIdsForPrjCheck[0];
		}
	}
	// 添加扣分
	function doAddCheck() {
		/*
		navTab.openTab("tjkf", MyURL
				+ "prj/addscorebygroup?CHECKGROUP_NO=${CHECKGROUP_NO}", {
			title : "添加扣分",
			fresh : false,
			data : {},
			close : function() {
				// 对话框关闭时执行刷新
				showcheckgroup_grid.reload();
				showcheckgroup_grid.checkedRows = {};
				return true;
			}
		});*/
		$.pdialog
				.open(
						"prj/addscorebygroup?CHECKGROUP_NO=${CHECKGROUP_NO}&CHECK_TYPE=${prj.CHECK_TYPE}",
						"tjkf", "添加评分", {
							width : 840,
							height : 380,
							max : false,
							mask : true,
							mixable : true,
							minable : true,
							resizable : true,
							drawable : true,
							fresh : true,
							close : function() {
								// 对话框关闭时执行刷新
								showcheckgroup_grid.reload();
								showcheckgroup_grid.checkedRows = {};
								return true;
							}
						});
	}

	//checkbox删除扣分
	function doDelCheck() {
		var id1 = doCheckIsOnlyRowForPrjCheck();
		if (id1 < 0) {
			alertMsg.error("请选择一条信息删除，删除前请确认该项目可删除！");
		} else {
			// 如果只有一条
			alertMsg.confirm("是否确定删除该信息？", {
				okCall : function() {
					$.post('${BaseURL}prj/delscore?ID=' + id1, {
						empId : ''
					}, function() {
						DWZ.ajaxDone;
						showcheckgroup_grid.reload();
						showcheckgroup_grid.checkedRows = {};
					}, "json");
				}
			});
		}
	}
	function test() {
		return true;
	}
</script>

<div class="pageContent" id="showcheckgroup_head"
	style="overflow-x: hidden; overflow-y: auto">
	<div class="panel" id="showcheckgroup_panel">
		<h1>检查单信息</h1>
		<div class="pageFormContent">
			<input size="30" name="ID" value="${prj.ID}" maxlength="22"
				type="hidden" /> <input size="30" name="PRJ_ID" id="PRJ_ID"
				value="${prj.PRJ_ID}" maxlength="22" type="hidden" />
			<!-- 查找带回需要指定id属性 -->
			<p>
				<label>评分表编号：</label> <input id="CHECKGROUP_NO" name="CHECKGROUP_NO"
					id="CHECKGROUP_NO" type="text" size="30" readonly="readonly"
					value="${prj.CHECKGROUP_NO}" />
			</p>
			<p>
				<label>检查类型：</label> <select name="CHECK_TYPE" id="CHECK_TYPE"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${CHECK_TYPE}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.CHECK_TYPE}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
					</c:forEach></select>
			</p>
			<p>
				<label>检查时间：</label> <input type="text" name="CHECKDATE"
					class="date readonly" size="30" yearstart="-80" yearend="5"
					value="${prj.CHECKDATE}" />
			</p>
			<p>
				<label>项目名称：</label> <input id="PRJ_NAME" name="PRJ_NAME"
					type="text" size="30" readonly="readonly" value="${prj.PRJ_NAME}" />
			</p>
			<p>
				<label>分公司名称：</label> <input id="DEPT_NAME" name="DEPT_NAME"
					type="text" size="30" readonly="readonly" value="${prj.DEPT_NAME}" />
			</p>
			<p>
				<label>受检人员：</label> <input id="TESTER_NAME" name="TESTER"
					type="text" size="30" readonly="readonly" value="${prj.TESTER}" />
			</p>
			<p>
				<label>项目总监：</label><input type="text" size="30" name="EMP_ID"
					value="${prj.EMP_ID}" maxlength="20" readonly="readonly" />
			</p>
			<p>
				<label>项目总代：</label><input type="text" size="30" name="EMP_ID_2"
					value="${prj.EMP_ID_2}" maxlength="20" readonly="readonly" />
			</p>
			<p>
				<label>检查人员：</label><input type="text" size="30" name="CHECK_USER"
					value="${prj.CHECK_USER}" maxlength="20" readonly="readonly" />
			</p>
			<p>
				<label>项目进展情况：</label><input type="text" size="30" name="PROGRESS"
					value="${prj.PROGRESS}" maxlength="1000" readonly="readonly" />
			</p>
			<p>
				<label>备注：</label><input type="text" size="30" name="MEMO"
					value="${prj.MEMO}" maxlength="500" readonly="readonly" />
			</p>
		</div>
	</div>
	<div class="panel">
		<h1>评分信息</h1>
		<div>

			<div class="button">
				<div class="buttonContent">
					<button class="add" onclick="doAddCheck();">添加评分</button>
				</div>
			</div>
			<div class="button">
				<div class="buttonContent">
					<button class="delete" onclick="doDelCheck();">删除评分</button>
				</div>
			</div>

		</div>
		<div>
			<div id="gridbox_showcheckgroup"></div>
		</div>
	</div>
</div>

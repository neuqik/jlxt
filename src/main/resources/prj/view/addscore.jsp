<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	// 增加item项
	function jsAddItemToSelect(objSelect, objItemText, objItemValue) {
		var varItem = new Option(objItemText, objItemValue);
		objSelect.options.add(varItem);
		//objSelect.add(varItem);
	}
	// 生成建设单位
	function doConstruct() {
		var PRJ_ID = $("#PRJ_ID").val();
		$.post('${BaseURL}prj/constructunit?PRJ_ID=' + PRJ_ID, {
			empId : ''
		}, function(json) {
			DWZ.ajaxDone;
			var obj = eval(json);
			var objSelect = document.getElementById('JSDW_ID');

			for ( var i = 0; i < obj.length; i++) {
				jsAddItemToSelect(objSelect, obj[i][1], obj[i][0]);
			}
		});
	}
</script>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/savenewscore"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input size="30" name="ID" value="${prj.ID}" maxlength="22"
					type="hidden" /> <input size="30" name="PRJ_ID" id="PRJ_ID"
					value="${prj.PRJ_ID}" maxlength="22" type="hidden" />
				<p>
					<label>项目编号：</label><input class="required" id="PRJNO"
						value="${prj.EMP_ID}" name="PRJNO" size="30" type="text" alt=""
						lookupGroup="" lookupName="PRJNO" onBlur="doConstruct();" /> <a
						class="btnLook" href="${BaseURL}common/doProjectLookup"
						lookupGroup="" lookupName="PRJNO" lookupPk="PRJ_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>项目名称：</label> <input id="PRJ_NAME" name="PRJ_NAME"
						id="PRJ_NAME" type="text" size="30" readonly="readonly"
						value="${prj.PRJ_NAME}" />
				</p>
				<p>
					<label>建设单位：</label> <select id="JSDW_ID" name="JSDW_ID"
						class="combox required"><option value="">请选择...</option>
					</select>
				</p>
				<p>
					<label>施工单位：</label> <select id="" name="" class="combox required"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${CHECKITEM}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>结构形式：</label> <select id="" name="" class="combox required"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${CHECKITEM}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<div class="divider"></div>
				<p>
					<label>评分表编号：</label> <input id="PRJ_NAME" name="PRJ_NAME"
						id="PRJ_NAME" type="text" size="30" readonly="readonly"
						value="${prj.PRJ_NAME}" />
				</p>
				<p>
					<label>检查时间：</label> <input type="text" name="CHECKDATE"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${prj.CHECKDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>检查大项：</label> <select id="ITEM" name="ITEM"
						class="combox required" ref="CHECKITEM"
						refUrl="${BaseURL}common/doGetCheckItem?item={value}"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${ITEM}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>检查细项：</label> <select id="CHECKITEM" name="CHECKITEM"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${CHECKITEM}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>扣分：</label><input type="text" size="30" name="ACT_SCORE"
						value="${prj.ACT_SCORE}" maxlength="22" class="required" />
				</p>
				<p>
					<label>项目进展情况：</label><input type="text" size="30"
						name="PRJ_PROGRESS" value="${prj.PRJ_PROGRESS}" maxlength="1000" />
				</p>
				<p>
					<label>备注：</label><input type="text" size="30" name="MEMO"
						value="${prj.MEMO}" maxlength="500" />
				</p>

			</div>
			<div class="formBar">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="button">
							<div class="buttonContent">
								<button type="button">新建评分表</button>
							</div>
						</div></li>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">保存</button>
							</div>
						</div></li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" class="close">取消</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</div>
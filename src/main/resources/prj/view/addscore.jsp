<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$("#PRJNO").select();
	function initVar() {
		var PRJ_ID = $("#PRJ_ID").val();
		var PRJNO = $("#PRJNO").val();
		// 建设单位
		var obj1 = document.getElementById('JSDW_LOOKUP');
		var h = obj1.getAttribute('href');

		if (h.indexOf('?') > 0) {
			h = h.substr(0, h.indexOf('?'));
		}
		obj1.setAttribute('href', h + '?PRJ_ID=' + PRJ_ID);
		//施工单位
		var obj2 = document.getElementById('SGDW_LOOKUP');
		var h2 = obj2.getAttribute('href');
		if (h2.indexOf('?') > 0) {
			h2 = h2.substr(0, h2.indexOf('?'));
		}
		obj2.setAttribute('href', h2 + '?PRJ_ID=' + PRJ_ID);
		//结构类型
		var obj3 = document.getElementById('CONSTRUCT_LOOKUP');
		var h3 = obj3.getAttribute('href');
		if (h3.indexOf('?') > 0) {
			h3 = h3.substr(0, h3.indexOf('?'));
		}
		obj3.setAttribute('href', h3 + '?PRJ_ID=' + PRJ_ID);
	}
</script>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/savecheckitem"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input size="30" name="ID" value="${prj.ID}" maxlength="22"
					type="hidden" /> <input size="30" name="PRJ_ID" id="PRJ_ID"
					value="${prj.PRJ_ID}" maxlength="22" type="hidden" />
				<p>
					<label>项目编号：</label><input class="required" id="PRJNO"
						value="${prj.PRJNO}" name="PRJNO" size="30" type="text" alt=""
						lookupGroup="" lookupName="PRJNO" onBlur="initVar();" readonly="readonly"/> 
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>项目名称：</label> <input id="PRJ_NAME" name="PRJ_NAME"
						type="text" size="30" readonly="readonly" value="${prj.PRJ_NAME}" />
				</p>
				<p>
					<label>建设单位编号：</label><input id="JSDW_ID"
						value="${prj.JSDW_ID}" name="JSDW_ID" size="30" type="text" alt=""
						lookupGroup="" lookupName="JSDW_ID" readonly="readonly" /> <a
						class="btnLook" id="JSDW_LOOKUP"
						href="${BaseURL}common/doJSDWLookup" lookupGroup=""
						lookupName="JSDW_ID" lookupPk="JSDW_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>建设单位名称：</label> <input id="UNIT_NAME" name="UNIT_NAME"
						type="text" size="30" readonly="readonly" value="${prj.UNIT_NAME}" />
				</p>

				<p>
					<label>施工单位编号：</label><input id="SGDW_ID"
						value="${prj.SGDW_ID}" name="SGDW_ID" size="30" type="text" alt=""
						lookupGroup="" lookupName="SGDW_ID" readonly="readonly" /> <a
						class="btnLook" id="SGDW_LOOKUP"
						href="${BaseURL}common/doSGDWLookup" lookupGroup=""
						lookupName="SGDW_ID" lookupPk="SGDW_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>施工单位名称：</label> <input id="SGDW_NAME" name="SGDW_NAME"
						type="text" size="30" readonly="readonly" value="${prj.SGDW_NAME}" />
				</p>
				<p>
					<label>结构类型：</label><input id="CONSTRUCT_TYPE"
						value="${prj.CONSTRUCT_TYPE}" name="CONSTRUCT_TYPE" size="30"
						type="text" alt="" lookupGroup="" lookupName="CONSTRUCT_TYPE"
						readonly="readonly" /> <a class="btnLook" id="CONSTRUCT_LOOKUP"
						href="${BaseURL}common/doJGLXLookup" lookupGroup=""
						lookupName="CONSTRUCT_TYPE" lookupPk="CONSTRUCT_TYPE">查找</a>
				</p>
				<p>
					<label>结构类型名称：</label> <input id="CONSTRUCT_TYPE_NAME"
						name="CONSTRUCT_TYPE_NAME" type="text" size="30"
						readonly="readonly" value="${prj.CONSTRUCT_TYPE_NAME}" />
				</p>
				<div class="divider"></div>
				<p>
					<label>评分表编号：</label> <input id="CHECKGROUP_NO"
						name="CHECKGROUP_NO" id="CHECKGROUP_NO" type="text" size="30"
						readonly="readonly" value="${prj.CHECKGROUP_NO}" />
				</p>
				<p>
					<label>检查时间：</label> <input type="text" name="CHECKDATE"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${prj.CHECKDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>


				<p>
					<label>实际得分：</label><input type="text" size="30" name="ACT_SCORE"
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
				<p>
					<label>检查项目：</label> <select id="ITEM" name="ITEM"
						class="combox required" ref="CHECKITEM"
						refUrl="${BaseURL}common/doGetCheckItem?item={value}"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${ITEM}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.ITEM}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select> <select id="CHECKITEM" name="CHECKITEM" class="combox required"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${CHECKITEM}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.CHECKITEM}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
			</div>
			<div class="formBar">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
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
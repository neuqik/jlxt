<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$("#PRJNO").select();
	function initVar() {
		var PRJ_ID = $("#PRJ_ID").val();
		var PRJNO = $("#PRJNO").val();
		// 建设单位
		$("#DEPT_ID").val("");
		$("#TESTER").val("");
		var obj1 = document.getElementById('JSDW_LOOKUP');
		var h = obj1.getAttribute('href');

		if (h.indexOf('?') > 0) {
			h = h.substr(0, h.indexOf('?'));
		}
		obj1.setAttribute('href', h + '?PRJ_ID=' + PRJ_ID);
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
		<form method="post" action="${BaseURL}prj/savenewscore"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input size="30" name="ID" value="${prj.ID}" maxlength="22"
					type="hidden" /> <input size="30" name="PRJ_ID" id="PRJ_ID"
					value="${prj.ID}" maxlength="22" type="hidden" />
				<p>
					<label>评分单编号：</label><input type="text" size="30"
						name="CHECKGROUP_NO" value="${prj.CHECKGROUP_NO}" maxlength="20"
						readonly="readonly" class="required" />
				</p>
				<div class="divider"></div>
				<p>
					<label>项目编号：</label><input class="required" id="PRJNO"
						value="${prj.PRJNO}" name="PRJNO" size="30" type="text" alt=""
						lookupGroup="" lookupName="PRJNO" onBlur="initVar();" /> <a
						class="btnLook" href="${BaseURL}common/doProjectLookup"
						lookupGroup="" lookupName="PRJNO" lookupPk="PRJ_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>项目名称：</label> <input id="PRJ_NAME" name="PRJ_NAME"
						type="text" size="30" readonly="readonly" value="${prj.PRJ_NAME}" />
				</p>
				<p>
					<label>分公司编号：</label><input class="required" id="DEPT_ID"
						value="${prj.DEPT_ID}" name="DEPT_ID" size="30" type="text" alt=""
						lookupGroup="" lookupName="DEPT_ID" readonly="readonly" /> <a
						class="btnLook" id="JSDW_LOOKUP"
						href="${BaseURL}common/doJSDWLookup" lookupGroup=""
						lookupName="DEPT_ID" lookupPk="DEPT_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>分公司名称：</label> <input id="DEPT_NAME" name="DEPT_NAME"
						type="text" size="30" readonly="readonly" value="${prj.DEPT_NAME}" />
				</p>
				<p>
					<label>受检人员编号：</label><input class="required" id="TESTER"
						value="${prj.TESTER}" name="TESTER" size="30" type="text" alt=""
						lookupGroup="" lookupName="CONSTRUCT_TYPE" readonly="readonly" />
					<a class="btnLook" id="CONSTRUCT_LOOKUP"
						href="${BaseURL}common/doJGLXLookup" lookupGroup=""
						lookupName="CONSTRUCT_TYPE" lookupPk="CONSTRUCT_TYPE">查找</a>
				</p>
				<p>
					<label>检查时间：</label> <input type="text" name="CHECKDATE"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${prj.CHECKDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>受检人员名称：</label> <input id="TESTER_NAME" name="TESTER"
						type="text" size="30" readonly="readonly" value="${prj.TESTER}" />
				</p>
				<p>
					<label>形象进度：</label><input type="text" size="30" name="PROGRESS"
						value="${prj.PROGRESS}" maxlength="500" />
				</p>
				<p>
					<label>备注：</label><input type="text" size="30" name="MEMO"
						value="${prj.MEMO}" maxlength="500" />
				</p>
				<div class="divider"></div>
				<p>
					<label>检查人员：</label><input type="text" size="30" name="CHECK_USER"
						value="${prj.CHECK_USER}" maxlength="20" class="required"
						readonly="readonly" />
				</p>
				<p>
					<label>项目总监：</label><input type="text" size="30" name="EMP_ID"
						value="${prj.EMP_ID}" maxlength="20" readonly="readonly" />
				</p>
				<p>
					<label>项目总代：</label><input type="text" size="30" name="EMP_ID_2"
						value="${prj.EMP_ID_2}" maxlength="20" readonly="readonly" />
				</p>
				<div class="divider"></div>
				<p>
					<label>总计得分：</label><input type="text" size="30" name="SUM1"
						value="${prj.SUM1}" maxlength="22" readonly="readonly" />
				</p>
				<p>
					<label>应得分：</label><input type="text" size="30" name="SUM2"
						value="${prj.SUM2}" maxlength="22" readonly="readonly" />
				</p>
				<p>
					<label>得分率：</label><input type="text" size="30" name="RATIO1"
						value="${prj.RATIO1}" maxlength="22" readonly="readonly" />
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
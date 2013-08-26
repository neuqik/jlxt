<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$("#PRJNO").select();
	// 老的值
	var PRJNO_OLD = $("#PRJNO").val();
	function initVar() {
		var PRJ_ID = $("#PRJ_ID").val();
		// 新的值
		var PRJNO = $("#PRJNO").val();
		// 如果换了项目编号
		if (PRJNO != PRJNO_OLD) {
			$("#DEPT_ID").val("");
		}
		var obj1 = document.getElementById('JSDW_LOOKUP');
		var h = obj1.getAttribute('href');

		if (h.indexOf('?') > 0) {
			h = h.substr(0, h.indexOf('?'));
		}
		obj1.setAttribute('href', h + '?PRJ_ID=' + PRJ_ID);
	}
</script>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/${SaveForm}"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input size="30" name="ID" value="${chk.ID}" maxlength="22"
					type="hidden" /> <input size="30" name="PRJ_ID" id="PRJ_ID"
					value="${chk.PRJ_ID}" maxlength="22" type="hidden" />
				<p>
					<label>评分单编号：</label><input type="text" size="30"
						name="CHECKGROUP_NO" value="${chk.CHECKGROUP_NO}" maxlength="20"
						readonly="readonly" class="required" />
				</p>
				<p>
					<label>轮次：</label><input type="text" size="30" name="BATCHNO"
						class="required" value="${chk.BATCHNO}" maxlength="22"
						alt="请输入正确的检查轮次" />
				</p>
				<div class="divider"></div>
				<p>
					<label>项目编号：</label><input class="required readonly" id="PRJNO"
						value="${chk.PRJNO}" name="PRJNO" size="30" type="text" alt=""
						lookupGroup="" lookupName="PRJNO" onBlur="initVar();" />
					<c:if test="${WRITE}">
						<a class="btnLook" href="${BaseURL}common/doProjectLookup"
							lookupGroup="" lookupName="PRJNO" lookupPk="PRJ_ID">查找</a>
					</c:if>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>项目名称：</label> <input id="PRJ_NAME" name="PRJ_NAME"
						type="text" size="30" readonly="readonly" value="${chk.PRJ_NAME}" />
				</p>
				<p>
					<label>分公司编号：</label><input class="required" id="DEPT_ID"
						value="${chk.DEPT_ID}" name="DEPT_ID" size="30" type="text" alt=""
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
					<label>检查时间：</label> <input type="text" name="CHECKDATE"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${chk.CHECKDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>检查人员：</label><input type="text" size="30" name="CHECK_USER"
						value="${chk.CHECK_USER}" maxlength="20" readonly="readonly" />
				</p>
				<p>
					<label>结构类型：</label><input type="text" size="30" name="CONSTRUCT"
						value="${chk.CONSTRUCT}" maxlength="200" readonly="readonly" />
				</p>
				<p>
					<label>实际开工日期：</label> <input type="text" name="ACT_BEGIN"
						class="date" size="30" yearstart="-80" yearend="5"
						value="${chk.ACT_BEGIN}" readonly="readonly" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>计划结束：</label> <input type="text" name="ACT_END" class="date"
						size="30" yearstart="-80" yearend="5" value="${chk.ACT_END}"
						readonly="readonly" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>项目面积(平方米)：</label><input type="text" size="30"
						name="PRJ_AREA" value="${chk.PRJ_AREA}" maxlength="20"
						readonly="readonly" />
				</p>
				<p>
					<label>项目等级：</label> <select name="PRJ_LEVEL" readonly="readonly"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_LEVEL}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == chk.PRJ_LEVEL}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>形象进度：</label><input type="text" size="30" name="PROGRESS"
						value="${chk.PROGRESS}" maxlength="500" />
				</p>
				<p>
					<label>备注：</label><input type="text" size="30" name="MEMO"
						value="${chk.MEMO}" maxlength="500" />
				</p>
				<div class="divider"></div>
				<p>
					<label>土建：</label><input type="text" size="30" name="CONSTRUCTION"
						value="${chk.CONSTRUCTION}" maxlength="200" readonly="readonly" />
				</p>
				<p>
					<label>土建实得：</label><input type="text" size="30"
						name="CONSTRUCTION_SUM" value="${chk.CONSTRUCTION_SUM}"
						maxlength="22" readonly="readonly" />
				</p>
				<p>
					<label>土建问题：</label><input type="text" size="30"
						name="CONSTRUCTION_COMMENT" value="${chk.CONSTRUCTION_COMMENT}"
						maxlength="500" readonly="readonly" />
				</p>
				<p>
					<label>土建占比：</label><input type="text" size="30"
						name="CONSTRUCTION_RATIO" value="${chk.CONSTRUCTION_RATIO}"
						maxlength="22" readonly="readonly" />
				</p>
				<div class="divider"></div>
				<p>
					<label>水暖：</label><input type="text" size="30" name="WATER"
						value="${chk.WATER}" maxlength="200" readonly="readonly" />
				</p>
				<p>
					<label>水暖实得：</label><input type="text" size="30" name="WATER_SUM"
						value="${chk.WATER_SUM}" maxlength="22" readonly="readonly" />
				</p>
				<p>
					<label>水暖问题：</label><input type="text" size="30"
						name="WATER_COMMENT" value="${chk.WATER_COMMENT}" maxlength="500"
						readonly="readonly" />
				</p>
				<p>
					<label>水暖占比：</label><input type="text" size="30" name="WATER_RATIO"
						value="${chk.WATER_RATIO}" maxlength="22" readonly="readonly" />
				</p>
				<div class="divider"></div>
				<p>
					<label>电气：</label><input type="text" size="30" name="ELECTRIC"
						value="${chk.ELECTRIC}" maxlength="200" readonly="readonly" />
				</p>
				<p>
					<label>电气实得：</label><input type="text" size="30"
						name="ELECTRIC_SUM" value="${chk.ELECTRIC_SUM}" maxlength="22"
						readonly="readonly" />
				</p>
				<p>
					<label>电气问题：</label><input type="text" size="30"
						name="ELECTRIC_COMMENT" value="${chk.ELECTRIC_COMMENT}"
						maxlength="500" readonly="readonly" />
				</p>
				<p>
					<label>电气占比：</label><input type="text" size="30"
						name="ELECTRIC_RATIO" value="${chk.ELECTRIC_RATIO}" maxlength="22"
						readonly="readonly" />
				</p>
				<div class="divider"></div>
				<p>
					<label>安全：</label><input type="text" size="30" name="SECURITY"
						value="${chk.SECURITY}" maxlength="200" readonly="readonly" />
				</p>
				<p>
					<label>安全实得：</label><input type="text" size="30"
						name="SECURITY_SUM" value="${chk.SECURITY_SUM}" maxlength="22"
						readonly="readonly" />
				</p>
				<p>
					<label>安全问题：</label><input type="text" size="30"
						name="SECURITY_COMMENT" value="${chk.SECURITY_COMMENT}"
						maxlength="500" readonly="readonly" />
				</p>
				<p>
					<label>安全占比：</label><input type="text" size="30"
						name="SECURITY_RATIO" value="${chk.SECURITY_RATIO}" maxlength="22"
						readonly="readonly" />
				</p>
				<div class="divider"></div>
				<p>
					<label>实得总分：</label><input type="text" size="30" name="TOTAL_SUM"
						value="${chk.TOTAL_SUM}" maxlength="22" readonly="readonly" />
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
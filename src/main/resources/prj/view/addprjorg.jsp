<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/saveneworg"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, dialogAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input type="hidden" size="30" name="ID" value="${prj.ID}"
					maxlength="22" /> <input type="hidden" size="30" name="PRJ_ID"
					value="${PRJ_ID}" maxlength="22" />
				<p>
					<label>员工编号：</label><input class="required" id="EMP_ID"
						value="${prj.EMP_ID}" name="EMP_ID" size="30" type="text" alt=""
						lookupGroup="" lookupName="EMP_ID" /> <a class="btnLook"
						href="${BaseURL}common/doEmpLookup" lookupGroup=""
						lookupName="EMP_ID" lookupPk="ID">查找</a>
				</p>
				<p>
					<label>姓名：</label> <input id="EMP_NAME" name="EMP_NAME" type="text"
						size="30" readonly="readonly" value="${prj.EMP_NAME}" />
				</p>
				<p>
					<label>项目中角色：</label> <select name="PRJ_ROLE"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_ROLE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.PRJ_ROLE}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>进场时间：</label> <input type="text" name="ENTERTIME"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${prj.ENTERTIME}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>离场时间：</label> <input type="text" name="LEAVETIME"
						class="date" size="30" yearstart="-80" yearend="5"
						value="${prj.LEAVETIME}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>项目责任：</label><input type="text" size="30"
						name="RESPONSBILITY" value="${prj.RESPONSBILITY}" maxlength="200" />
				</p>
				<p>
					<label>备注：</label><input type="text" size="30" name="MEMO"
						value="${prj.MEMO}" maxlength="500" />
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
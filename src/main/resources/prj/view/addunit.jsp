<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/savenewunit"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, dialogAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input type="hidden" size="30" name="ID" value="${prj.ID}"
					maxlength="22" /> <input type="hidden" size="30" name="PRJ_ID"
					value="${PRJ_ID}" maxlength="22" />
				<p>
					<label>参建单位名称：</label><input type="text" size="30" name="UNIT_NAME"
						value="${prj.UNIT_NAME}" maxlength="200" class="required" />
				</p>
				<p>
					<label>参建集团名称：</label><input type="text" size="30"
						name="GROUP_NAME" value="${prj.GROUP_NAME}" maxlength="200" />
				</p>
				<p>
					<label>项目角色：</label> <select name="UNIT_TYPE"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${UNIT_TYPE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.UNIT_TYPE}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>资质等级：</label> <select name="QUALI_LEVEL" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${QUALI_LEVEL}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.QUALI_LEVEL}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>单位地址：</label><input type="text" size="30"
						name="UNIT_ADDRESS" value="${prj.UNIT_ADDRESS}" maxlength="200" />
				</p>
				<p>
					<label>联系人：</label><input type="text" size="30" name="CONTRACTOR"
						value="${prj.CONTRACTOR}" maxlength="20" class="required" />
				</p>
				<p>
					<label>职务：</label><input type="text" size="30" name="TITLE"
						value="${prj.TITLE}" maxlength="50" />
				</p>
				<p>
					<label>电话：</label><input type="text" size="30" name="CONTRACT_TEL"
						value="${prj.CONTRACT_TEL}" maxlength="20" />
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
								<button type="submit" class="close">保存</button>
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
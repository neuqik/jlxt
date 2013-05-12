<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/saveeditproject"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent"
				style="overflow-x: hidden; overflow-y: auto">
				<INPUT type="hidden" name="ID" value="${prj.ID}" />
				<p>
					<label>项目编号：</label><input type="text" size="30" name="PRJNO"
						value="${prj.PRJNO}" maxlength="20" class="required" />
				</p>
				<p>
					<label>合同编号：</label><input type="text" size="30" name="CONTRACTNO"
						value="${prj.CONTRACTNO}" maxlength="20" />
				</p>
				<p>
					<label>项目名称：</label><input type="text" size="30" name="PRJ_NAME"
						value="${prj.PRJ_NAME}" maxlength="200" class="required" />
				</p>
				<p>
					<label>合同面积：</label><input type="text" size="30"
						name="CONTRACTAREA" value="${prj.CONTRACTAREA}" maxlength="20" />
				</p>
				<p>
					<label>单体数量(计算)：</label><input type="text" size="30"
						name="BUILDINGCOUNT" maxlength="22" readonly="readonly"
						value="${prj.BUILDINGCOUNT}" />
				</p>
				<p>
					<label>项目等级：</label> <select name="PRJ_LEVEL"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_LEVEL}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.PRJ_LEVEL}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目类别：</label> <select name="PRJ_TYPE"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_TYPE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.PRJ_TYPE}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目总投资：</label><input type="text" size="30" name="PRJ_INVEST"
						value="${prj.PRJ_INVEST}" maxlength="20" />
				</p>
				<p>
					<label>项目面积(平方米)：</label><input type="text" size="30"
						name="PRJ_AREA" value="${prj.PRJ_AREA}" maxlength="20" />
				</p>
				<p>
					<label>项目开工时间：</label> <input type="text" name="PRJ_STARTTIME"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${prj.PRJ_STARTTIME}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>项目结束时间：</label> <input type="text" name="PRJ_ENDTIME"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${prj.PRJ_ENDTIME}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>周例会星期：</label> <select name="WEEKMEETING" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${WEEKMEETING}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.WEEKMEETING}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>周例会时间：</label> <select name="WEEKMEETINGTIME" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${WEEKMEETINGTIME}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.WEEKMEETINGTIME}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地图：</label><input type="text" size="30" name="PRJ_MAP"
						value="${prj.PRJ_MAP}" maxlength="200" />
				</p>
				<p>
					<label>施工区域：</label><input type="text" size="30" name="PRJ_REGION"
						value="${prj.PRJ_REGION}" maxlength="20" />
				</p>
				<p>
					<label>档案归档标志：</label> <select name="PRJ_ARCHIVE" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_ARCHIVE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.PRJ_ARCHIVE}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>

				<p>
					<label>档案归档时间：</label> <input type="text" name="PRJ_ARCHIVETIME"
						class="date" size="30" yearstart="-80" yearend="5"
						value="${prj.PRJ_ARCHIVETIME}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>项目地址(省)：</label> <select id="LOCATION1" name="LOCATION1"
						class="combox required" ref="LOCATION2"
						refUrl="${BaseURL}common/doGetCity?location1={value}"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION1}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.LOCATION1}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地址(市)：</label> <select id="LOCATION2" name="LOCATION2"
						class="combox required" ref="LOCATION3"
						refUrl="${BaseURL}common/doGetArea?location2={value}"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION2}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.LOCATION2}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地址(县/区)：</label> <select id="LOCATION3" name="LOCATION3"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION3}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.LOCATION3}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地址(街道)：</label><input type="text" size="30"
						name="LOCATION4" value="${prj.LOCATION4}" maxlength="2000"
						class="required" />
				</p>
				<p>
					<label>质量目标：</label> <select name="QUALITY_TARGET"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${QUALITY_TARGET}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == prj.QUALITY_TARGET}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目工期：</label><input type="text" size="30" name="PRJ_TIME"
						value="${prj.PRJ_TIME}" maxlength="20" />
				</p>
				<p>
					<label>项目图片：</label><input type="text" size="30" name="PRJ_PIC"
						value="${prj.PRJ_PIC}" maxlength="200" />
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
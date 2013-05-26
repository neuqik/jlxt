<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/savenewproject"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<p>
					<label>项目编号：</label><input type="text" size="30" name="PRJNO"
						maxlength="20" readonly="readonly" />
				</p>
				<p>
					<label>合同编号：</label><input type="text" size="30" name="CONTRACTNO"
						maxlength="20" />
				</p>
				<p>
					<label>项目名称：</label><input type="text" size="30" name="PRJ_NAME"
						maxlength="200" class="required" />
				</p>
				<p>
					<label>项目类别：</label> <select name="PRJ_TYPE"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_TYPE}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目等级：</label> <select name="PRJ_LEVEL"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_LEVEL}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>合同面积：</label><input type="text" size="30"
						name="CONTRACTAREA" maxlength="20" class="required" />
				</p>
				<p>
					<label>实际面积(计算)：</label><input type="text" size="30"
						name="PRJ_AREA" maxlength="20" class="required" />
				</p>
				<p>
					<label>项目投资：</label><input type="text" size="30" name="PRJ_INVEST"
						class="required" maxlength="20" />
				</p>
				<p>
					<label>单体数量(计算)：</label><input type="text" size="30"
						name="BUILDINGCOUNT" maxlength="22" readonly="readonly" />
				</p>
				<p>
					<label>质量目标：</label> <select name="QUALITY_TARGET"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${QUALITY_TARGET}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>合同开工：</label> <input type="text" name="PRJ_STARTTIME"
						class="date required" size="30" yearstart="-80" yearend="5" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>合同结束：</label> <input type="text" name="PRJ_ENDTIME"
						class="date required" size="30" yearstart="-80" yearend="5" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>合同工期(天)：</label><input type="text" size="30" name="PRJ_TIME"
						value="${prj.PRJ_TIME}" maxlength="20" />
				</p>
				<p>
					<label>项目地址(省)：</label> <select id="LOCATION1" name="LOCATION1"
						class="combox required" ref="LOCATION2"
						refUrl="${BaseURL}common/doGetCity?location1={value}"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION1}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地址(市)：</label> <select id="LOCATION2" name="LOCATION2"
						class="combox required" ref="LOCATION3"
						refUrl="${BaseURL}common/doGetArea?location2={value}"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION2}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地址(县/区)：</label> <select id="LOCATION3" name="LOCATION3"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION3}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地址(街道)：</label><input type="text" size="30"
						name="LOCATION4" maxlength="2000" />
				</p>
				<p>
					<label>例会时间：</label><select name="WEEKMEETING" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${WEEKMEETING}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select> <select name="WEEKMEETINGTIME" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${WEEKMEETINGTIME}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目进展：</label><input type="text" size="30"
						name="PRJ_PROGRESS" maxlength="1000" />
				</p>
				<p>
					<label>归档时间：</label> <input type="text" name="PRJ_ARCHIVETIME"
						class="date" size="30" yearstart="-80" yearend="5" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>归档标志：</label> <select name="PRJ_ARCHIVE" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${PRJ_ARCHIVE}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>项目地图：</label><input type="text" size="30" name="PRJ_MAP"
						maxlength="200" />
				</p>
				<p>
					<label>施工区域：</label><input type="text" size="30" name="PRJ_REGION"
						maxlength="20" />
				</p>
				<p>
					<label>项目图片：</label><input type="text" size="30" name="PRJ_PIC"
						maxlength="200" />
				</p>
				<p>
					<label>备注：</label><input type="text" size="30" name="MEMO"
						maxlength="500" />
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
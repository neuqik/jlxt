<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="pageContent">
	<form method="post" action="${BaseURL}prj/queryprojectbyinput"
		class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			<p>
				<label>项目编号：</label><input type="text" size="30" name="PRJNO"
					value="${prj.PRJNO}" maxlength="20" />
			</p>

			<p>
				<label>合同编号：</label><input type="text" size="30" name="CONTRACTNO"
					value="${prj.CONTRACTNO}" maxlength="20" />
			</p>
			<p>
				<label>项目名称：</label><input type="text" size="30" name="PRJ_NAME"
					value="${prj.PRJ_NAME}" maxlength="200" />
			</p>
			<p>
				<label>项目等级：</label> <select name="PRJ_LEVEL" class="combox"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${PRJ_LEVEL}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.PRJ_LEVEL}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
					</c:forEach></select>
			</p>
			<p>
				<label>项目类别：</label> <select name="PRJ_TYPE" class="combox"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${PRJ_TYPE}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.PRJ_TYPE}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
					</c:forEach></select>
			</p>
			<p>
				<label>项目开工截至日期：</label> <input type="text" name="PRJ_STARTTIME"
					class="date" size="30" yearstart="-80" yearend="5"
					value="${prj.PRJ_STARTTIME}" /><a class="inputDateButton"
					href="javascript:;">选择</a>
			</p>
			<!-- 
			<p>
				<label>项目结束时间：</label> <input type="text" name="PRJ_ENDTIME"
					class="date" size="30" yearstart="-80" yearend="5"
					value="${prj.PRJ_ENDTIME}" /><a class="inputDateButton"
					href="javascript:;">选择</a>
			</p>
			 -->
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
				<label>项目地址(省)：</label> <select id="LOCATION1" name="LOCATION1"
					class="combox" ref="LOCATION2"
					refUrl="${BaseURL}common/doGetCity?location1={value}"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${LOCATION1}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.LOCATION1}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
					</c:forEach></select>
			</p>
			<p>
				<label>项目地址(市)：</label> <select id="LOCATION2" name="LOCATION2"
					class="combox" ref="LOCATION3"
					refUrl="${BaseURL}common/doGetArea?location2={value}"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${LOCATION2}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.LOCATION2}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
					</c:forEach></select>
			</p>
			<p>
				<label>项目地址(县/区)：</label> <select id="LOCATION3" name="LOCATION3"
					class="combox"><option value="">请选择...</option>
					<c:forEach var="item" items="${LOCATION3}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.LOCATION3}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
					</c:forEach></select>
			</p>
			<p>
				<label>项目地址(街道)：</label><input type="text" size="30"
					name="LOCATION4" value="${prj.LOCATION4}" maxlength="2000" />
			</p>
			<p>
				<label>项目进展情况：</label><input type="text" size="30"
					name="PRJ_PROGRESS" value="${prj.PRJ_PROGRESS}" maxlength="1000" />
			</p>
			<p>
				<label>项目备注：</label> <input type="text" size="30" name="MEMO"
					maxlength="200" value="" />
			</p>
			<div class="divider"></div>
			<p>
				<label>部门/分公司：</label> <select name="DEPT_ID" size="30"
					class=" combox"><option value="">请选择...</option>
					<c:forEach var="item" items="${DEPT_ID}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.DEPT_ID}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>参建单位名称：</label><input type="text" size="30" name="UNIT_NAME"
					value="${prj.UNIT_NAME}" maxlength="200" class=""
					<c:if test="${prj.ID!=null}"> readonly="readonly"</c:if> />
			</p>
			<p>
				<label>项目角色：</label> <select name="UNIT_TYPE" class="combox "><option
						value="">请选择...</option>
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
			<div class="divider"></div>
			<p>
				<label>项目中员工姓名：</label> <input id="EMP_NAME" name="EMP_NAME"
					type="text" size="30" value="${prj.EMP_NAME}" />
			</p>
			<p>
				<label>项目中角色：</label> <select name="PRJ_ROLE" class="combox "><option
						value="">请选择...</option>
					<c:forEach var="item" items="${PRJ_ROLE}">
						<option value="${item.codeValue}"
							<c:if test="${item.codeValue == prj.PRJ_ROLE}"> 	selected="selected"</c:if>>${item.codeDesc}</option>
					</c:forEach></select>
			</p>
			<!-- 
			<p>
				<label>进场时间：</label> <input type="text" name="ENTERTIME"
					class="date " size="30" yearstart="-80" yearend="5"
					value="${prj.ENTERTIME}" /><a class="inputDateButton"
					href="javascript:;">选择</a>
			</p>
			<p>
				<label>离场时间：</label> <input type="text" name="LEAVETIME"
					class="date" size="30" yearstart="-80" yearend="5"
					value="${prj.LEAVETIME}" /><a class="inputDateButton"
					href="javascript:;">选择</a>
			</p>
			 -->
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">开始检索</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="reset">清除条件</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>

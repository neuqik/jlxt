<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var empId = "${EMP_ID}";
</script>
<script type="text/javascript"
	src="${BaseURL}pages/hr/labour/editEmpLabour.js"></script>
<div class="pageContent" id="editemplabour_head"
	style="overflow-x: hidden; overflow-y: hidden">
	<form method="post" class="pageForm" action="${BaseURL}labour/saveEmpLabour"
		onsubmit="return validateCallback(this, navTabAjaxDone)">
		<div class="panel">
			<h1>劳动关系</h1>
			<div class="pageFormContent">
				<p>
					<label>员工编号：</label> <input name="EMP_ID" type="text" size="30"
						value="${EMP_ID}" readonly="readonly" />
				</p>
				<p>
					<label>姓名：</label> <input name="EMP_NAME" class="" type="text"
						size="30" value="${emp.EMP_NAME}" readonly="readonly" />
				</p>
				<p>
					<label>部门/分公司：</label> <select id="DEPT_ID" name="DEPT_ID" class=""
						disabled><option value="">请选择...</option>
						<c:forEach var="item" items="${DEPT_ID}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.DEPT_ID}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>身份证号码：</label> <input name="IDCARD" class="" type="text"
						size="30" minlength="15" maxlength="18" value="${emp.IDCARD}"
						readonly="readonly" />
				</p>
				<p>
					<label>出生日期：</label> <input id="BIRTH" type="text" name="BIRTH"
						class="" size="30" yearstart="-80" yearend="5"
						value="${emp.BIRTH}" readonly="readonly" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>年龄：</label> <input type="text" size="30" name="AGE" id="AGE"
						maxlength="3" class="" value="${emp.AGE}" readonly="readonly" />
				</p>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>性别：</label> <select id="GENDER" name="GENDER" class=""
						disabled><option value="">请选择...</option>
						<c:forEach var="item" items="${GENDER}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.GENDER}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>岗位：</label> <select name="ROLENAME" class="" disabled><option
							value="">请选择...</option>
						<c:forEach var="item" items="${ROLENAME}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.ROLENAME}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>员工类型：</label> <select name="EMPTYPE" class="" disabled><option
							value="">请选择...</option>
						<c:forEach var="item" items="${EMPTYPE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.EMPTYPE}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>保险状态：</label> <select name="INSUSTATUS" class=""><option
							value="">请选择...</option>
						<c:forEach var="item" items="${INSUSTATUS}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.INSUSTATUS}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>养老保险编号：</label> <input name="PENSION_NO" type="text" size="30"
						value="${emp.PENSION_NO}" alt="请输入养老保险编号" />
				</p>
				<p>
					<label>医疗保险编号：</label> <input name="MEDICA_NO" type="text" size="30"
						value="${emp.MEDICA_NO}" alt="请输入医疗保险编号" />
				</p>
			</div>
			<div class="formBar">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit"
									<c:if test="${READONLY}">
								disabled="disabled"
							</c:if>>保存</button>
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
		</div>
	</form>
	<div class="panel collapse">
		<h1>劳动合同</h1>
		<div id="gridbox_editlabouremployee"></div>
	</div>
</div>

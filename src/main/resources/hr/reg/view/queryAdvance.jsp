<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<form method="post" action="${BaseURL}labour/queryByInput"
		class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			<p>
				<label>员工编号：</label> <input name="EMP_ID" type="text" size="30"
					value="" />
			</p>
			<p>
				<label>姓名：</label> <input name="EMP_NAME" type="text" size="30"
					value="" />
			</p>
			<p>
				<label>部门：</label> <select name="DEPT_ID" class="combox"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${DEPT_ID}">
						<option value="${item.codeValue}">${item.codeDesc}</option>
					</c:forEach>
				</select>
			</p>
			<div class="divider"></div>
			<p>
				<label>注册专业1：</label> <select name="REGMAJOR1" class="combox"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${REGMAJOR}">
						<option value="${item.codeValue}">${item.codeDesc}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>注册专业2：</label> <select name="REGMAJOR2" class="combox"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${REGMAJOR}">
						<option value="${item.codeValue}">${item.codeDesc}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>注册专业3：</label> <select name="REGMAJOR3" class="combox"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${REGMAJOR}">
						<option value="${item.codeValue}">${item.codeDesc}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>注册号：</label> <input type="text" size="30" name="REGNO"
					id="REGNO" maxlength="30" value="" />
			</p>
			<p>
				<label>证书编号：</label> <input type="text" size="30" name="CERTIFICATE"
					id="CERTIFICATE" maxlength="30" value="" />
			</p>
			<p>
				<label>资格证号：</label> <input type="text" size="30" name="CERTNUMBER"
					id="CERTNUMBER" maxlength="30" value="" />
			</p>
			<p>
				<label>所学专业(注册)：</label> <input type="text" size="30"
					name="PERF_STUDY" maxlength="200" value="" />
			</p>
			<p>
				<label>继续教育专业：</label> <input type="text" size="30"
					name="CONTINUE_EDU" maxlength="200" value="" />
			</p>
			<p>
				<label>注册信息的备注：</label> <input type="text" size="30" name="MEMO"
					maxlength="200" value="" />
			</p>
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

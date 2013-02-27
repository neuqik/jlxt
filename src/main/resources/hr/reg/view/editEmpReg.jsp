<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}hrs/saveEditEmpReg"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this,dialogAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input name="ID" type="hidden" value="${reg.ID}" />
				<p>
					<label>员工编号：</label> <input name="EMP_ID" type="text" size="30"
						value="${EMP_ID}" readonly="readonly" />
				</p>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>注册类别：</label> <select id="REGTYPE" name="REGTYPE"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${REGTYPE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == reg.REGTYPE}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>注册级别：</label> <select id="REGLEVEL" name="REGLEVEL"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${REGLEVEL}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == reg.REGLEVEL}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>注册专业1：</label> <select name="REGMAJOR1" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${REGMAJOR}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == reg.REGMAJOR1}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>注册专业2：</label> <select name="REGMAJOR2" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${REGMAJOR}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == reg.REGMAJOR2}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>注册专业3：</label> <select name="REGMAJOR3" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${REGMAJOR}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == reg.REGMAJOR3}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>

				<p>
					<label>注册号：</label> <input type="text" size="30" name="REGNO"
						id="REGNO" maxlength="30" value="${reg.REGNO}" />
				</p>
				<p>
					<label>证书编号：</label> <input type="text" size="30"
						name="CERTIFICATE" id="CERTIFICATE" maxlength="30"
						value="${reg.CERTIFICATE}" />
				</p>
				<p>
					<label>发证日期：</label> <input type="text" name="ISSUEDATE"
						id="ISSUEDATE" class="date " size="30" yearstart="-80" yearend="5"
						value="${reg.ISSUEDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>有效日期：</label> <input type="text" name="VALIDDATE"
						id="VALIDDATE" class="date " size="30" yearstart="-80"
						yearend="20" value="${reg.VALIDDATE}" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>资格证号：</label> <input type="text" size="30" name="CERTNUMBER"
						id="CERTNUMBER" maxlength="30" value="${reg.CERTNUMBER}" />
				</p>
				<p>
					<label>资格证发证日期：</label> <input type="text" name="CERTDATE"
						id="CERTDATE" class="date " size="30" yearstart="-80" yearend="5"
						value="${reg.CERTDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>资格证有效日期：</label> <input type="text" name="CERTVALIDDATE"
						id="CERTVALIDDATE" class="date " size="30" yearstart="-80"
						yearend="20" value="${reg.CERTVALIDDATE}" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>所学专业(注册)：</label> <input type="text" size="30"
						name="PERF_STUDY" maxlength="200" value="${reg.PERF_STUDY}" />
				</p>
				<p>
					<label>继续教育专业：</label> <input type="text" size="30"
						name="CONTINUE_EDU" maxlength="200" value="${reg.CONTINUE_EDU}" />
				</p>
				<p>
					<label>继续培训证编号：</label> <input type="text" size="30"
						name="CONTINUE_NO" maxlength="200" value="${reg.CONTINUE_NO}" />
				</p>
				<p>
					<label>继续教育时间：</label> <input type="text" size="30"
						name="CONTINUE_DATE" class="date " size="30" yearstart="-80"
						yearend="20" value="${reg.CONTINUE_DATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>备注：</label> <input type="text" size="30" name="MEMO"
						maxlength="200" value="${reg.MEMO}" />
				</p>
			</div>
			<div class="formBar">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit" class="cloase">保存</button>
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
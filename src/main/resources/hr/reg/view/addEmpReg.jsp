<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}hrs/saveNewEmpReg1"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<p>
					<label>员工编号：</label> <input id="EMP_ID" name="EMP_ID" type="text" size="30"
						value="${EMP_ID}" readonly="readonly" lookupGroup=""
						lookupName="EMP_ID"  class="required"/><a class="btnLook"
						href="${BaseURL}common/doEmpLookup" lookupGroup=""
						lookupName="EMP_ID" lookupPk="ID">查找</a>
				</p>
				<p>
					<label>姓名：</label> <input id="EMP_NAME" name="EMP_NAME" type="text"
						size="30" readonly="readonly" value="${EMP_NAME}" />
				</p>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>注册类别：</label> <select id="REGTYPE" name="REGTYPE"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${REGTYPE}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>注册级别：</label> <select id="REGLEVEL" name="REGLEVEL"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${REGLEVEL}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
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
						id="REGNO" maxlength="30" />
				</p>
				<p>
					<label>证书编号：</label> <input type="text" size="30"
						name="CERTIFICATE" id="CERTIFICATE" maxlength="30" />
				</p>
				<p>
					<label>发证日期：</label> <input type="text" name="ISSUEDATE"
						id="ISSUEDATE" class="date " size="30" yearstart="-80" yearend="5" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>有效日期：</label> <input type="text" name="VALIDDATE"
						id="VALIDDATE" class="date " size="30" yearstart="-80"
						yearend="20" /><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>资格证号：</label> <input type="text" size="30" name="CERTNUMBER"
						id="CERTNUMBER" maxlength="30" />
				</p>
				<p>
					<label>资格证发证日期：</label> <input type="text" name="CERTDATE"
						id="CERTDATE" class="date " size="30" yearstart="-80" yearend="5" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>资格证有效日期：</label> <input type="text" name="CERTVALIDDATE"
						id="CERTVALIDDATE" class="date " size="30" yearstart="-80"
						yearend="20" /><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>所学专业(注册)：</label> <input type="text" size="30"
						name="PERF_STUDY" maxlength="200" />
				</p>
				<p>
					<label>继续教育专业：</label> <input type="text" size="30"
						name="CONTINUE_EDU" maxlength="200" />
				</p>
				<p>
					<label>继续培训证编号：</label> <input type="text" size="30"
						name="CONTINUE_NO" maxlength="200" />
				</p>
				<p>
					<label>继续教育时间：</label> <input type="text" size="30"
						name="CONTINUE_DATE" class="date " size="30" yearstart="-80"
						yearend="20" /><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>备注：</label> <input type="text" size="30" name="MEMO"
						maxlength="200" />
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
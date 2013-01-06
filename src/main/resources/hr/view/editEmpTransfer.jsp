<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent" style="overflow-x: hidden; overflow-y: hidden">
		<form method="post" action="${BaseURL}hrs/saveEditEmpTransfer"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this)">
			<div class="pageFormContent" layoutH="58"
				style="overflow-x: hidden; overflow-y: hidden">
				<div class="divider"></div>
				<p>
					<label>员工编号：</label><input class="required" name="EMP_ID" size="30"
						type="text" value="请输入或选择员工编号" lookupGroup="emplookup"
						lookupName="empid" /> <a class="btnLook"
						href="${BaseURL}common/doEmpLookup" lookupGroup="emplookup"
						lookupName="empid">查找带回</a>
				</p>
				<p>
					<label>身份证号：</label> <input name="IDCARD" type="text" size="30"
						value="${IDCARD}" alt="请输入要办理人员的身份证号" />
				</p>
				<p>
					<label>姓名：</label> <input name="EMP_NAME" type="text" size="30"
						value="${EMP_NAME}" readonly="readonly" />
				</p>
				<p>
					<label>性别：</label> <input name="GENDER" type="text" size="30"
						value="${GENDER}" readonly="readonly" />
				</p>
				<p>
					<label>年龄：</label> <input name="AGE" type="text" size="30"
						value="${AGE}" readonly="readonly" />
				</p>
				<p>
					<label>部门(分公司)：</label> <input name="DEPT_ID" type="text" size="30"
						value="${DEPT_ID}" readonly="readonly" />
				</p>
				<div class="divider"></div>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>变动类型：</label> <select id="TRANSFERTYPE" name="TRANSFERTYPE"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${TRANSFERTYPE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == reg.TRANSFERTYPE}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>变动日期：</label> <input type="text" name="TRANSFERDATE"
						id="TRANSFERDATE" class="required date " size="30" yearstart="-80"
						yearend="5" value="${reg.TRANSFERDATE}" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>新部门/分公司：</label> <select id="NEWDEPT_ID" name="NEWDEPT_ID"
						class="combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${NEWDEPT_ID}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>变动原因：</label> <input type="text" size="30"
						name="TRANSFERREASON" id="TRANSFERREASON" maxlength="150"
						value="${reg.TRANSFERREASON}" alt="请输入变动原因" />
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
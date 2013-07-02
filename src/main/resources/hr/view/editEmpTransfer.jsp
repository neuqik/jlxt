<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent" style="overflow-x: hidden; overflow-y: hidden">
		<form method="post" action="${BaseURL}hrs/saveEmpTransfer" 
			class="pageForm required-validate"
			onsubmit="return validateCallback(this,navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58"
				style="overflow-x: hidden; overflow-y: hidden">
				<div class="divider"></div>
				<!-- lookup 回填js代码重写，根据ID和返回的json的key匹配，因此必须完全匹配 -->
				<p>
					<input id="ID" name="ID" value="" type="hidden" /> <label>员工编号：</label><input
						class="required" id="EMP_ID" name="EMP_ID" size="30" type="text"
						alt="" lookupGroup="" lookupName="EMP_ID" /> <a class="btnLook"
						href="${BaseURL}common/doEmpLookup" lookupGroup=""
						lookupName="EMP_ID" lookupPk="ID">查找</a>
				</p>
				<p>
					<label>身份证号：</label> <input id="IDCARD" name="IDCARD" type="text"
						size="30" readonly="readonly" />
				</p>
				<p>
					<label>姓名：</label> <input id="EMP_NAME" name="EMP_NAME" type="text"
						size="30" readonly="readonly" />
				</p>
				<p>
					<label>性别：</label> <input id="GENDER" name="GENDER" type="text"
						size="30" readonly="readonly" />
				</p>
				<p>
					<label>年龄：</label> <input id="AGE" name="AGE" type="text" size="30"
						readonly="readonly" />
				</p>
				<p>
					<label>部门(分公司)：</label> <input id="DEPT_ID" name="DEPT_ID"
						type="text" size="30" readonly="readonly" />
				</p>
				<div class="divider"></div>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>变动类型：</label> <select id="TRANSFERTYPE" name="TRANSFERTYPE"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${TRANSFERTYPE}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>变动日期：</label> <input type="text" name="TRANSFERDATE"
						id="TRANSFERDATE" class="required date " size="30" yearstart="-80"
						yearend="5" /><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
					<label>新分公司：</label> <select id="NEWDEPT_ID" name="NEWDEPT_ID"
						class="combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${DEPT_ID}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>变动原因：</label> <input type="text" size="30" class="required"
						name="TRANSFERREASON" id="TRANSFERREASON" maxlength="150"
						alt="请输入变动原因" />
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
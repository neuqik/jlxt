<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}labour/saveNewEmpEdu"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<p>
					<label>员工编号：</label> <input name="EMP_ID" type="text" size="30"
						value="${EMP_ID}" readonly="readonly" />
				</p>
				<p>
					<label>毕业院校：</label> <input type="text" size="30" name="GRADUATION"
						id="GRADUATION" maxlength="200" />
				</p>
				<p>
					<label>毕业证号：</label> <input type="text" size="30"
						name="GRADUATENO" id="GRADUATENO" maxlength="100" />
				</p>
				<p>
					<label>毕业日期：</label> <input type="text" name="GRADUATEDATE"
						id="GRADUATEDATE" class="date " size="30" yearstart="-80" yearend="5" /><a
						class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>所学专业：</label> <input type="text" size="30"
						name="MAJOR" maxlength="200" />
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
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="pageContent">
	<form method="post" action="${BaseURL}labour/queryLabourByInput"
		class="pageForm" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="58">
			<div>
				<label>劳动合同状态：</label> <label class="radioButton"><input
					name="CONTRACT_FLAG" type="radio" value="1" />有效</label> <label
					class="radioButton"><input name="CONTRACT_FLAG"
					type="radio" value="0" />无效</label>
			</div>
			<p>
				<label>劳动合同截至日期：</label> <input id="ENDDATE" type="text"
					name="ENDDATE" class="date" size="30" yearstart="-80" yearend="5"
					value="${currentDate}" /><a class="inputDateButton"
					href="javascript:;">选择</a>
			</p>
			<p>
				<label>劳动合同信息的备注：</label> <input type="text" size="30" name="MEMO"
					maxlength="200" value="" />
			</p>
			<div class="divider"></div>
			<div>
				<label>参加保险：</label> <label><input name="INSU_FLAGE"
					type="checkbox" value="1" />养老保险</label> <label><input
					name="INSU_FLAGE" type="checkbox" value="2" />医疗保险</label>
			</div>

			<p>
				<label>意外险状态：</label> <label class="radioButton"><input
					name="ACCIDENT_FLAG" type="radio" value="1" />参加</label> <label
					class="radioButton"><input name="ACCIDENT_FLAG"
					type="radio" value="0" />未参加</label>
			</p>
			<p>
				<label>意外险截至日期：</label> <input id="ACCIDENT_END" type="text"
					name="ACCIDENT_END" class="date" size="30" yearstart="-80"
					yearend="5" value="${currentDate}" /><a class="inputDateButton"
					href="javascript:;">选择</a>
			</p>
			<p>
				<label>保险状态：</label> <select name="INSUSTATUS" class="combox"><option
						value="">请选择...</option>
					<c:forEach var="item" items="${INSUSTATUS}">
						<option value="${item.codeValue}">${item.codeDesc}</option>
					</c:forEach>
				</select>
			</p>
			<div class="divider"></div>
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

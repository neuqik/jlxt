<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageHeader" id="showemptransperf_pageheader">
	<table>
		<tr>
			<td>&nbsp;&nbsp;员工编号：</td>
			<td><input id="EMP_ID" name="EMP_ID" type="text" size="30"
				value="${EMP_ID}" readonly="readonly" /></td>
			<td>&nbsp;&nbsp;姓名：</td>
			<td><input name="EMP_NAME" type="text" size="30"
				value="${EMP_NAME}" readonly="readonly" /></td>
			<td>&nbsp;&nbsp;身份证号：</td>
			<td><input name="IDCARD" type="text" size="30"
				value="${IDCARD}" readonly="readonly" /></td>
			<td>&nbsp;&nbsp;分公司：</td>
			<td><input name="DEPT_ID" type="text" size="30"
				value="${DEPT_ID}" readonly="readonly" /></td>
		</tr>
	</table>
</div>
<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="click">
		<div class="tabsHeader">

			<div class="tabsHeaderContent">
				<ul>
					<li><a href="${BaseURL}hrs/showEmpPerf?empId=${EMP_ID}"
						class="j-ajax"><span>绩效考评</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpTrans?empId=${EMP_ID}"
						class="j-ajax"><span>培训经历</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height: 100%;"
			id="showemptransperf_tabcontent">
			<!-- 要有空的DIV对应tab页的放在下面 -->
			<div></div>
			<div></div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageHeader" id="showempext_pageheader">
	<table>
		<tr>
			<td>&nbsp;&nbsp;员工编号：</td>
			<td><input id="EMP_ID" name="EMP_ID" type="text" size="30"
				value="${EMP_ID}" readonly="readonly" /></td>
			<td>&nbsp;&nbsp;姓名：</td>
			<td><input name="EMP_NAME" type="text" size="30"
				value="${EMP_NAME}" readonly="readonly" /></td>
			<td>&nbsp;&nbsp;身份证号：</td>
			<td><input name="IDCARD" type="text" size="30" value="${IDCARD}"
				readonly="readonly" /></td>
			<td>&nbsp;&nbsp;部门/分公司：</td>
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
					<li><a href="${BaseURL}hrs/showEmpJob?empId=${EMP_ID}"
						class="j-ajax"><span>劳动合同</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpProf?empId=${EMP_ID}"
						class="j-ajax"><span>职称评定</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpCert?empId=${EMP_ID}"
						class="j-ajax"><span>其他证书</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpPerf?empId=${EMP_ID}"
						class="j-ajax"><span>绩效考核</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpWork?empId=${EMP_ID}"
						class="j-ajax"><span>工作经历</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpReg?empId=${EMP_ID}"
						class="j-ajax"><span>注册信息</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpTrans?empId=${EMP_ID}"
						class="j-ajax"><span>培训经历</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpReward?empId=${EMP_ID}"
						class="j-ajax"><span>奖惩记录</span></a></li>
					<li><a href="${BaseURL}hrs/showEmpFamily?empId=${EMP_ID}"
						class="j-ajax"><span>家庭成员</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height: 100%;"
			id="showemptransperf_tabcontent">
			<!-- 要有空的DIV对应tab页的放在下面 -->
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>
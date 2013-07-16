<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="click">
		<div class="tabsHeader" id="projectcheckall_tabheader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="${BaseURL}prj/projectcheck?CHECK_TYPE=1"
						class="j-ajax" rel="xmxx"><span>安全检查</span></a></li>
					<li><a href="${BaseURL}prj/projectcheck?CHECK_TYPE=2"
						class="j-ajax" rel="gcxx"><span>土建检查</span></a></li>
					<li><a href="${BaseURL}prj/projectcheck?CHECK_TYPE=3"
						class="j-ajax" rel="cjdw"><span>水暖检查</span></a></li>
					<li><a href="${BaseURL}prj/projectcheck?CHECK_TYPE=4"
						class="j-ajax" rel="zzxx"><span>电气检查</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height: 100%;"
			id="projectcheckall_tabcontent">
			<!-- 要有空的DIV对应tab页的放在下面 -->
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
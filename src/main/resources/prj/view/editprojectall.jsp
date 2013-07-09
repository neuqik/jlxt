<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="click">
		<div class="tabsHeader" id="addprojectall_tabheader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="${BaseURL}prj/editprojectinfo?PRJ_ID=${PRJ_ID}"
						class="j-ajax" rel="xmxx"><span>项目信息</span></a></li>
					<li><a href="${BaseURL}prj/editbuilding?PRJ_ID=${PRJ_ID}"
						class="j-ajax" rel="gcxx"><span>工程信息</span></a></li>
					<li><a href="${BaseURL}prj/editunitall?PRJ_ID=${PRJ_ID}"
						class="j-ajax" rel="cjdw"><span>参建单位</span></a></li>
					<li><a href="${BaseURL}prj/editorg?PRJ_ID=${PRJ_ID}"
						class="j-ajax" rel="zzxx"><span>监理机构</span></a></li>
					<li><a href="${BaseURL}prj/editrelate?PRJ_ID=${PRJ_ID}"
						class="j-ajax" rel="bmfgs"><span>分公司</span></a></li>
					<li><a href="${BaseURL}prj/editprojectphoto?PRJ_ID=${PRJ_ID}"
						class="j-ajax" rel="xmtp"><span>项目图片</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height: 100%;"
			id="addprojectall_tabcontent">
			<!-- 要有空的DIV对应tab页的放在下面 -->
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
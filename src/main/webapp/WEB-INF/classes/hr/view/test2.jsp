<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="${BaseURL}pages/hr/test2.js"></script>

<div class="pageHeader" id="myheader2">
	<form rel="pagerForm" action="" method="get">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>&nbsp;&nbsp;姓名：<input name="searchName" value=""
						type="text" onKeyUp="doFilter();" /></td>
					<td><div class="buttonActive">
							<div class="buttonContent">
								<button type="button" onClick="doFilter();">查询</button>
							</div>
						</div></td>
					<td>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="button" onClick="doTest();">测试</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div>
	<div id="gridbox2"></div>
</div>



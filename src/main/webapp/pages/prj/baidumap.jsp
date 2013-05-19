<%@page import="net.biz.util.JDBCOracleUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 不要格式化显示 -->
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
body,html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
}

#l-map {
	height: 100%;
	width: 78%;
	float: left;
	border-right: 2px solid #bcbcbc;
}

#r-result {
	height: 100%;
	width: 20%;
	float: left;
}
</style>



<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=1.5&ak=3435ca077b70d6595308220e3df01d57"></script>
<title>项目地图</title>

</head>

<body>
	<div id="allmap"></div>
</body>
</html>
<%
	String no = request.getParameter("PRJNO");
	//取项目名称
	String name = String.valueOf(JDBCOracleUtil
			.executeQuery(
					"SELECT PRJ_NAME FROM V_PRJ_INFO WHERE PRJNO='"
							+ no + "'").get(0).get("PRJ_NAME"));
	String map = request.getParameter("PRJ_MAP");
	System.out.println(name);
	double x = 0;
	double y = 0;
	if (!"".equals(map)) {
		x = Double.parseDouble(String.valueOf(map.split(",")[0]));
		y = Double.parseDouble(String.valueOf(map.split(",")[1]));
	}
%>
<script type="text/javascript">
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(<%=x%>,<%=y%>);
	map.centerAndZoom(point, 15);
	var marker = new BMap.Marker(point); // 创建标注
	map.addOverlay(marker); // 将标注添加到地图中
	map.enableScrollWheelZoom(); //启用滚轮放大缩小
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	var infoWindow = new BMap.InfoWindow('<%=name%>'); // 创建信息窗口对象
	map.openInfoWindow(infoWindow, point); //开启信息窗口
</script>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="css.jsp" />
<jsp:include page="javascript.jsp" />
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
<title>单击获取点击的经纬度</title>

<body>
	<div id="allmap"></div>
</body>

<script type="text/javascript">
	var map = new BMap.Map("allmap"); // 创建Map实例
	map.centerAndZoom("沈阳", 12); // 初始化地图,设置城市和地图级别。
	map.enableScrollWheelZoom(); //启用滚轮放大缩小
	map.addEventListener("click", function(e) {
		var pos = e.point.lng + "," + e.point.lat;
		alert('请记录:' + pos);
		var str = prompt('请输入坐标' + pos + '属于的项目编号：', '');
		if (str != null && str != "") {
			$.post('${BaseURL}prj/savemap?PRJNO=' + str + '&PRJ_MAP=' + pos, {
				empId : ''
			}, function() {
				DWZ.ajaxDone;
				// 添加成功后加一个标志
				var point = new BMap.Point(e.point.lng, e.point.lat);
				map.centerAndZoom(point, 15);
				var marker = new BMap.Marker(point); // 创建标注
				map.addOverlay(marker); // 将标注添加到地图中
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			}, "json");
		} else {
			alert('请输入项目编号');
		}
	});
	var menu = new BMap.ContextMenu();
	var txtMenuItem = [ {
		text : '放大',
		callback : function() {
			map.zoomIn()
		}
	}, {
		text : '缩小',
		callback : function() {
			map.zoomOut()
		}
	} ];

	for ( var i = 0; i < txtMenuItem.length; i++) {
		menu.addItem(new BMap.MenuItem(txtMenuItem[i].text,
				txtMenuItem[i].callback, 100));
	}

	map.addContextMenu(menu);
</script>

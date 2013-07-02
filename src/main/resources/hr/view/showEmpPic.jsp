<%@ page language="java" contentType="text/html; charset=utf-8; "
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	//得到图片的完整路径  
	function getFullPath(obj) {
		if (obj) { //ie  
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				obj.select();
				return document.selection.createRange().text;
			} //firefox  
			else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
				if (obj.files) {
					return obj.files.item(0).getAsDataURL();
				}
				return obj.value;
			}
			return obj.value;
		}
	}
	$("#file1").change(function() {
		var strSrc = $("#file1").val();
		img = new Image();
		var pos = strSrc.lastIndexOf(".");
		var lastname = strSrc.substring(pos, strSrc.length);
		if (lastname.toLowerCase() != ".jpg") {
			alertMsg.error("您上传的文件类型为" + lastname + "，图片必须为 JPG 类型");
			return false;
		}
		//验证上传文件是否超出了大小  
		if (img.fileSize / 1024 > 500) {
			alertMsg.error("您上传的文件大小超出了500K限制！");
			return false;
		}
	});
	function reloadThis() {
		//document.getElementById("empic").src = "${BaseURL}pictures/emp/tmp/${RANDOMFILE}.jpg";
		//alert("${BaseURL}pictures/emp/tmp/${RANDOMFILE}.jpg");
		navTab.reload("${BaseURL}hrs/showEmpPic?empId=${EMP_ID}");
	}
</script>
<div class="page">
	<div class="pageHeader">
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
		<form enctype="multipart/form-data" method="post"
			action="${BaseURL}hrs/saveEmpPic?empId=${EMP_ID}"
			class="pageForm required-validate" name="upload"
			onsubmit="return iframeCallback(this);">
			<div class="formBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit"
									<c:if test="${READONLY}">
								disabled="disabled"
							</c:if>>提交</button>
							</div>
						</div></li>
					<li><div class="button">
							<div class="buttonContent">
								<button type="button" onClick="reloadThis();"
									<c:if test="${READONLY}">
								disabled="disabled"
							</c:if>>刷新</button>
							</div>
						</div></li>
					<li><div class="button">
							<div class="buttonContent">
								<button type="button" class="close">关闭</button>
							</div>
						</div></li>
				</ul>
			</div>
			<div class="pageFormContent">
				<c:if test="${READONLY!=true}">
					<p>
						<label>选择照片：</label> <input id="file1" name="file1" type="file" />
					</p>
				</c:if>
				<div id="pic_img">
					<img alt="员工照片" src="${BaseURL}pictures/emp/${EMP_ID}.jpg"
						width="150px" height="220px" id="empic" name="pic" border="2" />
				</div>
				<font color="red">图片大小不能超过100k，提交后请点击刷新按钮查看</font>
			</div>
		</form>

	</div>
</div>
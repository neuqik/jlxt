<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	var PRJ_ID = $("#PRJ_ID").val();
	/*
	// 增加item项
	function jsAddItemToSelect(objSelect, objItemText, objItemValue) {
		var varItem = new Option(objItemText, objItemValue);
		objSelect.options.add(varItem);
		//objSelect.add(varItem);
	}
	function test(o) {
		var childs = o.parentElement.parentElement.childNodes;
		// ul页面值
		var o_value = o.getAttribute("value");
		for ( var i = childs.length - 1; i >= 0; i--) {
			var a = childs[i].childNodes;
			// a是li下面的<a>

			var a_value = a[0].getAttribute("value");
			// 取li显示部分a的值
			// 如果选择的值和下面的子节点相等，则置为选择
			if (o_value == a_value) {
				a[0].setAttribute("class", "selected");
				// 改变下拉框的文本显示内容
				var obj = document.getElementById('combox_JSDW_ID');
				// 设置文本显示
				obj.childNodes[0].innerText = a[0].innerText;
				// 设置实际option值
				var obj2 = document.getElementById('JSDW_ID');
				var obj2Childs = obj2.childNodes;
				for ( var j = obj2Childs.length - 1; j >= 0; j--) {
					// 实际option的值
					var my_value = obj2Childs[j].getAttribute("value");
					if (o_value == my_value) {
						obj2.setAttribute("value", my_value);
					} 
				}
			} else {
				a[0].setAttribute("class", "");
			}
		}

		//o.parentElement.parentElement.find(".selected").removeClass("selected");
		//o.addClass("selected");
	}*/
	/*
	// 生成建设单位
	function doConstruct() {
		var PRJ_ID = $("#PRJ_ID").val();
		$.post('${BaseURL}prj/constructunit?PRJ_ID=' + PRJ_ID, {
			empId : ''
		}, function(json) {
			DWZ.ajaxDone;
			var obj = eval(json);
			var objSelect = document.getElementById('JSDW_ID');
			var opt = document.getElementById('op_combox_JSDW_ID');
			for ( var i = 0; i < obj.length; i++) {
				jsAddItemToSelect(objSelect, obj[i][1], obj[i][0]);
				opt.appendChild(new createA('', obj[i][0], obj[i][1]));
			}
			console.log(opt);
		});
	}*/
	/***************************************************
	定义方法创建一个<a>_$t_$t_$t_$t_$t_$t_$t_$t_$t_$t_$t标签；
	 *****   selected表示class是否为选择
	 *****   value表示标签对应value属性
	 *****   text表示标签文本
	 ***************************************************/
	//
	//var createA = function(selected, value, text) {
	//		var li = document.createElement("li");
	//	var var_a = document.createElement("a");
	//var a_class = document.createAttribute("class");
	//a_class.nodeValue = selected;
	//	var a_href = document.createAttribute("href");
	//		a_href.nodeValue = "#";
	//		var a_value = document.createAttribute("value");
	//		a_value.nodeValue = value;
	//		var a_click = document.createAttribute("onclick");
	//		a_click.nodeValue = "test(this);";
	//		var a_text = document.createTextNode(text);
	//		var_a.setAttributeNode(a_class);
	//		var_a.setAttributeNode(a_href);
	//		var_a.setAttributeNode(a_value);
	//		var_a.setAttributeNode(a_click);
	//		li.appendChild(var_a);
	//		var_a.appendChild(a_text);//注意这个值绑定顺序，只能放在最后去绑定（不然不支持IE6.0和IE7.0）
	//		return li;
	//}
</script>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}prj/savenewscore"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<input size="30" name="ID" value="${prj.ID}" maxlength="22"
					type="hidden" /> <input size="30" name="PRJ_ID" id="PRJ_ID"
					value="${prj.PRJ_ID}" maxlength="22" type="hidden" />
				<p>
					<label>项目编号：</label><input class="required" id="PRJNO"
						value="${prj.EMP_ID}" name="PRJNO" size="30" type="text" alt=""
						lookupGroup="" lookupName="PRJNO" /> <a class="btnLook"
						href="${BaseURL}common/doProjectLookup" lookupGroup=""
						lookupName="PRJNO" lookupPk="PRJ_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>项目名称：</label> <input id="PRJ_NAME" name="PRJ_NAME"
						type="text" size="30" readonly="readonly" value="${prj.PRJ_NAME}" />
				</p>
				<p>
					<label>建设单位编号：</label><input class="required" id="JSDW_ID"
						value="${prj.JSDW_ID}" name="JSDW_ID" size="30" type="text" alt=""
						lookupGroup="" lookupName="JSDW_ID" /> <a class="btnLook"
						href="${BaseURL}common/doJSDWLookup?" lookupGroup=""
						lookupName="JSDW_ID" lookupPk="JSDW_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>建设单位名称：</label> <input id="UNIT_NAME" name="UNIT_NAME"
						type="text" size="30" readonly="readonly" value="${prj.UNIT_NAME}" />
				</p>

				<p>
					<label>施工单位编号：</label><input class="required" id="SGDW_ID"
						value="${prj.SGDW_ID}" name="SGDW_ID" size="30" type="text" alt=""
						lookupGroup="" lookupName="SGDW_ID" /> <a class="btnLook"
						href="${BaseURL}common/doSGDWLookup" lookupGroup=""
						lookupName="SGDW_ID" lookupPk="SGDW_ID">查找</a>
				</p>
				<!-- 查找带回需要指定id属性 -->
				<p>
					<label>施工单位名称：</label> <input id="SGDW_NAME" name="SGDW_NAME"
						type="text" size="30" readonly="readonly" value="${prj.SGDW_NAME}" />
				</p>
				<p>
					<label>结构形式：</label><input class="required" id="CONSTRUCT_TYPE"
						value="${prj.CONSTRUCT_TYPE}" name="CONSTRUCT_TYPE" size="30"
						type="text" alt="" lookupGroup="" lookupName="CONSTRUCT_TYPE" />
					<a class="btnLook" href="${BaseURL}common/doJGXSLookup"
						lookupGroup="" lookupName="CONSTRUCT_TYPE"
						lookupPk="CONSTRUCT_TYPE">查找</a>
				</p>
				<div class="divider"></div>
				<p>
					<label>评分表编号：</label> <input id="CHECKGROUP_NO"
						name="CHECKGROUP_NO" id="CHECKGROUP_NO" type="text" size="30"
						readonly="readonly" value="${prj.CHECKGROUP_NO}" />
				</p>
				<p>
					<label>检查时间：</label> <input type="text" name="CHECKDATE"
						class="date required" size="30" yearstart="-80" yearend="5"
						value="${prj.CHECKDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>检查大项：</label> <select id="ITEM" name="ITEM"
						class="combox required" ref="CHECKITEM"
						refUrl="${BaseURL}common/doGetCheckItem?item={value}"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${ITEM}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>检查细项：</label> <select id="CHECKITEM" name="CHECKITEM"
						class="combox required"><option value="">请选择...</option>
						<c:forEach var="item" items="${CHECKITEM}">
							<option value="${item.codeValue}">${item.codeDesc}</option>
						</c:forEach></select>
				</p>
				<p>
					<label>扣分：</label><input type="text" size="30" name="ACT_SCORE"
						value="${prj.ACT_SCORE}" maxlength="22" class="required" />
				</p>
				<p>
					<label>项目进展情况：</label><input type="text" size="30"
						name="PRJ_PROGRESS" value="${prj.PRJ_PROGRESS}" maxlength="1000" />
				</p>
				<p>
					<label>备注：</label><input type="text" size="30" name="MEMO"
						value="${prj.MEMO}" maxlength="500" />
				</p>

			</div>
			<div class="formBar">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="button">
							<div class="buttonContent">
								<button type="button">新建评分表</button>
							</div>
						</div></li>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">保存</button>
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
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	//计算本单位工龄
	function showJoinAge(val) {
		var age = (new Date()).getFullYear()
				- document.getElementById('JOINDATE').value.substr(0, 4);
		document.getElementById('JOINAGE').value = age;
	}
	//计算出生日期和年龄性别
	function showBirthday(val) {
		var birthdayValue;
		var age;
		if (15 == val.length) { //15位身份证号码 
			birthdayValue = val.charAt(6) + val.charAt(7);
			if (parseInt(birthdayValue) < 10) {
				birthdayValue = '20' + birthdayValue;
			} else {
				birthdayValue = '19' + birthdayValue;
			}
			age = (new Date()).getFullYear() - birthdayValue;
			birthdayValue = birthdayValue + '-' + val.charAt(8) + val.charAt(9)
					+ '-' + val.charAt(10) + val.charAt(11);
			if (parseInt(val.charAt(14) / 2) * 2 != val.charAt(14)) {
				document.getElementById('GENDER').value = '1';
			} else {
				document.getElementById('GENDER').value = '2';
			}
			document.getElementById('BIRTH').value = birthdayValue;
			document.getElementById('AGE').value = age;
		}
		if (18 == val.length) { //18位身份证号码 
			birthdayValue = val.charAt(6) + val.charAt(7) + val.charAt(8)
					+ val.charAt(9);
			age = (new Date()).getFullYear() - birthdayValue;
			birthdayValue = val.charAt(6) + val.charAt(7) + val.charAt(8)
					+ val.charAt(9) + '-' + val.charAt(10) + val.charAt(11)
					+ '-' + val.charAt(12) + val.charAt(13);
			if (parseInt(val.charAt(16) / 2) * 2 != val.charAt(16))
				document.getElementById('GENDER').value = '1';
			else
				document.getElementById('GENDER').value = '2';
			document.getElementById('BIRTH').value = birthdayValue;
			document.getElementById('AGE').value = age;
		}
	}
</script>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${BaseURL}hrs/saveEditEmp"
			class="pageForm required-validate"
			onsubmit="return validateCallback(this, navTabAjaxDone)">
			<div class="pageFormContent" layoutH="58">
				<table>
					<th>
						<p>
							<label>员工编号：</label> <input name="EMP_ID" type="text" size="30"
								value="${EMP_ID}" readonly="readonly" />
						</p>
						<p>
							<label>姓名：</label> <input name="EMP_NAME" class="required"
								type="text" size="30" value="${emp.EMP_NAME}" alt="请输入员工姓名" />
						</p>
						<p>
							<label>部门/分公司：</label> <select name="DEPT_ID" size="30"
								class="required combox"><option value="">请选择...</option>
								<c:forEach var="item" items="${DEPT_ID}">
									<option value="${item.codeValue}"
										<c:if test="${item.codeValue == emp.DEPT_ID}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<label>身份证号码：</label> <input name="IDCARD" class="required"
								type="text" size="30" minlength="15" maxlength="18"
								alt="请输入身份证号码" value="${emp.IDCARD}"
								remote="${BaseURL}hrs/validIDCardUpdate"
								onChange="showBirthday(this.value);" />
						</p>
						<p>
							<label>出生日期：</label> <input id="BIRTH" type="text" name="BIRTH"
								class="date required" size="30" yearstart="-80" yearend="5"
								value="${emp.BIRTH}" /><a class="inputDateButton"
								href="javascript:;">选择</a>
						</p>
						<p>
							<label>年龄：</label> <input type="text" size="30" name="AGE"
								id="AGE" maxlength="3" class="required" value="${emp.AGE}" />
						</p>
						<p>
							<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
							<label>性别：</label> <select id="GENDER" name="GENDER"
								class="required "><option value="">请选择...</option>
								<c:forEach var="item" items="${GENDER}">
									<option value="${item.codeValue}"
										<c:if test="${item.codeValue == emp.GENDER}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<!-- class不能选择combox，如果增加，则会添加一个超链接的对象，导致修改value不能实时显示 -->
							<label>民族：</label> <select id="NATION" name="NATION"
								class="required combox"><option value="">请选择...</option>
								<c:forEach var="item" items="${NATION}">
									<option value="${item.codeValue}"
										<c:if test="${item.codeValue == emp.NATION}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<label>婚姻状况：</label> <select name="MARRIAGE"
								class="required combox"><option value="">请选择...</option>
								<c:forEach var="item" items="${MARRIAGE}">
									<option value="${item.codeValue}"
										<c:if test="${item.codeValue == emp.MARRIAGE}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<label>政治面貌：</label> <select name="POLITIC" class="combox"><option
									value="">请选择...</option>
								<c:forEach var="item" items="${POLITIC}">
									<option value="${item.codeValue}"
										<c:if test="${item.codeValue == emp.POLITIC}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
								</c:forEach>
							</select>
						</p>
					</th>
					<th align="left"><img alt="员工照片"
						src="${BaseURL}pictures/emp/${EMP_ID}.jpg" width="200px"
						height="200px" border="3" /></th>
				</table>
				<div class="divider"></div>
				<p>
					<label>员工类型：</label> <select name="EMPTYPE" class="combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${EMPTYPE}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.EMPTYPE}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>进入本单位日期：</label> <input type="text" name="JOINDATE"
						id="JOINDATE" class="date required" size="30" yearstart="-80"
						value="${emp.JOINDATE}" yearend="5" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>本单位工龄(年)：</label> <input type="text" size="30"
						name="JOINAGE" id="JOINAGE" maxlength="3" onFocus="showJoinAge();"
						value="${emp.JOINAGE}" />
				</p>
				<p>
					<label>岗位：</label> <select name="ROLENAME" class="required combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${ROLENAME}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.ROLENAME}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>职称：</label> <select name="TITLE_ID" class="required combox"><option
							value="">请选择...</option>
						<c:forEach var="item" items="${TITLE_ID}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.TITLE_ID}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>职称专业：</label> <select name="TITLENAME"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${TITLENAME}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.TITLENAME}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>从事专业：</label> <select name="TITLEWORK"
						class="required combox"><option value="">请选择...</option>
						<c:forEach var="item" items="${TITLEWORK}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.TITLEWORK}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>保险状态：</label> <select name="INSUSTATUS" class="" disabled><option
							value="">请选择...</option>
						<c:forEach var="item" items="${INSUSTATUS}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.INSUSTATUS}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>

				<p>
					<label>文化程度：</label> <input type="text" size="30" name="EDUCATION"
						maxlength="20" value="${emp.EDUCATION}" />
				</p>

				<p>
					<label>参加工作日期：</label> <input type="text" name="WORKDATE"
						class="date" size="30" yearstart="-80" yearend="5"
						value="${emp.WORKDATE}" /><a class="inputDateButton"
						href="javascript:;">选择</a>
				</p>
				<p>
					<label>工龄：</label> <input type="text" size="30" name="WORKAGE"
						value="${emp.WORKAGE}" maxlength="3" />
				</p>
				<p>
					<label>联系电话：</label> <input type="text" size="30" name="TEL"
						value="${emp.TEL}" class="required" maxlength="20" />
				</p>
				<p>
					<label>家庭电话：</label> <input type="text" size="30" name="TELEHOME"
						value="${emp.TELEHOME}" maxlength="20" />
				</p>
				<p>
					<label>紧急联系人电话：</label> <input type="text" size="30" name="EMERGENCY"
						value="${emp.EMERGENCY}" maxlength="20" />
				</p>
				<p>
					<label>档案保管机构：</label> <select name="ARCHIVEKEEP" class="combox">
						<option value="">请选择...</option>
						<c:forEach var="item" items="${ARCHIVEKEEP}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.ARCHIVEKEEP}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>居住地址(省)：</label> <select id="LOCATION1" name="LOCATION1"
						class="combox required" ref="LOCATION2"
						refUrl="${BaseURL}common/doGetCity?location1={value}">
						<option value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION1}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.LOCATION1}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>居住地址(市)：</label> <select id="LOCATION2" name="LOCATION2"
						class="combox required" ref="LOCATION3"
						refUrl="${BaseURL}common/doGetArea?location2={value}">
						<option value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION2}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.LOCATION2}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>居住地址(县区)：</label> <select id="LOCATION3" name="LOCATION3"
						class="combox required">
						<option value="">请选择...</option>
						<c:forEach var="item" items="${LOCATION3}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.LOCATION3}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>居住地址(街道)：</label> <input type="text" size="30"
						value="${emp.LOCATION4}" maxlength="200" name="LOCATION4" />
				</p>
				<div class="divider"></div>
				<p>
					<label>籍贯：</label> <input type="text" size="30" name="NATIVE"
						value="${emp.NATIVE}" maxlength="200" />
				</p>
				<p>
					<label>毕业院校：</label> <input type="text" size="30" name="GRADUATE"
						value="${emp.GRADUATE}" maxlength="100" />
				</p>
				<p>
					<label>主修专业：</label> <select name="MASTER" class="combox">
						<option value="">请选择...</option>
						<c:forEach var="item" items="${MASTER}">
							<option value="${item.codeValue}"
								<c:if test="${item.codeValue == emp.MASTER}">
								selected="selected"
							</c:if>>${item.codeDesc}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>毕业日期：</label> <input type="text" name="GRADDATE"
						value="${emp.GRADDATE}" class="date" size="30" yearstart="-80"
						yearend="5" /><a class="inputDateButton" href="javascript:;">选择</a>
				</p>
				<p>
					<label>户口所在地：</label> <input type="text" size="30" maxlength="200"
						value="${emp.REGLOCATION}" name="REGLOCATION" />
				</p>
				<p>
					<label>冬休所在地：</label> <input type="text" size="30" maxlength="200"
						value="${emp.WINTERLOC}" name="WINTERLOC" />
				</p>
				<p>
					<label>养老保险编号：</label> <input type="text" size="30" maxlength="200"
						value="${emp.PENSION_NO}" name="PENSION_NO" readonly="readonly" />
				</p>
				<p>
					<label>医疗保险编号：</label> <input type="text" size="30" maxlength="200"
						value="${emp.MEDICA_NO}" name="MEDICA_NO" readonly="readonly" />
				</p>
				<p>
					<label>备注：</label> <input type="text" size="30" name="MEMO"
						value="${emp.MEMO}" maxlength=" 200" />
				</p>
			</div>
			<div class="formBar">
				<ul>
					<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit"
									<c:if test="${READONLY}">
								disabled="disabled"
							</c:if>>保存</button>
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
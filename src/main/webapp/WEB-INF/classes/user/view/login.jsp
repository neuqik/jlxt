<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<!-- 
		<link rel="stylesheet" href="${BaseURL}_css/common.css" />  	
<link rel="stylesheet" href="${BaseURL}_css/header.css" />
<link rel="stylesheet" href="${BaseURL}_css/footer.css" />
	-->





<link href="${BaseURL}_css/styles.css" type="text/css" media="screen"
	rel="stylesheet" />
<style type="text/css">
img,div {
	behavior: url(iepngfix.htc)
}
</style>

<!-- 登录页面需要导入 -->
<link rel="stylesheet" href="${BaseURL}_css/login.css" />
<link rel="stylesheet" href="${BaseURL}_css/validationEngine.jquery.css" />


<!-- 登录页面都必须导入 -->
<script type="text/javascript"
	src="${BaseURL}dwzres/javascripts/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${BaseURL}_js/jquery.validationEngine-cn.js"></script>
<script type="text/javascript"
	src="${BaseURL}_js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="${BaseURL}_js/login.js"></script>

</head>
<body id="login">
	<!-- 
			code : chenyoca (chenyoca@163.com)
			date : 2011-11-18
			desc : div#main_wrapper 用于刷渐变背景，无实际意义。
		
		<div id="login">
		
		<!-- 
			code : chenyoca (chenyoca@163.com)
			date : 2011-11-18
			desc : div#wrapper 是页面的最大布局框架。它的CSS样式在common.css中，用于
				   设置页面显示区域的大小。当前设置为1000px，左右居中。
		 -->
	<!-- lef2371 20121105 start 
		<div id="wrapper">
			<div id="header_large"></div>
			<div id="login_box" class="fillet_all">
				<div id="login_content_box" class="fillet_all">
					<div id="login_form_box" class="floatLeft">
						<form action="${BaseURL}users/login" method="post" id="login_form">
							<input type="hidden" name="_method" value="put" />
							<label for="user.account">帐号：</label>
							<input type="text" value="${ReqParamMap['user.account'][0]}" name="user.account" id="username" class="input_style fillet_all validate[required,length[4,20]]" />
							<span>${valError['user.account'] }</span>
							<div class="blank10"></div>
							<label for="user.password">密码：</label>
							<input type="password" value="${ReqParamMap['user.password'][0]}" name="user.password" id="password" class="input_style fillet_all validate[required,length[6,20]]"/>
							<span>${valError['user.password']}</span>
							<div class="blank10"></div>
							
							<label for="user.authcode">验证码：</label>
							<input id="validate_code_input" name="user.authcode" class="code input_style fillet_all" type="text" maxlength="5" style="float:left; margin-right:5px;" />
							<img id="validate_code_img"src="${BaseURL}users/captcha.jsp" onclick="this.src=this.src+'?'+Math.random()" style="float:left;"/>
							<span>${valError['user.authcode'] }</span>
							<div class="blank10 clear"></div>
							<div class="blank10 clear"></div>
							
							<input type="submit" id="login_button" value="登录"/>
							<span>${loginError }</span>
							<div class="blank10 clear"></div>
							<span style="font-size:12px; padding-left:5px;"><a href="${BaseURL}users/register">注册账号</a></span>
						</form>
					</div>
					<div id="login_img_box" class="floatRight"></div>
				</div>
			</div>
			-- lef2371 end>
			
			<!-- Footer -->

	<div id="wrappertop"></div>
	<div id="wrapper">
		<div id="content">
			<div id="header">
				<h1>
					<a href=""><img src="${BaseURL}_css/images/logo.png"
						alt="FreelanceSuite"></a>
				</h1>
			</div>
			<div id="darkbanner" class="banner320">
				<h2>登录</h2>
			</div>
			<div id="darkbannerwrap"></div>

						<form action="${BaseURL}users/login" method="post" id="login_form">
							<fieldset class="form">

								<!-- 
                             <p>
								<label for="user.account">帐号：</label>
								<input name="user_name" id="user_name" type="text" value="" />
							</p>
							<p>
								<label for="密码">Password:</label>
								<input name="user_password" id="user_password" type="password" />
							</p>
							
							 -->
								<input type="hidden" name="_method" value="put" /> <label
									for="user.account">帐号：</label> <input type="text"
									value="${ReqParamMap['user.account'][0]}" name="user.account"
									id="username"
									class="input_style fillet_all validate[required,length[4,20]]" />
								<span>${valError['user.account'] }</span>
								<div class="blank10"></div>
								<label for="user.password">密码：</label> <input type="password"
									value="${ReqParamMap['user.password'][0]}" name="user.password"
									id="password"
									class="input_style fillet_all validate[required,length[6,20]]" />
								<span>${valError['user.password']}</span>
								<div class="blank10"></div>


								<button type="submit" class="positive" name="Submit"
									id="login_button">
									<img src="${BaseURL}_css/images/key.png" alt="Announcement" />登录
								</button>
								<span>${loginError }</span>
								<div class="blank10 clear"></div>
								<!--  
								<ul id="forgottenpassword">
								<li class="boldtext">|</li>
								<li><a href="forgot.php">Forgotten it?</a></li>
							</ul>
							-->
							</fieldset>

						</form>
					</div>
				</div>
	<div id="wrapperbottom_branding">
		<div id="wrapperbottom_branding_text">
			By <a href="lef2371@gmail.com" style="text-decoration: none">Freelance</a> 
			<a href="http://code.google.com/p/wonder4/"
				style="text-decoration: none">Wonder & Lef2371
				management</a>
		</div>

		<!-- 
			<div id="footer_simple">
				Copyright &copy; eweb4j.org 2012 AllRight Reserved
			</div>
			Footer End -->

	</div>
	<!-- End of div#main_wrapper  -->
	<script type="text/javascript" src="${BaseURL}_js/fillet.js"></script>
	<script type="text/javascript">
		jQuery(function($) {
			/*** 渲染圆角 ***/
			DD_roundies.addRule('.fillet_top', '5px 5px 0px 0px', true);
			DD_roundies.addRule('.fillet_all', '5px 5px 5px 5px', true);
			DD_roundies.addRule('.fillet_left', '5px 0px 0px 5px', true);
			DD_roundies.addRule('.fillet_right', '0px 5px 5px 0px', true);
		});
	</script>
</body>
</html>
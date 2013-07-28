<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	String path = request.getContextPath();
	String base = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录</title>
<base href="<%=base%>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<link href="./css/modern.css" rel="stylesheet">
<link href="./css/modern-responsive.css" rel="stylesheet">
<link href="./css/site.css" rel="stylesheet">
<link rel="stylesheet" href="./css/modern.css" />
<link href="./css/modern-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="./css/theme-dark.css" />
<script type="text/javascript" src="./js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="./js/angular.js"></script>
<style type="text/css">
.metrouicss {
	background-color: rgb(0, 125, 266);
}

#pwordbox {
	position: absolute;
	height: 50px;
	width: 200px;
	left: 50%;
	top: 15%;
	transform:   translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

#imgcont {
	position: absolute;
	left: -175%;
	top: 40%;
	transform: translate(-50%, -10%);
	-webkit-transform: translate(-50%, -10%);
	-moz-transform: translate(-50%, -10%);
	-ms-transform: translate(-50%, -10%);
}

#pboxcont {
	position: absolute;
	left: 0%;
	top: 100%;
	/*
         transform: translate(-50%, -10%);    
         -webkit-transform: translate(-50%, -10%);
         -moz-transform: translate(-50%, -10%);
         -ms-transform: translate(-50%, -10%);
         */
}

#pwordhint {
	color: #E86C19;
	font-size: 17.5px;
}
</style>
</head>
<body class="metrouicss">
	<div id="pwordbox">
		<div id="imgcont"></div>
		<div id="fieldcont">
			<form id="loginFrom" action="doLogin" method="post">
				<div id="pboxcont">
					<h1 style="color: white;">&lt;User&gt;</h1>
					<div class="input-control text span4" id="pworddiv">
						<input type="text" name="user.uname" id="user.uname" value="${user.uname}"
							placeholder="输入用户名" autofocus x-webkit-speech />
					</div>
					<h3 style="color: white;">
						&lt;Password&gt;<i class="icon-arrow-down offset2"></i>
					</h3>
					<div class="input-control password span4" id="pworddiv">
						<input type="password" name="user.upass" id="user.upass" value="${user.upass}"
							placeholder="输入密码" />
						<button class="btn-reveal"></button>
					</div>
					<div class="span4" style="text-align: center;">
						<a href="javascript:void(0);" id="doLogin"><i
							class="icon-enter-2 offset3"
							style="font-size: 120px; color: white;" id="login"></i></a>
					</div>
					<c:if test="${login_error!=null}">
					<div class="notices">
						<div class="bg-color-yellow">
							<a href="javascript:void(0);" class="close"></a>
							<div class="notice-icon">
								<i class="icon-bell" style="font-size:28px;"></i>
							</div>
							<div class="notice-header fg-color-darken"><h2>抱歉</h2></div>
							<div class="notice-text">
								 <c:if test="${uname_error==null &&  upass_error==null}">
									<small class="fg-color-red">${login_error}</small>
								 </c:if>
								<small class="fg-color-red">${uname_error}</small><br/>
								<small class="fg-color-red">${upass_error}</small><br/>
							</div>
						</div>
					</div>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="footer.html" flush="true" />
	<!-- footerEnd -->
	<script>
		$(function() {
			$("#doLogin").click(function() {
				$("#loginFrom").submit();
			});
			$(".close").click(function(){
				$(this).parent().parent().hide();
			});
		});
	</script>
</body>
</html>

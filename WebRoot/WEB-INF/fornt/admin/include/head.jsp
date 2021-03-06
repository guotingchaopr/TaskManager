<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>${param.title}</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href='<%=basePath %>css/bootstrap.min.css' rel="stylesheet" />
<link href="<%=basePath %>css/style.css" type="text/css"
	rel="stylesheet" />
<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="<%=basePath %>css/charisma-app.css" rel="stylesheet">
<link href="<%=basePath %>css/jquery-ui-1.8.21.custom.css"
	rel="stylesheet">
<link href='<%=basePath %>css/fullcalendar.css' rel='stylesheet'>
<link href='<%=basePath %>css/fullcalendar.print.css' rel='stylesheet'
	media='print'>
<link href='<%=basePath %>css/chosen.css' rel='stylesheet'>
<link href='<%=basePath %>css/uniform.default.css' rel='stylesheet'>
<link href='<%=basePath %>css/colorbox.css' rel='stylesheet'>
<link href='<%=basePath %>css/jquery.cleditor.css' rel='stylesheet'>
<link href='<%=basePath %>css/jquery.noty.css' rel='stylesheet'>
<link href='<%=basePath %>css/noty_theme_default.css' rel='stylesheet'>
<link href='<%=basePath %>css/elfinder.min.css' rel='stylesheet'>
<link href='<%=basePath %>css/elfinder.theme.css' rel='stylesheet'>
<link href='<%=basePath %>css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='<%=basePath %>css/opa-icons.css' rel='stylesheet'>
<link href='<%=basePath %>css/uploadify.css' rel='stylesheet'>
</head>
<body>
<!--  topbar start -->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" href="<%=basePath %>/admin"><span>用户管理后台</span></a>	
			<!-- user dropdown starts -->
			<c:if test="${user_info!=null}">
				<div class="btn-group pull-right">
					<a class="btn dropdown-toggle" data-toggle="dropdown">
						<i class="icon-user"></i><span class="hidden-phone">${user_info.attrs['uname']}</span> <span
						class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="admin/loginOut">退出</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</div></div>
<!-- topbar ends -->
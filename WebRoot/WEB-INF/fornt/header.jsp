<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html ng-app>
<head>
<base href="<%=basePath%>">
<title>任务管理平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="./css/modern.css" rel="stylesheet">
<link href="./css/modern-responsive.css" rel="stylesheet">
<link href="./css/site.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<script type="text/javascript" src="./js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="./js/angular.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="//cdnjs.bootcss.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script>
<![endif]-->
</head>
<body class="metrouicss">
<div class="page">
		<div class="nav-bar fixed-top">
			<div class="nav-bar-inner padding10">
				<span class="pull-menu"></span> <a href="<%=basePath%>"><span
					class="element brand">任务管理平台</span></a>
				<ul class="menu place-right">
				
				<c:choose>
					<c:when test="${uname==null}">
					<li><a href="login"><span class="icon"><i
								class="icon-user-2"></i></span>登录</a></li>
					<li><a href="#"><span class="icon"><i
								class="icon-accessibility"></i></span> 注册</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#"><span class="icon"><i
								class="icon-user-2"></i></span>${uname}</a></li>
					<li><a href="loginOut"><span class="icon"><i
								class="icon-accessibility"></i></span> 退出</a></li>
					</c:otherwise>
				</c:choose>
					
				</ul>
			</div>
		</div>
	</div>
	
	<div class="span3 bg-color-blue msg" ng-controller="msgBox">
	  <div class="span3 solid">
	  	<span class="icon-comments-5 msgComments"></span>
	  	<span style="font-size: 18px;">你有新的任务</span>
	  	<a href="javascript:void(0);" class="icon-cancel-2 msgClose"></a>
	  </div>
	  <div class="span3 solid">
	  	<p class="msgTitle">{{ taskName }}</p>
	  	<p class="msgContent">信息描述：{{ taskInfo }}</p>
	  	<p class="msgContent">派发人：{{ taskMaker }}</p>
	  	<p class="msgContent">建立时间：{{ creat_Time }}</p>
	  </div>
	  <div class="span3 " style="display: inline;">
	  	<a class="span2 checkMsg" href="showMsgTask">查看更多任务（{{MsgCount}}）</a>
	  	<a class="span1 neverShow" href="javascript:void(0);">不再提示</a>
	  </div>        
	</div>                  
                        
                        
                        
                        
                        
                        
                        
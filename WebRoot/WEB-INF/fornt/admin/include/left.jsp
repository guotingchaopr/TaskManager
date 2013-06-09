<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="span2 main-menu-span">
	<div class="well nav-collapse sidebar-nav">
		<ul class="nav nav-tabs nav-stacked main-menu">
			<li class="nav-header hidden-tablet">控制面板</li>
			<li class="active" style="margin-left: -2.000000238418579px;"><a
				class="ajax-link" href="#"><i class="icon-home"></i> <span
					class="hidden-tablet">用户管理</span> </a></li>
			<li style="margin-left: -2px;"><a class="ajax-link" href="#"><i
					class="icon-eye-open"></i> <span class="hidden-tablet">执行日志</span>
			</a></li>
			<li><a class="ajax-link" href="#"><i class="icon-edit"></i>
					<span class="hidden-tablet">任务管理</span> </a></li>
		</ul>
	</div>
</div>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="include/head.jsp" flush="true">
	<jsp:param name="title" value="用户管理后台-添加用户" />
</jsp:include>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<jsp:include page="include/left.jsp" flush="true" />
			<div id="content" class="span10">
				<div>
					<ul class="breadcrumb">
						<li><a href="<%=basePath %>	admin">首页</a> <span
							class="divider">/</span></li>
						<li><a href="#">添加用户</a></li>
					</ul>
				</div>
				<div class="row-fluid sortable ui-sortable">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-edit"></i>添加用户
							</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i
									class="icon-chevron-up"></i></a> <a href="#"
									class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
							<form class="form-horizontal">
								<fieldset>
									<div class="control-group ">
										<label class="control-label" for="uname">用户名</label>
										<div class="controls">
											<input class="input-xlarge focused" id="uname" type="text"
												placeholder="请输入用户名">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="upass">密码</label>
										<div class="controls">
											<input class="input-xlarge" id="upass" type="password"
												placeholder="请输入密码">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="valid-upass">确认密码</label>
										<div class="controls">
											<input class="input-xlarge" id="valid-upass" type="password"
												placeholder="请重复密码">
										</div>
									</div>
								</fieldset>
								<div class="form-actions center">
									<button type="submit" class="btn">
										<span class="icon32 icon-color icon-check" />
									</button>
									<button type="reset" class="btn">
										<span class="icon32  icon-color icon-close" />
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<jsp:include page="include/footer.jsp" flush="true" />
			</div>
		</div>
	</div>
</body>
</html>

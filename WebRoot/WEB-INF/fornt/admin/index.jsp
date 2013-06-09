<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	List<User> userList = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE HTML>
<html>
<jsp:include page="include/head.jsp" flush="true">
	<jsp:param name="title" value="用户管理后台" />
</jsp:include>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<jsp:include page="include/left.jsp" flush="true" />
			<div id="content" class="span10">
				<div>
					<ul class="breadcrumb">
						<li><a href="#">首页</a> <span class="divider">/</span></li>
					</ul>
				</div>
				<div class="sortable row-fluid ui-sortable">
					<a data-rel="tooltip" class="well span3 top-block" href="#"
						data-original-title="最近新增用户数${fn:length(userList)}"> <span
						class="icon32 icon-red icon-user"></span>
						<div>用户总数</div>
						<div>${fn:length(userList)}</div>
					</a>
				</div>
				<div class="row-fluid sortable ui-sortable">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-user"></i>成员列表
							</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i
									class="icon-chevron-up"></i></a> <a href="#"
									class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
							<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper"
								role="grid">
								<table
									class="table table-striped table-bordered bootstrap-datatable ">
									<thead>
										<tr>
											<th class="sorting_asc" rowspan="1" colspan="1"
												style="width: 193px;">用户名</th>
											<th class="sorting_asc" rowspan="1" colspan="1"
												style="width: 193px;">创建时间</th>
											<th class="sorting_asc" rowspan="1" colspan="1"
												style="width: 193px;">权限</th>
											<th class="sorting" rowspan="1" colspan="1"
												style="width: 98px;">状态</th>
											<th class="sorting" rowspan="1" colspan="1"
												style="width: 362px;">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${userList}" var="user">
											<tr class="odd">
												<td>${user.uname}</td>
												<td class="center">${user.create_time}</td>
												<td class="center"><c:choose>
														<c:when test="${user.role == 99 }">
															<b>管理员</b>
														</c:when>
														<c:when test="${user.role == 1 }">
															<b>普通用户</b>
														</c:when>
														<c:otherwise>
															<b>异常用户</b>
														</c:otherwise>
													</c:choose></td>
												<td class="center"><c:choose>
														<c:when test="${user.flag == 1 }">
															<span class="label label-success"> <b>正常</b>
															</span>
														</c:when>
														<c:when test="${user.flag == 0 }">
															<span class="label label-important"> <b>冻结</b>
															</span>
														</c:when>
														<c:otherwise>
															<span class="label label-error"> <b>异常</b>
															</span>
														</c:otherwise>
													</c:choose></td>
												<td class="center"><a class="btn btn-success" href="#">
														<i class="icon-zoom-in icon-white"></i>查看
												</a> <a class="btn btn-info" href=""> <i
														class="icon-edit icon-white"></i>编辑
												</a> <a class="btn btn-danger" href="#"> <i
														class="icon-trash icon-white"></i>删除
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<a href="admin/addUser" class="btn btn-primary">添加用户</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="include/footer.jsp" flush="true" />
	</div>
</body>
</html>

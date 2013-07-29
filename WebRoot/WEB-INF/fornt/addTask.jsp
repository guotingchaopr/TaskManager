<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--  header-->
<jsp:include page="header.jsp" flush="true" />
<!-- header End -->
<div class="page with-sidebar">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1>
				<a href="<%=basePath %>"><i class="icon-arrow-left-3 fg-color-red" style="font-size: 60px;"></a></i>新任务<small>添加</small>
			</h1>
		</div>
	</div>
	<!-- end Header -->
	<div class="page-region">
		<div class="page-region-content">
			<form id="addTaskFrom" action="doAddTask" method="post">
				<div class="row">
					<table class="span8">
						<tr>
							<td>派发人:</td>
							<td><input class="span4" type="text" id="task.taskMaker" value="${user_info.attrs['uname']}" readonly  value="" name="task.taskMaker" /></td>
						</tr>
						<tr>
							<td>任务名称:</td>
							<td>
								<div class="input-control text span4">
									<span class="fg-color-red" >${taskName_error}</span>
									<input type="text" id="task.taskName" placeholder="请输入名称"
										name="task.taskName" value="" />
									<button class="btn-clear"  type="button"></button>
								</div> 
								
							</td>
						</tr>
						<tr>
							<td>任务描述：</td>
							<td>
								<div class="input-control textarea span4">
									<textarea placeholder="在这描述任务" id="task.taskInfo"
										name="task.taskInfo"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td>计划时间：</td>
							<td>
								<div class="input-control text datepicker span4" id="picker1"
									data-Role="datepicker" data-param-lang="zh-cn">
									<input type="text" id="task.play_Time" name="task.play_Time"
										value="" />
									<button onclick="return false;" class="btn-date"></button>
								</div>
							</td>
						</tr>
						<tr>
							<td>重要指数：</td>
							<td><input type="hidden"
								id="task.rank" name="task.rank" />
								<div class="rating" data-role="rating" id="rating">
									<a href="javascript:void(0)" class=""></a> <a
										href="javascript:void(0)" class=""></a> <a
										href="javascript:void(0)" class=""></a> <a
										href="javascript:void(0)" class=""></a> <a
										href="javascript:void(0)" class=""></a> <a
										href="javascript:void(0)" class=""></a>
								</div></td>
						</tr>
						<tr>
							<td>指定人：</td>
							<td><input type="text"
								id="username" readonly class="span3"/> <select id="suname">
									<option>请选择</option>
									<c:forEach items="${userListSession}" var="user">
										<option value="${user.attrs['id']}">${user.attrs['uname']}</option>
									</c:forEach>
							</select> <input type="hidden" name="user.id" id="user.id" value="" /> <span
								class="fg-color-red">${uid_error}</span></td>
						</tr>
						<tr>
							<td colspan='2' id="brachTable">
							
							</td>
						</tr>
						<tr>
							<td colspan='2' style="text-align: center;"><input
								type="button" id="addBranch" value="添加模块" /> <input
								type="button" id="addTask" value="添加" /> <input type="button"
								value="返回" onclick="javascript:window.history.go(-1)" /></td>
						</tr>
					</table>
				</div>

			</form>
		</div>
	</div>
	<c:if test="${add_success_msg != null}">
			<div class="page-footer">
				<div class="pushResult message-dialog bg-color-green">
					<h3 class="fg-color-white padding30">${add_success_msg}</h3>
				</div>
			</div>
	</c:if>
</div>
<script type="text/javascript">
	var nameStr = valueStr = "";
	$("#suname").change(function() {
		var index = this.selectedIndex;
		nameStr += this.children[index].text + " ";
		if (valueStr == "") {
			valueStr += this.value;
		} else {
			valueStr += "," + this.value;
		}
		$("#user\\.id").val(valueStr);
		$("#username").val(nameStr);
		this.children[index].remove();
	});

	$("#addTask").click(function() {
		$("#task\\.rank").val($("#rating .rated").length);
		var playtime = $("#task\\.play_Time").val();
		playtime = playtime.replace("年", "-");
		playtime = playtime.replace("月", "-");
		playtime = playtime.replace("日", "");
		$("#task\\.play_Time").val(playtime);

		$("#addTaskFrom").submit();
	});
	var brachHtml = "<div class='border-color-blue span8'>"+
					 "	<div class='span8'>"+
						 "<div style='width: 142px;float: left;text-align: center;'>名称:</div>"+
							 "<div ><input type='text' id='BranchName' placeholder='请输入名称' name='task.taskName' value='' /></div>"+
						 "</div>"+
						
						 "<div class='span8'>"+
							 "<div style='width: 142px;float: left;text-align: center;'>描述:</div>"+
							 "<div ><textarea placeholder='在这描述任务' id='task.taskInfo' name='task.taskInfo'></textarea></div>"+
						 "</div>"+
						
						 "<div class='span8'>"+
							 "<div style='width: 142px;float: left;text-align: center;'>计划时间:</div>"+
							 "<div class='input-control text datepicker span4' style= 'float: left;' id='picker1' data-Role='datepicker' data-param-lang='zh-cn'>"+
								 "<input type='text' id='task.play_Time' name='task.play_Time' value='' />"+
								 "<button onclick='return false;' class='btn-date'></button>"+
							 "</div>"+
						 "</div>"+
						 "<div class='span8'>"+
							 "<div style='width: 142px;float: left;text-align: center;'>重要指数：</div>"+
							 "<div class='rating' data-role='rating' id='rating'>"+
								 "<a href='javascript:void(0)' class=''></a> "+
								 "<a href='javascript:void(0)' class=''></a> "+
								 "<a href='javascript:void(0)' class=''></a> "+
								 "<a href='javascript:void(0)' class=''></a> "+
								 "<a href='javascript:void(0)' class=''></a> "+
								 "<a href='javascript:void(0)' class=''></a>"+
							"</div>"+
						"</div>	"+
						"<div class='span8'>"+
							"<div style='width: 142px;float: left;text-align: center;'>指定人：</div>"+
							"<div style='float: left;'>"+
								"<input type='text'	id='username' readonly class='span3'/> "+
								"<select id='suname'>"+
										"<option>请选择</option>"+
										"<c:forEach items='${userListSession}' var='user'>"+
											"<option value='${user.attrs['id']}'>${user.attrs['uname']}</option>"+
										"</c:forEach>"+
								"</select>"+
							"</div>"+
						"</div>	"+		
				"</div >";
				
	$("#addBranch").click(function() {
		$("#brachTable").html(brachHtml);
	});

</script>
<jsp:include page="footer.html" flush="true" />
</body>
</html>
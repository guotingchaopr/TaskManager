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
				<a href="<%=basePath %>"><i class="icon-arrow-left-3 fg-color-red" style="font-size: 60px;"></a></i>添加<small>新任务</small>
			</h1>
		</div>
	</div>
	<!-- end Header -->
	<div class="page-region">
		<div class="page-region-content">
			<form id="addTaskFrom" action="doAddTask" method="post">
				<div class="row">
					<table class="span8 border">
						<tr>
							<td>派发人:</td>
							<td><input class="span4" type="text" id="task.taskMaker" value="${uname}" readonly  value="" name="task.taskMaker" /></td>
						</tr>
						<tr>
							<td>任务名称:</td>
							<td>
								<div class="input-control text span4">
									<span class="fg-color-red" >${taskName_error}</span>
									<input type="text" id="task.taskName" placeholder="请输入名称"
										name="task.taskName" value="${taskName}" />
									<button class="btn-clear"  type="button"></button>
								</div> 
								
							</td>
						</tr>
						<tr>
							<td>任务描述：</td>
							<td>
								<div class="input-control textarea span4">
									<textarea placeholder="在这描述任务" id="task.taskInfo"
										name="task.taskInfo">${taskInfo}</textarea>
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
							<td>
							<div class="span4">
								<div id="username" class="span3 namecontrol" >
									<c:forEach items="${userListSession}" var="user">
									<div class="nameshow" id="${user.attrs['uname']}" >
									<a href="javascript:void(0);" class="icon-cancel-2 closeName" id="${user.attrs['id']}"></a>
									 <div class="singlename">${user.attrs['uname']}</div>
									</div>
									</c:forEach>
								</div>
							    <div class="span1 uname">
								    <select id="suname">
											<option>请选择</option>
											<c:forEach items="${userListSession}" var="user">
												<option value="${user.attrs['id']}">${user.attrs['uname']}</option>
											</c:forEach>
									</select> 
								</div>
							</div>
							<div class="float:left;"><span class="fg-color-red">${uid_error}</span></div>
							<input type="hidden" name="user.id" id="user.id" value="" /> </td>
						</tr>
							<tr id="modelName" >
							<td>模块：</td>
							<td>
								<div class="span3 namecontrol" id="minBranch">
								</div>
								<div class="span1 addBranch" id="addBranch">添加模块 </div>
							</td>
						</tr>
						<tr>
							<td colspan='2' style="text-align: center;"><input
								type="button" id="addTask" value="添加" /> <input type="button"
								value="返回" onclick="javascript:window.history.go(-1)" /></td>
						</tr>
					</table>
				</div>
			</form>
			<form id="addBranchFrom" action="addBranch" method="post">
				<input type="hidden" id="userId" name="userId" value="" />
				<input type="hidden" id="taskName" name="taskName" value="" />
				<input type="hidden" id="taskInfo" name="taskInfo" value="" />
				<input type="hidden" id="taskRank" name="taskRank" value="" />
				<input type="hidden" id="taskPlayTime" name="taskPlayTime" value="${play_Time}" />
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
	$("document").ready(function() {
		//时间
		$("#task\\.play_Time").val("${play_Time}");
		//等级
		var rank = ${rank};
		for(var a=0;a<rank;a++){
			$('$("#rating").children()['+a+']').addClass("rated");
		}
		
	});
	//添加名字
	var nameStr = valueStr = singleName="";
	$("#suname").change(function() {
		var index = this.selectedIndex;
		singleName=this.children[index].text;
		$("#"+singleName).show();
		this.children[index].remove();
	});
	//删除名字
	$(".closeName").click(function() {
		$(this.parentElement).hide();
		var uid = this.id;
		$("#suname").append("<option value='"+uid+"'>"+this.parentElement.id+"</option>");
		
	});
	
	$("#addTask").click(function() {
		var _nameshow = $(".nameshow");
		for(var i=0;i<_nameshow.length;i++){
			if(_nameshow[i].style.display=="block"){
				if (valueStr == "") {
					valueStr += _nameshow[i].children[0].id;
				} else {
					valueStr += "," + _nameshow[i].children[0].id;
				}
			}
		}
		//表单需要提交的内容赋值 
		$("#user\\.id").val(valueStr);
		$("#task\\.rank").val($("#rating .rated").length);
		var playtime = $("#task\\.play_Time").val();
		playtime = playtime.replace("年", "-");
		playtime = playtime.replace("月", "-");
		playtime = playtime.replace("日", "");
		$("#task\\.play_Time").val(playtime);

		$("#addTaskFrom").submit();
	});
	
	
	//添加模块
	var branchBefore ="<div class='branchshow'>"+
						"<a href='javascript:void(0);' class='icon-cancel-2 closeBranch'></a>"+
						" <div class='singlename'>";
	var branchAfter = "</div></div>";

	$("#addBranch").click(function() {
		
		var _nameshow = $(".nameshow");
		for(var i=0;i<_nameshow.length;i++){
			if(_nameshow[i].style.display=="block"){
				if (valueStr == "") {
					valueStr += _nameshow[i].children[0].id;
				} else {
					valueStr += "," + _nameshow[i].children[0].id;
				}
			}
		}
		//表单需要提交的内容赋值 
		$("#userId").val(valueStr);
		$("#taskName").val($("#task\\.taskName").val());
		$("#taskInfo").val($("#task\\.taskInfo").val());
		$("#taskRank").val($("#rating .rated").length);
		var playtime = $("#task\\.play_Time").val();
		playtime = playtime.replace("年", "-");
		playtime = playtime.replace("月", "-");
		playtime = playtime.replace("日", "");
		$("#taskPlayTime").val(playtime);

		$("#addBranchFrom").submit();
	
	});

</script>
<jsp:include page="footer.html" flush="true" />
</body>
</html>
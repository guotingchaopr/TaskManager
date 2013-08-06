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
								<div class="float:left;"><span class="fg-color-red">${uid_error}</span></div>
							</div>
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
					<div class="border-color-blue span8" id="branchAll">
						<div class="span8 branchTitle">
						<b>任务模块</b> </div>
					 	<div class="span8">
						 <div class="branchTable">名称:</div>
							 <div ><input class="span4" type="text" id="BranchName" placeholder="请输入名称" value="" /></div>
						 </div>
						
						 <div class="span8 ">
							 <div class="branchTable">描述:</div>
							 <div ><textarea class="span4" placeholder="在这描述任务" id="branchInfo"></textarea></div>
						 </div>
						
						 <div class="span8">
							 <div class="branchTable">计划时间:</div>
							 <div class="input-control text datepicker span4" style= "float: left;" id="picker1" data-Role="datepicker" data-param-lang="zh-cn">
								 <input type="text" id="branchPlay_Time" name="branchPlay_Time" value="" />
								 <button onclick="return false;" class="btn-date"></button>
							 </div>
						 </div>
						 <div class="span8">
							 <div class="branchTable">重要指数：</div>
							 <div class="rating" data-role="rating" id="branchRating">
								 <a href="javascript:void(0)" class=""></a> 
								 <a href="javascript:void(0)" class=""></a> 
								 <a href="javascript:void(0)" class=""></a> 
								 <a href="javascript:void(0)" class=""></a> 
								 <a href="javascript:void(0)" class=""></a> 
								 <a href="javascript:void(0)" class=""></a>
							</div>
						</div>	
						<div class="span8">
							<div class="branchTable">指定人：</div>
							<div style="float: left;">
								<input type="text"	id="BranchUsername" readonly class="span3"/> 
								<select id="branchUname">
										<option>请选择</option>
										<c:forEach items="${userListSession}" var="user">
											<option value='${user.attrs["id"]}'>${user.attrs["uname"]}</option>
										</c:forEach>
								</select>
							</div>
						</div>
						<div class="span8">
							<div class="span8" style="text-align: center;">
								<input type="button" id="doAddBranch" value="确认添加" /> 
							</div>
						</div>			
					</div >
					<input type="hidden" id="branch.branchName" name="branch.branchName" value="" />
					<input type="hidden" id="branch.branchInfo" name="branch.branchInfo" value="" />
					<input type="hidden" id="branch.play_Time" name="branch.play_Time" value="" />
					<input type="hidden" id="branch.rank" name="branch.rank" value="" />
					<input type="hidden" id="branch.uid" name="branch.uid" value="" />
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
	
	//添加分支模块
	var branchName="";
	var branchInfo="";
	var branchRank="";
	var branchUid="";
	var branchPlayTime="";
	
	var userId="";
	var bRank = "";
	//添加分支 选择人员 选一个
	$("#branchUname").change(function() {
		var index = this.selectedIndex;
		if(index>0){
			var BranchnameStr = this.children[index].text;
			userId = this.value;
			$("#BranchUsername").val(BranchnameStr);
		}
	});
	//添加模块
	$("#doAddBranch").click(function() {
		var playtime = $("#branchPlay_Time").val();
		playtime = playtime.replace("年", "-");
		playtime = playtime.replace("月", "-");
		playtime = playtime.replace("日", "");
		
		bRank=$("#branchRating .rated").length;
		
		if(branchName==""||branchName==null){
			branchName += $("#BranchName").val();
		}else{
			branchName += ","+$("#BranchName").val();
		}
			
		if(branchInfo==""||branchInfo==null){
			branchInfo += $("#branchInfo").val();
		}else{
			branchInfo += ","+$("#branchInfo").val();
		}
		
		if(branchRank==""||branchRank==null){
			branchRank += bRank;
		}else{
			branchRank += ","+bRank;
		}
		
		if(branchPlayTime==""||branchPlayTime==null){
			branchPlayTime += playtime;
		}else{
			branchPlayTime += ","+playtime;
		}
		if(branchUid==""||branchUid==null){
			branchUid += userId;
		}else{
			branchUid += ","+userId;
		}
		
		$("#branch\\.branchName").val(branchName);
		$("#branch\\.branchInfo").val(branchInfo);
		$("#branch\\.rank").val(branchRank);
		$("#branch\\.uid").val(branchUid);
		$("#branch\\.play_Time").val(branchPlayTime);

		
		$("#branchAll").hide();
	});
	
	$("#addBranch").click(function() {
		$("#branchAll").show();
	});

</script>
<jsp:include page="footer.html" flush="true" />
</body>
</html>
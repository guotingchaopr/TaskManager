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
				<a href="<%=basePath %>"><i class="icon-arrow-left-3 fg-color-red" style="font-size: 60px;"></a></i>更新<small>任务</small>
			</h1>
		</div>
	</div>
	<!-- end Header -->
	<div class="page-region">
		<div class="page-region-content">
			<form id="updateTaskFrom" action="doUpdateTask" method="post">
				<div class="row">
					<table class="span8">
						<tr>
							<td>派发人:</td>
							<td><input class="span4" type="text" id="task.taskMaker" value="${task.taskMaker}" readonly  name="task.taskMaker" /></td>
						</tr>
						<tr>
							<td>任务名称:</td>
							<td>
								<div class="input-control text span4">
									<span class="fg-color-red" >${taskName_error}</span>
									<input type="text" id="task.taskName" placeholder="请输入名称"
										name="task.taskName" value="${task.taskName}" />
									<button class="btn-clear"  type="button"></button>
								</div> 
								
							</td>
						</tr>
						<tr>
							<td>任务描述：</td>
							<td>
								<div class="input-control textarea span4">
									<textarea placeholder="在这描述任务" id="task.taskInfo"
										name="task.taskInfo" >${task.taskInfo}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td>计划时间：</td> 
							<td>
								<div class="input-control text datepicker span4" id="picker1"
									data-Role="datepicker" data-param-lang="zh-cn" data-param-init-date="${task.play_Time}" >
									<input type="text" id="task.play_Time" name="task.play_Time"
										/>
									<button onclick="return false;" class="btn-date"></button>
								</div>
							</td>
						</tr>
						<tr>
							<td>重要指数：</td>
							<td><input type="hidden"
								id="task.rank" name="task.rank" />
								<div class="rating" data-role="rating" data-param-rating="${task.rank}">
								</div></td>
						</tr>
						<tr>
							<td>当前进度：</td>
							<td><input type="hidden"
								id="task.percent" name="task.percent" />
								<div class="span4">
								<div class="span3">
								<div class="slider taskupdate" data-param-init-value="${task.percent}"></div>
								
								</div>
								<div class="offset3 bg-color-blue updateTask">
								<span id="slider_val">${task.percent}%</span>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>当前状态：</td>
							<td>
								<input type="hidden" name="task.taskType" id="task.taskType" value="${task.taskType}" />
								<div class="span4">
								<c:choose>
			                  				<c:when test="${task.taskType eq 0}"><a class="icon-attachment update" style="font-size: 28px;color: blue;"></a><span id="taskType" style="font-size: 20px;">初始化</span></c:when>
			                  				<c:when test="${task.taskType eq 1}"><a class="icon-unlocked update" style="font-size: 28px;color: red;"></a><span id="taskType style="font-size: 20px;">进行中</span></c:when>
			                  				<c:when test="${task.taskType eq -1}"><a class="icon-locked update" style="font-size: 28px;color: red;"></a><span id="taskType" style="font-size: 20px;">已冻结</span></c:when>
			                  				<c:when test="${task.taskType eq 2}"><a class="icon-checkmark update" style="font-size: 28px;color: green;"></a><span id="taskType" style="font-size: 20px;">已完成</span></c:when>
		                  		</c:choose>
								</div>
							</td>
						</tr>
						<tr>
							<td>指定人：</td>
							<td><input type="hidden" name="user.id" id="user.id" value="" />
								<div class="input-control select span2" style="display: inline;">
									<select id="user" size="5" multiple="multiple" style="float: left;width: 100px;display: inline;">
									<c:forEach items="${userList}" var="user">
										<option value="${user.id}">${user.uname}</option>
									</c:forEach>
									</select>
									
									<span id="addUser" class="button" style="position: absolute;top: 50px;display: block;margin-left: 105px;">>></span>
									<span id="removeUser"  class="button" style="position: absolute;top: 10px;display: block;margin-left: 105px;"><<</span>
									
									<select id="otheruser" size="5" multiple="multiple" style="position: absolute;width: 100px;margin-left: 68px;">
									<c:forEach items="${userListSession}" var="user" >
										<option value="${user.attrs['id']}">${user.attrs['uname']}</option>
									</c:forEach>
									</select>
									
								</div>
								<span
								class="fg-color-red">${uid_error}</span>
							</td>
						</tr>
						<tr>
							<td colspan='2' style="text-align: center;"><input
								type="button" id="updateTask" value="更新" /> <input type="button"
								value="返回" onclick="javascript:window.history.go(-1)" /></td>
						</tr>
					</table>
				</div>

			</form>
		</div>
	</div>
	<c:if test="${update_success_msg != null}">
			<div class="page-footer">
				<div class="pushResult message-dialog bg-color-green">
					<h3 class="fg-color-white padding30">${update_success_msg}</h3>
				</div>
			</div>
	</c:if>
</div>
<script type="text/javascript">

$("document").ready(function(){
	//用户列表去掉重复 
	for(var i=0;i<s1[0].options.length;i++){
		_this1=s1[0].options[i];
		for(var j=0;j<s2[0].options.length;j++){
			_this2=s2[0].options[j];
			if(_this1.value==_this2.value){
				_this2.remove();
			}
		}
	}
	
});
	
	
	var s1 = $("#user");
	var s2 = $("#otheruser");
	for(var i=0;i<s1[0].options.length;i++){
		$(s1[0].options[i]).dblclick(function(){
			s2.append("<option value='"+this.value+"'>"+this.text+"</option>");
			this.remove();
			
		});
	}
	for(var i=0;i<s2[0].options.length;i++){
		$(s2[0].options[i]).dblclick(function(){
			s1.append("<option value='"+this.value+"'>"+this.text+"</option>");
			this.remove();
			
		});
	}
		
	$("#addUser").click(function(){
		for(var i=0;i<s1[0].options.length;i++){
			_this=s1[0].options[i];
			if(s1[0].options[i].selected){
				s2.append("<option value='"+_this.value+"'>"+_this.text+"</option>");
				_this.remove();
			}			
		}
	});
	$("#removeUser").click(function(){
		for(var i=0;i<s2[0].options.length;i++){
			_this=s2[0].options[i];
			if(s2[0].options[i].selected){
				s1.append("<option value='"+_this.value+"'>"+_this.text+"</option>");
				_this.remove();
			}			
		}
	});
	
	$(".icon-locked.update").click(function(){
		if(this.className=="icon-unlocked update"){
			this.className="icon-locked update";
			$("#taskType").html("已冻结");
			$("#task\\.taskType").val(-1);
		}else{
			this.className="icon-unlocked update";
			$("#taskType").html("进行中");
			$("#task\\.taskType").val(1);
		}
	});
	
	$(".icon-unlocked.update").click(function(){
		if(this.className=="icon-unlocked update"){
			this.className="icon-locked update";
			$("#taskType").html("已冻结");
			$("#task\\.taskType").val(-1);
		}else{
			this.className="icon-unlocked update";
			$("#taskType").html("进行中");
			$("#task\\.taskType").val(1);
		}
	});
	
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
	
	$(".slider").change(function(e,val){
		//任务进度
		$("#slider_val").html(val+"%");
		if(val==100){
			this.children[0].style.background="green";
		}else{
			this.children[0].style.background="";
		}
	});
	$("#updateTask").click(function() {
		
		//任务等级
		$("#task\\.rank").val($(".rating .rated").length);
		var percentStr = $("#slider_val").html();
		$("#task\\.percent").val(percentStr.substring(0,percentStr.length-1));
		//获取用户id
		var valueStr = "";
		for(var i=0;i<s1[0].options.length;i++){
			_this1=s1[0].options[i];
			if (valueStr == "") {
				valueStr += _this1.value;
			} else {
				valueStr += "," + _this1.value;
			}
			$("#user\\.id").val(valueStr);
		}
		
		
		//计划时间
		var playtime = $("#task\\.play_Time").val();
		playtime = playtime.replace("年", "-");
		playtime = playtime.replace("月", "-");
		playtime = playtime.replace("日", "");
		$("#task\\.play_Time").val(playtime);

		$("#updateTaskFrom").submit();
	});
	
</script>
<jsp:include page="footer.html" flush="true" />
</body>
</html>
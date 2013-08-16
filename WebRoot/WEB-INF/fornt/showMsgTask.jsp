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
				<i class="icon-arrow-left-3 fg-color-red"></i> 未读<small>任务列表</small>
			</h1>
		</div>
	</div>
	<div class="page-region">
		<div class="page-region-content" id="Operate">
			<ul class="accordion" data-role="accordion">
				<li class="active">
					<div id="MsgTask">
						<ul class="listview fluid">
							<c:forEach items="${MsgTaskList}" var="task">
								<li class="border-color-blue" value="${task.id}" >
									<div class="title">任务名称：${task.taskName}</div>
									<div class="time">任务时间：${task.create_Time}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.taskPercent}%"></div>
											<div class="bar bg-color-yellow"
												style="width: ${100-task.taskPercent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a>${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="footer.html" flush="true" />
<script type="text/javascript">
function toPlace(location){
	$('html, body, .content').animate({scrollTop: location},1000);
}
	$("document").ready(function() {
		$(".title").parent().click(function() {
			var tid = this.value;
			$.ajax({
				url:"doCheckedMsgTask",
				type:"POST",
				data:{"tid":tid*1},
				success:function(date){
					window.location.href="taskInfo/show/"+tid;
				}
			});
		});
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<!DOCTYPE HTML>
<html>
<!--  header-->
<jsp:include page="header.jsp" flush="true" />
<!-- header End -->
<div class="page with-sidebar">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1> 
				<i class="icon-arrow-down-3 fg-color-red"></i> 首页<small>任务列表</small>
			</h1>
		</div>
	</div>
	<!-- header End -->
	<!-- leftMenu -->
	<div class="page-sidebar">
		<ul class="sub-menu light">
			<c:if test="${user_info.attrs['uname']!=null&&taskListRelative!=null}">
				<li class="sticker sticker-color-black" data-for-id="Operate"><a
				href="#">可操作任务</a></li>
			</c:if>
			<li class="sticker sticker-color-blue" data-for-id="NotBegin"><a
				href="#">未开始任务</a></li>
			<li class="sticker sticker-color-yellow" data-for-id="Begin"><a
				href="#">进行中任务</a></li>
			<li class="sticker sticker-color-green" data-for-id="Finish"><a
				href="#">已完成的任务</a></li>
			<li class="sticker sticker-color-red" data-for-id="blocked"><a
				href="#">冻结的任务</a></li>
		</ul>
	</div>
	<!-- leftMenu End -->
	<div class="page-region">
		<!-- 可操作任务 -->
		<div class="page-region-content" id="Operate" style="display: none">
		<button class="bg-color-blue"  id="updateTask">更新</button>	
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>可操做的任务</h3></a> 
					<div id="OperateTask">
					
						<ul class="listview fluid">
							<c:forEach items="${taskListRelative}" var="task">
								<li class="border-color-blue" value="${task.id}" >
									<div class="Operate">任务名称：${task.taskName}</div>
									<div class="time">任务时间：${task.create_Time}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.percent}%"></div>
											<div class="bar bg-color-yellow"
												style="width: ${100-task.percent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a>${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 可操作的 end -->
		<!-- 未开始  -->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>未开始的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:if test="${user_info.attrs['uname']!=null}">
							<li class="border-color-blue">
							<a href="addTask">
								<div class="title" style="text-align: center;"><b>新建任务</b></div>
								<div style="height: 107px; text-align:center;">
										<i class="icon-plus-2" style="font-size: 50px;padding-top: 20px;"></i>
								</div>
							</a>
							</li>
							</c:if>
							<c:forEach items="${taskListInit}" var="task">
								<li class="border-color-blue" value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.percent}%"></div>
											<div class="bar bg-color-yellow"
												style="width: ${100-task.percent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a>${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
						<!-- div class="span8" style="text-align: center;">
							当前第<span id="pagCurrent">1</span>页,共<span id="pagTotal">${totalPage}</span>页,跳转至<input style="width: 20px;" type="text" name="pagNo" id="pagNo"></input>页
							<button id="upPage" disabled>上一页</button>
							<button id="downPage">下一页</button>
							
						</div -->
					</div></li>
			</ul>
		</div>
		<!-- 未开始 end -->
		<!-- 进行中  -->
		<div class="page-region-content" id="Begin" style="display: none">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>进行中的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${taskListOn}" var="task">
								<li class="taskList bg-color-yellow"
									value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.percent}%"></div>
												<div class="bar bg-color-yellow"
												style="width: ${100-task.percent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a>${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 进行中 end -->
		<!-- 完成的  -->
		<div class="page-region-content" id="Finish" style="display: none">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>已完成的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${taskListOn}" var="task">
								<li class="taskList bg-color-green fg-color-white" value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-yellow" style="width: 100%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a class="fg-color-white">${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 完成  end -->
		<!-- 冻结  -->
		<div class="page-region-content" id="blocked" style="display: none">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>冻结的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${taskListBlocked}" var="task">
								<li class="taskList bg-color-red fg-color-white" value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote class="bg-color-blueLight">${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.percent}%"></div>
											<div class="bar bg-color-yellow"
												style="width: ${100-task.percent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a class="fg-color-white">${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 冻结 end -->
	</div>
</div>
<!-- footer -->
<jsp:include page="footer.html" flush="true" />
<!-- footerEnd -->
<script type="text/javascript">
function toPlace(location){
	$('html, body, .content').animate({scrollTop: location},1000);
}
	$("document").ready(function() {
		$(".sub-menu li").click(function() {
			var __selfName=$(this).attr("data-for-id"),
			$hover_active=$("#"+__selfName);
			if($hover_active.is(":hidden")){
				$(".page-region-content").each(function(){
					if(this.id != __selfName){
						$(this).css("display","none");
					}
				});
				$("#"+__selfName).addClass('animated rotateIn');
				$("#"+__selfName).css("display","block");
			}else{
				return;
			}
		});
		$(".title").parent().click(function() {
			window.location.href="taskInfo/show/"+this.value;
		});
		
		var operate =$(".Operate").parent();
		var tid;
		operate.click(function() {
			for(i=0;i<operate.length;i++){
				operate[i].className="border-color-blue";
			}
			this.className="selected";
			tid=this.value;
			$("#updateTask").className="button";
		});
		
		
		$("#updateTask").click(function() {
			window.location.href="updateTask/"+tid;
		});
		
		//分页操作
		var a = parseInt($("#pagCurrent").text());
		$("#downPage").click(function(){
			$("#upPage")[0].disabled=false;
			a++;
			
			$.ajax({
				url:"doPage",
				type:"POST",
				data:{"a":a},
				success:function(){
					$("#pagCurrent").text(a);
					if(a==$("#pagTotal").text()){
						$("#downPage")[0].disabled=true;
					}
				}
			});
			
			
		});
		
		$("#upPage").click(function(){
			$("#downPage")[0].disabled=false;
			a--;
			$("#pagCurrent").text(a);
			if(a==1){
				$("#upPage")[0].disabled=true;
			}
		});
		
	});
</script>
</body>
</html>

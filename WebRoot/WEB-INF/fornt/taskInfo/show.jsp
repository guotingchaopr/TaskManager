<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	String path = request.getContextPath();
	String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<base href="<%=base%>" />
<!--  header-->
<jsp:include page="../header.jsp" flush="true" />
<!-- header End -->
<div class="page secondary">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1>
				<a href="javascript:window.history.go(-1);"><i class="icon-arrow-left-3 fg-color-red page-back" style="font-size: 60px;"></i> </a>${task.taskName}<small>任务详细</small>
			</h1>
		</div>
	</div>
	<div class="page-region">
		<!-- 任务描述-->
		
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3><li class="icon-book"></li>任务描述</h3></a>
					<div>
						<ul class="listview fluid">
							<li>
								<div class="title"><h4>描述信息</h4></div>
								<div>
									<blockquote>${task.taskInfo}</blockquote>
								</div>
							</li>
							
							<li>
								<div class="title"><h4>重要指数</h4></div>
								<div>
									<blockquote>
									<div class="rating" date-role="rating" data-param-vote="off" data-param-rating="${task.rank}" data-param-stars="5"></div>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title"><h4>任务状态</h4></div>
								<div>
									<blockquote>
										<span style="font-size: 30px;color: red;">
										<c:choose>
			                  				<c:when test="${task.taskType eq 0}">初始化</c:when>
			                  				<c:when test="${task.taskType eq 1}">进行中</c:when>
			                  				<c:when test="${task.taskType eq -1}">已冻结</c:when>
			                  				<c:when test="${task.taskType eq 2}">已完成</c:when>
		                  				</c:choose>
										</span>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title"><h4>当前进度     ${task.taskPercent}%</h4></div>
								<div>
									<blockquote>
										<div class="progress-bar" style="height: 30px;margin: auto;">
											<div class="bar bg-color-green" style="width: ${task.taskPercent}%;"></div>
											<div class="bar bg-color-yellow" style="width:${100-task.taskPercent}%"></div>
										</div>
									</blockquote>
								</div>
							</li>
						</ul>
					</div>
				</li>
				
			</ul>
		</div>
	</div>
	<div class="page-region">
		<!--时间-->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3><li class="icon-clock"></li>任务时间</h3></a>
					<div>
						<ul class="listview fluid">
							<li>
								<div class="title"><h4>初始时间</h4></div>
								<div>
									<blockquote>
										<span><fmt:formatDate value="${task.creat_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title"><h4>计划时间</div>
								<div>
									<blockquote>
										<span><fmt:formatDate value="${task.play_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
							   </div>
							</li>
							<li>
								<div class="title"><h4>完成时间</div>
								<div>
									<blockquote>
										<c:if test="${empty task.finish_Time}">
											<span style="font-size: 18px;font-weight: bold;"> 未完成</span>
										</c:if>
										<span><fmt:formatDate value="${task.finish_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
								</div>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="page-region">
		<!--操作人员-->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3><li class="icon-user"></li>关联人员</h3></a>
					<div>
						<ul class="listview fluid">
							<li>
								<div class="title"><h4>派发人</div>
								<div>
									<blockquote>
				                        <h6>${task.taskMaker}</h6>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title"><h4>指定人</div>
								<div>
									<blockquote>
										<c:forEach items="${userList}" var="user">
				                        <h6>${user.uname}</h6>
				                        </c:forEach>
									</blockquote>
								</div>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<c:if test="${branchList!=null}">
	<div class="page-region">
		<!--子任务-->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3><li class="icon-tree-view"></li>分支任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${branchList}" var="branch">
								<li class="taskList bg-color-yellow"
									value="${task.id}">
									<div class="title">任务名称：${branch.branchName}</div>
									<div>
										任务描述：
										<blockquote>${branch.branchInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${branch.percent}%"></div>
												<div class="bar bg-color-yellow"
												style="width: ${100-branch.percent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a>${branch.taskMaker}</a></strong>
										</p>
									</div>
								</li>
								<li class="taskList bg-color-yellow" style="height:152px;">
									<div class="title"><b>指定人:</b></div>
									
								</li>
							</c:forEach>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	</c:if>						             
</div>	                  
<!-- footer -->
<jsp:include page="../footer.html" flush="true" />
<!-- footerEnd -->
<script type="text/javascript">
	$("document").ready(function(){
	});
</script>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<div class="page with-sidebar">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1>
				<a href="javascript:window.history.go(-1);"><i class="icon-arrow-left-3 fg-color-red page-back" style="font-size: 60px;"></i> </a>${branch.branchName}<small>任务详细</small>
			</h1>
		</div>
	</div>
	<div class="page-region">
		<!-- 任务描述-->
		
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3><li class="icon-book"></li>模块描述</h3></a>
					<div>
						<ul class="listview fluid">
							<li>
								<div class="title"><h4>描述信息</h4></div>
								<div>
									<blockquote>${branch.branchInfo}</blockquote>
								</div>
							</li>
							
							<li>
								<div class="title"><h4>重要指数</h4></div>
								<div>
									<blockquote>
									<div class="rating" date-role="rating" data-param-vote="off" data-param-rating="${branch.rank}" data-param-stars="5"></div>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title"><h4>当前进度     ${branch.percent}%</h4></div>
								<div>
									<blockquote>
										<div class="progress-bar" style="height: 30px;margin: auto;">
											<div class="bar bg-color-green" style="width: ${branch.percent}%;"></div>
											<div class="bar bg-color-yellow" style="width:${100-branch.percent}%"></div>
										</div>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title"><h4>指定人</h4></div>
								<div>
									<blockquote>
										<div class="progress-bar" style="height: 30px;margin: auto;">
											${branch.uname}
											
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
										<span><fmt:formatDate value="${branch.create_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title"><h4>计划时间</div>
								<div>
									<blockquote>
										<span><fmt:formatDate value="${branch.play_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
							   </div>
							</li>
							<li>
								<div class="title"><h4>完成时间</div>
								<div>
									<blockquote>
										<c:if test="${empty branch.finish_Time}">
											<span style="font-size: 18px;font-weight: bold;"> 未完成</span>
										</c:if>
										<span><fmt:formatDate value="${branch.finish_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
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

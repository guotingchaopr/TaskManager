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
				<a href="<%=basePath %>"><i class="icon-arrow-left-3 fg-color-red" style="font-size: 60px;"></i></a>模块<small>添加</small>
			</h1>
		</div>
	</div>
	<!-- end Header -->
	<div class="page-region">
		<div class="page-region-content">
			<form id="addBranchFrom" action="backTask" method="post">
				<div class="row">
					<div class="border-color-blue span8" id="branchAll">
						<div class="span8 branchTitle">
						<b>任务模块</b> </div>
					 	<div class="span8">
						 <div class="branchTable">名称:</div>
							 <div >
							 	<input class="span4" type="text" id="branch.branchName" name="branch.branchName" placeholder="请输入名称" value="" style="height:32px;" />
							 	<span class="fg-color-red" >${branchName_error}</span>
							 </div>
						 </div>
						
						 <div class="span8 ">
							 <div class="branchTable">描述:</div>
							 <div ><textarea class="span4" id="branch.branchInfo" name="branch.branchInfo" placeholder="在这描述任务" id="branchInfo"></textarea></div>
						 </div>
						
						 <div class="span8">
							 <div class="branchTable">计划时间:</div>
							 <div class=span4" style= "float: left;">
								 <input class="datepicker span4" type="date"  autofocus value="" id="branch.play_Time" name="branch.play_Time" style="height:32px;"/>
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
								<input type="text"	id="BranchUsername" readonly class="span3"  style="height:32px;"/> 
								<select id="branchUname" style="margin-left: -16px;">
										<option>请选择</option>
										<c:forEach items="${userListSession}" var="user">
											<option value='${user.attrs["id"]}'>${user.attrs["uname"]}</option>
										</c:forEach>
								</select>
							</div>
							<span class="fg-color-red">${uid_error}</span>
						</div>
						<div class="span8">
							<div class="span8" style="text-align: center;">
								<input type="button" id="doAddBranch" value="确认添加" /> 
							</div>
						</div>			
					</div >
					<input type="hidden" id="branch.rank" name="branch.rank" value="" />
					<input type="hidden" id="branch.uid" name="branch.uid" value="" />
					<input type="hidden" id="minName" name="minName" value="" />
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
	
	//添加分支模块
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
	var beforeName="<div class='branchshow' id=''>"+
					"<a href='javascript:void(0);' class='icon-cancel-2 closeName' ></a>"+
					 "<div class='singlename'>";
	var afterName="</div></div>";
	$("#doAddBranch").click(function() {
		//模块名称加入
		var minName = beforeName+$("#branch\\.branchName").val()+afterName;
		$("#minName").val(minName);
		
		var playtime = $("#branch\\.play_Time").val();
		playtime = playtime.replace("/", "-");
		$("#branch\\.play_Time").val(playtime);
		
		bRank=$("#branchRating .rated").length;
		$("#branch\\.rank").val(bRank);
		
		$("#branch\\.uid").val(userId);
		
		$("#addBranchFrom").submit();
	});
</script>
<jsp:include page="footer.html" flush="true" />
</body>
</html>
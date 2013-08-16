var msgBox = function($scope,  $http){
	
	var get = $http({
		method:'GET',
		url:'msgInterceptor'
	});
	get.success(function(response,status,header,config){
		$scope.taskName=response.taskName;
		$scope.taskInfo=response.taskInfo;
		$scope.taskMaker=response.taskMaker;
		$scope.creat_Time=response.creat_Time;
		$scope.MsgCount=response.MsgCount;
		if($scope.MsgCount>0){
			$(".msg").animate({bottom:0},2000);
		}else{
			$(".msg").hide();
		}
		console.log($scope);
		
	});
};
$(function(){
	
	//消息框消失
	$(".msgClose").click(function(){
        $(this).parents(".span3.bg-color-blue.msg").animate({
            opacity: "hide"
        }, "slow");		   
	});
	
	//不再提示
	$(".neverShow").click(function(){
		var _self=this;
		$.get('doUpdateMsgTask', function(data){
			$(_self).parents(".span3.bg-color-blue.msg").animate({
	            opacity: "hide"
	        }, "slow");	
		});
	});
});

angular.bootstrap(document.documentElement);
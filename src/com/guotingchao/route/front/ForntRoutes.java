package com.guotingchao.route.front;

import com.guotingchao.controlle.front.IndexController;
import com.guotingchao.controlle.front.ShowBranchController;
import com.guotingchao.controlle.front.ShowController;
import com.jfinal.config.Routes;

public class ForntRoutes extends Routes {
	
	@Override
	public void config() {
		add("/branchInfo/show",ShowBranchController.class);
		add("/taskInfo/show",ShowController.class);
		add("/",IndexController.class);
	}
}

package com.guotingchao.controlle.front;


import com.guotingchao.interceptor.ForntUrlInterceptor;
import com.guotingchao.model.impl.Branch;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * 前端Index控制器
 * @author os-yugq
 *
 */
@Before(ForntUrlInterceptor.class)
public class ShowBranchController extends Controller{
	
	Logger log = Log4jLogger.getLogger(ShowBranchController.class);
	/**
	 * 任务详细页
	 */
	public void index(){
		Long tid = getParaToLong();
		setAttr("branch", Branch.branchDao.findBranchInfoBytid(tid));
		render("../show.jsp");
	}
}

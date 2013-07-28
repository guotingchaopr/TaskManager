package com.guotingchao.controlle.front;


import java.util.List;

import com.guotingchao.interceptor.ForntUrlInterceptor;
import com.guotingchao.model.impl.Branch;
import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
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
public class ShowController extends Controller{
	
	Logger log = Log4jLogger.getLogger(ShowController.class);
	/**
	 * 任务详细页
	 */
	public void index(){
		Long tid = getParaToLong();
		setAttr("userList",User.userDao.getUserByTaskId(tid));
		setAttr("task", Task.taskDao.findTaskById(tid));
		List<Branch> branchList = Branch.branchDao.findBrachBytid(tid);
		if(branchList.size()>0){
			setAttr("branchList", branchList);
		}
		render("../show.jsp");
	}
}

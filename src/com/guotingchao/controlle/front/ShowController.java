package com.guotingchao.controlle.front;


import java.util.List;

import com.guotingchao.interceptor.ForntUnameInterceptor;
import com.guotingchao.interceptor.ForntUrlInterceptor;
import com.guotingchao.model.BaseModel;
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
	@Before(ForntUnameInterceptor.class)
	public void index(){
		Long tid = getParaToLong();
		setAttr("userList",User.userDao.getUserByTaskId(tid));
		setAttr("task", Task.taskDao.findTaskById(tid));
		List<BaseModel<Branch>> branchList = Branch.branchDao.branchInfoBytid(tid);
		
		if(branchList.size()>0){
			setAttr("branchList", branchList);
		}
		render("../show.jsp");
	}
}

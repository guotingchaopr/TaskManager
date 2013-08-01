package com.guotingchao.interceptor;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * fornt 路径拦截器
 * @author os-yugq
 *
 */
public class ForntUrlInterceptor  implements Interceptor {
	Logger log = Log4jLogger.getLogger(ForntUrlInterceptor.class);

	@Override
	public void intercept(ActionInvocation ai) {
		Controller c= ai.getController();
	
		//截取当前的URL存入session
		c.setSessionAttr("actionKey", c.getRequest().getServletPath());
		log.info("请求路径"+c.getRequest().getServletPath());
		ai.invoke();
		
	}
}

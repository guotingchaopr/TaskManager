package com.guotingchao.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.jfinal.handler.Handler;
/**
 * 路由跳转时间计算接口
 * @author 
 *
 */
public class RenderTimeHandle extends Handler {
	protected final Logger log = Logger.getLogger(RenderTimeHandle.class);

	@Override
	public void handle(String target, HttpServletRequest request,HttpServletResponse response, boolean[] isHandled) {
		long start = System.currentTimeMillis();
		nextHandler.handle(target, request, response, isHandled);
		long end = System.currentTimeMillis();
		String uri =request.getRequestURI();
		if(uri.indexOf("/js/") == -1 && uri.indexOf("/fonts/") == -1 && uri.indexOf("/css/") == -1){
			log.debug(target + " Action Time : " + (end - start) + " ms");
		}
	}
}
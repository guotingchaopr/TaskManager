package com.guotingchao.interceptor;

import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import redis.clients.jedis.Jedis;

import com.guotingchao.MyPlugin.RedisKit;
import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

/**
 * fornt 路径 基础拦截器
 * 
 * @author os-yugg
 * 
 */
public class ForntInterceptor implements Interceptor {
	Logger log = Log4jLogger.getLogger(IndexInterceptor.class);
	Jedis jedis = RedisKit.getJedis();
	@Override
	public void intercept(ActionInvocation ai) {
		Controller c= ai.getController();
		String  user_info=c.getCookie("user_info");
		if(user_info==null){
			user_info=c.getSessionAttr("user_info");
		}
		if(user_info!=null){
			if(jedis.exists(user_info)){
				try {
					JSONObject json = new JSONObject(jedis.get(user_info));
					String uname = json.getString("uname");
					c.setAttr("uname", uname);
				} catch (JSONException e) {
					e.printStackTrace();
					c.redirect("/");
				}
			}else{
				c.redirect("/");
			}
		}else{
			c.redirect("/");
		}
		ai.invoke();
	}
}
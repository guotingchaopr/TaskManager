package com.guotingchao.interceptor;

import org.json.JSONException;
import org.json.JSONObject;

import redis.clients.jedis.Jedis;

import com.guotingchao.MyPlugin.RedisKit;
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
public class ForntUnameInterceptor implements Interceptor {
	Logger log = Log4jLogger.getLogger(IndexInterceptor.class);
	@Override
	public void intercept(ActionInvocation ai) {
		Jedis jedis = RedisKit.getJedis();
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
				}
			}
		}
		RedisKit.returnResource(jedis);
		ai.invoke();
	}
}

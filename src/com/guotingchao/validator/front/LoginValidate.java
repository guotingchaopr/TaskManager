package com.guotingchao.validator.front;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import redis.clients.jedis.Jedis;

import com.guotingchao.MyPlugin.RedisKit;
import com.guotingchao.model.impl.User;
import com.guotingchao.tools.Utils;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;
/**
 * 前端登录验证
 * @author guotingchao
 *
 */
public class LoginValidate extends Validator{
	Logger log = Log4jLogger.getLogger(LoginValidate.class);
	Jedis jedis = RedisKit.getJedis();
	@Override
	protected void handleError(Controller c) {
		c.keepModel(User.class);
		c.render("login.jsp");
	}

	@Override
	protected void validate(Controller c) {
		validateRequired("user.uname", "uname_error", "请输入用户名");
		validateRequired("user.upass", "upass_error", "请输入密码");
		String uname = c.getPara("user.uname");
		String upass = c.getPara("user.upass");
		boolean checkFlag  =  checkIdenting(uname,upass,c.getSession());
		if(checkFlag){
			if(c.getSessionAttr("actionKey")!=null){
				try{
					c.redirect((String) c.getSessionAttr("actionKey"));
					log.info("前访问路径："+ c.getSessionAttr("actionKey"));
				}catch(Exception e){
					 log.debug(e.getMessage());
				};
				
			}else{
				c.redirect("");
			}
		}else{
			c.setAttr("login_error", "账户或密码错误");
			handleError(c);
		}
	}
	public boolean checkIdenting(String userName,String userPass,HttpSession session){
		String uname =userName;// getPara("uname");
		String upass =userPass;// getPara("upass");
		User user = User.userDao.findFirst("select * from user where user.uname=? and user.upass= ? ",uname,upass);
		Boolean flag;
		if(user!=null){
			String user_info = user.getLong("id")+Utils.getCurTime();
			jedis.set(user_info,user.toJson());
			
			Cookie cookie =new Cookie("user_info", user_info);
			session.setAttribute("user_info", user_info);
			
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
}

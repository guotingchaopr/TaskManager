package com.guotingchao.validator.front;
import javax.servlet.http.HttpSession;

import com.guotingchao.model.impl.User;
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
				c.redirect((String) c.getSessionAttr("actionKey"));
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
			flag=true;
			session.setAttribute("user_info", user);
		}else{
			flag=false;
		}
		return flag;
	}
}

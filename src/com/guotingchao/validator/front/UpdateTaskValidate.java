package com.guotingchao.validator.front;
import com.guotingchao.model.impl.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;
/**
 * 更新验证
 * @author os-yugq
 *
 */
public class UpdateTaskValidate extends Validator{
	Logger log = Log4jLogger.getLogger(UpdateTaskValidate.class);
	@Override
	protected void handleError(Controller c) {
		c.keepModel(User.class);
		c.render("updateTask.jsp");
	}

	@Override
	protected void validate(Controller c) {
		validateRequired("task.taskName", "taskName_error", "*请输入任务名称");
		validateRequired("user.id", "uid_error", "*请选择指定人");
	}
	
}

package com.guotingchao.validator.front;
import com.guotingchao.model.impl.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;
/**
 * 添加分支模块验证
 * @author os-yugq
 *
 */
public class AddBranchValidate extends Validator{
	Logger log = Log4jLogger.getLogger(AddBranchValidate.class);
	@Override
	protected void handleError(Controller c) {
		c.keepModel(User.class);
		c.render("addBranch.jsp");
	}

	@Override
	protected void validate(Controller c) {
		validateRequired("branch.branchName", "branchName_error", "*请输入任务名称");
		validateRequired("branch.uid", "uid_error", "*请选择指定人");
	}
	
}

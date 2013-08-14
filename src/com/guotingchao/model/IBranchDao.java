package com.guotingchao.model;

import java.util.List;
import java.util.Map;

import com.guotingchao.model.impl.Branch;
import com.guotingchao.model.impl.User;

public interface IBranchDao {
	
	public Map<String, Object> getAttrs();
	/**
	 * 通过tid获取分支模块
	 * @param tid
	 */
	public List<BaseModel<Branch>> findBrachBytid(Long tid);
	/**
	 * 通过tid获取Branch信息包括执行人
	 * @param tid
	 * @return
	 */
	public List<BaseModel<Branch>> branchInfoBytid(Long tid);
	
	/**
	 * 通过tid获取Branch信息包括执行人
	 * @param tid
	 * @return
	 */
	public Branch findBranchInfoBytid(Long tid);
}

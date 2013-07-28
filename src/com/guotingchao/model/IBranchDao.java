package com.guotingchao.model;

import java.util.List;

import com.guotingchao.model.impl.Branch;
import com.guotingchao.model.impl.User;

public interface IBranchDao {
	/**
	 * 通过tid获取分支模块
	 * @param tid
	 */
	public List<Branch> findBrachBytid(Long tid);
	/**
	 * 通过bid获取User
	 * @param bid
	 * @return
	 */
	public List<User> findUserByBid(Long bid);
}

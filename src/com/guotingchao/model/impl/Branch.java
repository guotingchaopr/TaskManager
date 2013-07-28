package com.guotingchao.model.impl;

import java.util.List;

import com.guotingchao.model.IBranchDao;
import com.jfinal.plugin.activerecord.Model;

public class Branch extends Model<Branch> implements IBranchDao {
	
	public static Branch branchDao  = new Branch(); 
	
	@Override
	public List<Branch> findBrachBytid(Long tid) {
		return branchDao.find("select * from branch where tid=?",tid);
	}

	@Override
	public List<User> findUserByBid(Long bid) {
		
		return null;
	}

}

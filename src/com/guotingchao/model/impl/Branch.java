package com.guotingchao.model.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.guotingchao.model.IBranchDao;
import com.jfinal.plugin.activerecord.Model;

public class Branch extends Model<Branch> implements IBranchDao {
	
	public static Branch branchDao  = new Branch(); 
	
	public Map<String, Object> getAttrs(){
	    return super.getAttrs();
	}
	
	@Override
	public List<Branch> findBrachBytid(Long tid) {
		return branchDao.find("select * from branch where tid=?",tid);
	}

	@Override
	public List<Branch> branchInfoBytid(Long tid) {
		
		return branchDao.find("SELECT u.uname,b.* FROM `user` u,branch b WHERE b.tid=? and u.id=b.uid",tid);
	}


}

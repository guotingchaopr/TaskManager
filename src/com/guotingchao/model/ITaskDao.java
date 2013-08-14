package com.guotingchao.model;

import java.util.List;

import com.guotingchao.model.impl.Task;
import com.jfinal.plugin.activerecord.Page;

public interface ITaskDao{
	
	/**
	 * 获取所有任务
	 * @return List
	 */
	public List<Task> findAllTaskList();
	
	/**
	 * 通过任务类型获取任务列表
	 * @param taskType
	 * @return List
	 */
	public List<Task> findTaskListByType(int taskType);
	
	/**
	 * 通过id获取task
	 * @param id
	 * @return task
	 */
	public Task findTaskById(Long id);
	
	/**
	 * 通过用户名获取相关的任务列表
	 * @param uname
	 * @return
	 */
	public List<Task> findTaskByUser(String uname);
//	/**
//	 * 通过tid获取子任务
//	 * @param tid
//	 * @return
//	 */
//	public List<Task> findChildTask(Long tid);
}

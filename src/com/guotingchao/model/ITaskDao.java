package com.guotingchao.model;

import java.util.List;

import com.guotingchao.model.impl.Task;

public interface ITaskDao{
	
	
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
	 * 通过id获取执行任务人列表
	 * @param id
	 * @return List<User> 
	 */
	public List<String> findUserListByTaskId(Long id); 
	
}
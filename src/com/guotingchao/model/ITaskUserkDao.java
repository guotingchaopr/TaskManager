package com.guotingchao.model;

import java.util.List;

import com.guotingchao.model.impl.T_user_task;


public interface ITaskUserkDao{
	/**
	 * 通过 tid 获取对应的uid
	 * @param tid
	 * @return
	 */
	public String[] getUidArray(Long tid);
	
	/**
	 * 通过 tid和uid 删除对象
	 * @param tid
	 * @param uid
	 * @return
	 */
	public boolean deleteByTidAndUid(Long tid,Long uid);
	
	/**
	 * 通过uid获取有信息提示的T_user_task对象
	 * @param uid
	 * @return
	 */
	public List<BaseModel<T_user_task>> findMsgTaskByUid(Long uid);
	
	/**
	 * 将消息任务全部更新为已查看任务
	 * @return
	 */
	public boolean updateMsgTask();
	
	/**
	 * 查看某个消息任务，并标注为已查看
	 * @param tid
	 * @return
	 */
	public boolean checkedMsgTask(int tid,Long uid);
	
}

package com.guotingchao.model.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.guotingchao.BaseConfig;
import com.guotingchao.model.BaseModel;
import com.guotingchao.model.ITaskDao;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
public class Task extends Model<Task> implements ITaskDao{
	public static Logger log = Log4jLogger.getLogger(BaseModel.class);
	private static final long serialVersionUID = 1L;
	static Properties prop = new Properties();
	static{
		InputStream in = BaseConfig.class.getClassLoader().getResourceAsStream("config.properties");
		try{
			prop.load(in);
		}catch(IOException e){
			log.error(e.getMessage());
		}
	}
	public static Task taskDao = new Task();
//	
//	List<Task> taskList = new ArrayList<Task>();
//	Task tempTask = null;
//	
	public Map<String, Object> getAttrs(){
	    return super.getAttrs();
	}

	
	
	@Override
	public List<Task> findAllTaskList() {
		
		return Task.taskDao.find("select * from task ");
	}
	
	@Override
	public List<Task> findTaskListByType(int taskType) {
//分页取消  先做子任务模块
//		int pageSize = Integer.parseInt(prop.getProperty("pageSize"));
//		int pageNo = PaginationContext.getPageNo();
//		String sqlExceptSelect="from task where tasktype ="+taskType;
//		Page<Task> page = Task.taskDao.paginate(pageNo, pageSize, "select * ", sqlExceptSelect);
//		System.out.println("TotalPage"+page.getTotalPage());
//		System.out.println("TotalRow"+page.getTotalRow());
//		System.out.println("PageNumber"+page.getPageNumber());		
//		return page;
//		List<Long> tidList = new ArrayList<Long>();
//		//获取对应类型的任务列表
//		taskList=Task.taskDao.find("select * from task where tasktype = ? and pid=0 order by id",taskType);
//		//得到任务列表id
//		for(Task task:taskList){
//			tidList.add(task.getLong("id"));
//		}
//		//清空任务列表
//		taskList.clear();
//		for(Long tid:tidList){
//			tempTask=Task.taskDao.find("select * from task where id=? ",tid).get(0);
//			taskList.add(tempTask);
//			findTask(tid);
//		}
//			
//		return taskList;
		return Task.taskDao.find("select * from task where tasktype = ?  order by id",taskType);
	}
	
	@Override
	public Task findTaskById(Long id) {
		return Task.taskDao.findById(id);
	}



	@Override
	public List<Task> findTaskByUser(String uname) {
		
		return Task.taskDao.find("select * from task where taskMaker = ? ",uname);
	}



	@Override
	public List<Task> findChildTask(Long tid) {

		return Task.taskDao.find("select * from task where pid=? order by id",tid);
	
	}
	

//	
//	public List<Task> findTask(Long tid){
//		
//		List<Task> taskProxyList = new ArrayList<Task>();
//		List<Long> tidList = new ArrayList<Long>();
//		//获取所有子元素
//		taskProxyList = Task.taskDao.find("select * from task where pid=? order by id",tid);
//		if(taskProxyList!=null){
//			//获取所有的子任务id
//			for(Task task:taskProxyList){
//				tidList.add(task.getLong("id"));
//			}
//			//获取所有子任务
//			for(Long id:tidList){
//				tempTask=Task.taskDao.find("select * from task where id=? ",id).get(0);
//				taskList.add(tempTask);
//				findTask(id);
//			}
//		}
//		return taskList;
//	}
//	
}

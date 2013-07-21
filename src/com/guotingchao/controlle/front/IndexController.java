package com.guotingchao.controlle.front;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.guotingchao.interceptor.ForntMessageInterceptor;
import com.guotingchao.model.BaseModel;
import com.guotingchao.model.impl.T_user_task;
import com.guotingchao.model.impl.Task;
import com.guotingchao.model.impl.User;
import com.guotingchao.tools.Compare;
import com.guotingchao.validator.front.AddTaskValidate;
import com.guotingchao.validator.front.LoginValidate;
import com.guotingchao.validator.front.UpdateTaskValidate;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Model;

/**
 * 前端Index控制器
 * @author os-yugq
 */
public class IndexController extends Controller{
	
	Logger log= Log4jLogger.getLogger(IndexController.class);
	/**
	 *  主页
	 */
	@Before(ForntMessageInterceptor.class)
	public void index(){
		User user = getSessionAttr("user_info");
		if(user!=null){
			String uname = user.get("uname");
			List<Task> taskListRelative = Task.taskDao.findTaskByUser(uname);
			if(taskListRelative.size()>0){
				setAttr("taskListRelative", taskListRelative);
			}
		}
		System.out.println(getAttr("taskListRelative"));
		setAttr("taskListInit", Task.taskDao.findTaskListByType(0));
		setAttr("taskListOn", Task.taskDao.findTaskListByType(1));
		setAttr("taskListFinish", Task.taskDao.findTaskListByType(2));
		setAttr("taskListBlocked", Task.taskDao.findTaskListByType(-1));
		render("index.jsp");
	}
	/**
	 * 获取消息任务内容
	 */
	public void msgInterceptor(){
		User user =getSessionAttr("user_info");
		HttpServletResponse response = getResponse();
		response.setContentType("charset=utf-8");
		JSONObject json = null;
		if(user!=null){
			Long uid = user.getLong("id");
			//获取有信息的任务
			List<BaseModel<T_user_task>> list = T_user_task.taskUserDao.findMsgTaskByUid(uid);

			if(list!=null){
				int count = list.size();
				//有信息的任务列表
				List<Task> taskList = new ArrayList<Task>(count);
				for(int i = 0;i < count;i++){
					taskList.add(Task.taskDao.findById(list.get(i).getInt("tid")));
				}
				if(taskList.size()>0){
					int last = taskList.size()-1;
					try {
						json = new JSONObject(taskList.get(last).toJson());
						json.put("MsgCount", count);
					} catch (JSONException e) {
						e.printStackTrace();
					}
					
				}
			}
		}
		if(json==null){
			renderNull();
		}else{
			renderJson(json.toString());
		}
	}
	/**
	 * 查看未读任务，并标识为已读
	 */			
	public void doCheckedMsgTask(){
		User user = getSessionAttr("user_info");
		Long uid = user.get("id");
		int tid = getParaToInt("tid");
		T_user_task.taskUserDao.checkedMsgTask(tid, uid);
		renderNull();
	}
	/**
	 * 显示与自己相关的未查看任务
	 */
	public void showMsgTask(){
		User user =getSessionAttr("user_info");
		if(user!=null){
			Long uid = user.getLong("id");
			//获取有信息的任务
			List<BaseModel<T_user_task>> list = T_user_task.taskUserDao.findMsgTaskByUid(uid);
			if(list!=null){
				int count = list.size();
				//有信息的任务列表
				List<Task> taskList = new ArrayList<Task>(count);
				for(int i = 0;i < count;i++){
					taskList.add(Task.taskDao.findById(list.get(i).getInt("tid")));
				}
			    setAttr("MsgTaskList", taskList);
			}
		}
		render("showMsgTask.jsp");
	}
	/**
	 * 把消息任务全部更新为已查看任务
	 */
	public void doUpdateMsgTask(){
 		try{
			if(T_user_task.taskUserDao.updateMsgTask()){
				removeSessionAttr("MsgTaskList");
				removeSessionAttr("MsgTask");
				removeSessionAttr("MsgCount");
			}else{
				log.info("更新消息任务失败！");
			}
		}catch(Exception e){
			log.info("更新消息任务失败！"+e.getMessage());
		}
		renderNull();
	}
	/**
	 * 更新任务
	 */
	public void updateTask(){
		Long tid = getParaToLong();
		setSessionAttr("tid", tid);
		setSessionAttr("userListSession",User.userDao.findUserList());
		setAttr("userList",User.userDao.getUserByTaskId(tid));
		setAttr("task", Task.taskDao.findTaskById(tid));
		render("updateTask.jsp");
	}
	@Before(UpdateTaskValidate.class)
	public void doUpdateTask(){
		try {
			//更新任务
			Long tid= getSessionAttr("tid");
			Task task =Task.taskDao.findById(tid);
			task.set("taskMaker", getPara("task.taskMaker"));
			task.set("taskInfo", getPara("task.taskInfo"));
			task.set("taskPercent", getPara("task.taskPercent"));
			task.set("taskType", getPara("task.taskType"));
			task.set("rank", getParaToInt("task.rank"));
			task.set("taskName", getPara("task.taskName"));
			SimpleDateFormat sdf = new  SimpleDateFormat( "yyyy-MM-dd" ); 
			Date play_time=sdf.parse(getPara("task.play_Time"));
			task.set("play_Time", play_time); 
			
			if (task.update()) {
				String[] uid_new = getPara("user.id").split(",");
				String[] uid_old = T_user_task.taskUserDao.getUidArray(tid);
				//两个数组内容不同就进行  更新中间表
				if(!Compare.ComArray(uid_new, uid_old)){
					int newCount = uid_new.length;
					int oldCount = uid_old.length;
					//在uid_new中不包含uid_old里的uid  就删除此项
					for(int i = 0;i < oldCount; i++){
						if(!Compare.Content(uid_new, uid_old[i])){
							if(T_user_task.taskUserDao.deleteByTidAndUid(tid, Long.parseLong(uid_old[i]))){
								log.info("删除中间表中的里面的内容。。。 成功");
							}
						}
					}
					//在uid_old中不包含uid_new里的uid  就添加此项
					for(int i = 0;i < newCount; i++){
						if(!Compare.Content(uid_old, uid_new[i])){
							T_user_task user_task = new T_user_task();
							user_task.set("tid", tid);
							user_task.set("uid",uid_new[i]);
							if(user_task.save()){
								log.info("添加中间表中的里面的内容。。。成功");
							};
						}
					}
					
				}
				
				setAttr("update_success_msg", "添加成功");
			}
		} catch (Exception e) {
			log.error("更新任务" + getPara("task.taskName")+ "失败,原因：" + e.getMessage());
			setAttr("update_success_msg", "添加失败");
		}
		render("updateTask.jsp");
	}
	/**
	 * 添加新任务
	 */
	public void addTask(){
		setSessionAttr("userListSession",User.userDao.findUserList());
		render("addTask.jsp");
	}
	
	@Before(AddTaskValidate.class)
	public void doAddTask(){
		try {
			//保存新任务
			Task task =new Task();
			task.set("taskMaker", getPara("task.taskMaker"));
			task.set("taskInfo", getPara("task.taskInfo"));
			task.set("rank", getParaToInt("task.rank"));
			task.set("taskName", getPara("task.taskName"));
			SimpleDateFormat sdf = new  SimpleDateFormat( "yyyy-MM-dd" ); 
			Date play_time=sdf.parse(getPara("task.play_Time"));
			task.set("play_Time", play_time); 
			String[] uid = getPara("user.id").split(",");
			
			//批量保存处理
			List<Model> user_task_list = new ArrayList<Model>();
			if (task.save()) {
				String tid = task.get("id").toString();
				for(int i=0;i<uid.length;i++){
					T_user_task temp_user_task = new T_user_task();
					temp_user_task.set("tid",tid);
					temp_user_task.set("uid",uid[i]);
					user_task_list.add(temp_user_task);
				}
				T_user_task.taskUserDao.batchSave(user_task_list);
				setAttr("add_success_msg", "添加成功");
			}
		} catch (Exception e) {
			log.error("添加任务" + getPara("task.taskName")+ "失败,原因：" + e.getMessage());
			setAttr("add_success_msg", "添加失败");
		}
			render("addTask.jsp");
	}
	
	/**
	 * 登录
	 */
	
	public void login(){
		render("login.jsp");
	}
	/**
	 * 登录动作处理
	 */
	@Before(LoginValidate.class)
	public void doLogin() {
		
	}
	/**
	 * 退出登录
	 */
	public void loginOut(){
		removeSessionAttr("user_info");
		removeSessionAttr("actionKey");
		redirect("/");
	}

}

package com.guotingchao.model;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.guotingchao.BaseConfig;
import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;


public class BaseModel<Class> extends Model<BaseModel<Class>>{
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
	
	/**
	 * 批量保存
	 * @param modelList
	 */
	public boolean batchSave(List<Model> modelList){
		List<String> sqlList = new ArrayList<String>();
		try{
			//获取 对象com.guotingchao.model.impl.Branch
			String[] temp=modelList.get(0).getClass().getName().split("\\.");
			
			System.out.println(modelList.get(0).getClass().getName());
			//截取 得到表名
			String tableName=temp[temp.length-1];  //改
			for(Model model : modelList){
				StringBuffer sql = new StringBuffer("insert into "+tableName+"(" );
				StringBuffer name= new StringBuffer() ,value = new StringBuffer();
				
				String[] attr_names = model.getAttrNames();int attr_names_length = attr_names.length;
				String attx = ""; //前缀
				for(int i = 0 ; i<attr_names_length;i++){
					if(i>0){attx=",";}
					String attr_key =attr_names[i]; 
					name.append(attx+attr_key);
					//判断传过来的参数是否为
					try{
						Integer.parseInt((String) model.get(attr_key));
						value.append(attx+model.get(attr_key));
					}catch(Exception e){
						value.append(attx+"'"+model.get(attr_key)+"'");
					}
				}
				sql.append(name);
				sql.append(") values(");
				sql.append(value);
				sql.append(")");
				
				log.info("批量保存的sql:"+sql.toString());
				sqlList.add(sql.toString());
			}
			//批量保存
			if(Db.batch(sqlList, sqlList.size()).length>0){
				return true;
			}else{
				return false;
			}
			
		}catch(NullPointerException e){
			log.error(e.getMessage());
			return false;
		}
		
	}

}

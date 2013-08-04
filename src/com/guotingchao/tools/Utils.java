package com.guotingchao.tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.jfinal.log.Log4jLogger;
import com.jfinal.log.Logger;

public class Utils {
	public static Logger log = Log4jLogger.getLogger(Utils.class);
	/** 
     * 得到当前的时间，时间格式yyyy-MM-dd 
     * @return 
     */  
    public static String getCurrentDate(){  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        return sdf.format(new Date());  
    } 
	/** 
     * 日期格式化，默认日期格式yyyy-MM-dd 
     * @param date 
     * @return 
     */  
    public static String getFormatDate(Date date){  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        return sdf.format(date);  
    }  
	/**
	 * 将字符串转为时间 要求参数默认格式yyyy-MM-dd
	 * @param str
	 * @return
	 */
    public static Date getDate(String str){
    	SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd"); 
		Date play_time = null;
		try {
			play_time = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
			log.error("转换时间的字符串格式有误！");
		}
		return play_time;
    }
}

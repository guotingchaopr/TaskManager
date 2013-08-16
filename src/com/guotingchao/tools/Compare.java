package com.guotingchao.tools;

import java.util.Arrays;

/**
 * 比较器 
 * @author os-yugq
 *
 */
public class Compare {
	/**
	 * 比较两个 数组内容是否相同 
	 * @param temp1
	 * @param temp2
	 * @return
	 */
	public static boolean ComArray(String[] temp1,String[] temp2){
		
		boolean flag = true;
		int count1 = temp1.length;
		int count2 = temp2.length;
		if(count1 != count2){
			flag = false;
		}else{
			Arrays.sort(temp1);
			Arrays.sort(temp2);
			for(int i=0;i <count1;i++){
				if(!temp1[i].equals(temp2[i])){
					flag = false;
				}
			}
		}
		return flag;
	}
	/**
	 * 判断数组里面是否包含 某个元素
	 * @param temp
	 * @param str
	 * @return
	 */
	public static boolean Content(String[] temp,String str){
		if(temp == null){
			return false;
		}else{
			int count = temp.length;
			boolean flag = false;
			for(int i = 0; i < count; i++){
				if(temp[i].equals(str)){
					flag = true;
				}
			}
			return flag;
		}
	}
}

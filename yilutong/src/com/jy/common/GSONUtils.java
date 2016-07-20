package com.jy.common;

import java.lang.reflect.Type;

import com.google.gson.Gson;

public class GSONUtils {
	private static Gson gson = null;  
	    
	    static {  
	        if (gson == null) {  
	            gson = new Gson();  
	        }  
	    }
	 /** 
     * json转成List
     * @param str   
     * @param type  
     * @return  
     */  
    public static <T> T fromJson(String str, Type type) { 
        Gson gson = new Gson();  
        return gson.fromJson(str, type);  
    }  
    /**
     * 将给定的 {@code JSON} 字符串转换成指定的类型对象。
     * 
     * @param <T> 要转换的目标类型。
     * @param json 给定的 {@code JSON} 字符串。
     * @param token {@code com.google.gson.reflect.TypeToken} 的类型指示类对象。
     * @return 给定的 {@code JSON} 字符串表示的指定的类型对象。
     * @since 1.0
     */
    public static Object JsonToObject(String jsonString, Object obj) {
		if (gson == null) {
			gson = new Gson();
		}
		return gson.fromJson(jsonString, obj.getClass());
	}
}

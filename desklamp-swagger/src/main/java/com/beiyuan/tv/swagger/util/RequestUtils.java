package com.hiveview.tv.swagger.util;

import org.springframework.core.NamedThreadLocal;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class RequestUtils {
	/**
	 * ThreadLocal确保高并发下每个请求的request，response都是独立的
	 */
	public static ThreadLocal<HttpServletRequest> currentRequest = new ThreadLocal<HttpServletRequest>();
	public static ThreadLocal<HttpServletResponse> currentResponse = new ThreadLocal<HttpServletResponse>();
	public static ThreadLocal<Map<String,String>> currentParam=new NamedThreadLocal<>("当前request参数");


	public static HttpServletRequest getRequest(){
		try{
			return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		}catch(Exception e){
			return null;
		}
	}

	public static HttpServletResponse getResponse(){
		try{
			return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
		}catch(Exception e){
			return null;
		}
	}


}

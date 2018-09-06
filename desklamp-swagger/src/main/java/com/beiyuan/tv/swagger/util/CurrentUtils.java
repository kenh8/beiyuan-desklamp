package com.hiveview.tv.swagger.util;

import javax.servlet.http.HttpServletRequest;

import com.hiveview.tv.swagger.util.constant.HeaderParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



/**
 * @author chenxingyong
 * @email chenxingyong@turing.online
 * @date 2017年4月6日下午12:37:30
 * @version 1.0
 */
public class CurrentUtils {
	private CurrentUtils(){
		
	}
	
	/**
	 * 获取当前登录用户的id(app用户)
	 * @return
	 * @throws Exception 
	 */
	public static String getCurrentUserId() throws Exception {
		return CurrentUtils.getHeader(HeaderParam.USER_ID);
	}
	
	/**
	 * 获取当前的请求域
	 * @return
	 * 		HttpServletRequest
	 */
	public static HttpServletRequest getCurrentRequest() {
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		if (requestAttributes != null) {
			HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
			return request;
		}
		return null;
	}
	
	/**
	 * 获取指定的header信息
	 * @param key
	 * @return
	 * @throws Exception 
	 */
	public static String getHeader(String key) throws Exception {
		return getCurrentRequest().getHeader(key);
	}
}

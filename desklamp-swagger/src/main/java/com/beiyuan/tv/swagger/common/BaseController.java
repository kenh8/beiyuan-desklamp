package com.hiveview.tv.swagger.common;



import com.hiveview.base.common.BaseConstants;
import com.hiveview.tv.swagger.util.RequestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 控制器基类
 * @author leo
 *
 */
public abstract class BaseController {
	public Logger logger = LoggerFactory.getLogger(getClass());

	@SuppressWarnings("rawtypes")
	@ModelAttribute
	public void initReqAndRep(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("imgPath", Global.getImgUrl());
		RequestUtils.currentRequest.set(request);
		RequestUtils.currentResponse.set(response);

		Map<String,String> parameters = new HashMap<String, String>();
		Map map = request.getParameterMap();
		Set keys = map.keySet();
		for(Object key : keys){
			String value=request.getParameter(key.toString());
			if(!StringUtils.isEmpty(value)){
				parameters.put(key.toString(), value.trim());
			}
		}
		//parameters.put(BaseConstants.REQUEST_SESSION_ID, request.getSession().getId());//每个请求添加 sessionId
		RequestUtils.currentParam.set(parameters);
	}

	public HttpServletRequest getRequest(){
		return RequestUtils.getRequest();
	}

	public HttpServletResponse getResponse(){
		return RequestUtils.getResponse();
	}



	/**获取指定参数*/
	public String getString(String name) {
		return getString(name, null);
	}

	public String getString(String name, String defaultValue) {
		String resultStr = getRequest().getParameter(name);
		if (resultStr == null || "".equals(resultStr)
				|| "null".equals(resultStr) || "undefined".equals(resultStr)) {
			return defaultValue;
		} else {
			return resultStr;
		}
	}

	public int getInt(String name) {
		return getInt(name, 0);
	}

	public int getInt(String name, int defaultValue) {
		String resultStr = getRequest().getParameter(name);
		if (resultStr != null) {
			try {
				return Integer.parseInt(resultStr);
			} catch (Exception e) {
				return defaultValue;
			}
		}
		return defaultValue;
	}

	public BigDecimal getBigDecimal(String name) {
		return getBigDecimal(name, null);
	}

	public BigDecimal getBigDecimal(String name, BigDecimal defaultValue) {
		String resultStr = getRequest().getParameter(name);
		if (resultStr != null) {
			try {
				return BigDecimal.valueOf(Double.parseDouble(resultStr));
			} catch (Exception e) {
				return defaultValue;
			}
		}
		return defaultValue;
	}


	/**
	 * 获取request参数map
	 * 因 admin项目 用http 所以都用string
	 * @return
	 */
	protected Map<String,String> getRequestMap(){
		return RequestUtils.currentParam.get();
	}


}

package com.beiyuan.tvapi.commom;

import com.beiyuan.base.common.properties.PropertiesLoader;
import com.beiyuan.base.common.properties.PropertiesResourcePaths;
import com.beiyuan.base.spring.SpringContextHolder;
import com.google.common.collect.Maps;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.DefaultResourceLoader;

import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * 全局配置类
 * @author ThinkGem
 * @version 2014-06-25
 */
public class Global {

	/**
	 * 保存全局属性值
	 */
	private static Map<String, String> map = Maps.newHashMap();
	
	/**
	 * 属性文件加载对象
	 */
	private static PropertiesLoader loader = null;

	/**
	 * 显示/隐藏
	 */
	public static final String SHOW = "1";
	public static final String HIDE = "0";

	/**
	 * 是/否
	 */
	public static final String YES = "1";
	public static final String NO = "0";
	
	/**
	 * 对/错
	 */
	public static final String TRUE = "true";
	public static final String FALSE = "false";
	
	public static final String IMG_URL="tracker_http_server";
	public static final String SERVICE_URL="domy.services.url";
	public static final String NOTIFY_URL = "notify_url";


	public static PropertiesLoader getLoader(){
		synchronized (Global.class){
			if(null == loader){
				PropertiesResourcePaths tmp= SpringContextHolder.getBean(PropertiesResourcePaths.class);
				loader=new PropertiesLoader(tmp.getResourcesPaths());
			}
		}
		return loader;
	}

	/**
	 * 获取配置
	 * ${fns:getConfig('adminPath')}
	 * @see
	 */
	public static String getConfig(String key) {
		String value = map.get(key);
		if (value == null){
			value = getLoader().getProperty(key);
			map.put(key, value != null ? value : StringUtils.EMPTY);
		}
		return value;
	}

	/**
	 * 获取service项目请求路径
	 * @return
	 */
	public static String getServiceUrl(){
		return Global.getConfig(SERVICE_URL);
	}

	/**
	 * 获取图片显示url
	 * @return
	 */
	public static String getImgUrl(){
		String imgUrl= Global.getConfig(IMG_URL);
		if(imgUrl.startsWith("http")){
			return imgUrl;
		}else{
			return "http://"+imgUrl;
		}
		
	}

	/**
	 * 获取支付回调URL
	 * @return
	 */
	public static String getNotifyUrl(){
		String notifyurl= Global.getConfig(NOTIFY_URL);
		if(notifyurl.startsWith("http")){
			return notifyurl;
		}else{
			return "http://"+notifyurl;
		}

	}

	public static void main(String[] args) {
		System.out.println(getImgUrl());
	}
	
	
	/**
	 * 页面获取常量
	 * ${fns:getConst('YES')}
	 * @see
	 */
	public static Object getConst(String field) {
		try {
			return Global.class.getField(field).get(null);
		} catch (Exception e) {
			// 异常代表无配置，这里什么也不做
		}
		return null;
	}

	
    /**
     * 获取工程路径
     * @return
     */
    public static String getProjectPath(){
    	// 如果配置了工程路径，则直接返回，否则自动获取。
		String projectPath = Global.getConfig("projectPath");
		if (StringUtils.isNotBlank(projectPath)){
			return projectPath;
		}
		try {
			File file = new DefaultResourceLoader().getResource("").getFile();
			if (file != null){
				while(true){
					File f = new File(file.getPath() + File.separator + "src" + File.separator + "main");
					if (f == null || f.exists()){
						break;
					}
					if (file.getParentFile() != null){
						file = file.getParentFile();
					}else{
						break;
					}
				}
				projectPath = file.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return projectPath;
    }
	
}

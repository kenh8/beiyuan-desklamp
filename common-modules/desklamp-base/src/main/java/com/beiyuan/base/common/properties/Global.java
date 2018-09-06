/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.beiyuan.base.common.properties;

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
	private static PropertiesLoader loader=null;

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
	
	public static final String SERVICE_URL="domy.services.url";
	
	public static final String IMG_URL="tracker_http_server";

	public static final String HIVE_PAYMENT_NOTIFY_KEY = "hive.payment.notify.key";

	public static final String REFUND_SIGN_KEY = "refund.sign.key";

	private static final String ANDROID_VIPCLUB_ACTION = "android.vipclub.action";

	public static final String NETTY_PUSH_MSG_HTTP_URL = "netty_receiver_push_msg_url";

	public static final String KD100_API_KEY = "kd100_api_key";

	public static final String KD100_API_URL= "kd100_api_url";

	public static final String KD100_API_ID = "kd100_api_id";

	public static final String KD100_DELIVERY_KEY = "kd100_delivery_key";

	public static final String KD100_DELIVERY_URL = "kd100_delivery_url";


    public static final String DELIVERY_OVER_COMPLETE_TIME_UINT_KEY = "delivery_over_complete_time_unit";

    public static final String DELIVERY_OVER_COMPLETE_TIME_KEY = "delivery_over_complete_time";

    public static final String DELIVERY_OVER_TIME_UINT_KEY = "delivery_over_time_unit";

    public static final String DELIVERY_OVER_TIME_KEY = "delivery_over_time";

    public static final String DELIVERY_QUESTION_TIME_KEY = "delivery_question_time";

    public static final String DELIVERY_QUESTION_TIME_UNIT_KEY = "delivery_question_time_uint";

	public static final String SCRM_AUTH_KEY = "scrm_auth_key";

    private static String deliveryQuestionTimeUnitKey;
	private static String authKey;

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
		return getConfig(IMG_URL);

	}
	

	/**
	 * 页面获取常量
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

	public static String getHivePaymentNotifyKey(){
		String Url=Global.getConfig(HIVE_PAYMENT_NOTIFY_KEY);
		return Url;
	}



	public static String getAndroidVipclubAction() {
		String Url=Global.getConfig(ANDROID_VIPCLUB_ACTION);
		return Url;
	}

	/**
	 * 获取支付回调URLHTTP
	 * @return
	 */
	public static String getNettyPushMsgHttpUrl(){
		String httpurl=Global.getConfig(NETTY_PUSH_MSG_HTTP_URL);
		if(httpurl.startsWith("http")){
			return httpurl;
		}else{
			return "http://"+httpurl;
		}

	}

	/**
	 * 快递100API
	 * @return
	 */
	public static String getKd100DeliveryUrl() {
		String Url=Global.getConfig(KD100_DELIVERY_URL);
		if(Url.startsWith("http")){
			return Url;
		}else{
			return "http://"+Url;
		}
	}

	/**
	 * 快递100API
	 * @return
	 */
	public static String getKd100DeliveryKey() {
		String Url=Global.getConfig(KD100_DELIVERY_KEY);
		return Url;
	}

	/**
	 * 快递100API
	 * @return
	 */
	public static String getKd100ApiId() {
		String Url=Global.getConfig(KD100_API_ID);
		return Url;
	}

	/**
	 * 快递100API
	 * @return
	 */
	public static String getKd100ApiKey() {
		String Url=Global.getConfig(KD100_API_KEY);
		return Url;
	}

	/**
	 * 快递100API
	 * @return
	 */
	public static String getKd100ApiUrl() {
		String Url=Global.getConfig(KD100_API_URL);
		if(Url.startsWith("http")){
			return Url;
		}else{
			return "http://"+Url;
		}
	}

    public static String getDeliveryOverCompleteTimeUintKey(){
        String Url=Global.getConfig(DELIVERY_OVER_COMPLETE_TIME_UINT_KEY);
        return Url;
    }

    public static String getDeliveryOverCompleteTimeKey(){
        String Url=Global.getConfig(DELIVERY_OVER_COMPLETE_TIME_KEY);
        return Url;
    }

    public static String getDeliveryOverTimeUintKey(){
        String Url=Global.getConfig(DELIVERY_OVER_TIME_UINT_KEY);
        return Url;
    }

    public static String getDeliveryOverTimeKey(){
        String Url=Global.getConfig(DELIVERY_OVER_TIME_KEY);
        return Url;
    }

    public static String getDeliveryQuestionTimeKey() {
        String Url = Global.getConfig(DELIVERY_QUESTION_TIME_KEY);
        return Url;
    }

    public static String getDeliveryQuestionTimeUnitKey() {
        String Url = Global.getConfig(DELIVERY_QUESTION_TIME_UNIT_KEY);
        return Url;
    }

	public static String getScrmAuthKey() {
		String Url=Global.getConfig(SCRM_AUTH_KEY);
		return Url;
	}
}

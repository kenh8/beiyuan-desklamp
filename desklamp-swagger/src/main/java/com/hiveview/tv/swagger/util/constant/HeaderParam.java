package com.hiveview.tv.swagger.util.constant;

//公共参数
//deviceId;    //设备ID，用于统计终端量
//platform;    //软件平台 android、iOS、web
//clientVer;   //客户端接口版本号
//osVer;       //操作系统版本
//userToken;   //用户token令牌
//networkType; //网络类型 4g/wifi。。。
//channel;     //渠道号
//buildId;     //构建号

//private String userToken;
//private String userId ;
//private String tokenSecret;
//private String deviceId;
//private String platform;
//private String clientVer;
//private String osVer;
//private String networkType;
//private String channel;
//private String buildId;
//private String xForwardedForIp;
//private String traceId;

/**
 * 请求头信息
 * @version 1.0
 */
public class HeaderParam{

	/**
	 * 设备号
	 */
    public static final String DEVICE_ID = "deviceId";
    /**
     * 平台
     */
    public static final String PLATFORM = "platform";
    /**
     * 
     */
    public static final String CLIENT_VER = "clientVer";
    /**
     * 
     */
    public static final String OS_VER = "osVer";
    /**
     * 用户token
     */
    public static final String USER_TOKEN = "userToken";
    /**
     * url签名值
     */
    public static final String SIGN = "sign";
    /**
     * 网络类型
     */
    public static final String NETWORK_TYPE = "networkType";
    /**
     * 
     */
    public static final String CHANNEL = "channel";
    /**
     * 版本号
     */
    public static final String BUILD_ID = "buildId";
    /**
     * 用户id
     */
    public static final String USER_ID = "userId";
}

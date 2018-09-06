package com.beiyuan.base.util;

import java.util.concurrent.TimeUnit;

/**
 *
 */
public final class Constants {

    /**
     * 管道符号
     */
    public final static String BAR = "|";

    /**
     * 下划线符号
     */
    public final static String UNDERLINE = "_";

    public static final String PASSWORD_SALT = "7f03519ef84128e7bdc9a704d0c9458e";

    /**
     * 允许访问的url
     */
    public static final String PERMIT_URL = "permitUrl";

    /**
     * 禁止访问的URl
     */
    public static final String FORBID_URL = "forbidUrl";

    /**
     * 未登录roleID
     */
    public final static Long NOT_LOGIN_ROLE_ID = 1L;

    /**
     * 已登录roleID
     */
    public final static Long LOGIN_IN_ROLE_ID = 2L;

    /**
     * 一分钟毫秒数
     */
    public final static Long ONE_MINUTE_MILLISECOND = TimeUnit.MINUTES.toMillis(1);

    /**
     * 分页默认显示10条
     */
    public static final Integer PAGE_COUNT = 5;

    /**
     * 章节 资源类型
     */
    public static final Integer RESOURCE_CHAPTER_TYPE = 1;

    /**
     * 课程 资源类型
     */
    public static final Integer RESOURCE_LESSON_TYPE = 2;

    /**
     * 课时 资源类型
     */
    public static final Integer RESOURCE_CLASS_TYPE = 3;

    /**
     * 环节 资源类型
     */
    public static final Integer RESOURCE_STEP_TYPE = 4;

    /**
     * 父资源/源资源
     */
    public static final Long RESOURCE_ROOT = -1L;

    /**
     * 生成验证码的最大数量
     */
    public static final Integer PICTURE_CODE_RANDOM_MAX = 9999;

    /**
     * redis 验证码数据存储前缀
     */
    public static final String PICTURE_CODE = "pictureCode:";



    /**
     * 后续需要移动配置文件
     */
    /**
     * MD5 KEY
     */
    //public static final String HIVE_PARTNER_KEY = "31871fa18f49742f95295ef7fe5d3550"; //3773434fec2587bcbaad2bfe0220679f

    /**
     * 支付回调URL KEY
     */
    //public static final String HIVE_PAYMENT_NOTIFY_KEY = "3773434fec2587bcbaad2bfe0220679f";

    /**
     * 支付退款KEY
     */
    //public static final String HIVE_PAY_KEY = "31871fa18f49742f95295ef7fe5d3550"; //14432604858cb9aa02bc48c7e79443b7


    /**
     * 用户中心域名
     */
    //public static final String PASSPORT_SERVICE = PropertiesUtil.getString("service.passport");
    /**
     * 线上域名
     */
    //public static final String PASSPORT_SERVICE = "http://best.passport.domybox.local/";
    /**
     * 测试域名
     */
    //public static final String PASSPORT_SERVICE_TEST = "http://passport.pthv.gitv.tv/";

    /**
     * 用户中心查询用户接口
     */
    //public static final String USER_API = PASSPORT_SERVICE_TEST  + "api/user/getUserInfo.json" ;

    /**
     * 关联ID
     */
    //public static final String HIVE_PARTNER_ID = "hiveview";

    /**
     * 测试退款接口
     */
    //public static final String REFUND_PAYMENT = "http://test.pay.pthv.gitv.tv/trade/unified/refund.json";

    /**
     * 测试退款接口
     */
    //public static final String REFUND_PAYMENT_TEST = "http://test.pay.pthv.gitv.tv/trade/unified/refund.json";


    /**
     * 退款状态
     */
    public static final int REFUND_SUCCESS_STATUS = 4;

    public static final int REFUND_FAILED_STATUS = 2;

    /**
     * 接口返回成功状态
     */
    public static final String REFUND_API_RETURN_SUCCESS = "000";

    /**
     *矩阵定义
     */
    public static final int MATRIX_IMAGE_TYPE = 1;
    /**
     * VIDEO
     */
    public static final int MATRIX_VIDEO_TYPE = 2;

    /*token请求参数名*/
    public static final String TOKEN_PARAMETER = "token";

    public static final String REQUIRED_PARAMETER = "params";

    public static final String SIGN_PARAMETER = "sign";

    /*userid请求参数名*/
    public static final String USERID_PARAMETER = "userid";



    /*不限制时间*/
    public static final int REDIS_IME_INFINITY = 0;
    /**
     * 用户LIMIT 10DAY
     */
    public static final int REDIS_USER_TIME_INFINITY = 3600 * 240;
    /**
     * TOKEN有效期
     */
    public static final int REDIS_TOKEN_TIME_INFINITY = 3600 * 240;


    /**
     * 地址界面SESSION TOKEN有效期
     * 半小时
     */
    public static final int REDIS_SESSION_TOKEN_TIME_INFINITY = 1800;




    /**
     * 返回APP的字符串
     */
    public static final int NETTY_OP_SUCESS = 0;

    public static final int NETTY_OP_FAILED = -1;

    public static final String PAY_SUCCESS_STR = "PAY_SUCCESS";

    public static final String ADD_RECEIVER_SUCCESS_STR = "ADD_RECEIVER_SUCCESS";

    public static final String ADD_RECEIVER_FAILED_STR = "ADD_RECEIVER_FAILED";

    public static final String UPDATE_RECEIVER_SUCCESS_STR = "UPDATE_RECEIVER_SUCCESS";

    public static final String UPDATE_RECEIVER_FAILED_STR = "UPDATE_RECEIVER_FAILED";













    public static  final String goodsCoverUrl="http://pic36.nipic.com/20131203/3822951_101052690000_2.jpg";

    /**
     * 虚拟卡流向
     */
    public  static  final  String FLOW_TO_SHOP="shop";


}

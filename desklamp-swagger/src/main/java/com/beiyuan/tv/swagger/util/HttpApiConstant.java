package com.hiveview.tv.swagger.util;

/**
 * Created by mikejiang on 2017/6/12.
 */
public class HttpApiConstant {

    /**
     * 获取商品
     */
    public static final String GET_GOODS_LIST="/api/tv/v1.0/goods/getGoods";
    /*public static final String GET_GOODS_BYID="/api/tv/v1.0/goods/getGoods/{goodsId}";*/

    /**
     * 获取会员沙龙的图片
     */
    public static final String GET_MEMBER_SHARON="/api/tv/v1.0/membersharon/getMemberSharon";

    /**
     * 获取首页导航栏
     */
    public static final String GET_NAVIGATION_BAR="/api/tv/v1.0/navigationbar/getBar";

    /**
     * 获取运营活动
     */
    public static final String GET_INDEX_OPERATION="/api/tv/v1.0/operation/getIndexOperation";


    /**
     * 获取跨界权益
     */
    public static final String GET_CROSS_BRODER="/api/tv/v1.0/crossborder/getCrossProfile";


    /**
     * 获取即将过期积分
     */
    public static final String GET_DUEINTEGRAL="/api/tv/v1.0/userIntegrals/getDueIntegral";

    /**
     * 积分流水
     */
    public static final String LIST_INTEGRALHISTORY="/api/tv/v1.0/userIntegrals/listIntegralHistory";

    /**
     * 确认订单
     */
    public static final String CONFIRMEXCHANGE="/api/tv/v1.0/purchase/confirmExchange";
   /*
   * 保存发票信息接口
   * */
   public static final String ADD_INVOICE="/api/tv/v1.0/userInvoice/addInvoice";

}

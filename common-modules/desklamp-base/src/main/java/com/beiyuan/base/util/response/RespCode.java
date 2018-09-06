package com.beiyuan.base.util.response;

/**
 * Created by leo on 2017/10/20.
 */
public enum RespCode implements ErrCode {
    SUCCESS(0L, "操作成功"),
    EN_SUCCESS(0L, "success"),
    FAIL(-1L, "操作失败"),
    EN_FAILED(-1L, "fail"),

    SYSTEM_ERROR(-1L, "system_error"),
    EN_PARAS_NOT_NULL(-1L, "parameter_null"),
    EN_ORDER_PAYMENTED_FAILED(1L, "order_paymented"),
    PARAS_NOT_NULL(-1L, "参数不能为空"),
    SIGN_ERROR(-2L, "SIGN错误"),

    SUCCESS_EXCHANGE(200000L, "兑换成功"),
    ABLE_TO_BUY(200001L, "可以换购"),

    FAIL_EXCHANGE(100000L, "兑换失败"),
    FAIL_BUY(100001L, "支付失败"),
    INTEGRAL_NOT_ENSURE(100002L, "积分不足"),
    BOX_NOT_ENSURE(100003L, "超过盒子限购次数"),
    USER_NOT_ENSURE(100004L, "超过用户限购次数"),
    FAIL_CREATE_ORDER(100005L, "生成订单失败"),
    STOCK_NOT_ENSURE(100006L, "已售罄"),
    CANT_FIND_USER(100007L, "用户不存在"),
    ORDER_ERROR(100008L, "订单不存在"),
    ORDER_ERROR_EN(100015L, "order is null"),
    FAIL_UPDATE_LOCK_STOCK(100009L, "更新库存失败"),
    FAIL_UPDATE_LOCK_INTEGRALS(100010L, "更新积分失败"),
    FAIL_UPDATE_ORDER_STATUS(100011L, "更新订单失败"),
    FAIL_FIND_GOODS(100012L, "找不到商品"),
    EXCHANGE_RATE_ERROR(100013L, "积分汇率获取失败"),
    EMPTY_RECORD(100014L, "交易记录为空"),
    USER_ERROR(100015L, "userId生成失败"),
    ILLEGAL_SHIPPING(100016L, "快递单号与快递公司填写不符"),
    ADD_SHIPPING_FAIL(100017L, "增加发货失败"),
    ADD_SHIPPING_ITEM_FAIL(100018L, "增加发货失败"),
    UPDATE_ORDER_FAIL(100019L, "更新订单失败"),
    GET_DELIVERY_FAILED(100020L, "查询物流失败"),
    DEL_DELIVERY_FAILED(100021L, "删除物流失败"),
    UPDATE_DELIVERY_FAILED(100022L, "更新物流失败"),
    ADD_DELIVERY_FAILED(100023L, "增加物流失败"),
    INSERT_ORDER_FAIL(100024L, "插入订单失败"),
    UPDATE_USER_FAIL(100025L, "更新用户积分失败"),
    INSERT_INTEGRAL_BILL_FAIL(100026L, "插入积分流水失败"),
    ORDER_RETURN_FAIL(100027L, "订单不可退"),
    UPDATE_USER_INTEGRALS_FAIL(100028L, "跟新用户积分失败"),
    INTEGRALS_ORDER_ERROR(100029L, "积分订单找不到"),
    GOODS_OFFLINE(100030L, "商品已下线");

    RespCode(long code, String name) {
        this.code = code;
        this.msg = name;
    }

    private long code;

    private String msg;

    @Override
    public long getCode() {
        return code;
    }

    public void setCode(long code) {
        this.code = code;
    }

    @Override
    public String getMsg() {
        return msg;
    }

    public void setMsg(String name) {
        this.msg = name;
    }
}

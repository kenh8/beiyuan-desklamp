package com.beiyuan.credit.entity;



import com.beiyuan.base.common.BaseEntity;

import java.util.Date;

/**
 * 
 * @author leo
 * @date 2018-04-12 15:24:21
 * @version 1.0.0
 * @copyright www.hiveview.com
 */
public class SmsSend extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 订单编号.
     */
    private String orderSn;

    /**
     * 发送时间.
     */
    private Date sendTime;

    /**
     * 接收人电话.
     */
    private String sendPhone;

    /**
     * 内容
     */
    private String sendMessage;


    private Byte status;

    /**
     * 
     * {@linkplain #orderSn}
     *
     * @return the value of t_sms_send.order_sn
     */
    public String getOrderSn() {
        return orderSn;
    }

    /**
     * {@linkplain #orderSn}
     * @param orderSn the value for t_sms_send.order_sn
     */
    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn == null ? null : orderSn.trim();
    }

    /**
     * 
     * {@linkplain #sendTime}
     *
     * @return the value of t_sms_send.send_time
     */
    public Date getSendTime() {
        return sendTime;
    }

    /**
     * {@linkplain #sendTime}
     * @param sendTime the value for t_sms_send.send_time
     */
    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    /**
     * 
     * {@linkplain #sendPhone}
     *
     * @return the value of t_sms_send.send_phone
     */
    public String getSendPhone() {
        return sendPhone;
    }

    /**
     * {@linkplain #sendPhone}
     * @param sendPhone the value for t_sms_send.send_phone
     */
    public void setSendPhone(String sendPhone) {
        this.sendPhone = sendPhone == null ? null : sendPhone.trim();
    }

    /**
     * 
     * {@linkplain #sendMessage}
     *
     * @return the value of t_sms_send.send_message
     */
    public String getSendMessage() {
        return sendMessage;
    }

    /**
     * {@linkplain #sendMessage}
     * @param sendMessage the value for t_sms_send.send_message
     */
    public void setSendMessage(String sendMessage) {
        this.sendMessage = sendMessage == null ? null : sendMessage.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}
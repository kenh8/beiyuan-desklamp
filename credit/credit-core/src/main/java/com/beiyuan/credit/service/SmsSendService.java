package com.beiyuan.credit.service;


import com.beiyuan.base.service.BaseCrudService;

import java.util.List;

/**
 * t_sms_send
 * 
 * @author leo
 * @date 2018-04-12 15:24:21
 * @version 1.0.0
 * @copyright www.hiveview.com
 */
public interface SmsSendService extends BaseCrudService {

    /**
     * 发送短信,返回是否成功
     * @param orderNumber
     * @return 成功 true 失败false 其他 null
     */
    Boolean sendMessage(String orderNumber);




}
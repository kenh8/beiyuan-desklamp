package com.beiyuan.admin.rpc.credit;

import com.alibaba.dubbo.config.annotation.Reference;

import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.credit.api.SmsSendApiService;
import org.springframework.stereotype.Component;

/**
 * Created by sh on 2018/4/16.
 */
@Component
public class SmsSendAapiComsumer {
    @Reference(registry = DubboConfiguration.ZOOKEEPER_CLIENT)
    private SmsSendApiService smsSendApiService;


    public boolean sendSms(String orderNum){
        return smsSendApiService.sendMassage(orderNum);

    }
}

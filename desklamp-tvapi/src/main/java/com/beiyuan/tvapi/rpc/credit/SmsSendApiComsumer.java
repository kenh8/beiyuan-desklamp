package com.beiyuan.tvapi.rpc.credit;

import com.alibaba.dubbo.config.annotation.Reference;

import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.credit.api.SmsSendApiService;
import org.springframework.stereotype.Component;

/**
 * Created by sh on 2018/4/12.
 */
@Component
public class SmsSendApiComsumer {
    @Reference(registry = DubboConfiguration.ZOOKEEPER_CLIENT)
    private SmsSendApiService smsSendApiService;
    public void sendMSg(String orderNumber){
        smsSendApiService.sendMassage(orderNumber);
    }
}

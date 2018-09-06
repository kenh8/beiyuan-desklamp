package com.beiyuan.credit.api;

import com.alibaba.dubbo.config.annotation.Service;
import com.beiyuan.config.dubbo.DubboConfiguration;

import com.beiyuan.credit.api.SmsSendApiService;
import com.beiyuan.credit.service.SmsSendService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by sh on 2018/4/12.
 */
@Service(registry = DubboConfiguration.ZOOKEEPER_SERVICE)
public class SmsSendApiServiceImpl implements SmsSendApiService {

    @Autowired
    private SmsSendService smsSendService;


    @Override
    public Boolean sendMassage(String  orderNumber) {
        return smsSendService.sendMessage(orderNumber);
    }


}

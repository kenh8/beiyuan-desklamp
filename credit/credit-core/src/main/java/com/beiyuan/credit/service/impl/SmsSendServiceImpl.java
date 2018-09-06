package com.beiyuan.credit.service.impl;

import com.alibaba.fastjson.JSON;

import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.service.impl.BaseCrudServiceImpl;
import com.beiyuan.credit.dao.SmsSendMapper;
import com.beiyuan.credit.service.SmsSendService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * @author sh
 * @version 1.0.0
 * @date 2018-04-12 15:24:21
 * @copyright www.beiyuan.com
 */
@Service("smsSendService")
public class SmsSendServiceImpl extends BaseCrudServiceImpl implements SmsSendService {

    @Autowired
    private SmsSendMapper smsSendMapper;



    /**
     * 发送短信,返回是否成功
     *
     * @param orderNum 订单号
     * @return 成功 true 失败false 其他 null
     */
    @Override
    @Transactional(rollbackFor = Exception.class,propagation = Propagation.NOT_SUPPORTED)
    public Boolean sendMessage(String orderNum) {
        return null;
    }


    @Override
    public CrudMapper init() {
        return this.smsSendMapper;
    }
}
package com.beiyuan.credit.controller;

import com.beiyuan.base.util.response.RespMsg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

/**
 * Created by leo on 2017/10/20.
 */
@RestController
@RequestMapping("/hello")
public class HelloController {


    private static final Logger log= LoggerFactory.getLogger(HelloController.class);


    @RequestMapping(value = "index")
    public RespMsg<?> index(){
        log.info("test info log text...");
        log.warn("test warn log text...");
        log.error("test error log text...");
        return RespMsg.successResp("嘿嘿测试乘公共");
    }


    @RequestMapping(value = "addData")
    public RespMsg<?> addData(String name){
        Random random=new Random();
        return RespMsg.successResp();
    }



}

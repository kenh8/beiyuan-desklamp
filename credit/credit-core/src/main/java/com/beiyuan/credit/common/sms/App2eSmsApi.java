package com.beiyuan.credit.common.sms;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.beiyuan.base.common.properties.Global;
import com.beiyuan.credit.common.HttpUtils;
import com.beiyuan.credit.common.OkHttp3Utils;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by leo on 2017/12/13.
 * 聚信 短信平台
 */
public class App2eSmsApi {

    private static final String API_URL="app2e.api.url";

    private static final String USERNAME="app2e.api.username";

    private static final String PWD="app2e.api.pwd";

    private static final int SUCCESS_STATUS=100;




    /**
     * 111是签名不合法
     *  105余额不足
     *
     *  101是参数错误
     * 短信发送
     * @param phones 可以多个 手机号 平台限制最多1000个 ","好隔开
     * @param msg
     */
    public static boolean sendMsg(String phones,String msg) throws UnsupportedEncodingException {
        Map<String,String> map=new HashMap<>();
        map.put("username", Global.getConfig(USERNAME));
        map.put("pwd", Global.getConfig(PWD));
        map.put("p",phones);
        map.put("msg", URLEncoder.encode(msg,"GBK"));
        String response= OkHttp3Utils.staticPost(Global.getConfig(API_URL),map);
        JSONObject json= JSON.parseObject(response);
        return SUCCESS_STATUS == json.getInteger("status");
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
       /* Map<String,String> map=new HashMap<>();
        map.put("username","dmkj");
        map.put("pwd","dd697af346d5a70be6cb090767932912");
        map.put("p","13267135642");
        map.put("msg", URLEncoder.encode("【家视天下】测试","GBK"));
        String response= HttpUtils.post("http://api.app2e.com/smsBigSend.api.php",map);
        JSONObject json= JSON.parseObject(response);
        System.out.println(json.getInteger("status"));*/

        Map<String,String> map=new HashMap<>();
        map.put("username","dmkj");
        map.put("pwd","dd697af346d5a70be6cb090767932912");
        map.put("p","13267135642");
        map.put("msg", URLEncoder.encode("【家视天下】测试","GBK"));
        String response= HttpUtils.post("http://api.app2e.com/smsBigSend.api.php",map);
        JSONObject json= JSON.parseObject(response);
        System.out.println(json.getInteger("status"));

    }

}


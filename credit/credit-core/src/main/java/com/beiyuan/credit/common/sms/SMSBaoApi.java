package com.beiyuan.credit.common.sms;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Lww on 2017/9/14.
 */
@Component("sMSBaoApi")
public class SMSBaoApi {
    private static final Logger logger= LoggerFactory.getLogger(SMSBaoApi.class);

    /**
     * 短信宝Api  接口
     * http://api.smsbao.com/sms?u=USERNAME&p=PASSWORD&m=PHONE&c=CODE
     */
    private String apiUrl = "http://api.smsbao.com/sms";
    // 用户名
    private String userName;
    // 密码
    private String passWord ;
    // 短信宝 成功发送返回的判断标志
    public static final String SEND_SUCCESS = "0";
    // 短信宝 发送异常自定义错误标志（lww）
    public static final String SEND_ERROR = "ERROR";



    // 短信宝api
    public String sendMessage(String userName, String passWord, String receivePhone, String content) {
        logger.info("发送短信开始-----userName----passWord---receivePhone---content----{},{},{},{}",userName,passWord,
                receivePhone,content);
        StringBuffer httpArg = new StringBuffer();
        httpArg.append("u=").append(userName).append("&");
        httpArg.append("p=").append(md5(passWord)).append("&");
        httpArg.append("m=").append(receivePhone).append("&");
        httpArg.append("c=").append(encodeUrlString(content, "UTF-8"));
        return request(apiUrl, httpArg.toString());
    }
    private String request(String httpUrl, String httpArg) {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        httpUrl = httpUrl + "?" + httpArg;

        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = reader.readLine();
            if (strRead != null) {
                sbf.append(strRead);
                while ((strRead = reader.readLine()) != null) {
                    sbf.append("\n");
                    sbf.append(strRead);
                }
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        if (result.equals(SEND_SUCCESS)) {
            return result;
        } else {
            logger.error("短信发送错误"+result);
            result = SEND_ERROR;
            return result;
        }
    }
    private String md5(String plainText) {
        StringBuffer buf = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
            int i;
            buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
        } catch (NoSuchAlgorithmException e) {
            logger.error("md5出错："+e.getMessage());
        }
        return buf.toString();
    }

    //对短信内容进行编码
    private String encodeUrlString(String str, String charset) {
        String strret = null;
        if (str == null)
            return str;
        try {
            strret = java.net.URLEncoder.encode(str, charset);
        } catch (Exception e) {
            logger.error("encodeUrlString出错："+e.getMessage());
            return null;
        }
        return strret;
    }

    public static void main(String[] args) {
        System.out.println(new SMSBaoApi().sendMessage("mikejiangmin","PinXuan2015","13267135642","测试测试"));
    }
}

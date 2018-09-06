package com.beiyuan.credit.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.*;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.*;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 基于httpclient4.5
 */
public class HttpUtils4 {
    final static int timeout =19000;
    private HttpUtils4() {
        throw new AssertionError();
    }

    private static Log logger = LogFactory.getLog(HttpUtils4.class);

    // get
    public static String getByJson(String url) {
        String resp = "";
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        httpGet.setHeader(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        resp = getString(resp, httpclient, httpGet);
        return resp;
    }

    public static String get(String url) {
        String resp = "";
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        resp = getString(resp, httpclient, httpGet);
        return resp;
    }

    private static String getString(String resp, CloseableHttpClient httpclient, HttpGet httpGet) {
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            int code = response.getStatusLine().getStatusCode();
            if (code == HttpStatus.SC_OK) {
                resp = EntityUtils.toString(entity, "UTF-8");
            }
            EntityUtils.consume(entity);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e);
        } finally {
            responseClose(response);
        }
        return resp;
    }

    // post
    public static String postByJson(String url, String json) {
        String resp = "";
        CloseableHttpClient httpclient;
        CloseableHttpResponse response = null;
        try {
            httpclient = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);
            StringEntity se = new StringEntity(json);
            se.setContentType("application/json;charset==UTF-8");
            httpPost.setEntity(se);
            response = httpclient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            int code = response.getStatusLine().getStatusCode();
            if (code == HttpStatus.SC_CREATED) {
                resp = EntityUtils.toString(entity, "UTF-8");
            }
            EntityUtils.consume(entity);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e);
        } finally {
            responseClose(response);
        }
        return resp;
    }


    // put
    public static String putByJson(String url, String json) {
        String resp = "";
        CloseableHttpClient httpclient;
        CloseableHttpResponse response = null;
        try {
            httpclient = HttpClients.createDefault();
            HttpPut httpPut = new HttpPut(url);
            StringEntity se = new StringEntity(json);
            se.setContentType("application/json;charset==UTF-8");
            httpPut.setEntity(se);
            response = httpclient.execute(httpPut);
            HttpEntity entity = response.getEntity();
            int code = response.getStatusLine().getStatusCode();
            if (code == HttpStatus.SC_OK) {
                resp = EntityUtils.toString(entity, "UTF-8");
            }
            EntityUtils.consume(entity);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e);
        } finally {
            responseClose(response);
        }
        return resp;
    }


    // delete
    public static boolean delete(String url) {
        CloseableHttpClient httpclient;
        CloseableHttpResponse response = null;
        try {
            httpclient = HttpClients.createDefault();
            HttpDelete httpDelete = new HttpDelete(url);
            response = httpclient.execute(httpDelete);
            HttpEntity entity = response.getEntity();
            int code = response.getStatusLine().getStatusCode();
            if (code == HttpStatus.SC_NO_CONTENT) {
                return true;
            }
            EntityUtils.consume(entity);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e);
        } finally {
            responseClose(response);
        }
        return false;
    }

    private static void responseClose(CloseableHttpResponse response) {
        try {
            if (response != null) {
                response.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
            logger.error(e);
        }
    }
    public static String doPost(String url, Map<String, String> paramsMap){
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().
                setConnectTimeout(180 * 1000).setConnectionRequestTimeout(180 * 1000)
                .setSocketTimeout(180 * 1000).setRedirectsEnabled(true).build();
        httpPost.setConfig(requestConfig);

        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        for (String key : paramsMap.keySet()) {
            nvps.add(new BasicNameValuePair(key, String.valueOf(paramsMap.get(key))));
        }
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
            logger.info("httpPost ===**********===>>> " + EntityUtils.toString(httpPost.getEntity()));
            HttpResponse response = httpClient.execute(httpPost);
            String strResult = "";
            if (response.getStatusLine().getStatusCode() == 200) {
                strResult = EntityUtils.toString(response.getEntity());
                return strResult;
            } else {
                return "Error Response: " + response.getStatusLine().toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "post failure :caused by-->" + e.getMessage().toString();
        }finally {
            if(null != httpClient){
                try {
                    httpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

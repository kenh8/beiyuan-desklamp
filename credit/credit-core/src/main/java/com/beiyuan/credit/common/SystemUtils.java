package com.beiyuan.credit.common;



import com.beiyuan.base.spring.SpringContextHolder;
import com.beiyuan.cache.redis.RedisService;

import static org.apache.commons.lang3.StringUtils.isNotEmpty;

/**
 * Created by ubuntu on 2018/4/8.
 */
public class SystemUtils {

    private static RedisService redisService= SpringContextHolder.getBean(RedisService.class);

    public static String getUpperCaseStrOfMacSn(String str) {
        if (isNotEmpty(str)) {
            return str.replaceAll("[：]", ":").toUpperCase();
        }
        return null;
    }

    public static String replaceColonMacSn(String str) {
        if (isNotEmpty(str)) {
            return str.replaceAll("[:：]", "").toUpperCase();
        }
        return null;
    }

}

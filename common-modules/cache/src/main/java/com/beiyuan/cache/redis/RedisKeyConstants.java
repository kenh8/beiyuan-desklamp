package com.beiyuan.cache.redis;

/**
 * Created by shehao on 2018/5/3.
 */
public class RedisKeyConstants {
    /**
     * 根据sessionID存用户名
     */
    public static final String SECURITY_SESSION_KEY="desklamp:security:session:%s";

    /**
     * 存放所有登录用户信息
     */
    public static final String SECURITY_USER_MAP_KEY="desklamp:security:user:map";
}

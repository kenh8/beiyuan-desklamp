package com.beiyuan.credit.annotation;

import java.lang.annotation.*;

/**
 * Created by ubuntu on 2018/5/4.
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface UpdateRedis {
    /**
     * key
     * @return
     */
    String redisKey() default "";
}

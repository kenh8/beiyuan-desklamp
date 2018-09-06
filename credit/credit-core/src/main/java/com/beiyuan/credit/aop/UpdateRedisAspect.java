package com.beiyuan.credit.aop;


import com.beiyuan.cache.redis.RedisService;
import com.beiyuan.credit.annotation.UpdateRedis;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * Created by ubuntu on 2018/5/4.
 */
@Component
@Aspect
public class UpdateRedisAspect {
    private static final Logger log = LoggerFactory.getLogger(UpdateRedisAspect.class);

    @Autowired
    private RedisService redisService;

    @After(value = "@annotation(redisKey)")
    public void after(JoinPoint point, UpdateRedis redisKey) throws Throwable {

        String s = redisKey.redisKey();
        try{
            updateRedis(s);
        }catch (Exception e){
            log.error(""+e);
            log.error("删除缓存失败：redisKey="+s);

        }
    }

    private void updateRedis(String key) {
        if (redisService.exists(key)) {
            redisService.deleteByKey(key);
        }
    }


}

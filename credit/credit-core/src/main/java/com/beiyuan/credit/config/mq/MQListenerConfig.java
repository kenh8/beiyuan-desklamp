package com.beiyuan.credit.config.mq;


import com.beiyuan.credit.config.mq.MQQueueConfig;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.handler.annotation.Payload;

/**
 * Created by leo on 2018/1/30.
 * MQ消息监听示例
 */
//@Configuration
public class MQListenerConfig {


    @RabbitListener(queues= MQQueueConfig.RETURN_SUCCESS_QUEUE, containerFactory="rabbitListenerContainerFactory")
    public void listener(@Payload String foo){
        System.out.println("queue1 receive msg "+foo);
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        /**
         * 调用出现异常的话, 该消息 会 持续不断地
         */
//        Assert.isTrue(false, "这里报错了");
        System.out.println("消息被成功消费:"+ foo);
    }

}

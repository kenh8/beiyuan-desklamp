package com.beiyuan.rabbitmq;


import com.beiyuan.config.mq.MQExchangeConfig;
import com.beiyuan.config.mq.MQQueueConfig;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by leo on 2018/1/31.
 * 消息发送 示例
 */
//@Component
public class MqSenderDemo {

    //@Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendMsg(Object obj){
        rabbitTemplate.convertAndSend(MQExchangeConfig.DIRECT_EXCHANGE, MQQueueConfig.TEST_QUEUE_1,obj);
    }
}

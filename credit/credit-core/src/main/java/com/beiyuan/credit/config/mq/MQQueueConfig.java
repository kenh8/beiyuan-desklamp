package com.beiyuan.credit.config.mq;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by leo on 2018/1/30.
 * 队列绑定交换机 示例
 */
//@Configuration
public class MQQueueConfig {

    @Autowired
    private DirectExchange directExchange;
    
    public static final String RETURN_FAIL_QUEUE="return_fail_queue";

    public static final String RETURN_SUCCESS_QUEUE="return_success_queue";

    @Bean
    public Queue returnSuccessQueue(){
        return new Queue(RETURN_SUCCESS_QUEUE);
    }
    @Bean
    public Queue returnFailQueue(){
        return new Queue(RETURN_FAIL_QUEUE);
    }


    @Bean
    public Binding directSuccessBinding(){
        Binding binding = BindingBuilder.bind(returnSuccessQueue()).to(directExchange).with(RETURN_SUCCESS_QUEUE);
        return binding;
    }
    @Bean
    public Binding directFailBinding(){
        Binding binding = BindingBuilder.bind(returnFailQueue()).to(directExchange).with(RETURN_FAIL_QUEUE);
        return binding;
    }

}

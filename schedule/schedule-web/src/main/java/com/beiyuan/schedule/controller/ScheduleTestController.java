package com.beiyuan.schedule.controller;


import com.beiyuan.base.mybatis.page.Page;
import com.beiyuan.schedule.service.ScheduleJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by leo on 2018/1/10.
 */
@RestController
public class ScheduleTestController{
    @Autowired
    private ScheduleJobService scheduleJobService;

    @RequestMapping(value = "pageTest")
    public Page pageTest(Page page){
        scheduleJobService.findByPage(page);
        return page;
    }
}

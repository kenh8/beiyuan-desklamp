package com.beiyuan.tvapi.rpc.schedule;

import com.alibaba.dubbo.config.annotation.Reference;
import com.beiyuan.common.api.ModifyCommonDto;
import com.beiyuan.common.api.PageDto;
import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.schedule.api.ScheduleJobApiService;
import com.beiyuan.schedule.dto.ScheduleJobDto;


import org.springframework.stereotype.Component;

/**
 * Created by leo on 2018/1/15.
 */
@Component
public class ScheduleApiConsumer {

    @Reference(registry = DubboConfiguration.ZOOKEEPER_CLIENT)
    private ScheduleJobApiService scheduleJobApiService;


    public PageDto findPage(PageDto page, ScheduleJobDto dto){
        return scheduleJobApiService.findPage(page, dto);
    }

    public ScheduleJobDto findById(Long id){
        return scheduleJobApiService.findById(id);
    }

    public void saveData(ScheduleJobDto dto){
        scheduleJobApiService.saveData(dto);
    }

    public void modifyData(ModifyCommonDto dto){
        scheduleJobApiService.modifyData(dto);
    }

}

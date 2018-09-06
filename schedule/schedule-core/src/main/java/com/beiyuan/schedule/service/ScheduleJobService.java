package com.beiyuan.schedule.service;


import com.beiyuan.base.service.BaseCrudService;
import com.beiyuan.common.api.ModifyCommonDto;
import com.beiyuan.schedule.entity.ScheduleJob;

/**
 * Created by leo on 2018/1/10.
 */
public interface ScheduleJobService extends BaseCrudService<ScheduleJob> {

    void modifyData(ModifyCommonDto dto);
}

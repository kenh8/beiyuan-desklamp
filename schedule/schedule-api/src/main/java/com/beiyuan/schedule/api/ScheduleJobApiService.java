package com.beiyuan.schedule.api;


import com.beiyuan.common.api.CrudApiService;
import com.beiyuan.common.api.ModifyCommonDto;
import com.beiyuan.schedule.dto.ScheduleJobDto;

/**
 * Created by leo on 2018/1/10.
 */
public interface ScheduleJobApiService  extends CrudApiService<ScheduleJobDto> {

    void modifyData(ModifyCommonDto dto);
}

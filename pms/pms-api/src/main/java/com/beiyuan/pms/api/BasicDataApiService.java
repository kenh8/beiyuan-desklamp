package com.beiyuan.pms.api;


import com.beiyuan.common.api.CrudApiService;
import com.beiyuan.common.api.ModifyCommonDto;
import com.beiyuan.pms.dto.BasicDataDto;

/**
 * Created by leo on 2018/1/15.
 */
public interface BasicDataApiService extends CrudApiService<BasicDataDto> {

    void modifyData(ModifyCommonDto dto);
}

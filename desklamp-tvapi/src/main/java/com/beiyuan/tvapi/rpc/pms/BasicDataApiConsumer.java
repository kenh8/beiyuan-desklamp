package com.beiyuan.tvapi.rpc.pms;

import com.alibaba.dubbo.config.annotation.Reference;
import com.beiyuan.common.api.ModifyCommonDto;
import com.beiyuan.common.api.PageDto;
import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.pms.api.BasicDataApiService;
import com.beiyuan.pms.api.BasicDataTypeApiService;
import com.beiyuan.pms.dto.BasicDataDto;
import com.beiyuan.pms.dto.BasicDataTypeDto;


import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by leo on 2018/2/5.
 * 基础数据
 */
@Component
public class BasicDataApiConsumer {

    @Reference(registry = DubboConfiguration.ZOOKEEPER_CLIENT)
    private BasicDataApiService basicDataApiService;

    @Reference(registry = DubboConfiguration.ZOOKEEPER_CLIENT)
    private BasicDataTypeApiService basicDataTypeApiService;


    public List<BasicDataTypeDto> findTypeList(BasicDataTypeDto dto){
       return basicDataTypeApiService.findList(dto);
    }

    public BasicDataTypeDto findTypeById(long id){
       return basicDataTypeApiService.findById(Long.valueOf(id));
    }

    public BasicDataDto findById(long id){
        return basicDataApiService.findById(id);
    }

    public void moidfyData(ModifyCommonDto dto){
        basicDataApiService.modifyData(dto);
    }

    public PageDto findByPage(PageDto page, BasicDataDto params){
        return basicDataApiService.findPage(page, params);
    }

    public void saveData(BasicDataDto dto){
        basicDataApiService.saveData(dto);
    }

    public void saveTypeData(BasicDataTypeDto dto){
        basicDataTypeApiService.saveData(dto);
    }

}

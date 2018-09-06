package com.beiyuan.pms.service;


import com.beiyuan.base.service.BaseCrudService;
import com.beiyuan.pms.entity.basic.BasicDataType;

/**
 * basic_data_type
 * 
 * @author hiveview
 * @date 2018-01-15 17:01:06
 * @version 1.0.0
 * @copyright www.hiveview.com
 */
public interface BasicDataTypeService extends BaseCrudService<BasicDataType> {

    BasicDataType getByCode(String code);
}
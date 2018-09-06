package com.beiyuan.pms.service.impl;


import javax.annotation.Resource;

import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.exception.ServiceException;
import com.beiyuan.base.service.impl.BaseCrudServiceImpl;
import com.beiyuan.pms.dao.BasicDataTypeMapper;
import com.beiyuan.pms.entity.basic.BasicDataType;
import com.beiyuan.pms.service.BasicDataTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 */
@Service("basicDataTypeService")
public class BasicDataTypeServiceImpl extends BaseCrudServiceImpl<BasicDataType> implements BasicDataTypeService {

    @Resource
    private BasicDataTypeMapper basicDataTypeMapper;

    @Override
    public CrudMapper init() {
        return basicDataTypeMapper;
    }

    @Override
    public BasicDataType getByCode(String code) {
        if(StringUtils.hasText(code)){
            Map<String,Object> map = new HashMap<>();
            map.put("code", code);
            BasicDataType data = this.findOneByBiz(map);
            return data;
        }
        return null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int saveData(BasicDataType entity) throws ServiceException {
        Assert.notNull(entity);
        if(null == entity.getMultipleOnline()){
            entity.setMultipleOnline(true);//默认允许多条数据启用
        }
        if(null == entity.getId()){
            Assert.hasText(entity.getCode(),"编码不能为空");
            int check=getCountByCode(entity.getCode());
            Assert.isTrue(check == 0,"编码不唯一");
            if(!StringUtils.isEmpty(entity.getParentCode())){
                Map<String,Object> map=new HashMap<>();
                map.put("code",entity.getParentCode());
                BasicDataType parent=findOneByBiz(map);
                Assert.notNull(parent,"上级编码有误");
                entity.setLevel(parent.getLevel()+1);
                entity.setLongCode(parent.getLongCode()+","+entity.getCode());
            }else{//一级数据
                entity.setLevel(1);
                entity.setLongCode(entity.getCode());
            }
            return basicDataTypeMapper.insert(entity);
        }else{
            BasicDataType old=this.findById(entity.getId());
            Assert.notNull(old);
            return basicDataTypeMapper.updateByPrimaryKeySelective(entity);
        }
    }

    public int getCountByCode(String code){
        Map<String,Object> map=new HashMap<>();
        map.put("code", code);
        int count = basicDataTypeMapper.selectCount(map);
        return count;
    }
}
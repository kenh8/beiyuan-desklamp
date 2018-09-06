package com.beiyuan.pms.dao;


import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.mybatis.annotation.MyBatisDao;

@MyBatisDao
public interface SysResourceMapper extends CrudMapper {
    /**
     * 校验是否包含下级数据
     * @param id
     * @return
     */
    int checkChildCount(Long id);
}
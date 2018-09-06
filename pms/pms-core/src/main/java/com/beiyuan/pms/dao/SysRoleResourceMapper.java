package com.beiyuan.pms.dao;


import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.mybatis.annotation.MyBatisDao;

/**
 * sys_role_resource
 * 
 * @author beiyuan
 * @date 2017-11-03 17:24:06
 * @version 1.0.0
 * @copyright www.beiyuan.com
 */
@MyBatisDao
public interface SysRoleResourceMapper extends CrudMapper {

    int deleteByRoleCode(String roleCode);
}
package com.beiyuan.pms.service;


import com.beiyuan.base.service.BaseCrudService;
import com.beiyuan.pms.entity.sys.SysRoleResource;

/**
 * sys_role_resource
 * 
 * @author hiveview
 * @date 2017-11-03 17:24:06
 * @version 1.0.0
 * @copyright www.hiveview.com
 */
public interface SysRoleResourceService extends BaseCrudService<SysRoleResource> {

    /**
     * 根据角色编码删除 关联数据
     * @param roleCode
     * @return
     */
    int deleteByRoleCode(String roleCode);
}
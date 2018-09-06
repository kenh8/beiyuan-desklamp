package com.beiyuan.pms.service.impl;


import javax.annotation.Resource;

import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.service.impl.BaseCrudServiceImpl;
import com.beiyuan.pms.dao.SysUserRoleMapper;
import com.beiyuan.pms.entity.sys.SysUserRole;
import com.beiyuan.pms.service.SysUserRoleService;
import org.springframework.stereotype.Service;

/**
 */
@Service("sysUserRoleService")
public class SysUserRoleServiceImpl extends BaseCrudServiceImpl<SysUserRole> implements SysUserRoleService {

    @Resource
    private SysUserRoleMapper sysUserRoleMapper;

    @Override
    public CrudMapper init() {
        return sysUserRoleMapper;
    }
}
package com.beiyuan.pms.service.impl;


import javax.annotation.Resource;

import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.service.impl.BaseCrudServiceImpl;
import com.beiyuan.pms.dao.SysRoleResourceMapper;
import com.beiyuan.pms.entity.sys.SysRoleResource;
import com.beiyuan.pms.service.SysRoleResourceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 */
@Service("sysRoleResourceService")
public class SysRoleResourceServiceImpl extends BaseCrudServiceImpl<SysRoleResource> implements SysRoleResourceService {

    @Resource
    private SysRoleResourceMapper sysRoleResourceMapper;

    @Override
    public CrudMapper init() {
        return sysRoleResourceMapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteByRoleCode(String roleCode) {
        return sysRoleResourceMapper.deleteByRoleCode(roleCode);
    }
}
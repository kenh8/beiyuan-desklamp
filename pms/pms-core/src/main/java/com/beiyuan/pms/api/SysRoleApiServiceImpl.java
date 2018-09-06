package com.beiyuan.pms.api;

import com.alibaba.dubbo.config.annotation.Service;
import com.beiyuan.base.util.serializer.ObjectUtils;
import com.beiyuan.common.api.PageDto;
import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.pms.common.WrapperApiService;
import com.beiyuan.pms.dto.RoleResourceDto;
import com.beiyuan.pms.dto.SysRoleDto;
import com.beiyuan.pms.entity.sys.SysRole;
import com.beiyuan.pms.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by leo on 2017/11/6.
 */
@Service(registry = DubboConfiguration.ZOOKEEPER_SERVICE)
public class SysRoleApiServiceImpl implements SysRoleApiService {

    @Autowired
    private SysRoleService roleService;

    @Override
    public SysRoleDto findById(Long id) {
        SysRole role=roleService.findById(id);
        return ObjectUtils.copyObject(role,SysRoleDto.class);
    }

    @Override
    @Transactional
    public int saveData(SysRoleDto data) {
        return roleService.saveData(ObjectUtils.copyObject(data,SysRole.class));
    }

    @Override
    @Transactional
    public int deleteData(SysRoleDto data) {
        SysRole role=ObjectUtils.copyObject(data,SysRole.class);
        return roleService.deleteById(role.getId());
    }

    @Override
    public List<SysRoleDto> findList(SysRoleDto params) {
        List<SysRole> list=roleService.findByBiz(ObjectUtils.changeToMap(params));
        return ObjectUtils.copyListObject(list,SysRoleDto.class);
    }

    @Override
    public PageDto<SysRoleDto> findPage(PageDto<SysRoleDto> page, SysRoleDto params) {
        return WrapperApiService.findByPage(page,params,roleService,SysRoleDto.class);
    }

    @Override
    @Transactional
    public int modifyData(SysRoleDto dto) {
        return roleService.modifyData(ObjectUtils.copyObject(dto,SysRole.class));
    }

    @Override
    @Transactional
    public void roleResourceSave(RoleResourceDto dto) {
       roleService.roleResourceSave(dto);
    }
}

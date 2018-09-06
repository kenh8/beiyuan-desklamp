package com.beiyuan.pms.api;

import com.beiyuan.common.api.CrudApiService;
import com.beiyuan.pms.dto.RoleResourceDto;
import com.beiyuan.pms.dto.SysRoleDto;


/**
 * Created by leo on 2017/11/3.
 */
public interface SysRoleApiService extends CrudApiService<SysRoleDto> {

    /**
     * 数据 启用 禁用
     * @param dto
     * @return
     */
    int modifyData(SysRoleDto dto);

    void roleResourceSave(RoleResourceDto dto);

}

package com.beiyuan.pms.api;

import com.beiyuan.common.api.CrudApiService;
import com.beiyuan.pms.dto.SysResourceDto;



import java.util.List;

/**
 */
public interface SysResourceApiService extends CrudApiService<SysResourceDto> {

    /**
     * 根据角色获取 权限信息
     * @param roleSn
     * @return
     */
    List<SysResourceDto> getResourceByRole(String roleSn);
}

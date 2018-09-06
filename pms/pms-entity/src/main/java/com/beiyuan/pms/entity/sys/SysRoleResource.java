package com.beiyuan.pms.entity.sys;


import com.beiyuan.base.common.BaseEntity;
import lombok.Data;


@Data
public class SysRoleResource extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 角色编码.
     */
    private String roleCode;

    /**
     * 资源编码.
     */
    private String resourceCode;
}
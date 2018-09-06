package com.beiyuan.pms.entity.sys;


import com.beiyuan.base.common.BaseEntity;
import lombok.Data;

@Data
public class SysRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

    public static final String ROLE_TYPE_COMMON="COMMON";

    public static final String ROLE_TYPE_SUPER_ADMIN="SUPER_ADMIN";

    public static final Integer ROLE_STATUS_ENABLE=1;

    public static final Integer ROLE_STATUS_DISABLE=2;

    /**
     * 编码.
     */
    private String code;

    /**
     * 名称.
     */
    private String name;

    /**
     * 状态(1:启用,2:禁用).
     */
    private Integer status;

    /**
     * 角色类型.
     */
    private String roleType;

    /**
     * 备注.
     */
    private String remark;

}
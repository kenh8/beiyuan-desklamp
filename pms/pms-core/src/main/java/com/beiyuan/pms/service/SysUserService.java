package com.beiyuan.pms.service;


import com.beiyuan.base.service.BaseCrudService;
import com.beiyuan.pms.dto.SysUserDto;
import com.beiyuan.pms.entity.sys.SysUser;

/**
 * sys_user
 * 
 * @author hiveview
 * @date 2017-11-03 17:24:06
 * @version 1.0.0
 * @copyright www.hiveview.com
 */
public interface SysUserService extends BaseCrudService<SysUser> {

    void modifyData(SysUser dto);

    /**
     * 修改密码
     * @param user
     */
   void modifyPwd(SysUserDto user);
}
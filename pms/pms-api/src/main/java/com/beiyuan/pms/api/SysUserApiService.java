package com.beiyuan.pms.api;

import com.beiyuan.common.api.CrudApiService;
import com.beiyuan.pms.dto.SysUserDto;



/**
 * Created by leo on 2017/10/24.
 */
public interface SysUserApiService extends CrudApiService<SysUserDto> {

    SysUserDto getUserByUserName(String userName);

    void modifyData(SysUserDto dto);

    void rpcTest();

    void modifyPwd(SysUserDto dto);
}

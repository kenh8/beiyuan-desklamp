package com.beiyuan.admin.rpc.pms;

import com.alibaba.dubbo.config.annotation.Reference;
import com.beiyuan.common.api.PageDto;
import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.pms.api.SysUserApiService;
import com.beiyuan.pms.dto.SysUserDto;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.util.List;


@Component
public class SysUserApiConsumer {
    private static final Logger logger = LoggerFactory.getLogger(SysUserApiConsumer.class);

    @Reference(registry = DubboConfiguration.ZOOKEEPER_CLIENT)
    private SysUserApiService sysUserApiService;


    public SysUserDto getUserByUserName(String userName) {
        return sysUserApiService.getUserByUserName(userName);
    }


    /**
     * 分页数据
     *
     * @param page
     * @param params
     * @return
     */
    public PageDto<SysUserDto> findPage(PageDto page, SysUserDto params) {
        return sysUserApiService.findPage(page, params);
    }

    public SysUserDto findById(String id) {
        Assert.hasText(id, "ID不能为空");
        return sysUserApiService.findById(Long.valueOf(id));
    }

    /**
     * 保存数据
     *
     * @param dto
     * @return
     */
    public int saveData(SysUserDto dto) {
        return sysUserApiService.saveData(dto);
    }

    /**
     * 启用禁用
     *
     * @param dto
     */
    public void modifyData(SysUserDto dto) {
        sysUserApiService.modifyData(dto);
    }

    public List<SysUserDto> findList(SysUserDto dto) {
        return sysUserApiService.findList(dto);
    }

    public void modifyPwd(SysUserDto dto) {
        sysUserApiService.modifyPwd(dto);
    }

    public SysUserDto findUserById(String id) {
        SysUserDto sysUserDto = this.findById(id);
        return sysUserDto;
    }
}

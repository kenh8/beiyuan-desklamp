package com.beiyuan.pms.api;

import com.alibaba.dubbo.config.annotation.Service;
import com.beiyuan.base.util.serializer.ObjectUtils;
import com.beiyuan.common.api.PageDto;
import com.beiyuan.config.dubbo.DubboConfiguration;
import com.beiyuan.pms.common.WrapperApiService;
import com.beiyuan.pms.dto.SysUserDto;
import com.beiyuan.pms.entity.sys.SysUser;
import com.beiyuan.pms.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by leo on 2017/11/6.
 */
@Service(registry = DubboConfiguration.ZOOKEEPER_SERVICE)
public class SysUserApiServiceImpl implements SysUserApiService {

    @Autowired
    private SysUserService sysUserService;

    @Override
    public SysUserDto getUserByUserName(String userName) {
        Map<String,Object> params=new HashMap<>();
        params.put("username",userName);
        List<SysUser> ulist=sysUserService.findByBiz(params);
        if(!CollectionUtils.isEmpty(ulist)){
            return ObjectUtils.copyObject(ulist.get(0),SysUserDto.class);
        }
        return null;
    }

    @Override
    public SysUserDto findById(Long id) {
        SysUser user=sysUserService.findById(id);
        return ObjectUtils.copyObject(user,SysUserDto.class);
    }

    @Override
    @Transactional
    public void modifyData(SysUserDto dto) {
        sysUserService.modifyData(ObjectUtils.copyObject(dto,SysUser.class));
    }

    @Override
    public void rpcTest() {
        System.out.println("rpc test......");
    }



    @Override
    @Transactional
    public int saveData(SysUserDto data) {
        return sysUserService.saveData(ObjectUtils.copyObject(data,SysUser.class));
    }

    @Override
    public int deleteData(SysUserDto data) {
        return sysUserService.deleteById(Long.valueOf(data.getId()));
    }

    @Override
    public List<SysUserDto> findList(SysUserDto params) {
        List<SysUser> list=sysUserService.findByBiz(ObjectUtils.changeToMap(params));
        return ObjectUtils.copyListObject(list,SysUserDto.class);
    }

    @Override
    public PageDto<SysUserDto> findPage(PageDto<SysUserDto> page, SysUserDto params) {
        return WrapperApiService.findByPage(page, params, sysUserService, SysUserDto.class);
    }


    @Override
    public void modifyPwd(SysUserDto dto) {
        sysUserService.modifyPwd(dto);
    }
}

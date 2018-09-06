package com.beiyuan.pms.service.impl;


import javax.annotation.Resource;

import com.beiyuan.base.common.BaseConstants;
import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.exception.ServiceException;
import com.beiyuan.base.service.impl.BaseCrudServiceImpl;
import com.beiyuan.base.util.encry.EncryUtils;
import com.beiyuan.pms.dao.SysUserMapper;
import com.beiyuan.pms.dto.SysUserDto;
import com.beiyuan.pms.entity.sys.SysUser;
import com.beiyuan.pms.service.SysUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author hiveview
 * @date 2017-11-03 17:24:06
 * @version 1.0.0
 * @copyright www.hiveview.com
 */
@Service("sysUserService")
public class SysUserServiceImpl extends BaseCrudServiceImpl<SysUser> implements SysUserService {

    @Resource
    private SysUserMapper sysUserMapper;

    @Override
    public CrudMapper init() {
        return sysUserMapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void modifyData(SysUser dto) {
        Assert.notNull(dto,"参数不能为空");
        Assert.isTrue(null != dto.getId() && null != dto.getStatus(),"ID和修改状态不能为空");
        //状态只有1,2
        Assert.isTrue(dto.getStatus() == BaseConstants.ENABLE_STATUS || dto.getStatus() == BaseConstants.DISABLE_STATUS,"状态数据不正确");
        SysUser old=sysUserMapper.selectByPrimaryKey(dto.getId());
        Assert.notNull(old,"ID无效");
        Assert.isTrue(dto.getStatus() != old.getStatus(),"数据已经被修改");
        sysUserMapper.updateByPrimaryKeySelective(dto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int saveData(SysUser entity) throws ServiceException {
        Assert.notNull(entity,"参数不能为空");
        if(null != entity.getId()){
            if(StringUtils.hasText(entity.getPassword())){
                //有修改密码
                entity.setPassword(EncryUtils.encryPwd(entity.getPassword()));
            }else{
                entity.setPassword(null);//因为会传 空字符串 过来
            }
            return sysUserMapper.updateByPrimaryKeySelective(entity);
        }else{
            //新增
            entity.setPassword(EncryUtils.encryPwd(entity.getPassword()));
            entity.setStatus(BaseConstants.ENABLE_STATUS);//默认启用状态
            entity.setUsername(entity.getEmail());
            Map<String,Object>  map=new HashMap<>();
            map.put("username",entity.getEmail());
            int count=sysUserMapper.selectCount(map);
            Assert.isTrue(count == 0,"该电子邮箱已经注册过了");
            return sysUserMapper.insert(entity);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void modifyPwd(SysUserDto user) {
        Assert.notNull(user,"参数不能为空");
        Assert.hasText(user.getOldPassword(),"旧密码不能为空");
        Assert.hasText(user.getPassword(),"新密码不能为空");
        Assert.isTrue(!user.getPassword().equals(user.getOldPassword()),"新密码不能与旧密码相同");
        SysUser old=this.findById(Long.valueOf(user.getId()));
        if(EncryUtils.encryPwd(user.getOldPassword()).equals(old.getPassword())){
            old.setPassword(EncryUtils.encryPwd(user.getPassword()));
            this.sysUserMapper.updateByPrimaryKey(old);
        }else{
            throw new ServiceException("旧密码不正确");
        }
    }


}
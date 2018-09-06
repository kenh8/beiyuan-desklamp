package com.beiyuan.pms.service.impl;


import javax.annotation.Resource;

import com.beiyuan.base.dao.CrudMapper;
import com.beiyuan.base.service.impl.BaseCrudServiceImpl;
import com.beiyuan.pms.dao.SubSystemMapper;
import com.beiyuan.pms.entity.sys.SubSystem;
import com.beiyuan.pms.service.SubSystemService;
import org.springframework.stereotype.Service;


@Service("subSystemService")
public class SubSystemServiceImpl extends BaseCrudServiceImpl<SubSystem> implements SubSystemService {

    @Resource
    private SubSystemMapper subSystemMapper;

    @Override
    public CrudMapper init() {
        return subSystemMapper;
    }
}
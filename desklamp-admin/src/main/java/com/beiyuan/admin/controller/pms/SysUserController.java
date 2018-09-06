package com.beiyuan.admin.controller.pms;


import com.beiyuan.admin.commom.BaseController;
import com.beiyuan.admin.commom.SystemUserUtils;
import com.beiyuan.admin.rpc.pms.SysRoleApiConsumer;
import com.beiyuan.admin.rpc.pms.SysUserApiConsumer;
import com.beiyuan.base.util.response.RespMsg;
import com.beiyuan.common.api.PageDto;
import com.beiyuan.pms.dto.SysRoleDto;
import com.beiyuan.pms.dto.SysUserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by leo on 2017/11/6.
 */
@RequestMapping("/pms/user")
@Controller
public class SysUserController extends BaseController {

    @Autowired
    private SysUserApiConsumer userApiConsumer;

    @Autowired
    private SysRoleApiConsumer roleApiConsumer;



    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView list() {
        return new ModelAndView("pms/user/user_list");
    }

    @RequestMapping(value = "listData")
    public @ResponseBody
    PageDto<SysUserDto> listData(PageDto page, SysUserDto dto) {
        return userApiConsumer.findPage(page, dto);
    }

    /**
     * 添加 编辑页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public ModelAndView edit(ModelMap model) {
        SysRoleDto dto = new SysRoleDto();
        dto.setExceptRoleType("SUPER_ADMIN");//过滤掉超级管理员
        model.put("roleList", roleApiConsumer.findList(dto));
        if (StringUtils.hasText(getString("id"))) {
            model.put("data", userApiConsumer.findUserById(getString("id")));
        }
        return new ModelAndView("pms/user/user_edit");
    }

    @RequestMapping(value = "saveData", method = RequestMethod.POST)
    public @ResponseBody
    RespMsg<?> saveData(SysUserDto dto) {
        try {
            putOperatorInfo(dto);
            userApiConsumer.saveData(dto);
        } catch (Exception e) {
            return RespMsg.failResp(e.getMessage());
        }
        return RespMsg.successResp();
    }

    /**
     * 启用禁用
     *
     * @param dto
     * @return
     */
    @RequestMapping(value = "modifyData", method = RequestMethod.POST)
    public @ResponseBody
    RespMsg<?> modifyData(SysUserDto dto) {
        try {
            userApiConsumer.modifyData(dto);
        } catch (Exception e) {
            return RespMsg.failResp(e.getMessage());
        }
        return RespMsg.successResp();
    }

    /**
     * 修改密码
     *
     * @return
     */
    @RequestMapping(value = "toModifyPwd", method = RequestMethod.GET)
    public ModelAndView toModifyPwd() {
        return new ModelAndView("pms/user/modify_pwd");
    }


    /**
     * 修改密码
     *
     * @param dto
     * @return
     */
    @RequestMapping(value = "modifyPwd", method = RequestMethod.POST)
    public @ResponseBody
    RespMsg<?> modifyPwd(SysUserDto dto) {
        try {
            SysUserDto currentUser = SystemUserUtils.getCurrentUser();
            dto.setId(currentUser.getId());
            dto.setUsername(currentUser.getUsername());
            userApiConsumer.modifyPwd(dto);


        } catch (Exception e) {
            return RespMsg.failResp(e.getMessage());
        }
        return RespMsg.successResp();
    }

}

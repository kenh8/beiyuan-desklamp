package com.hiveview.tv.swagger.controller.scrm;

import com.hiveview.base.util.http.OkHttp3Utils;
import com.hiveview.base.util.response.RespMsg;
import com.hiveview.tv.swagger.common.BaseController;
import com.hiveview.tv.swagger.util.Global;
import com.hiveview.tv.swagger.util.HttpApiConstant;
import io.swagger.annotations.*;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by sh on 2018/3/29.
 */
@Api(value = "会员沙龙",tags = "会员沙龙模块")

@Controller
@RequestMapping("/swagger/api/tv/v1.0/membersharon/*")
public class ApiMemberSharonController extends BaseController {

    @ApiOperation(value = "获取一张图片,一期会员沙龙只展示一张长图")
    @ApiResponse(code = 0, message = "操作成功", response = RespMsg.class)
    @ApiImplicitParams({
            /*@ApiImplicitParam(name = "buildId", value = "接口版本号", required = true, dataType = "String",paramType="header"),
            @ApiImplicitParam(name = "userToken", value = "用户的token信息", required = true, dataType = "String",paramType="header"),
            @ApiImplicitParam(name = "userId", value = "用户id", required = true, dataType = "String",paramType="header"),
            @ApiImplicitParam(name = "id", value = "筹款动态id", required = true, dataType = "int",paramType="path"),*/
           /* @ApiImplicitParam(name = "entity", value = "{\"desc\":\"项目最新进展\",\"images\":[\"图片\",\"图片\"],\"pid\":项目id,\"targetMoney\":修改后的目标金额}", required = true, dataType = "string",paramType="form")*/
            /*@ApiImplicitParam(name = "pageSize", value = "每页条数", required = true, dataType = "int",paramType="form"),
            @ApiImplicitParam(name = "pageIndex", value = "第几页", required = true, dataType = "int",paramType="query")*/
    })
    @RequestMapping(value = "getMemberSharon", method = RequestMethod.GET)
    public @ResponseBody
    Object getIntegral(){

        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.GET_MEMBER_SHARON, new
                HashedMap());
        return resp;
    }

}

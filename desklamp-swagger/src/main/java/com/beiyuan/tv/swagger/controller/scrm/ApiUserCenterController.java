package com.hiveview.tv.swagger.controller.scrm;

import com.google.common.collect.Maps;
import com.hiveview.base.util.http.OkHttp3Utils;
import com.hiveview.base.util.response.RespMsg;
import com.hiveview.credit.dto.IntegralOrderHistoryDto;
import com.hiveview.tv.swagger.common.BaseController;
import com.hiveview.tv.swagger.util.Global;
import com.hiveview.tv.swagger.util.HttpApiConstant;
import io.swagger.annotations.*;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by ubuntu on 2018/3/30.
 */

@Api(value = "用户积分中心",tags = "用户积分中心")
@RequestMapping("/swagger/api/tv/v1.0/userIntegrals/*")
@Controller
public class ApiUserCenterController extends BaseController {

    @ApiOperation(value = "用户即将过期积分")
    @ApiResponse(code = 0, message = "操作成功", response = RespMsg.class)
    @RequestMapping(value = "getDueIntegral", method = RequestMethod.POST)
    /*@ApiImplicitParams({
            @ApiImplicitParam(name = "unionId", value = "用户id", required = true, dataType = "String",paramType="form")
    })*/
    public @ResponseBody
    Object getDueIntegral(@RequestBody @ApiParam(name ="{\"unionId\":11} ") String unionId){

        HashedMap map = new HashedMap();
        map.put("unionId",unionId);
        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.GET_DUEINTEGRAL,map);
        return resp;
    }

    @ApiOperation(value = "积分流水")
    @ApiResponse(code = 0, message = "操作成功", response = RespMsg.class)
    @RequestMapping(value = "listIntegralHistory", method = RequestMethod.POST)
   /* @ApiImplicitParams({
            @ApiImplicitParam(name = "unionId", value = "用户Id", required = true, dataType = "int",paramType="form"),
            @ApiImplicitParam(name = "pageIndex", value = "第几页", required = true, dataType = "int",paramType="form"),
            @ApiImplicitParam(name = "pageSize", value = "每页几条", required = true, dataType = "int",paramType="form")
    })*/
    public @ResponseBody
    Object listIntegralHistory(@RequestBody @ApiParam(name ="{\"unionId\":11,\"pageIndex\":0,\"pageSize\":5} " ,value = "传入json对象" ,required = true) IntegralOrderHistoryDto integralOrderHistoryDto){

        //String unionId, String pageIndex, String pageSize
        Map map = Maps.newHashMap();
        map.put("unionId",integralOrderHistoryDto.getUnionId());
        map.put("pageIndex",integralOrderHistoryDto.getPageIndex());
        map.put("pageSize",integralOrderHistoryDto.getPageSize());
        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.LIST_INTEGRALHISTORY, map);
        return resp;
    }




}

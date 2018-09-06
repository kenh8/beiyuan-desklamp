package com.hiveview.tv.swagger.controller.scrm;

import com.alibaba.fastjson.JSON;
import com.hiveview.base.util.http.OkHttp3Utils;
import com.hiveview.base.util.response.RespCode;
import com.hiveview.base.util.response.RespMsg;
import com.hiveview.tv.swagger.common.BaseController;
import com.hiveview.tv.swagger.util.Global;
import com.hiveview.tv.swagger.util.HttpApiConstant;
import io.swagger.annotations.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by sh on 2018/3/29.
 */
@Api(value = "商品接口", tags = "商品接口模块")

@Controller
@RequestMapping("/swagger/api/tv/v1.0/goods/*")
public class ApiGoodsController extends BaseController {
    /**
     * 获取所有的有效的商品,并按照兑换规则进行分组排序
     *
     * @param
     * @param
     * @return
     */
    @ApiOperation(value = "获取所有的有效的商品,并按照兑换规则进行分组排序")
    @ApiResponse(code = 200, message = "success", response = RespMsg.class)
    @ApiImplicitParams({
           /* @ApiImplicitParam(name = "buildId", value = "接口版本号", required = true, dataType = "String",paramType="header"),
            @ApiImplicitParam(name = "userToken", value = "用户的token信息", required = true, dataType = "String",paramType="header"),
            @ApiImplicitParam(name = "userId", value = "用户id", required = true, dataType = "String",paramType="header"),
            @ApiImplicitParam(name = "id", value = "筹款动态id", required = true, dataType = "int",paramType="path"),
            @ApiImplicitParam(name = "entity", value = "{\"desc\":\"项目最新进展\",\"images\":[\"图片\",\"图片\"],\"pid\":项目id," +
                    "\"targetMoney\":修改后的目标金额}", required = true, dataType = "string",paramType="form"),*/
            @ApiImplicitParam(name = "pageSize", value = "每页条数", required = true, dataType = "int", paramType = "query"),
            @ApiImplicitParam(name = "pageIndex", value = "第几页", required = true, dataType = "int", paramType = "query"),
            @ApiImplicitParam(name = "integralRuleId", value = "兑换规则", required = false, dataType = "int", paramType = "query")
    })
    @RequestMapping(value = "getGoods", method = {RequestMethod.POST})
    public @ResponseBody
    Object getIntegral(@RequestParam("pageSize") Integer pageSize, @RequestParam("pageIndex") Integer pageIndex, @RequestParam(value = "integralRuleId", required = false) Integer integralRuleId) {
        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.GET_GOODS_LIST, getRequestMap());
        return resp;
    }

    @ApiOperation(value = "商品id获取商品轮播图详情")
    @ApiResponse(code = 200, message = "success", response = RespMsg.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "goodsId", value = "商品id", required = true, dataType = "int", paramType = "query"),
    })
    @RequestMapping(value = "getGoods/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    Object getGoods(@PathVariable("goodsId") String goodsId) {
        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.GET_GOODS_LIST + "/" + goodsId,new HashMap<>());
        return resp;
    }

}

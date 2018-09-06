package com.hiveview.tv.swagger.controller.scrm;

import com.google.common.collect.Maps;
import com.hiveview.base.util.http.OkHttp3Utils;
import com.hiveview.base.util.response.RespMsg;
import com.hiveview.tv.swagger.common.BaseController;
import com.hiveview.tv.swagger.util.Global;
import com.hiveview.tv.swagger.util.HttpApiConstant;
import io.swagger.annotations.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by ubuntu on 2018/4/2.
 */
@Api(value = "订单中心", tags = "订单中心")
@RequestMapping("/swagger/api/tv/v1.0/purchase/*")
@Controller
public class ApiOrderController extends BaseController {
    @ApiOperation(value = "积分流水")
    @ApiResponse(code = 0, message = "操作成功", response = RespMsg.class)
    @RequestMapping(value = "confirmexchange", method = RequestMethod.POST)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "unionId", value = "用户Id", required = true, dataType = "int", paramType = "form"),
            @ApiImplicitParam(name = "goodsId", value = "商品id", required = true, dataType = "String", paramType = "form"),
            @ApiImplicitParam(name = "address", value = "地址", required = true, dataType = "String", paramType = "form"),
            @ApiImplicitParam(name = "macId", value = "mac地址", required = true, dataType = "String", paramType = "form")
    })
    public @ResponseBody
    Object confirmexchange(String unionId, String goodsId, String address, String macId) {
        Map map = Maps.newHashMap();
        map.put("unionId", unionId);
        map.put("goodsId", goodsId);
        map.put("address", address);
        map.put("macId", macId);
        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.CONFIRMEXCHANGE, map);
        return resp;
    }


}

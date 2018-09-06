package com.hiveview.tv.swagger.controller;


import com.hiveview.base.util.http.OkHttp3Utils;
import com.hiveview.base.util.response.RespCode;
import com.hiveview.tv.swagger.common.BaseController;
import com.hiveview.tv.swagger.common.RespMessage;
import com.hiveview.tv.swagger.util.Global;
import com.hiveview.tv.swagger.util.HttpApiConstant;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import io.swagger.annotations.ApiParam;

/**
 * Created by mikejiang on 2017/6/12.
 */
@Controller
@Api(value = "模板",tags = "接口文档模板")

@RequestMapping(value = "/api/open/user"/*, produces = { "application/json;charset=utf-8" }*/)
//@Api(description = "盒子用户中心")
public class ApiUserController extends BaseController {
    /**
     * 盒子请求MAC/SN
     * @param params
     * @return
     */
    @ApiOperation(value = "getAuthToken",notes = "盒子请求MAC/SN")

    /*@ApiOperation(value = "盒子请求MAC/SN", notes = "http://60.206.137.159:8082/api/open/user/getAuthToken?params={mac\":\"143DF24A133D\","+"\n"+
            "\"sn\":\"DMD3310E160803702\"}", produces = MediaType.APPLICATION_JSON_VALUE)*/
    /*@ApiParam(name = "params", value = "{MAC/SN}params={mac\":\"143DF24A133D\",\"sn\":\"DMD3310E160803702\"}", required = true*//*, dataType = "String"*//*)*/
    @RequestMapping(value = "getAuthToken", method = { RequestMethod.POST,RequestMethod.GET })
    @ResponseBody
    public String getAuthToken(@RequestParam @ApiParam(name = "params", value = "{MAC/SN}params={mac\":\"143DF24A133D\",\"sn\":\"DMD3310E160803702\"}", required = true) String params) {
        /**
         * mac(String) sn(String) 参数
         * {"mac":"143DF24A133D","sn":"DMD3310E160803702"}
         *
         * http://60.206.137.159:8082/api/open/user/getAuthToken?params={mac":"143DF24A133D","sn":"DMD3310E160803702"}
         */
        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.GET_GOODS_LIST, getRequestMap());
        if (org.apache.commons.lang3.StringUtils.isEmpty(resp)) {
            return new RespMessage<>().GetReturnMessage(RespCode.FAIL);
        }
        return resp;
    }
}

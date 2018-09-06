package com.hiveview.tv.swagger.controller.scrm;

import com.hiveview.base.util.http.OkHttp3Utils;
import com.hiveview.base.util.response.RespMsg;
import com.hiveview.tv.swagger.common.BaseController;
import com.hiveview.tv.swagger.util.Global;
import com.hiveview.tv.swagger.util.HttpApiConstant;
import io.swagger.annotations.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/5/14 0014.
 */
@Api(value = "发票接口", tags = "发票添加模块")

@Controller
@RequestMapping("/swagger/api/tv/v1.0/userInvoice/*")
public class UserInvoiceController extends BaseController {

    @ApiOperation(value = "对发票进行进行保存操作")
    @ApiResponse(code = 200, message = "success", response = RespMsg.class)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户的编号", required = true, dataType = "Long", paramType = "query"),
            @ApiImplicitParam(name = "orderId", value = "订单编号", required = true, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "invoiceType", value = "发票类型", required = true, dataType = "int", paramType = "query"),
            @ApiImplicitParam(name = "taxpayerCode", value = "纳税人编码", required = false, dataType = "String", paramType = "query")
    })
    @RequestMapping(value = "addInvoice", method = {RequestMethod.POST})
    public @ResponseBody
    Object getIntegral(@RequestParam("userId") Long userId, @RequestParam("orderId") String orderId, @RequestParam(value = "invoiceType") Integer invoiceType,@RequestParam(value = "taxpayerCode",required = false) String taxpayerCode) {
        String resp = OkHttp3Utils.getInstance().doPost(Global.getServiceUrl() + HttpApiConstant.ADD_INVOICE, getRequestMap());
        return resp;
    }

}

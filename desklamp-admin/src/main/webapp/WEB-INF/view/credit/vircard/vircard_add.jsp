<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
</head>
<style>
    .container{
        overflow: hidden !important;
    }
    .confirmBtn{
        margin-top: -55px;
    }
</style>
<form  class="form-horizontal tasi-form"
      method="post" id="addVirCardForm"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <h4 class="modal-title">
            会员卡
        </h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="panel adapt-window-height panel-default" style="overflow: scroll;">
                    <div class="panel-body" style="padding: 30px">
                        <div class="row">
                            <div class="">
                                <li role="tab"  class="disabled" aria-disabled="true">
                                    <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                        <span class="number"></span>
                                        基础信息
                                    </a>
                                    <%--<a class="refresh-page" style="display: inline-block;float: right;margin-right: 25px;"   href="javascript:;" onclick="RefreshPage();">刷新页面</a>
                                    <a class="refresh-page" style="display: inline-block;float: right;margin-right: 25px;"   href="javascript:;" onclick="cardList();" >返回列表</a>--%>
                                </li>
                            </div>
                            <div class="form-group">
                                <%--<div class="form-group clearfix">--%>
                                <label class="col-lg-2 control-label" for="virtualCardName"> 虚拟卡名称<em class="requiredred">*</em></label>
                                <div class="col-lg-3">
                                    <input id="virtualCardName" name="virtualCardName" type="text"
                                           placeholder="请输入虚拟卡名称"
                                           data-error="请输入虚拟卡名称" class="form-control" required>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <label class="col-lg-2 control-label" for="virtualCardType"> 分类</label>
                                <select class="select2 select2-offscreen select-zdy" id="virtualCardType" name="virtualCardType"
                                        style="width: 120px;"
                                        data-placeholder="请选择" tabindex="" title="">
                                    <%--2激活卡，3激活码，4储值卡，5礼品卡--%>
                                    <option value="1">提货卡</option>
                             <%--       <option value="2">激活卡</option>
                                    <option value="3">激活码</option>
                                    <option value="4">储值卡</option>
                                    <option value="5">礼品卡</option>--%>
                                </select>
                                <%--</div>--%>
                            </div>
                            <div class="form-group">
                                <div class="clearfix">
                                    <div class="btn-group clearfix col-sm-2">
                                        <label class="col-lg-12 control-label"> 限用地区</label>
                                    </div>
                                    <div class="btn-group clearfix col-sm-4">
                                        <label class="col-lg-4 control-label" for="proName"> 所属省：</label>
                                        <select class="select2 select2-offscreen col-lg-8 select-zdy" style="width: 150px;"
                                                id="proName" name="proName"
                                                data-placeholder="请选择" tabindex="-1" title="" onchange="getAllProName(2)">
                                            <option value="${item}">请选择</option>
                                            <option id="OptionProName" value="-1">请选择</option>
                                        </select>
                                    </div>
                                    <div class="btn-group clearfix col-sm-4">
                                        <label class="col-lg-4 control-label" for="cityName"> 所属市：</label>
                                        <select  class="select2 select2-offscreen  col-lg-8 select-zdy" style="width: 150px;"
                                                id="cityName"
                                                name="cityName" data-placeholder="请选择" tabindex="-1" title="">
                                            <c:forEach items="${cityList}" var="item">
                                                <option value="${item}">请选择</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label " for="coverUrl"> 封面图片<em class="requiredred">*</em></label>
                                <div class="col-lg-10 div-img" id="override-img-show-div">
                                    <a class="btn btn-info waves-effect waves-light m-b-10" href="javascript:void(0);" onclick="uploadCoverImg();">
                                        <i class="fa fa-cloud"></i>
                                        <span>上传图片</span>
                                    </a>
                                    <div style="display: none;" class="show-img-div">
                                        <input type="hidden" id="coverUrl" name="coverUrl" value=""/>
                                        <img data-original="" src="" style="width: 50px;height: 50px; cursor: pointer;">
                                        <a href="javascript:void(0);" class="delete-image" onclick="deleteCommonImg(this);">删除图片</a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-3 control-label" for="cardFrom"> 来源方式</label>
                                    <div id="cardFrom" class="col-sm-9" style="margin-bottom: 10px">
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" checked id="cardFrom1" value="1" name="cardFrom">
                                            <label for="cardFrom1">外部商户</label>
                                        </div>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="cardFrom2" value="2" name="cardFrom">
                                            <label for="cardFrom2">自有业务</label>
                                        </div>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="cardFrom3" value="3" name="cardFrom">
                                            <label for="cardFrom3">合并业务</label>
                                        </div>
                                    </div>
                                    <label class="col-lg-3 control-label" for="stockNumber"> 库&nbsp;&nbsp;存<em class="requiredred">*</em></label>
                                    <div class="col-lg-3">
                                        <input id="stockNumber" name="stockNumber" type="text" placeholder="请导入文件"
                                               data-error="请导入文件"
                                               readonly="readonly"
                                               class="input-zdy"
                                              <%-- value="${sessionScope.importVitutalCardSize}"--%>
                                               onafterpaste="limitInputNumber(this);" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <a class="btn btn-primary"
                                       href="${pageContext.request.contextPath}/credit/virCard/importvircard?IdWorker=${IdWorker}"
                                       data-toggle="modal" data-target="#base_modal">导入库存</a>

                                    <input id="IdWorker" type="hidden" name="IdWorker" value="${IdWorker}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group clearfix">
                                    <label class="col-lg-2 control-label" for="expirationDate"> 有效期</label>
                                    <div class="col-lg-3">
                                        <input type="text" style="width: 180px;" class="form-control" autocomplete="off"
                                               id="expirationDate" disabled="disabled"
                                               name="expirationDate" data-error="请输入有效期"  required/>
                                    </div>
                                    <label class="col-lg-2 control-label" for="isForever"> 是否永久</label>
                                    <div id="isForever" class="col-lg-3">
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" checked id="isForever2" value="1" name="isForever">
                                            <label for="isForever2">是</label>
                                        </div>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="isForever1" value="0" name="isForever">
                                            <label for="isForever1">否</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-group clearfix">
                                    <label class="col-lg-2 control-label" for="expirationDate">领取地址 <em class="requiredred">*</em> </label>
                                    <div class="col-lg-3">
                                        <input type="text" style="width: 180px;" class="form-control"
                                               id="receivePlace"
                                               name="receivePlace" data-error="请输入领取地址" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="">
                                <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                                    <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                        <span class="number"></span>
                                        价格
                                    </a>
                                </li>
                            </div>
                            <div class="form-group">
                                <div class="form-group clearfix">
                                    <label class="col-lg-2 control-label" for="price">售&nbsp;&nbsp;价<em class="requiredred">*</em> </label>
                                    <div class="col-lg-3">
                                        <input id="price" name="price" type="text" placeholder="请输入售价"
                                               data-error="请输入售价"
                                               onblur="showPrice();"
                                               class="input-zdy"
                                               onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <label class="col-lg-2 control-label" for="freightPrice"> 运费</label>
                                    <div class="col-lg-3">
                                        <input id="freightPrice" name="freightPrice" type="text" placeholder="请输入运费"
                                               data-error="请输入运费"
                                               onblur="showPrice();"
                                               class="input-zdy"
                                               onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="">
                                <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                                    <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                        <span class="number"></span>
                                        财务信息
                                    </a>
                                </li>
                            </div>
                            <div class="form-group">
                                <div class="form-group" >
                                    <label class="col-sm-2 control-label" for="merchantId"> 所属商家<em class="requiredred">*</em>：</label>
                                    <select id="merchantSelect" style="width: 320px;" class="select2 select2-offscreen col-lg-8"
                                            onchange="obtainMerchant();" id="merchantId" name="merchantId" required
                                            data-placeholder="请选择" tabindex="-1" title="">
                                        <option id="optionOne" value="-1">-请选择-</option>
                                    </select>
                                   <%-- <input type="hidden" id="merchantId" name="merchantId" value=""/>--%>
                                    <input type="hidden" id="merchantId" name="merchantName" value=""/>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="settlementType" class="col-sm-2 control-label">结算方式<em class="requiredred">*</em></label>
                                    <div class="col-sm-3">
                                        <select class="select2 select2-offscreen select-zdy"
                                                id="settlementType"
                                                name="settlementType" onchange="changePrice()">
                                            <option value="1">售价结算</option>
                                            <option value="2">自拟价结算</option>
                                        </select>
                                    </div>
                                    <label for="totalPrice" class="col-sm-2 control-label">结算价</label>
                                    <div class="col-sm-3">
                                        <input id="totalPrice" name="totalPrice" type="text" placeholder="请输入结算价"
                                               data-error="请输入结算价"
                                               class="input-zdy input-zdy-width input-float-left"
                                               onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" required>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div style="text-align: center;">
                                    <input class="btn btn-primary" type="submit" id="subBtn" value="确定">
                                    <button type="button" onclick="cardList();" class="btn btn-default waves-effect" data-dismiss="modal">取消
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="my_model" onclick="colseModel();" class="model-mask box-hide">
    </div>
    <div id="model_context" class="model_context box-hide">
        <div class="model-Exhibition">
            <div class="infoNum" style="width: 100%;overflow: hidden;margin: 0 auto;padding: 5px;">
                <span style="">成功 : <em id="successNum"></em></span>
                <span>失败 : <em id="errorNum"></em></span>
            </div>
            <ul class="err_mes">
            </ul>
        </div>
        <div class="model-bottom confirmBtn">
            <input type="button" value="确定" class="btn btn-info" onclick="colseModel();">
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/vircard_add.js"></script>
</html>


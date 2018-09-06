<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
</head>
<form class="form-horizontal tasi-form"
      method="post" id="goodsAddForm"
      data-toggle="validator"
     onsubmit="return saveData();">
    <div class="modal-header">
        <h4 class="modal-title">
            添加商品
        </h4>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="panel adapt-window-height panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="">
                                <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                                    <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                        <span class="number">1.</span>
                                        基础信息  &nbsp;&nbsp;<em class="requiredred">带*为必填信息</em>
                                    </a>
                                </li>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsName"> 商品名称<em class="requiredred">*</em></label>
                                    <div class="col-lg-10">
                                        <input id="goodsName" name="goodsName" type="text" placeholder="请输入商品名称" data-error="请输入商品名称" class="required form-control" required />
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsType"> 商品形式</label>
                                    <div id="goodsType" class="col-sm-4 col-md-offset-2">
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" checked id="goodsType1" value="1" name="goodsType" >
                                            <label for="goodsType1">实物</label>
                                        </div>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="goodsType3"  value="3" name="goodsType">
                                            <label for="goodsType3">虚拟</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsSubtitle"> 商品副标题<em class="requiredred">*</em></label>
                                    <div class="col-lg-10">
                                        <input id="goodsSubtitle" name="goodsSubtitle" type="text" placeholder="请输入商品副标题" data-error="请商品副标题" class="required form-control" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label " for="goodsCoverUrl"> 封面图片<em class="requiredred">*</em></label>
                                    <div class="col-lg-10 div-img" id="override-img-show-div">
                                        <a class="btn btn-info waves-effect waves-light m-b-10" href="javascript:void(0);" onclick="uploadCoverImg();">
                                            <i class="fa fa-cloud"></i>
                                            <span>上传图片</span>
                                        </a>
                                        <div style="display: none;" class="show-img-div">
                                            <input type="hidden" id="goodsCoverUrl" name="goodsCoverUrl" value=""/>
                                            <img id="coverimg" data-original="" src="" style="width: 50px;height: 50px; cursor: pointer;">
                                            <a href="javascript:void(0);" class="delete-image" onclick="deleteCommonImg(this);">删除图片</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsStock"> 商品库存<em class="requiredred">*</em></label>
                                    <div class="col-lg-5">
                                        <input id="goodsStock" class="input-zdy" name="goodsStock" maxlength="8" type="text" placeholder="请输入商品库存"
                                               data-error="请输入商品库存" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="freight"> 商品运费</label>
                                    <div class="col-lg-10">
                                        <input id="freight" name="freight" type="text" placeholder="请输入商品运费" class="input-zdy"
                                               data-error="请输入商品运费"  onkeyup="limitTwoPoint(this);" maxlength="8" onafterpaste="limitTwoPoint(this);" required>元  精确到小数点后两位
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="">
                                <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                                    <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                        <span class="number">2.</span>
                                        兑换规则
                                    </a>
                                </li>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-11">
                                    <label class="col-lg-2 control-label" for="integralRuleId"> 积分使用规则</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-3">
                                            <select id="integralRuleId" name="integralRuleId" class="select-zdy" onchange="changeIntegralRule()">
                                                <option value="2">积分+现金</option>
                                                <option value="1">纯积分</option>
                                                <option value="3">纯现金</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="text" id="goodsExchangeIntegral" class="input-zdy"
                                                   name="goodsExchangeIntegral" onKeyUp="value=value.replace(/[^0-9]/g,'')" maxlength="8" required>积分<em class="requiredred">*</em>
                                        </div>
                                        <div class="">
                                            <input type="text" id="goodsPrice" name="goodsPrice" class="input-zdy"
                                                   onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" maxlength="8" required>元<em class="requiredred">*</em>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameDeviceLimitedNumber"> 同设备限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" name="sameDeviceLimited" value="1" checked>是
                                            <input type="radio" name="sameDeviceLimited" value="2">否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" id="sameDeviceLimitedNumber" name="sameDeviceLimitedNumber" maxlength="8" class="input-zdy" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <%--
                           暂时保留、用户限购会做调整
                           <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameUserLimitedNumber"> 同用户限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" name="sameUserLimited" value="1" checked>是
                                            <input type="radio" name="sameUserLimited" value="2">否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" id="sameUserLimitedNumber" class="input-zdy" maxlength="8" name="sameUserLimitedNumber" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <div style="text-align: center;">
                                    <button type="submit" id="subBtn" class="btn btn-info waves-effect waves-light" >下一步</button>
                                    <a href="javascript:void(0);" onclick="returnToListPage('${pageContext.request.contextPath}/credit/goods/list');" class="btn btn-default waves-effect" data-dismiss="modal">取消</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_add.js"></script>
</html>

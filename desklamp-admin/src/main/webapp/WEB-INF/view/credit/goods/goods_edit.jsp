<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
        .show-img-div{
            float:left;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
    <%--<script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>--%>
</head>
<form class="form-horizontal tasi-form"
      method="post" id="goodsAddForm"
      action="${pageContext.request.contextPath}/credit/goods/saveData"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <h4 class="modal-title">
            编辑商品
        </h4>
    </div>
    <input type="hidden" id="id" name="id" value="${data.id}"/>
    <input type="hidden" id="integral" name="integral" value="${data.goodsExchangeIntegral}"/>
    <input type="hidden" id="price" name="price" value="${data.goodsPrice}"/>
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
                                        基础信息&nbsp;&nbsp;<em class="requiredred">带*为必填信息</em>
                                    </a>
                                </li>
                            </div>
                            <div class="">
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsName"> 商品名称<em class="requiredred">*</em></label>
                                    <div class="col-lg-10">
                                        <input id="goodsName" name="goodsName" type="text" placeholder="请输入商品名称" data-error="请输入商品名称" class="required form-control" value="${data.goodsName}" required/>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsType"> 商品形式</label>
                                    <div id="goodsType" class="col-sm-4 col-md-offset-2">
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="goodsType1" value="1" disabled <c:if test="${data ne null and data.goodsType eq 1}">checked</c:if> name="goodsType">
                                            <label for="goodsType1">实物</label>
                                        </div>
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="goodsType2"  value="2" disabled <c:if test="${data ne null and data.goodsType eq 2}">checked</c:if> name="goodsType">
                                            <label for="goodsType2">虚拟</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsSubtitle"> 商品副标题<em class="requiredred">*</em></label>
                                    <div class="col-lg-10">
                                        <input id="goodsSubtitle" name="goodsSubtitle" type="text" placeholder="请输入商品副标题" data-error="请商品副标题" class="required form-control" value="${data.goodsSubtitle}" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label " for="goodsCoverUrl"> 封面图片</label>
                                    <div class="col-lg-10 div-img" id="override-img-show-div">
                                        <a class="btn btn-info waves-effect waves-light m-b-10" href="javascript:void(0);" onclick="uploadCoverImg();">
                                            <i class="fa fa-cloud"></i>
                                            <span>上传图片</span>
                                        </a>
                                        <div style="display: none;" class="show-img-div">
                                            <input type="hidden" id="goodsCoverUrl" name="goodsCoverUrl" value="${data.goodsCoverUrl}"/>
                                            <img data-original="${imgPath}/${data.goodsCoverUrl}"  alt="" src="${imgPath}/${data.goodsCoverUrl}" style="width: 100px;height: 100px; cursor: pointer;">
                                            <%--<img data-original="" src="" style="width: 50px;height: 50px; cursor: pointer;">--%>
                                            <a href="javascript:void(0);" class="delete-image" onclick="deleteCommonImg(this);">删除图片</a>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsStock"> 商品库存<em class="requiredred">*</em></label>
                                    <div class="col-lg-5">
                                        <input type="hidden" id="orgGoodsType" value="${data.goodsType}" >
                                        <input id="goodsStock" class="input-zdy" name="goodsStock" type="text" placeholder="请输入商品库存" data-error="请输入商品库存" onKeyUp="value=value.replace(/[^0-9]/g,'')" value="${data.goodsStock}" required readonly="readonly">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="freight"> 商品运费</label>
                                    <div class="col-lg-10">
                                        <input type="hidden" id="orgFreight" name="orgFreight" value="${data.freight}">
                                        <input id="freight" class="input-zdy" name="freight" type="text" placeholder="请输入商品运费" maxlength="8" data-error="请输入商品运费"  onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" value="${data.freight}" required>元  精确到小数点后两位
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

                            <div class="">
                                <div class="form-group col-sm-11">
                                    <label class="col-lg-2 control-label" for="integralRuleId"> 积分使用规则</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-3">
                                            <input type="hidden" id="orgIntegralRuleId" name="orgIntegralRuleId" value="${data.integralRuleId}" >
                                            <select id="integralRuleId" class="select-zdy" name="integralRuleId" onchange="changeIntegralRule()">
                                                <option value="2" <c:if test="${data.integralRuleId eq 2}">selected</c:if>>积分+现金</option>
                                                <option value="3" <c:if test="${data.integralRuleId eq 3}">selected</c:if>>纯现金</option>
                                                <option value="1" <c:if test="${data.integralRuleId eq 1}">selected</c:if>>纯积分</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="hidden" id="orgGoodsExchangeIntegral" name="orgGoodsExchangeIntegral" value="${data.goodsExchangeIntegral}" >
                                            <input type="text" class="input-zdy" id="goodsExchangeIntegral" name="goodsExchangeIntegral" onKeyUp="value=value.replace(/[^0-9]/g,'')" maxlength="8" value="${data.goodsExchangeIntegral}" required>积分<em class="requiredred">*</em>
                                        </div>
                                        <div class="">
                                            <input type="hidden" id="orgGoodsPrice" name="orgGoodsPrice" value="${data.goodsPrice}" >
                                            <input type="text" class="input-zdy" id="goodsPrice" name="goodsPrice" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" maxlength="8" value="${data.goodsPrice}" required>元<em class="requiredred">*</em>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameDeviceLimitedNumber"> 同设备限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" onclick="editInputDisable('Device')" name="sameDeviceLimited" value="1" <c:if test="${data ne null and data.sameDeviceLimited eq 1}">checked</c:if>>是
                                            <input type="radio" onclick="editInputDisable('Device')" name="sameDeviceLimited" value="2" <c:if test="${data ne null and data.sameDeviceLimited eq 2}">checked</c:if>>否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" class="input-zdy" id="sameDeviceLimitedNumber" name="sameDeviceLimitedNumber" maxlength="8" onKeyUp="value=value.replace(/[^0-9]/g,'')" value="${data.sameDeviceLimitedNumber}" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>
                          <%--  <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameUserLimitedNumber"> 同用户限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" onclick="editInputDisable('user')" name="sameUserLimited" value="1" <c:if test="${data ne null and data.sameUserLimited eq 1}">checked</c:if>>是
                                            <input type="radio" onclick="editInputDisable('user')" name="sameUserLimited" value="2" <c:if test="${data ne null and data.sameUserLimited eq 2}">checked</c:if>>否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" class="input-zdy" id="sameUserLimitedNumber" name="sameUserLimitedNumber" maxlength="8" onKeyUp="value=value.replace(/[^0-9]/g,'')" value="${data.sameUserLimitedNumber}" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <div style="text-align: center;">
                                    <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
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
<script type="text/javascript">
    $(document).ready(function(){
        $(".select2").select2({

        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_edit.js"></script>
</html>

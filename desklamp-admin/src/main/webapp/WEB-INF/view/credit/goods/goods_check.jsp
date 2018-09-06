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
     <%-- action="${pageContext.request.contextPath}/credit/goods/saveData"--%>
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <h4 class="modal-title">
            查看商品
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
                            <div class="form-group">
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsName"> 商品名称<em class="requiredred">*</em></label>
                                    <div class="col-lg-10">
                                        <input id="goodsName" name="goodsName" type="text" placeholder="请输入商品名称" data-error="请输入商品名称" class="required form-control" value="${data.goodsName}" readonly="readonly" required/>
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
                                            <input type="radio" id="goodsType2"  value="2" disabled <c:if test="${data ne null and data.goodsType eq 2 || data.goodsType eq 3 }">checked</c:if> name="goodsType">
                                            <label for="goodsType2">虚拟</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsSubtitle"> 商品副标题<em class="requiredred">*</em></label>
                                    <div class="col-lg-10">
                                        <input id="goodsSubtitle" name="goodsSubtitle" type="text" placeholder="请输入商品副标题" data-error="请商品副标题" class="required form-control" value="${data.goodsSubtitle}" readonly="readonly" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">

                                    <label class="col-lg-2 control-label " for="goodsCoverUrl"> 封面图片</label>
                                    <input type="hidden" id="goodsCoverUrl" name="goodsCoverUrl" value="${data.goodsCoverUrl}"/>
                                    <img id="goodsCoverUrlImg" alt="封面图片" src=""  style="width: 100px;height: 100px; cursor: pointer;">
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="goodsStock"> 商品库存<em class="requiredred">*</em></label>
                                    <div class="col-lg-5">
                                        <input id="goodsStock" class="input-zdy" name="goodsStock" type="text" placeholder="请输入商品库存" data-error="请商品副标题" onKeyUp="value=value.replace(/[^0-9]/g,'')" value="${data.goodsStock}" readonly="readonly" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label class="col-lg-2 control-label" for="freight"> 商品运费</label>
                                    <div class="col-lg-10">
                                        <input id="freight" class="input-zdy" name="freight" type="text" placeholder="请输入商品运费" data-error="请输入商品运费"  onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" value="${data.freight}" readonly="readonly" required>元  精确到小数点后两位
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
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="originalPrice">结算价</label>
                                    <div class="col-lg-5">
                                       &nbsp; <input class="input-zdy" id="originalPrice" name="originalPrice" type="text"  value="${data.orginalPrice}" readonly="readonly">&nbsp;元
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="integralRuleId"> 积分使用规则</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-3">
                                            <select id="integralRuleId" class="select-zdy" name="integralRuleId" disabled="disabled" onchange="changeIntegralRule()">
                                                <option value="2" <c:if test="${data.integralRuleId eq 2}">selected</c:if>>积分+现金</option>
                                                <option value="3" <c:if test="${data.integralRuleId eq 3}">selected</c:if>>纯现金</option>
                                                <option value="1" <c:if test="${data.integralRuleId eq 1}">selected</c:if>>纯积分</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="text" class="input-zdy" id="goodsExchangeIntegral" name="goodsExchangeIntegral" onKeyUp="value=value.replace(/[^0-9]/g,'')" value="${data.goodsExchangeIntegral}" readonly="readonly" required>积分<em class="requiredred">*</em>
                                        </div>
                                        <div class="">
                                            <input type="text" class="input-zdy" id="goodsPrice" name="goodsPrice" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" value="${data.goodsPrice}" readonly="readonly" required>元<em class="requiredred">*</em>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameDeviceLimitedNumber"> 同设备限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" disabled onclick="editInputDisable('Device')" name="sameDeviceLimited" value="1" <c:if test="${data ne null and data.sameDeviceLimited eq 1}">checked</c:if>>是
                                            <input type="radio" disabled onclick="editInputDisable('Device')" name="sameDeviceLimited" value="2" <c:if test="${data ne null and data.sameDeviceLimited eq 2}">checked</c:if>>否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" class="input-zdy" id="sameDeviceLimitedNumber" name="sameDeviceLimitedNumber" onKeyUp="value=value.replace(/[^0-9]/g,'')" value="${data.sameDeviceLimitedNumber}" readonly="readonly" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <%-- <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameUserLimitedNumber"> 同用户限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" disabled onclick="editInputDisable('user')" name="sameUserLimited" value="1" <c:if test="${data ne null and data.sameUserLimited eq 1}">checked</c:if>>是
                                            <input type="radio" disabled onclick="editInputDisable('user')" name="sameUserLimited" value="2" <c:if test="${data ne null and data.sameUserLimited eq 2}">checked</c:if>>否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" class="input-zdy" id="sameUserLimitedNumber" name="sameUserLimitedNumber" onKeyUp="value=value.replace(/[^0-9]/g,'')" value="${data.sameUserLimitedNumber}" readonly="readonly" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <div style="text-align: center;">
                                 <%--   <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>--%>
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
        $("#goodsCoverUrlImg").attr("src",imgPath+"/"+$("#goodsCoverUrl").val());
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_edit.js"></script>
</html>

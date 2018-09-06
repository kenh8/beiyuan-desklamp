<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
<head>
    <style type="text/css">
        .show-img-div{
            float:left;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <%-- <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>--%>
</head>
<form class="form-horizontal tasi-form"
      method="post" id="editForm"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">

        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
        </button>
        <h4 class="modal-title">
            会员卡
        </h4>
    </div>
    <input type="hidden" id="id" name="id" value="${data.id}"/>
    <div class="modal-body">
        <div class="">
            <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                    <span class="number"></span>
                    基础信息
                </a>
            </li>
        </div>
        <div class="form-group">
            <div class="form-group clearfix">
                <label class="col-lg-2 control-label" for="virtualCardName"> 虚拟卡名称</label>
                <div class="col-lg-3">
                    <input id="virtualCardName" name="virtualCardName" type="text" placeholder="请输入虚拟卡名称" data-error="请输入虚拟卡名称" class="required form-control" value="${data.virtualCardName}" required>
                    <div class="help-block with-errors"></div>
                </div>
                <label class="col-lg-2 control-label" for="virtualCardType"> 分类</label>
                <select class="select2 select2-offscreen" id="virtualCardType" name="virtualCardType" style="width: 120px;" data-placeholder="请选择" tabindex="" title="">
                    <option value="1" <c:if test="${data ne null and data.virtualCardType eq 1}">checked</c:if>>提货卡</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="clearfix">
                <div class="btn-group clearfix col-sm-2">
                    <label class="col-lg-12 control-label"> 限用地区</label>
                </div>
                <div class="btn-group clearfix col-sm-4">
                    <input type="hidden" id="proNameId"  value="${data.proName}">
                    <input type="hidden" id="cityNameId" value="${data.cityName}">
                    <label class="col-lg-4 control-label" for="proName"> 所属省：</label>
                    <select class="select2 select2-offscreen col-lg-8" style="width: 150px;" id="proName" name="proName" data-placeholder="请选择" tabindex="-1" title=""  onchange="getAllProName(2)">
                       <%-- <c:forEach items="${proList}" var="item">
                            <option value="${item}" <c:if test="${data.proName eq item.proName}">selected</c:if>>${item.proName}</option>
                        </c:forEach>--%>
                    </select>
                </div>
                <div class="btn-group clearfix col-sm-4">
                    <label class="col-lg-4 control-label" for="cityName"> 所属市：</label>
                    <select class="select2 select2-offscreen  col-lg-8" style="width: 150px;" id="cityName" name="cityName" data-placeholder="请选择" tabindex="-1" title="" >
                        <%--<c:forEach items="${cityList}" var="item">
                            <option value="${item}" <c:if test="${data.cityName eq item.cityName}">selected</c:if>>${item.cityName}</option>
                        </c:forEach>--%>
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-group col-sm-8">
                <label class="col-lg-3 control-label " for="coverUrl"> 封面图片</label>
                <div class="col-lg-9 div-img" id="override-img-show-div">
                    <div style="display: none;" class="show-img-div">
                        <input type="hidden" id="coverUrl" name="coverUrl" value="${data.coverUrl}"/>
                        <img data-original="${data.coverUrl}" alt="" src="${data.coverUrl}" style="width: 50px;height: 50px; cursor: pointer;">
                        <a href="javascript:void(0);" class="delete-image" onclick="deleteCommonImg(this);">删除图片</a>
                    </div>
                    <input id="file" name="file" type="file" class="file" data-overwrite-initial="true">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-group col-sm-8">
                <label class="col-lg-3 control-label" for="cardFrom"> 来源方式</label>
                <div id="cardFrom" class="col-sm-9" style="margin-bottom: 15px">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="cardFrom1" value="1" <c:if test="${data ne null and data.cardFrom eq 1}">checked</c:if> name="cardFrom">
                        <label for="cardFrom1">外部商户</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="cardFrom2"  value="2" <c:if test="${data ne null and data.cardFrom eq 2}">checked</c:if> name="cardFrom">
                        <label for="cardFrom2">自有业务</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="cardFrom3"  value="3" <c:if test="${data ne null and data.cardFrom eq 3}">checked</c:if> name="cardFrom">
                        <label for="cardFrom3">合并业务</label>
                    </div>
                </div>
                <%--<label class="col-lg-3 control-label" for="stockNumber"> 库存</label>
                <div class="col-lg-3">
                    <input id="stockNumber" class="input-zdy" name="stockNumber" type="text" placeholder="请输入库存" data-error="请输入库存"
                         value="${data.stockNumber}"  onafterpaste="limitInputNumber(this);">
                    <div class="help-block with-errors"></div>
                </div>--%>
            </div>
        </div>
        <div class="form-group">
            <div class="form-group clearfix">
                <label class="col-lg-2 control-label" for="expirationDate"> 有效期</label>
                <div class="col-lg-3">
                    <input type="text" style="width: 180px;" class="form-control" id="expirationDate" name="expirationDate" data-error="请输入有效期" autocomplete="off" value="<fmt:formatDate value="${data.expirationDate }" pattern="yyyy-MM-dd HH:mm:ss"/>" required/>
                </div>
                <label class="col-lg-2 control-label" for="isForever"> 是否永久</label>
                <div id="isForever" class="col-lg-3">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="isForever2"  value="1" <c:if test="${data ne null and data.isForever eq 1}">checked</c:if> name="isForever">
                        <label for="isForever2">是</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="isForever1" value="0" <c:if test="${data ne null and data.isForever eq 0}">checked</c:if> name="isForever">
                        <label for="isForever1">否</label>
                    </div>
                </div>
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
            <label class="col-lg-2 control-label" for="price"> 售价</label>
            <div class="col-lg-3">
                <input id="price" name="price" class="input-zdy" type="text" placeholder="请输入售价" data-error="请输入售价" value="${data.price}" onkeyup="limitTwoPoint(this);" onblur="showPrice();" onafterpaste="limitTwoPoint(this);" required>
                <div class="help-block with-errors"></div>
            </div>
            <label class="col-lg-2 control-label" for="freightPrice"> 运费</label>
            <div class="col-lg-3">
                <input id="freightPrice" name="freightPrice" class="input-zdy" type="text" placeholder="请输入运费" data-error="请输入运费" value="${data.freightPrice}" onkeyup="limitTwoPoint(this);" onblur="showPrice();"  onafterpaste="limitTwoPoint(this);" required>
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
    <div class="">
        <div class="form-group clearfix">
            <input type="hidden" id="orgMerchantId" value="${data.merchantId}"/>
            <input type="hidden" id="merchantName" name="merchantName" value="${data.merchantName}"/>
            <label class="col-sm-2 control-label" for="merchantSelect"> 所属商家：</label>
            <select class="select2 select2-offscreen col-lg-8 select-zdy"
                    id="merchantSelect" name="merchantId" onchange="obtainMerchant();"
                    data-placeholder="请选择" tabindex="-1" title="">
                <option id="optionOneUp" value=''>-请选择-</option>
            </select>
        </div>
        <div class=" clearfix">
            <input id="settlement" type="hidden" value="${data.settlementType}">
            <label for="settlementType" class="col-sm-2 control-label">结算方式</label>
            <div class="col-sm-3">
                <select class="select2 select2-offscreen" id="settlementType" name="settlementType" onchange="changePrice('t2')">
                    <option value="1" <c:if test="${data ne null and data.settlementType eq 1}">selected</c:if>>售价结算</option>
                    <option value="2" <c:if test="${data ne null and data.settlementType eq 2}">selected</c:if>>自拟价结算</option>
                </select>
            </div>
            <label for="totalPrice" class="col-sm-2 control-label">结算价</label>
            <div class="col-sm-3">
                <input id="totalPrice" class="input-zdy" name="totalPrice" type="text" placeholder="请输入结算价" data-error="请输入结算价" value="${data.totalPrice}" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" required>
            </div>
        </div>
    </div>
    <div class="">
        <div style="text-align: center;">
            <input class="btn btn-primary" type="submit" id="subBtn" value="确定" >
            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
        </div>
    </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/vircard_edit.js"></script>
</html>

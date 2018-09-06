<%@ taglib prefix="sec" uri="http://sec.hiveview.com/sec-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">订单</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">订单</a></li>
            <li class="active">订单管理</li>
        </ol>
    </div>
</div>

<div class="panel adapt-window-height" style="min-width: 2000px;">
    <div class="panel-body">
        <div class="mt20">
            <input type="hidden" id="currRole" value="${role}">
            <div class="col-sm-12">
                <form id="paramForm" searchFunction="searchOrder" class="form-inline" tableId="orderTableId"
                      onsubmit="return false;">
                    <label><span class="hidden-xs">订单号:</span> <input name="orderNumber" type="text"
                                                                      class="form-control" placeholder="请输入订单号"></label>
                    <label><span class="hidden-xs">用户ID:</span> <input name="userId" type="text" class="form-control"
                                                                       placeholder="请输入用户ID"></label>
                    <label>订单时间：
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' id="startTime" style="width: 170px;" name="startTime" autocomplete="off"
                                   class="form-control"/>
                        </div>
                        ~
                        <div class='input-group date' id='datetimepicker2'>
                            <input type='text' id="endTime" name="endTime" style="width: 170px;" autocomplete="off"
                                   class="form-control"/>
                        </div>
                    </label>
                    <input type="hidden" name="type" id="type" value="">
                    <input type="hidden" name="goodsCategorySn" id="goodsCategorySn" value="">
                    <div class="form-group fr" style="margin-right: 850px;">
                        <button class="btn btn-primary waves-effect" onclick="selectData();">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                </form>
            </div>
            <!--列表-->
            <div class="col-sm-12">
                <div class="col-lg-10">
                    <ul class="nav nav-tabs tabs" style="width: 100%;">
                        <li class="tab active" style="width: 8%;" key="DAI_FA_HUO">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="false" class="active">
                                <span class="hidden-xs">待发货</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 8%;" key="DAI_SHOU_HUO">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">待收货</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 8%;" key="JIAO_YI_SUCCESS">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">交易成功</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 8%;" key="TUI_KUAN_Z">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">退款中</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 8%;" key="YI_TUI_KUAN">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">已退款</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 8%;" key="JIAO_YI_CLOSE">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">交易关闭</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div> <!--end SM12-->
            <!--列表-->
            <table data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/order/listData?orderStatus=1"
                   id="DAI_FA_HUO_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                    <th data-field="" data-align="left" data-formatter="operateRender2">操作</th>
                    <th data-field="orderNumber" data-align="left" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="transactionNumber" data-align="left" data-formatter="autoWrapRender">交易号</th>
                    <th data-field="userId" data-align="left">用户ID</th>
                    <th data-field="name" data-align="left">姓名</th>
                    <th data-field="phone" data-align="left">手机号</th>
                    <th data-field="address" data-formatter="autoWrapRender" data-align="left">收货地址</th>
                    <th data-field="goodsName" data-formatter="autoWrapRender" data-align="left">商品名称</th>
                    <th data-field="goodsCount" data-align="left">商品数量</th>
                    <th data-field="cash" data-align="left">现金</th>
                    <th data-field="integral" data-align="left">积分</th>
                    <th data-field="settlementPrice" data-align="left">结算价</th>
                    <th data-field="merchantName" data-align="left">商户</th>
                    <th data-field="payTime" data-align="left" data-formatter="defaultDateFormatter">支付时间</th>
                    <th data-field="orderCreateTime" data-align="left" data-formatter="defaultDateFormatter">订单生成时间</th>
                </tr>
                </thead>
            </table>
            <table data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/order/listData?orderStatus=2"
                   id="DAI_SHOU_HUO_TABLE"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                    <th data-field="" data-align="left" data-formatter="operateRender2">操作</th>
                    <th data-field="transactionNumber" data-align="left" data-formatter="autoWrapRender">交易号</th>
                    <th data-field="orderNumber" data-align="left" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="userId" data-align="left">用户ID</th>
                    <th data-field="name" data-align="left">姓名</th>
                    <th data-field="phone" data-align="left">手机号</th>
                    <th data-field="address" data-formatter="autoWrapRender" data-align="left">收货地址</th>
                    <th data-field="goodsName" data-formatter="autoWrapRender" data-align="left">商品名称</th>
                    <th data-field="goodsCount" data-align="left">商品数量</th>
                    <th data-field="cash" data-align="left">现金</th>
                    <th data-field="integral" data-align="left">积分</th>
                    <th data-field="settlementPrice" data-align="left">结算价</th>
                    <th data-field="invoiceOrNot" data-align="left" data-formatter="parseInvoice">是否开具发票</th>
                    <th data-field="invoiceType" data-align="left" data-formatter="invoiceFormatter">发票类型</th>
                    <th data-field="invoiceContent" data-align="left">发票内容</th>
                    <th data-field="merchantName" data-align="left">商户</th>
                    <th data-field="logisticCode" data-align="left">物流单号</th>
                    <th data-field="logisticsInfo" data-align="left" data-formatter="logisticFormatter">物流信息</th>
                    <th data-field="orderCreateTime" data-align="left" data-formatter="defaultDateFormatter">订单生成时间</th>
                    <th data-field="deliveryDate" data-align="left" data-formatter="defaultDateFormatter">发货时间</th>
                </tr>
                </thead>
            </table>
            <table data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/order/listData?orderStatus=3"
                   id="JIAO_YI_SUCCESS_TABLE"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                    <th data-field="" data-align="left" data-formatter="operateRender2">操作</th>
                    <th data-field="transactionNumber" data-align="left" data-formatter="autoWrapRender">交易号</th>
                    <th data-field="orderNumber" data-align="left" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="userId" data-align="left">用户ID</th>
                    <th data-field="name" data-align="left">姓名</th>
                    <th data-field="phone" data-align="left">手机号</th>
                    <th data-field="address" data-formatter="autoWrapRender" data-align="left">收货地址</th>
                    <th data-field="goodsName" data-formatter="autoWrapRender" data-align="left">商品名称</th>
                    <th data-field="goodsCount" data-align="left">商品数量</th>
                    <th data-field="cash" data-align="left">现金</th>
                    <th data-field="integral" data-align="left">积分</th>
                    <th data-field="settlementPrice" data-align="left">结算价</th>
                    <th data-field="invoiceOrNot" data-align="left" data-formatter="parseInvoice">是否开具发票</th>
                    <th data-field="invoiceType" data-align="left" data-formatter="invoiceFormatter">发票类型</th>
                    <th data-field="userInvoiceCompanyName" data-align="left">公司名称</th>
                    <th data-field="invoiceContent" data-align="left">发票内容</th>
                    <th data-field="merchantName" data-align="left">商户</th>
                    <th data-field="logisticCode" data-align="left">物流单号</th>
                    <th data-field="logisticsInfo" data-align="left" data-formatter="logisticFormatter">物流信息</th>
                    <th data-field="orderCreateTime" data-align="left" data-formatter="defaultDateFormatter">订单生成时间</th>
                    <th data-field="deliveryDate" data-align="left" data-formatter="deliveryDateRender">发货时间</th>
                </tr>
                </thead>
            </table>
            <table data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/order/listData?orderStatus=4"
                   id="TUI_KUAN_Z_TABLE"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                    <th data-field="" data-align="left" data-formatter="operateRender2">操作</th>
                    <th data-field="transactionNumber" data-align="left" data-formatter="autoWrapRender">交易号</th>
                    <th data-field="refundSn" data-align="left" data-formatter="autoWrapRender">退款单号</th>
                    <th data-field="orderNumber" data-align="left" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="goodsName" data-formatter="autoWrapRender" data-align="left">商品名称</th>
                    <th data-field="goodsCount" data-align="left">商品数量</th>
                    <th data-field="userId" data-align="left">用户ID</th>
                    <th data-field="name" data-align="left">姓名</th>
                    <th data-field="phone" data-align="left">手机号</th>
                    <th data-field="address" data-formatter="autoWrapRender" data-align="left">收货地址</th>
                    <th data-field="cash" data-align="left">退款金额</th>
                    <th data-field="integral" data-align="left">退款积分</th>
                    <th data-field="refundReason" data-align="left">退款原因</th>
                   <%-- <th data-field="logisticCode" data-align="left">退款物流单号</th>--%>
                    <th data-field="" data-align="left" data-formatter="refundFormatter">退款状态</th>
                    <th data-field="merchantName" data-align="left">商户</th>
                    <th data-field="orderCreateTime" data-align="left" data-formatter="defaultDateFormatter">订单时间</th>
                    <th data-field="refundTime" data-align="left" data-formatter="defaultDateFormatter">申请时间</th>
                    <th data-field="refundCreator" data-align="left">操作者</th>
                </tr>
                </thead>
            </table>
            <table data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/order/listData?orderStatus=5"
                   id="YI_TUI_KUAN_TABLE"
                   data-side-pagination="server">

                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                    <th data-field="id" data-align="left">id</th>
                    <th data-field="transactionNumber" data-align="left" data-formatter="autoWrapRender">交易号</th>
                    <th data-field="refundSn" data-align="left" data-formatter="autoWrapRender">退款单号</th>
                    <th data-field="orderNumber" data-align="left" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="userId" data-align="left">用户ID</th>
                    <th data-field="name" data-align="left">姓名</th>
                    <th data-field="phone" data-align="left">手机号</th>
                    <th data-field="address" data-formatter="autoWrapRender" data-align="left">收货地址</th>
                    <th data-field="goodsName" data-formatter="autoWrapRender" data-align="left">商品名称</th>
                    <th data-field="goodsCount" data-align="left">商品数量</th>
                    <th data-field="cash" data-align="left">退款金额</th>
                    <th data-field="integral" data-align="left">退款积分</th>
                    <th data-field="refundReason" data-align="left">退款原因</th>
                   <%-- <th data-field="logisticCode" data-align="left">退款物流单号</th>--%>
                    <th data-field="" data-align="left" data-formatter="refundFormatter">退款状态</th>
                    <th data-field="merchantName" data-align="left">商户</th>
                    <th data-field="orderCreateTime" data-align="left" data-formatter="defaultDateFormatter">订单时间</th>
                    <th data-field="refundTime" data-align="left" data-formatter="defaultDateFormatter">申请时间</th>
                    <th data-field="refundOperator" data-align="left">操作者</th>
                </tr>
                </thead>
            </table>
            <table data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/order/listData?orderStatus=6"
                   id="JIAO_YI_CLOSE_TABLE"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                    <th data-field="id" data-align="left">id</th>
                    <th data-field="orderNumber" data-align="left" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="transactionNumber" data-align="left" data-formatter="autoWrapRender">交易号</th>
                    <th data-field="userId" data-align="left">用户ID</th>
                    <th data-field="name" data-align="left">姓名</th>
                    <th data-field="phone" data-align="left">手机号</th>
                    <th data-field="address" data-formatter="autoWrapRender" data-align="left">收货地址</th>
                    <th data-field="goodsName" data-formatter="autoWrapRender" data-align="left">商品名称</th>
                    <th data-field="goodsCount" data-align="left">商品数量</th>
                    <th data-field="cash" data-align="left">现金</th>
                    <th data-field="integral" data-align="left">积分</th>
                    <th data-field="invoiceOrNot" data-align="left" data-formatter="parseInvoice">是否开具发票</th>
                    <th data-field="invoiceType" data-align="left" data-formatter="invoiceFormatter">发票类型</th>
                    <th data-field="invoiceContent" data-align="left">发票内容</th>
                    <th data-field="merchantName" data-align="left">商户</th>
                    <th data-field="orderCreateTime" data-align="left" data-formatter="defaultDateFormatter">订单生成时间</th>
                    <th data-field="closeReason" data-align="left">关闭原因</th>
                </tr>
                </thead>
            </table>


        </div>
    </div>
</div>
<%-----------------------权限-------------------------%>
<sec:requiredPermission resource="order:permission:updateOrderStatus">
    <input id="orderUpdateOrderStatus" type="hidden" name="orderUpdateOrderStatus">
</sec:requiredPermission>

<script src="${pageContext.request.contextPath}/assets/js/module/credit/order/order_list.js"></script>

</html>
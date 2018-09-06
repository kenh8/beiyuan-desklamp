<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>vip影视列表页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">退款订单</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">积分商城</a></li>
            <li class="active">vip影视订单列表</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt10">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="vipMoviesTableId" onsubmit="return false;">
                    <div style="float: left;margin: 5px 0px;">
                        <label style="display:inline-block;">订单号：</label>
                        <input type="text" id="tradeNo" name="tradeNo" style="width: 260px;" class="form-control"
                               placeholder="订单号">
                    </div>
                    <div style="float: left;margin: 5px 0px;">
                        <label style="display:inline-block;">用户id：</label>
                        <input type="text" id="userUuid" name="userUuid" style="width: 260px;" class="form-control"
                               placeholder="用户id">
                    </div>
                    <div style="float: left;margin: 5px 0px;">
                        <label style="display:inline-block;">商户id：</label>
                        <input type="text" id="partnerId" name="partnerId" style="width: 260px;" class="form-control"
                               placeholder="用户id">&nbsp;&nbsp;
                    </div>
                    <label>支付时间：
                        <div class='input-group date' id='datetimepicker3'>
                            <input type='text' id="date" name="date" style="width: 230px;" class="form-control"/>
                        </div>
                    </label>
                    <input type="hidden" name="type" id="type" value="">
                    <div class="ml10  form-group">
                        <%--<button class="btn btn-primary waves-effect" onclick="pullData();">拉取</button>--%>
                        <button class="btn btn-primary waves-effect" onclick="selectData();">查询</button>
                        <button class="btn btn-primary waves-effect" onclick="resetPage()">清空</button>
                    </div>
                </form>
            </div>
            <!--列表-->
            <div class="col-sm-12">
                <div class="col-lg-10">
                    <ul class="nav nav-tabs tabs" style="width: 100%;">
                        <li class="tab active" style="width: 15%;" key="MOVIES_TV">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">极清影视</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 15%;" key="MEMBER_VIP">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">VIP</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 15%;" key="COMMODITY_PACKAGE">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">商品包</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 15%;" key="APPLICATION_APP">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">应用</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div> <!--end SM12-->
            <table data-toggle="table" data-classes="table table-hover table-bordered  text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/vip/listData?productType=2006"
                   id="MOVIES_TV_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%-- <th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center">订单号</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="tradeStatus" data-align="center">订单状态</th>
                    <th data-field="userUuid" data-align="center">用户id</th>
                    <th data-field="paymentTime" data-align="center" data-formatter="defaultDateFormatter">支付时间</th>
                    <th data-field="partnerId" data-align="center">商户id</th>
                    <th data-field="partnerName" data-align="center">商户名称</th>
                    <th data-field="productName" data-align="center">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="thirdTradeNo" data-align="center">支付流水订单号</th>
                </tr>
                </thead>
            </table>
            <table data-toggle="table" data-classes="table table-hover table-bordered text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/vip/listData?productType=2009"
                   id="MEMBER_VIP_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%--  <th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center">订单号</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="tradeStatus" data-align="center">订单状态</th>
                    <th data-field="userUuid" data-align="center">用户id</th>
                    <th data-field="paymentTime" data-align="center" data-formatter="defaultDateFormatter">支付时间</th>
                    <th data-field="partnerId" data-align="center">商户id</th>
                    <th data-field="partnerName" data-align="center">商户名称</th>
                    <th data-field="productName" data-align="center">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="thirdTradeNo" data-align="center">支付流水订单号</th>
                </tr>
                </thead>
            </table>
            <table data-toggle="table" data-classes="table table-hover table-bordered text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/vip/listData?productType=21693"
                   id="COMMODITY_PACKAGE_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%--<th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center">订单号</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="tradeStatus" data-align="center">订单状态</th>
                    <th data-field="userUuid" data-align="center">用户id</th>
                    <th data-field="paymentTime" data-align="center" data-formatter="defaultDateFormatter">支付时间</th>
                    <th data-field="partnerId" data-align="center">商户id</th>
                    <th data-field="partnerName" data-align="center">商户名称</th>
                    <th data-field="productName" data-align="center">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="thirdTradeNo" data-align="center">支付流水订单号</th>
                    <th data-field="isRefund" data-align="center"></th>
                </tr>
                </thead>
            </table>
            <table data-toggle="table" data-classes="table table-hover table-bordered text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/vip/listData?productType=1003"
                   id="APPLICATION_APP_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%--  <th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center">订单号</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="tradeStatus" data-align="center">订单状态</th>
                    <th data-field="userUuid" data-align="center">用户id</th>
                    <th data-field="paymentTime" data-align="center" data-formatter="defaultDateFormatter">支付时间</th>
                    <th data-field="partnerId" data-align="center">商户id</th>
                    <th data-field="partnerName" data-align="center">商户名称</th>
                    <th data-field="productName" data-align="center">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="thirdTradeNo" data-align="center">支付流水订单号</th>
                    <%--  <th data-field="isRefund" data-align="center"></th>--%>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    <div id="my_model" onclick="colseModel();" class="model-mask box-hide">
    </div>
    <div id="model_context" class="model_context box-hide">
        <div class="panel-heading" style="color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;">
            <h3 class="panel-title" style="display: inline-block;">退款</h3>
            <button type="button" class="close" onclick="colseModel();">
                &times;
            </button>
        </div>
        <div class="model-Exhibition" style="display: none">
            <%--<span style="display: inline-block;width: 100%;">金额单位为元</span>--%>
            <form id="myRufe" onsubmit="return saveData();">
                <input type="hidden" name="tradeNo" value="" id="jqtradeNo">
                <input type="hidden" name="deductionIntegrals" value="0" id="deductionIntegrals">
                <div class="infoNum" style="width: 100%;height: 390px;margin: 0 auto;padding: 5px;">
                    <div class="form-group input-float-left">
                        <label class="li-hight input-float-left lable-width">退款对应账户:&nbsp;&nbsp;</label>
                        <input class="input-zdy" type="text" value="" name="refundAccount" placeholder="请输入退款对应账户">
                    </div>
                    <div class="form-group input-float-left">
                        <label class="li-hight input-float-left lable-width">订单金额 :&nbsp;&nbsp;</label>
                        <input class="input-zdy" readonly="readonly" id="orderMoney" type="text" name="orderMoney"
                               placeholder="">
                    </div>
                    <div class="form-group input-float-left">
                        <label class="li-hight input-float-left lable-width">可退款金额 :&nbsp;&nbsp;</label>
                        <input class="input-zdy" readonly="readonly" id="refundableMoney" type="text"
                               name="refundableMoney" placeholder="">
                    </div>
                    <div class="form-group input-float-center">
                        <label class="li-hight input-float-left lable-width">抵扣积分金额 :&nbsp;&nbsp;</label>
                        <input class="input-zdy" readonly="readonly" id="discountMoney" type="text" name="discountMoney"
                               placeholder="">
                    </div>
                    <div class="form-group input-float-left">
                        <label class="li-hight input-float-left lable-width"><em class="requiredred">*</em>实退金额 :&nbsp;&nbsp;</label>
                        <input class="input-zdy" type="text" id="probablyMoney" onchange="VerificationMoney(this)"
                               name="probablyMoney" placeholder="" required>
                    </div>
                    <div class="form-group input-float-left">
                        <label class="li-hight input-float-left lable-width">用户实际收款金额 :&nbsp;&nbsp;</label>
                        <input class="input-zdy" type="text" name="refundMoney" id="refundMoney" readonly="readonly"
                               placeholder="" required>
                    </div>
                    <div class="form-group">
                        <label class="li-hight  input-float-left lable-width">退款方式:&nbsp;&nbsp;</label>
                        <input name="refundWay" type="hidden" id="checkValue">
                        <select id="refundWay" class="select-zdy" style="width: 180px">

                        </select>
                    </div>
                    <div class="form-group input-float-left">
                        <label class="li-hight input-float-left lable-width"><em class="requiredred">*</em>退款原因:&nbsp;&nbsp;</label>
                        <textarea rows="4" style="resize:none" cols="50" class="input-zdy" type="text"
                                  name="refundReason" id="refundReason" placeholder="" required></textarea>
                    </div>

                    <div class="form-group" style="overflow:hidden;clear:both;">
                        <label class=" li-hight  input-float-left lable-width"><em class="requiredred">*</em>附件地址:&nbsp;&nbsp;</label>
                        <div style="width: 395px;overflow: hidden;float: left">
                            <input style="width: 180px" type="file" name="file" id="file">
                            <input id="imgUrl" name="attachmentUrl" type="hidden" value="">
                            <%--http://60.206.137.209/group2/M00/00/5B/PM6J0VssncSAXeUrAABUL_Ztbt4028.jpg--%>
                        </div>
                    </div>

                </div>
                <div class="model-bottom model-width">
                    <input type="submit" id="determineBtn" value="确定" class="btn btn-info">
                    <input type="button" value="关闭" class="btn btn-default" onclick="colseModel();">
                </div>
            </form>
        </div>
        <div class="loadEffect">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>

    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/vipmovies/vipmovies_list.js"></script>
</html>

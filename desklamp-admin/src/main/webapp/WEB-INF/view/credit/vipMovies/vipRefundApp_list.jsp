<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>vip影视列表页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">应用退款详情</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">积分商城</a></li>
            <li class="active">vip影视订单列表</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <input type="hidden" id="product" value="1003">
                <form id="paramForm" class="form-inline" tableId="goodsTableId" onsubmit="return false;">
                    <label style="display:inline-block;">订单号：</label>
                    <input type="text" id="tradeNo" name="tradeNo" type="text" class="form-control input-zdy-width-3" placeholder="订单号">
                    <label style="display:inline-block;">退款单号：</label>
                    <input type="text" id="refundNo" name="refundNo" type="text" class="form-control input-zdy-width-3" placeholder="退款订单号">
                    <input type="hidden" name="type" id="type" value="">
                    <div class="form-group">
                        <button class="btn btn-primary waves-effect" onclick="selectData();">查询</button>
                        <button class="btn btn-primary waves-effect"  onclick="clickEmpty();">清空</button>
                    </div>
                    <table class="table table-striped table-bordered table-bordered  text-nowrap dataTable" id="goodsList"
                           aria-describedby="sample_1_info">
                    </table>
                    <div class="row-fluid">
                        <div class="span6" style="display:none">
                            <div class="dataTables_info" id="sample_1_info"></div>
                        </div>
                    </div>
                </form>
            </div>
            <!--列表-->
            <div class="col-sm-12">
                <div class="col-lg-10">
                    <ul class="nav nav-tabs tabs" style="width: 100%;">
                        <li class="tab active" style="width: 15%;" key="ALREADY_COMMIT">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">已提交</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 15%;" key="ALREADY_REVOKE">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">已撤销</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 15%;" key="ALREADY_REFUND">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">已全部退款</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 15%;" key="ALREADY_PARE">
                            <a href="javascript:void(0);" data-toggle="tab" aria-expanded="true" class="">
                                <span class="hidden-xs">部分退款</span>
                               </a>
                        </li>
                    </ul>
                </div>
            </div> <!--end SM12-->
            <table data-toggle="table" data-classes="table table-bordered  text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/refund/listData?productType=1003&refundStatus=2"
                   id="ALREADY_COMMIT_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%--<th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="productName" data-align="center" data-formatter="autoWrapRender">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="refundNo" data-align="center">退款单号</th>
                    <th data-field="allowRefundAmount" data-align="center" data-formatter="fenzyuan">可退金额</th>
                    <th data-field="actualRefundAmount" data-align="center" data-formatter="fenzyuan">实退金额</th>
                    <th data-field="refundWay" data-align="center">退款方式</th>
                    <th data-field="refundStatus" data-align="center" >退款状态</th>
                    <th data-field="refundOperator" data-align="center" >退款操作人员</th>
                    <th data-field="summitTime" data-align="center" data-formatter="defaultDateFormatter">提交时间</th>
                    <th data-field="completeTime" data-align="center" data-formatter="defaultDateFormatter">退款时间</th>
                </tr>
                </thead>
            </table>
            <table data-toggle="table" data-classes="table table-bordered  text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/refund/listData?productType=1003&refundStatus=3"
                   id="ALREADY_REVOKE_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%--<th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="productName" data-align="center" data-formatter="autoWrapRender">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="refundNo" data-align="center">退款单号</th>
                    <th data-field="allowRefundAmount" data-align="center" data-formatter="fenzyuan">可退金额</th>
                    <th data-field="actualRefundAmount" data-align="center" data-formatter="fenzyuan">实退金额</th>
                    <th data-field="refundWay" data-align="center">退款方式</th>
                    <th data-field="refundStatus" data-align="center" >退款状态</th>
                    <th data-field="refundOperator" data-align="center" >退款操作人员</th>
                    <th data-field="summitTime" data-align="center" data-formatter="defaultDateFormatter">提交时间</th>
                    <th data-field="completeTime" data-align="center" data-formatter="defaultDateFormatter">退款时间</th>
                </tr>
                </thead>
            </table>
            <table data-toggle="table" data-classes="table table-bordered  text-nowrap text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/refund/listData?productType=1003&refundStatus=4"
                   id="ALREADY_REFUND_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%--<th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="productName" data-align="center" data-formatter="autoWrapRender">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="refundNo" data-align="center">退款单号</th>
                    <th data-field="allowRefundAmount" data-align="center" data-formatter="fenzyuan">可退金额</th>
                    <th data-field="actualRefundAmount" data-align="center" data-formatter="fenzyuan">实退金额</th>
                    <th data-field="refundWay" data-align="center">退款方式</th>
                    <th data-field="refundStatus" data-align="center" >退款状态</th>
                    <th data-field="refundOperator" data-align="center" >退款操作人员</th>
                    <th data-field="summitTime" data-align="center" data-formatter="defaultDateFormatter">提交时间</th>
                    <th data-field="completeTime" data-align="center" data-formatter="defaultDateFormatter">退款时间</th>
                </tr>
                </thead>
            </table>
            <table data-toggle="table" data-classes="table table-bordered  text-nowrap"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/refund/listData?productType=1003&refundStatus=5 "
                   id="ALREADY_PARE_TABLE"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <%--<th data-checkbox="true" data-align="center">序号</th>--%>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="tradeNo" data-align="center" data-formatter="autoWrapRender">订单号</th>
                    <th data-field="productName" data-align="center" data-formatter="autoWrapRender">产品名称</th>
                    <th data-field="productType" data-align="center">产品类型</th>
                    <th data-field="totalAmount" data-align="center" data-formatter="fenzyuan">订单金额</th>
                    <th data-field="refundNo" data-align="center">退款单号</th>
                    <th data-field="allowRefundAmount" data-align="center" data-formatter="fenzyuan">可退金额</th>
                    <th data-field="actualRefundAmount" data-align="center" data-formatter="fenzyuan">实退金额</th>
                    <th data-field="refundWay" data-align="center">退款方式</th>
                    <th data-field="refundStatus" data-align="center" >退款状态</th>
                    <th data-field="refundOperator" data-align="center" >退款操作人员</th>
                    <th data-field="summitTime" data-align="center" data-formatter="defaultDateFormatter">提交时间</th>
                    <th data-field="completeTime" data-align="center" data-formatter="defaultDateFormatter">退款时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/vipmovies/vipRefund_list.js"></script>
</html>

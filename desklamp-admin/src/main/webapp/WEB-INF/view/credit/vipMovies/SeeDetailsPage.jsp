<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
<style>
.seeDeta ul li{
width: 100%;
text-align: left;
padding-left: 10px;
border-bottom: 1px solid #CCCCCC;
height: 32px;
line-height: 32px;
}
.seeDeta ul li em{
display: inline-block;
margin-left: 10px;
font-size: 14px;
}
.seeDeta ul li:hover{
    cursor: pointer;
    border-bottom: 2px solid #00B7EE;
    transition: all 0.5s ease;
}
.seeDeta ul li:hover em{
    color: #00B7EE;
}
</style>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            订单详细信息
        </h4>
    </div>
    <div class="panel panel-success">
        <div class="panel-heading">
            <h4 class="panel-title" onclick="clickTwo();">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#collapseTwo">
                    退款单详情
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-body">
                <div style="width: 100%;margin: 0 auto;padding: 10px;">
                    <div class="seeDeta" style="width: 50%;box-sizing:border-box; float: left;">
                        <ul>
                            <li>退款订单号 : <em>${data.vipRefundDetailly.refundNo}</em></li>
                            <li>订单金额 : <em>${data.vipRefundDetailly.totalAmount/100}</em></li>
                            <li>实退款金额: <em>${data.vipRefundDetailly.actualRefundAmount/100}</em></li>
                            <li>提交时间 : <em>${data.getSummitTime}</em></li>
                            <li>退款状态 : <em>
                                <c:if test="${data.vipRefundDetailly.refundStatus eq '2'}">
                                    已提交
                                </c:if>
                                <c:if test="${data.vipRefundDetailly.refundStatus eq '3'}">
                                    已撤销
                                </c:if>
                                <c:if test="${data.vipRefundDetailly.refundStatus eq '4'}">
                                    已全部退款
                                </c:if>
                                <c:if test="${data.vipRefundDetailly.refundStatus eq '5'}">
                                    部分退款
                                </c:if>
                            </em></li>
                            <li>第三方账号 : <em>${data.vipRefundDetailly.userUuid}</em></li>
                            <li>退款原因 : <em>${data.vipRefundDetailly.refundReason}</em></li>
                            <li>其他信息 : <em></em></li>
                        </ul>
                    </div>
                    <div class="seeDeta" style="width: 50%;box-sizing:border-box;float: left;">
                        <ul>
                            <li>订单号 : <em>${data.vipRefundDetailly.tradeNo}</em></li>
                            <li>可退金额 : <em>${data.vipRefundDetailly.allowRefundAmount/100}</em></li>
                            <li>退款途径 : <em>
                                    <c:if test="${data.vipRefundDetailly.refundWay eq '-1'}">
                                        原路返回
                                    </c:if>
                                <c:if test="${data.vipRefundDetailly.refundWay eq '1'}">
                                    麦币余额
                                </c:if>
                            </em></li>
                            <li>退款时间 : <em>${data.getSummitTime}</em></li>
                            <li>用户id : <em>${data.vipRefundDetailly.userUuid}</em></li>
                            <li>附件下载 :<a target="_blank" href="${data.vipRefundDetailly.attachmentUrl}">下载</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-warning">
        <div class="panel-heading">
            <h4 class="panel-title" onclick="collapseFour();">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#collapseFour">
                    点击我进行展开，订单详细信息
                </a>
            </h4>
        </div>
        <div id="collapseFour" class="panel-collapse collapse">
            <div class="panel-body">
                <div class="seeDeta" style="width: 100%;margin: 0 auto;padding: 10px;">
                    <div style="width: 50%;box-sizing:border-box; float: left;">
                        <ul>
                            <li>订单号 : <em>${data.vipOrderDetails.tradeNo}</em></li>
                            <li>订单状态 : <em>
                                <c:if test="${data.vipOrderDetails.tradeStatus eq '2'}">
                                    已支付
                                </c:if>
                                <c:if test="${data.vipOrderDetails.tradeStatus eq '4'}">
                                    已退款
                                </c:if>
                            </em></li>
                            <li>下单时间 : <em>${data.getPaymentTime}</em></li>
                            <li>服务开通时间 : <em>${data.getOpenTime}</em></li>
                            <li>订单描述 : <em>${data.orderPaycenter.productDuration}</em></li>
                            <li>支付信息 : <em>
                                <c:if test="${data.vipOrderDetails.tradeStatus eq '2'}">
                                已支付
                                </c:if>
                                <c:if test="${data.vipOrderDetails.tradeStatus eq '4'}">
                                    已退款
                                </c:if></em></li>
                            <li>支付方式 : <em>${data.vipOrderDetails.paymentWay}</em></li>
                            <li>订单金额 : <em>${data.vipOrderDetails.totalAmount/100}</em></li>
                            <li>商品信息 : <em></em></li>
                            <li>产品id : <em>${data.orderPaycenter.productId}</em></li>
                            <li>服务时长 : <em>${data.vipOrderDetails.productDuration}</em>秒</li>
                            <li>设备MAC : <em>${data.vipOrderDetails.deviceMac}</em></li>
                        </ul>
                    </div>
                    <div class="seeDeta"  style="width: 50%;box-sizing:border-box;float: left;">
                        <ul>
                            <li>支付状态 : <em>
                                <c:if test="${data.vipOrderDetails.tradeStatus eq '2'}">
                                    已支付
                                </c:if>
                                <c:if test="${data.vipOrderDetails.tradeStatus eq '4'}">
                                    已退款
                                </c:if>
                            </em></li>
                            <li>支付时间 : <em>${data.getPaymentTime}</em></li>
                            <li>支付手续费费率 : <em></em></li>
                            <li>支付现金 : <em>${data.vipOrderDetails.cashAmount/100}</em></li>
                            <li>产品名称 : <em>${data.vipOrderDetails.partnerName}</em></li>
                            <li>产品类型 : <em>
                                <c:if test="${data.vipOrderDetails.productType eq '2006'}">
                                    极清
                                </c:if>
                                <c:if test="${data.vipOrderDetails.productType eq '2009'}">
                                    VIP
                                </c:if>
                                <c:if test="${data.vipOrderDetails.productType eq '21693'}">
                                    商品包
                                </c:if>
                                <c:if test="${data.vipOrderDetails.productType eq '1003'}">
                                    应用
                                </c:if>
                            </em></li>
                            <li>结算周期 : <em>${data.orderPaycenter.paymentChannel}</em></li>
                            <li>商户名称 : <em>${data.vipOrderDetails.partnerName}</em></li>
                            <li>地区名称 : <em>${data.vipOrderDetails.regionName}</em></li>
                            <li>用户id : <em>${data.vipOrderDetails.userUuid}</em></li>
                            <li>分公司 : <em>${data.vipOrderDetails.branchName}</em></li>
                            <li>地区名称 : <em>${data.vipOrderDetails.regionName}</em></li>
                            <li>设备SN : <em>${data.vipOrderDetails.deviceSn}</em></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script  type="text/javascript">
    $(function () {
        $('#collapseTwo').collapse('show')
    });
    function clickTwo() {
        $('#collapseTwo').collapse('hide');
        $('#collapseFour').collapse('show');
    }
    function collapseFour() {
        $('#collapseTwo').collapse('show');
        $('#collapseFour').collapse('hide');
    }
</script>
</html>

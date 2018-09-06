<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
<style>
.seep ul li{
width: 100%;
text-align: left;
padding-left: 10px;
border-bottom: 1px solid #CCCCCC;
height: 32px;
line-height: 32px;
}
.seep ul li em{
display: inline-block;
margin-left: 10px;
font-size: 14px;
}
.seep ul li:hover{
    cursor: pointer;
    border-bottom: 2px solid #00B7EE;
    transition: all 0.5s ease;
}
.seep ul li:hover em{
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
    <div style="width: 100%;margin: 0 auto;padding: 10px;">
        <div class="seep" style="width: 50%;box-sizing:border-box; float: left;">
            <ul>
                <li>订单号 : <em>${data.vipOrderDetails.tradeNo}</em></li>
                <li>用户id : <em>${data.vipOrderDetails.userUuid}</em></li>
                <li>订单号 : <em>${data.vipOrderDetails.tradeNo}</em></li>
                <li>产品名称 : <em>${data.vipOrderDetails.productName}</em></li>
                <li>产品时长 : <em>${data.vipOrderDetails.productDuration}</em>秒</li>
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
                <li>费率 : <em>${data.vipOrderDetails.feeRatio}</em></li>
                <li>支付时间 : <em>${data.getPaymentTime}</em></li>
                <li>开通时间 : <em>${data.getOpenTime}</em></li>
            </ul>
        </div>
        <div class="seep" style="width: 50%;box-sizing:border-box;float: left;">
            <ul>
                <li>ip : <em>${data.vipOrderDetails.clientIp}</em></li>
                <li> 商户id : <em>${data.vipOrderDetails.partnerId}</em></li>
                <li>商户名称 : <em>${data.vipOrderDetails.partnerName}</em></li>
                <li>商户单号 : <em>${data.vipOrderDetails.outTradeNo}</em></li>
                <li>订单金额 : <em>${data.vipOrderDetails.totalAmount/100}</em></li>
                <li>订单状态 : <em>
                    <c:if test="${data.vipOrderDetails.tradeStatus eq '2'}">
                        已支付
                    </c:if>
                    <c:if test="${data.vipOrderDetails.tradeStatus eq '4'}">
                        已退款
                    </c:if>
                </em></li>
                <li>支付渠道 : <em>${data.vipOrderDetails.paymentChannel}</em></li>
                <li>支付方式 : <em>${data.vipOrderDetails.paymentWay}</em></li>
                <li>地区名称 : <em>${data.vipOrderDetails.regionName}</em></li>
            </ul>
        </div>


    </div>
</body>
</html>

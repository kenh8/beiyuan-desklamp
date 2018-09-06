<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <form class="form-horizontal tasi-form">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">×</button>
            <h4 class="modal-title">
                商户详情
            </h4>
        </div>
        <div class="modal-body">
            <table class="table table-bordered table-striped">
                <tbody>
                <tr>
                    <th width="20%;">商户名称</th>
                    <td>${data.partnerName}</td>
                </tr>
                <tr>
                    <th>商户类型</th>
                    <td>${data.partnerType}</td>
                </tr>
                <tr>
                    <th>商户负责人</th>
                    <td>${data.partnerManager}</td>
                </tr>
                <tr>
                    <th>省市区</th>
                    <td>${data.province} ${data.city} ${data.area}</td>
                </tr>
                <tr>
                    <th>公司详细地址</th>
                    <td>${data.address}</td>
                </tr>
                <tr>
                    <th>营业执照号</th>
                    <td>${data.businessNo}</td>
                </tr>
                <tr>
                    <th>营业执照</th>
                    <td>${data.businessPic}</td>
                </tr>
                <tr>
                    <th>产品负责人</th>
                    <td></td>
                </tr>
                <tr>
                    <th>电子信箱</th>
                    <td>${data.email}</td>
                </tr>
                <tr>
                    <th>手机号码</th>
                    <td>${data.mobile}</td>
                </tr>
                <tr>
                    <th>QQ</th>
                    <td>${data.qq}</td>
                </tr>
                <tr>
                    <th>商户电话</th>
                    <td>${data.partnerPhone}</td>
                </tr>
                <tr>
                    <th>开户人</th>
                    <td>${data.accountHolder}</td>
                </tr>
                <tr>
                    <th>开户行</th>
                    <td>${data.accountBank}</td>
                </tr>
                <tr>
                    <th>银行账户</th>
                    <td>${data.bankAccount}</td>
                </tr>
                <tr>
                    <th>支付宝账号</th>
                    <td>${data.aliAccount}</td>
                </tr>
                <tr>
                    <th>结算方式</th>
                    <td>${data.settleType}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
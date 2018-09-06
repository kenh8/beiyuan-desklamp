<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">


    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>

</head>

<div>
<form class="form-horizontal tasi-form"
      method="post" id="expressAddress"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <h4 class="modal-title">
            提取收货地址
        </h4>
    </div>
    <div class="modal-body">
        <div class="">
            <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                    <span class="number"></span>
                    用户信息
                </a>
            </li>
        </div>
        <div class="" style="overflow: hidden;width: 60%;margin: 0 auto;">
                <div class="">
                    <input id="orderid" name="id" type="hidden" value="${requestScope.order.id}" />
                    <label class="">兑换商品人的姓名: </label><input id="name" name="name" type="text"  value="${requestScope.order.name}"  class="form-control" readonly="readonly" >
                    <label>手机号码:</label> <input id="phone" name="phone" type="text"  value="${requestScope.order.phone}"  class="form-control" readonly="readonly" >
                    <label>地址:</label> <input id="address" name="address" type="text"  value="${requestScope.order.address}"  class="form-control" readonly="readonly" >
                    <div class="help-block with-errors"></div>
                </div>
            <%--</div>--%>
        </div>
        <div class="form-group">
            <div style="text-align: center;">
                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</form>
</div>
</html>

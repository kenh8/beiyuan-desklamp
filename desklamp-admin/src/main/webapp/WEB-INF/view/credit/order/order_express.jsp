<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
        .logistics{
            float: left;
            width: 50%;
        }
        .form-group label{
            float: left;
            font-size: 14px;
            line-height: 2;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<div class="panel-body">
    <div class="mt20">
        <div class="m-b-10">
            <%--<form class="form-horizontal tasi-form"
                  method="post" id="logisticsModel"
                  data-toggle="validator"
                  onsubmit="return saveData();">--%>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">物流信息</h4>
                <div class="modal-body" style="overflow: hidden;width: 80%;margin: 0 auto;">
                    <input id="orderNum" type="hidden" value="${orderNumber}">
                    <div class="form-group">
                        <label for="deliveryCode"> <span style="color:red">*</span>快递公司：</label>
                        <select class="select2 select2-offscreen isApprove" style="width: 500px"
                                id="deliveryCode" name="deliveryCode"
                                data-placeholder="请选择" tabindex="-1" title="">
                            <option id="optionOne" value=''>-请选择-</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="trackingNo"> <span style="color:red">*</span>物流单号：
                        </label>
                        <input type="text" name="trackingNo" class="form-control logistics" id="trackingNo"
                               placeholder="物流单号">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary " id="model_submit" onclick="submitlogistics()">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            <%--</form>--%>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(document).ready(function(){
        $(".isApprove").select2({
            width:'50%'
        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/order/order_express.js"></script>
</html>

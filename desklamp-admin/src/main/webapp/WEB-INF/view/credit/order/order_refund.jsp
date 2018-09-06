<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
        .logistics {
            float: left;
            width: 50%;
        }

        .form-group label {
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
            <div class="modal-body" style="overflow: hidden;width: 80%;margin: 0 auto;">
                <input id="orderSn" type="hidden" value="${orderNumber}">
                <div class="form-group">
                    <label for="reason">填写原因：
                    </label>
                    <input type="text" name="reason" class="form-control logistics" id="reason"
                           placeholder="填写原因"  />
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
    $(document).ready(function () {
        $(".isApprove").select2({
            width: '50%'
        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/order/order_refund.js"></script>
</html>

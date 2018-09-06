<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<body>
<form class="form-horizontal tasi-form" method="post"
      action="${pageContext.request.contextPath}/partner/savePartnerPhone?callbackMethod=refreshTable"
      data-toggle="validator"
      onsubmit="return validateCallback(this,modalAjaxDone);">
    <%--onsubmit="return checkTel(this,modalAjaxDone);">--%>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            商户电话编辑
        </h4>
    </div>
    <input type="hidden" id="partnerId" name="partnerId" value="${partnerId}">
    <div class="modal-body">
        <div class="form-group">
            <label for="partnerPhone" class="col-sm-2 col-xs-2 control-label">商户电话</label>
            <div class="col-sm-4 col-md-offset-2">
                <input type="text" class="form-control" id="partnerPhone" name="partnerPhone" placeholder="商户电话" data-error="请输入商户电话" value="${partnerPhone}"  required/>
                <div class="help-block with-errors"></div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
</body>
<script type="text/javascript">
    function checkTel(form,modalAjaxDone){
        var phone = document.getElementById('partnerPhone').value;
        if(!/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/.test(phone)){
            _errorTipsFun("电话号码格式有误，请重新填写");
            return false;
        }
        return validateCallback(form,modalAjaxDone);
    }
</script>
</html>
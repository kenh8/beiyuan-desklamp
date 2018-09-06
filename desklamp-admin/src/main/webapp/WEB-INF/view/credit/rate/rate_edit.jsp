<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--<script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>--%>
</head>
<form id="rateForm" class="form-horizontal tasi-form" method="post"
     <%-- action="${pageContext.request.contextPath}/credit/rate/saveData"--%>
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            积分汇率设置
        </h4>
    </div>
    <input type="hidden" id="id" name="id" value="${id }" />
    <div class="modal-body">
        <div class="form-group">
            <label for="exchangeRate" class="col-sm-2 col-xs-2 control-label">汇率：</label>
            <div class="col-sm-4 col-md-offset-2">
                <input type="text" class="form-control" id="exchangeRate" name="exchangeRate" placeholder="汇率(1元=多少积分)"
                       data-error="汇率" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" value="${exchangeRate}"  required/>
                <div class="help-block with-errors"></div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<div id="cover_img_modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"></div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/rate/rate_edit.js"></script>
</html>

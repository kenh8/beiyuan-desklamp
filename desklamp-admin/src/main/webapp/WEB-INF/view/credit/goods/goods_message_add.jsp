<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<form class="form-horizontal tasi-form" method="post" id="messageForm"
      action="${pageContext.request.contextPath}/credit/message/saveData"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            积分商城-短信模板
        </h4>
    </div>
    <%--<input type="hidden" id="id" name="id"/>--%>
    <div class="modal-body">
        <div class="form-group no-margin">
            <label for="message" class="col-sm-2 col-xs-2 control-label">短信内容 </label>
            <div class="col-sm-8 col-md-offset-2">
                <input id="messageId" name="id" type="hidden" value="${data.id}"/>
                <label for="status">启用</label>
                <c:if test="${data.status==1}">
                    <input type="checkbox" id="status" name="status" value="${data.status}" checked="checked"
                           onclick="checkBoxChange()">
                </c:if>
                <c:if test="${data.status==0}">
                    <input type="checkbox" id="status" name="status" value="${data.status}" onclick="checkBoxChange()">
                </c:if>

                <textarea  class="form-control" name="message" id="message" style="width: 400px;height: 160px;"
                           placeholder="恭喜您已经获得[XXaXX]，您的[XXbXX]兑换码为[XXcXX]，请到[XXdXX]领取。"
                           data-error="请输入短信模板">${data.message}</textarea>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label for="defaultMessage" class="col-sm-2 col-xs-2 control-label">默认内容</label>
            <div class="col-sm-4 col-md-offset-2">
                <input type="text" class="form-control" style="border:0px;width: 500px;"
                       value="${data.defaultMessage}" name="defaultMessage" id="defaultMessage"
                       placeholder="恭喜您已经获得[商品名称]，您的[卡类型]为[兑换码]，请到[领取地址]领取。">
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light" onclick="finishBtnClick()">保存</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_message_add.js"></script>
</html>
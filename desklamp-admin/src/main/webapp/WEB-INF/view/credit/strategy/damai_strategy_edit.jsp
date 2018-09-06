<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <%-- <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>--%>
</head>
<form class="form-horizontal tasi-form" method="post"
      id="editForm"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            策略信息
        </h4>
    </div>
    <input type="hidden" id="integralStrategyId" name="integralStrategyId" value="${data.integralStrategyId}"/>
    <div class="modal-body">
        <div class="form-group">
            <label for="strategyName" class="col-sm-2 col-xs-2 control-label">策略名称</label>
            <div class="col-sm-4">
                <input type="text" name="strategyName" class="required form-control" id="strategyName" placeholder="请输入策略名称" data-error="请输入策略名称" value="${data.strategyName}" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-xs-2 control-label" for="isEffective"> 状态</label>
            <div id="isEffective" class="col-sm-10">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="isEffective1" value="1" <c:if test="${data ne null and data.isEffective eq 1}">checked</c:if> name="isEffective">
                    <label for="isEffective1">有效</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="isEffective2"  value="0" <c:if test="${data eq null or data.isEffective eq 0}">checked</c:if> name="isEffective">
                    <label for="isEffective2">无效</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="clientId" class="col-sm-2 col-xs-2 control-label">客户端</label>
            <div id="clientId" class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="clientId1" value="1" <c:if test="${data ne null and data.clientId eq 1}">checked</c:if> name="clientId">
                    <label for="clientId1">盒子端</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="clientId2"  value="2" <c:if test="${data ne null and data.clientId eq 2}">checked</c:if> name="clientId">
                    <label for="clientId2">移动端</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="clientId3"  value="3" <c:if test="${data ne null and data.clientId eq 3}">checked</c:if> name="clientId">
                    <label for="clientId3">PC端</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="strategyRuleYuan" class="col-sm-2 col-xs-2 control-label">消费策略</label>
            <div class="col-sm-4">
                <input type="text" id="strategyRuleYuan" name="strategyRuleYuan" placeholder="请输入消费策略" data-error="请输入消费策略" value="${data.strategyRuleYuan}" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" required>元
            </div>
            <div class="col-sm-4">
                <input type="text" id="strategyRuleIntegral" name="strategyRuleIntegral" placeholder="请输入策略积分" data-error="请输入策略积分" value="${data.strategyRuleIntegral}" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>积分
            </div>
        </div>
        <div class="form-group">
            <label for="limit" class="col-sm-2 col-xs-2 control-label">单品积分上限</label>
            <div class="col-sm-4">
                <input type="text" name="limit" class="form-control" id="limit" placeholder="请输入单品积分上限" data-error="请输入单品积分上限" value="${data.limit}" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">保存</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<div id="cover_img_modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"></div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/strategy/damai_strategy_edit.js"/>

</html>

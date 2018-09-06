<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<form class="form-horizontal tasi-form" method="post" id="approveUpForm"
      action="${pageContext.request.contextPath}/credit/goods/saveData?callbackMethod=refreshTable"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            审核商品上架
        </h4>
    </div>
    <input type="hidden" id="id" name="id" value="${data.id}"/>
    <input type="hidden" id="modifyType" name="modifyType" value="${modifyType}"/>
    <input type="hidden" id="goodsExchangeIntegral" name="goodsExchangeIntegral" value="${data.goodsExchangeIntegral}"/>
    <input type="hidden" id="freight" name="freight" value="${data.freight}"/>
    <input type="hidden" id="goodsPrice" name="goodsPrice" value="${data.goodsPrice}"/>
    <input type="hidden" id="nowRate" name="nowRate" value="${nowRate}"/>
    <input type="hidden" id="goodsStock" name="goodsStock" value="${data.goodsStock}"/>
    <div class="modal-body">
        <div class="form-group">
            <label for="isApprove" class="col-sm-2 col-xs-2 control-label">审核状态</label>
            <div class="col-sm-4 col-md-offset-2">
                <select class="select2 select2-offscreen isApprove" id="isApprove" name="isApprove" data-placeholder="请选择" data-error="请选择是否通过" tabindex="1" title="" required>
                    <option value="2">审核通过</option>
                    <option value="3">审核不通过</option>
                </select>
            </div>
        </div>
        <div class="form-group no-margin">
            <label for="goodsAuditDescription" class="col-sm-2 col-xs-2 control-label">审核描述 </label>
            <div class="col-sm-4 col-md-offset-2">
                <textarea class="form-control autogrow" id="goodsAuditDescription" name="goodsAuditDescription" data-error="请输入审核描述" style="width: 400px;height: 160px;"></textarea>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label for="isApprove" class="col-sm-2 col-xs-2 control-label">结算依据</label>
            <div class="col-sm-4 col-md-offset-2">
                <select class="select2 select2-offscreen" id="settlementBasisId" name="settlementBasisId" onchange="changePrice()">
                    <option value="1">自拟结算价</option>
                    <option value="2">原价</option>
                </select>
                <span id="orginalPriceSpan"> <input class="" type="text" class="form-control" style="width: 100px"
                                                    id="orginalPrice"
                                                 name="orginalPrice" value="" >元
                </span>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function(){
        $(".isApprove").select2({
            width:'50%'
        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_approveUp.js"></script>
</html>
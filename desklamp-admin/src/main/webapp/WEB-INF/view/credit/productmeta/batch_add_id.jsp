<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<form class="form-horizontal tasi-form" method="post" id="addForm"
      action=""
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            SKU/分类ID
        </h4>
    </div>
    <input type="hidden" name="integralStrategyId" value="${integralStrategyId}">
    <div class="modal-body">
        <div class="form-group">
            <label for="categoryIdType" class="col-sm-2 col-xs-2 control-label">审核状态</label>
            <div class="col-sm-4 col-md-offset-2">
                <select id="categoryIdType" name="categoryIdType" class="select2 select2-offscreen" style="width: 240px;" data-placeholder="请选择" tabindex="" title="">
                    <option value="1" >一级分类批量添加</option>
                    <option value="2">二级分类批量添加</option>
                    <option value="3">三级分类批量添加</option>
                    <option value="4">sku批量添加</option>
                </select>
            </div>
        </div>
        <div class="form-group no-margin">
            <label for="categoryId" class="col-sm-2 col-xs-2 control-label">SKU/分类ID </label>
            <div class="col-sm-4 col-md-offset-2">
                <textarea class="form-control autogrow" rows="3" id="categoryId" name="categoryId" data-error="请输入SKU/分类ID" style="width: 400px;height: 160px;"></textarea>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <input type="hidden" value="hide">
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/productmeta/batch_add_id.js"></script>
</html>
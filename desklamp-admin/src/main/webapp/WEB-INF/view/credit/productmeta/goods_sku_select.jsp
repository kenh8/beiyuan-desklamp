<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        .errorMes{overflow:hidden;padding:0;}
        .errorMes li{text-align:center;width:50%;float:left;color:red;opacity:.8;border-bottom:1px solid #d43f3a;}
    </style>
</head>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">内容选择 </h4>
</div>
<div class="modal-body">
    <div>
        <ul class="errorMes">

        </ul>
    </div>
    <div class="panel auth-width">
        <div class="panel-body">
            <div class="mt20">
                <div class="m-b-10">
                    <form id="paramForm" class="form-inline" tableId="skuSelectTableId" onsubmit="return false;">
                        <label class="m-b-5">商品名称：<input name="goodsName" type="text" class="form-control" placeholder="商品名称"></label>
                        <label  class="m-b-7">价格区间：<input name="minPrice" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" type="text" style="width: 100px;" class="form-control" placeholder="最小价格">~
                            <input name="maxPrice" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" type="text" style="width: 100px;" class="form-control" placeholder="最大价格">
                        </label>
                        <br>
                        <label>商品分类:</label>
                        <label>
                            <select class="select2 select2-offscreen category-one" style="width: 130px;" id="categoryOne" data-placeholder="一级分类" tabindex="-1" title="">
                            </select>
                        </label>
                        <label>
                            <select class="select2 select2-offscreen category-two" style="width: 130px;" id="categoryTwo" data-placeholder="二级分类" tabindex="-1" title="">
                            </select>
                        </label>
                        <label>
                            <select class="select2 select2-offscreen category-three" style="width: 130px;" id="categoryThree" data-placeholder="三级分类" tabindex="-1" title="">
                            </select>
                        </label>
                        <input type="hidden" name="categorySn" value="">
                        <div class="form-group fr">
                            <button class="btn btn-primary waves-effect searchBtn">查询</button>
                            <button class="btn btn-primary waves-effect clearSearch">清空</button>
                        </div>
                    </form>
                    <input type="hidden" name="integralStrategyId" value="${integralStrategyId}">
                </div>
                <table data-toggle="table" data-classes="table table-hover"
                       data-pagination="true"
                       data-url="${pageContext.request.contextPath}/credit/product/getSkuListData" id="skuSelectTableId"
                       data-side-pagination="server"
                >
                    <thead>
                    <tr>
                        <th data-checkbox="true" data-align="left">序号</th>
                        <th data-field="goodskuSn" data-align="left" data-formatter="autoWrapRender">SKU</th>
                        <th data-field="goodsName" data-align="left" data-formatter="autoWrapRender">商品名称</th>
                        <th data-field="" data-align="left" data-formatter="renderGoodsStatus">上架状态</th>
                        <th data-field="discountPrice" data-align="left">价格</th>
                        <th data-field="availableStock" data-align="left">库存</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal-footer">
    <button type="button" onclick="selectSureBtn(1);" class="btn btn-info waves-effect waves-light">保存</button>
    <%--<button type="button" onclick="selectSureBtn(2);" class="btn btn-info waves-effect waves-light">保存并更新</button>
    <button type="button" onclick="selectSureBtn(3);" class="btn btn-info waves-effect waves-light">保存但不更新</button>--%>
    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/productmeta/goods_category_common.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/productmeta/goods_sku_select.js"></script>

</html>
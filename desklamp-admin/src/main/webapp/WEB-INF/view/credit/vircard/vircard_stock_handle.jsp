<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<form class="form-horizontal tasi-form" method="post" id="approveUpForm"
      action="${pageContext.request.contextPath}/credit/goods/stockManage"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <%--<button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
        </button>--%>
        <h4 class="modal-title">
            虚拟卡库存
        </h4>
    </div>
    <input type="hidden" id="id" name="id" value="${stockDetail.id}"/>

    <div class="modal-body">
        <div class="">
            <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                    虚拟物品库存信息
                </a>
            </li>
        </div>
        <div class="form-group">
            <div class="form-group col-sm-10">
                <label class="col-lg-2 control-label" for="goodsStock">库存存量</label>
                <div class="">
                    <input type="text" id="goodsStock" value="${stockDetail.stockNumber}" disabled>
                </div>
            </div>
            <div class="form-group col-sm-10">
                <label class="col-lg-2 control-label" for="usedStock">总消耗库存</label>
                <div class="">
                    <input type="text" id="usedStock" value="${stockDetail.totalConsume}" disabled>
                </div>
            </div>
            <div class="form-group col-sm-10">
                <label class="col-lg-2 control-label" for="lockStock">占用库存</label>
                <div class="">
                    <input type="text" id="lockStock" name="lockStock" value="${stockDetail.lockStock}" disabled>
                </div>
            </div>
        </div>

        <div class="">
            <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                    库存操作
                </a>
            </li>
        </div>
        <div class="form-group">
            <div class="form-group col-sm-10">
                <div class="radio radio-info radio-inline">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/credit/virCard/addvircard?id=${stockDetail.id}"
                       data-toggle="modal" data-target="#base_modal">入库</a>

                    <%--  <input type="radio" id="stockType1" value="1" name="stockType" checked>
                      <label for="stockType1">补充库存</label>
                      <input type="text" id="toStock" name="stock" onKeyUp="value=value.replace(/[^0-9]/g,'')">--%>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="stockType2" value="2" name="stockType">
                    <a class="btn btn-primary"
                       href="${pageContext.request.contextPath}/credit/virCard/exportvircard?id=${stockDetail.id}"
                       data-toggle="modal" data-target="#base_modal">出库</a>

                </div>
            </div>
        </div>

    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/vircard_stock_handle.js"></script>
</html>
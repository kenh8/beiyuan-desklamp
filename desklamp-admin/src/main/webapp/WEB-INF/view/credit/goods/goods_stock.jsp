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
      action="${pageContext.request.contextPath}/credit/goods/stockManage"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            商品库存
        </h4>
    </div>
    <input type="hidden" id="id" name="id" value="${data.id}"/>
    <input type="hidden" id="maxStock" name="maxStock" value=""/>
    <input type="hidden" id="goodsType" name="goodsType" value="${data.goodsType}"/>
    <input type="hidden" id="viralCardId" name="viralCardId" value="${data.viralCardId}"/>
    <input type="hidden" id="modifyType" name="modifyType"/>
    <div class="modal-body">
        <div class="">
            <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                    <c:choose>
                        <c:when test="${data ne null and data.goodsType eq 1}">
                            实体物品库存信息
                        </c:when>
                        <c:otherwise>
                            虚拟物品库存信息
                        </c:otherwise>
                    </c:choose>
                </a>
            </li>
        </div>
        <div class="">
            <div class="form-group col-sm-10">
                <label class="col-lg-2 control-label" for="goodsStock">库存存量</label>
                <div class="">
                    <input type="text" id="goodsStock" value="${data.actualGoodsStockDto.stock}" disabled>
                </div>
            </div>
            <div class="form-group col-sm-10">
                <label class="col-lg-2 control-label" for="usedStock">总消耗库存</label>
                <div class="">
                    <input type="text" id="usedStock" value="${data.actualGoodsStockDto.usedStock}" disabled>
                </div>
            </div>
            <div class="form-group col-sm-10">
                <label class="col-lg-2 control-label" for="lockStock">锁定库存</label>
                <div class="">
                    <input type="text" id="lockStock" name="lockStock" value="${data.actualGoodsStockDto.lockStock}"disabled >
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
        <div class="">
            <div class="form-group col-sm-10">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="stockType1" value="1" name="stockType" checked onclick="InputDisable();">
                    <label for="stockType1">入库</label>
                    <input type="text" id="toStock"  class="input-zdy" name="stock" onKeyUp="value=value.replace(/[^0-9]/g,'')">
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="stockType2" value="2" name="stockType" onclick="InputDisable();">
                    <label for="stockType2">出库</label>
                    <input type="text" class="" id="fromStock" name="stock" onKeyUp="value=value.replace(/[^0-9]/g,'')">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div style="text-align: center;">
                <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_stock.js"></script>
</html>
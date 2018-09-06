<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="/WEB-INF/tld/sys-permission.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">关联内容</h4>
        <ol class="breadcrumb pull-right">
            <li>优购消费积分策略管理</li>
            <li class="active">关联内容</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <input type="hidden" id="integralStrategyId" value="${integralStrategyId}" />
              <form id="paramForm" class="form-inline" tableId="productMetaTable" onsubmit="return false;">
                 <label style="display:inline-block;">SKU：</label>
                    <input type="text" name="categoryId" type="text" class="form-control" placeholder="SKU">
                    &nbsp;&nbsp;
                    <div class="form-group fr">
                        <a class="btn btn-primary"  href="javascript:;" onclick="upperPage(this);" >返回上级页面</a>
                        <a class="btn btn-primary"  href="${pageContext.request.contextPath}/credit/product/selectSku?integralStrategyId=${integralStrategyId}" data-toggle="modal" data-target="#base_modal">筛选添加</a>
                       <%-- <a class="btn btn-primary"  href="${pageContext.request.contextPath}/credit/product/selectByCategory?integralStrategyId=${integralStrategyId}" onclick="upFormTableId();" data-toggle="modal" data-target="#base_modal">SKU/分类ID批量添加</a>--%>
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                </form>
            </div>
            <table data-toggle="table" data-classes="table table-hover"
                   data-pagination="true"
                   data-url="${pageContext.request.contextPath}/credit/product/listData?integralStrategyId=${integralStrategyId}" id="productMetaTable"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="productName" data-align="center" data-formatter="autoWrapRender">商品名称</th>
                    <th data-field="categoryIdType" data-align="center" data-formatter="typeRender">分类</th>
                    <th data-field="categoryId" data-align="center">SKU</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/productmeta/product_meta_list.js"></script>
</html>
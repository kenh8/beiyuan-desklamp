<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="/WEB-INF/tld/sys-permission.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">库存管理</h4>
        <ol class="breadcrumb pull-right">
            <li>库存管理</li>
            <li class="active">库存列表</li>
        </ol>
    </div>
</div>

 <div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="stockTableId" onsubmit="return false;">

                    <%--<div class="form-group fr">
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>--%>

                </form>
                <div class="btn-group">
                    <a class="btn btn-primary"  href="${pageContext.request.contextPath}/credit/virCardStock/toClearSingle" data-toggle="modal" data-target="#base_modal">单个消库</a>
                    <a class="btn btn-primary"  href="${pageContext.request.contextPath}/credit/virCardStock/toClearMore" data-target="divload" data-div="baseContainer">批量消库</a>
                  <%--  <a class="btn btn-primary"  href="${pageContext.request.contextPath}/credit/virCardStock/toClearMore" data-toggle="modal" data-target="#base_modal">批量消库</a>--%>
                </div>

            </div>
        <table data-toggle="table" data-classes="table table-hover"
               data-pagination="true" data-striped="true"
               data-url="${pageContext.request.contextPath}/credit/virCardStock/listData" id="stockTableId"
               data-show-jumpto="true"
               data-side-pagination="server">
            <thead>
            <tr>
                <th data-checkbox="true" data-align="center">序号</th>
                <th data-field="redeemCodeId" data-align="center">兑换码id</th>
                <th data-field="redeemCodeName" data-align="center">兑换码</th>
                <th data-field="redeemCodeStatus" data-align="center" data-formatter="redeemStatusRender">兑换码状态</th>
                <th data-field="merchantName" data-align="center" <%--data-formatter="autoWrapRender"--%>>商户</th>
                <%--<th data-field="totalStock" data-align="left">总库存</th>
                <th data-field="occupyStock" data-align="left">占用库存</th>
                <th data-field="availableStock" data-align="left">可用库存</th>
                <th data-field="goods.marketUpDate" data-align="left" data-formatter="defaultDateFormatter" >上架时间</th>--%>
            </tr>
            </thead>
        </table>

   </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/stock/stock_list.js"></script>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">积分商城</h4>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="virCardTableId" onsubmit="return false;">
                    <label style="display:inline-block;">卡名称：</label>
                    <div class="btn-group">
                        <input type="text" id="virtualCardName" name="virtualCardName" type="text" class="form-control" placeholder="卡名称">
                    </div>
                    <div class="clearfix" style="display:inline-block;position: relative;top:0px;">
                        <label style="display:inline-block;">卡类型：</label>
                        <select id="virtualCardType" name="virtualCardType" style="width: 240px;height: 32px;margin-top: 3px;border-radius: 2px;    border: 1px solid #eee;" data-placeholder="请选择" tabindex="" title="">
                            <option value="">全部</option>
                            <option value="1">提货卡</option>
                            <option value="2">激活卡</option>
                        </select>
                        &nbsp;&nbsp;
                        <div class="form-group fr">
                            <button class="btn btn-primary waves-effect searchBtn">查询</button>
                            <button class="btn btn-primary waves-effect clearSearch">清空</button>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover dataTable" id="virCardList"
                           aria-describedby="sample_1_info">
                    </table>
                    <div class="row-fluid">
                        <div class="span6" style="display:none">
                            <div class="dataTables_info" id="sample_1_info"></div>
                        </div>
                    </div>
                </form>
            </div>

            <table data-toggle="table" data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/goods/goodsVircardlistData" id="virCardTableId"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                    <th data-field="" data-align="left" data-formatter="operateRender">操作</th>
                    <th data-field="virtualCardName" data-align="left" data-formatter="autoWrapRender">卡名称</th>
                    <th data-field="virtualCardType" data-align="left"  data-formatter="renderVirCardType">卡类型</th>
                    <th data-field="stockNumber" data-align="left">剩余库存</th>
                    <th data-field="merchantName" data-align="left" data-formatter="autoWrapRender">所属商户</th>
                    <th data-field="price" data-align="left">售价</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_vircard_list.js"></script>
</html>

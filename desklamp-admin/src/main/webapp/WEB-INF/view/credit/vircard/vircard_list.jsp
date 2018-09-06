<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>
<style>
    .select-zdy{
        width: 200px;
        height: 32px;
        margin-top: 3px;
        border-radius: 2px;
        border:1px solid #e2e2e2;
    }

    .box {
        width: 70%;
        float: left;
        margin-bottom: 15px;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">虚拟卡管理</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">虚拟卡管理</a></li>
            <li class="active">虚拟卡列表</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="virCardTableId" onsubmit="return false;">
                    <div class="box" style="width: 67%;">
                        <label>卡名称：</label>
                        <input type="text" id="searchVirtualCardName" name="virtualCardName" class="form-control"
                               placeholder="卡名称">
                        <label style="display:inline-block;">卡类型：</label>
                            <select id="searchVirtualCardType" class="select-zdy"
                           name="virtualCardType"
                            data-placeholder="请选择" tabindex="" title="">
                            <option value="">全部</option>
                            <option value="1">提货卡</option>
                            <option value="2">激活卡</option>
                        </select>
                        <br/>
                        <div style="margin-top: 5px;">
                            <label class="control-label" for="merchantId"> 所属商家：</label>
                         <%--   <select class="select-zdy select2"
                                    id="merchantId" name="merchantId"
                                    data-placeholder="请选择" tabindex="-1" title="">
                                &lt;%&ndash; <option id="optionOne" value=''>---请选择---</option>&ndash;%&gt;
                            </select>--%>
                            <select id="merchantSelect" style="width: 320px;" class="select2 select2-offscreen select-zdy"
                                    id="merchantId" name="merchantId"
                                    data-placeholder="请选择" tabindex="-1" title="">
                                <option id="optionOne" value="">-请选择-</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group fr">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/credit/virCard/add"
                               data-target="divload" data-div="baseContainer">批量制卡</a>
                            <a href="${pageContext.request.contextPath}/upload/excel_temp.xlsx"
                               class="btn btn-primary waves-effect">下载EXCEL模板</a>
                            <button class="btn btn-primary waves-effect searchBtn">查询</button>
                            <button class="btn btn-primary waves-effect clearSearch" id="clearSearch">清空</button>
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
                   data-url="${pageContext.request.contextPath}/credit/virCard/listData" id="virCardTableId"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="center">序号</th>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="id" data-align="center">id</th>
                    <th data-field="virtualCardName" data-align="center" <%--data-formatter="autoWrapRender"--%>>卡名称</th>
                    <th data-field="virtualCardType" data-align="center" data-formatter="renderVirCardType">卡类型</th>
                    <%-- <th data-field="stockNumber" data-align="left">总库存</th>--%>
                    <th data-field="stockNumber" data-align="center">剩余库存</th>
                    <th data-field="isExpire" data-align="center" data-formatter="isExpireRender">是否过期</th>
                    <th data-field="merchantName" data-align="center" <%--data-formatter="autoWrapRender"--%>>所属商户</th>
                    <th data-field="price" data-align="center">售价</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/vircard_list.js"></script>
</html>

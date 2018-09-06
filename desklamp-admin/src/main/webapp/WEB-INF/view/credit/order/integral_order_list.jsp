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
        <h4 class="pull-left page-title">积分订单</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">积分订单</a></li>
            <li class="active">积分订单列表</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="intOrderTableId" onsubmit="return false;">
                    <label><span class="hidden-xs">积分订单号:</span> <input name="integralOrderId" id="searchIntegralOrderId" type="text" class="form-control" placeholder="请输入积分订单号"></label>
                    <label><span class="hidden-xs">业务订单号:</span> <input name="businessOrderId" id="searchBusinessOrderId" type="text" class="form-control" placeholder="请输入业务订单号"></label>
                    <label style="display:inline-block;">策略类型：</label>
                    <select  class="select2 select2-offscreen" id="searchOrderType" name="orderType" style="width: 240px;" data-placeholder="请选择" tabindex="" title="">
                        <option value="">全部</option>
                        <option value="1">消费</option>
                        <option value="2">退单</option>
                        <option value="3">到期</option>
                    </select>
                    <div class="clearfix" style="display:inline-block;position: relative;top:0px;">
                       <%-- <label style="display:inline-block;">积分来源：</label>
                        <select  class="select2 select2-offscreen" id="searchIntegralSource" name="integralSource" style="width: 240px;" data-placeholder="请选择" tabindex="" title="">
                            <option value="">全部</option>
                        </select>--%>
                        <label style="display:inline-block;">客户端：</label>
                        <select  class="select2 select2-offscreen" id="searchClientId" name="clientId" style="width: 240px;" data-placeholder="请选择" tabindex="" title="">
                            <option value="">全部</option>
                            <option value="1">盒子端</option>
                            <option value="2">手机端</option>
                            <option value="3">PC端</option>I
                        </select>
                        <label style="display:inline-block;">积分来源：</label>
                        <select  class="select2 select2-offscreen" id="searchIntegralsSource" name="integralSource" style="width: 240px;" data-placeholder="请选择" tabindex="" title="">
                            <option value="">全部</option>
                            <option value="1">家视天下</option>
                        </select>
                        <label><span id="userno" class="hidden-xs">用户ID:</span> <input name="unionId" id="searchUnionId" type="text" class="form-control" placeholder="请输入用户ID"></label>
                        <label>
                            <span id="integralStrategyName" class="hidden-xs">策略名称:</span>
                            <input name="integralStrategyName" type="text" class="form-control" placeholder="策略名称">
                        </label>
                        &nbsp;&nbsp;
                        <label>订单时间：
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' id="startTime" style="width: 170px;" name="startTime" autocomplete="off" class="form-control" />
                            </div>
                            ~
                            <div class='input-group date' id='datetimepicker2'>
                                <input type='text' id="endTime" name="endTime" style="width: 170px;" autocomplete="off" class="form-control" />
                            </div>
                        </label>
                        &nbsp;&nbsp;
                        <div class="form-group">
                            <button class="btn btn-primary waves-effect searchBtn">查询</button>
                            <button class="btn btn-primary waves-effect clearSearch">清空</button>
                            <a class="btn btn-primary waves-effect" onclick="sureExport()">
                                <i class="fa fa-cloud-download"></i>
                                <span>导出订单</span>
                            </a>
                        </div>
                    </div>

                    <%--<table class="table table-striped table-bordered table-hover dataTable" id="integralOrderList"
                           aria-describedby="sample_1_info">
                    </table>
                    <div class="row-fluid">
                        <div class="span6" style="display:none">
                            <div class="dataTables_info" id="sample_1_info"></div>
                        </div>
                    </div>--%>
                </form>
                <%--导出excel begin--%>
                <form id="commonExportForm" action="" target="hide" method="POST">

                </form>
                <iframe class="hidden" name="hide"></iframe>
                <%--导出excel end--%>
            </div>

            <table data-toggle="table" data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/integralOrder/listData" id="intOrderTableId"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="center">序号</th>
                    <th data-field="integralOrderId" data-align="center" >积分订单号</th>
                    <th data-field="businessOrderId" data-align="center" >业务订单号</th>
                    <th data-field="unionId" data-align="center">用户ID</th>
                    <th data-field="clientId" data-align="center" data-formatter="renderClientId">客户端</th>
                    <th data-field="integralStrategyName" data-align="center" data-formatter="autoWrapRender">策略名称</th>
                    <th data-field="orderType" data-align="center"  data-formatter="orderTypeRender">策略类型</th>
                    <th data-field="integralType" data-align="center" data-formatter="integralTypeRender">积分类型</th>
                    <th data-field="integralNum" data-align="center">积分</th>
                    <th data-field="price" data-align="center" >积分金额</th>
                    <th data-field="integralSource" data-align="center" data-formatter="integralSourceRender">积分来源</th>
                    <th data-field="createTime" data-align="center" data-formatter="defaultDateFormatter">积分订单时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/order/integral_order_list.js"></script>
</html>

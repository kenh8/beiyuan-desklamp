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
        <h4 class="pull-left page-title">消费积分策略管理</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">消费积分策略管理</a></li>
            <li class="active">消费积分策略列表</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="strategyTableId" onsubmit="return false;">
                    <label style="display:inline-block;">策略名称：</label>
                    <div class="btn-group">
                        <input type="text" id="searchName" name="searchName" type="text" class="form-control" placeholder="策略名称">
                    </div>
                    <div class="form-group">
                        <a class="btn btn-primary"  href="${pageContext.request.contextPath}/credit/integralStrategy/add" data-toggle="modal" data-target="#base_modal">添加</a>
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                    <table class="table table-striped table-bordered table-hover dataTable" id="strategyList"
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
                   data-url="${pageContext.request.contextPath}/credit/integralStrategy/listData" id="strategyTableId"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="center">序号</th>
                    <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                    <th data-field="strategyName" data-align="center" data-formatter="autoWrapRender">策略名称</th>
                    <th data-field="strategyRuleYuan" data-align="center"  data-formatter="renderStrategyRule">策略规则</th>
                    <th data-field="businessId" data-align="center" data-formatter="renderBusinessType">选择业务</th>
                    <th data-field="clientId" data-align="center"  data-formatter="renderClientType">客户端</th>
                    <th data-field="ifEffective" data-align="center"  data-formatter="renderEffectiveType">状态</th>
                    <th data-field="updateTime" data-align="center" data-formatter="defaultDateFormatter">创建时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/strategy/integral_strategy_list.js"></script>
</html>

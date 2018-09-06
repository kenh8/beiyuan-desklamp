<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
</head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">运营管理</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">运营管理</a></li>
            <li class="active">运营列表</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="operationTableId" onsubmit="return false;">
                    <label style="display:inline-block;">运营名称：</label>
                    <div class="btn-group">
                        <input type="text" id="searchOperateName" name="operateName" type="text" class="form-control"
                               placeholder="运营名称">
                    </div>
                    <div class="clearfix" style="display:inline-block;position: relative;top:0px;">
                        <label style="display:inline-block;">运营类型：</label>
                        <select id="searchOperateType" name="operateType" class="select-zdy" data-placeholder="请选择"
                                tabindex="" title="">
                            <option value="">全部</option>
                            <option value="1">轮播图</option>
                        </select>
                        &nbsp;&nbsp;
                        <label style="display:inline-block;">状态：</label>
                        <select id="searchStatus" name="status" class="select-zdy" data-placeholder="请选择" tabindex=""
                                title="">
                            <option value="">全部</option>
                            <option value="0">无效(下线)</option>
                            <option value="1">有效(上线)</option>
                        </select>
                        &nbsp;&nbsp;
                        <div class="form-group fr">
                            <button class="btn btn-primary waves-effect searchBtn">查询</button>
                            <button class="btn btn-primary waves-effect clearSearch">清空</button>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/credit/operation/add"
                               data-target="divload" data-div="baseContainer">添加运营方式</a>
                        </div>
                    </div>
                </form>
            </div>
            <table data-toggle="table" data-classes="table table-hover"
                   data-pagination="true" data-striped="true"
                   data-url="${pageContext.request.contextPath}/credit/operation/listData" id="operationTableId"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="center">序号</th>
                    <th data-field="" data-align="left" data-formatter="operateRender">操作</th>
                    <th data-field="operateName" data-align="center" data-formatter="autoWrapRender">运营名称</th>
                    <th data-field="operateType" data-align="center" data-formatter="renderOperateType">运营类型</th>
                    <th data-field="status" data-align="center" data-formatter="renderOperateStatus">状态</th>
                    <th data-field="createTime" data-align="center" data-formatter="defaultDateFormatter">创建时间</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/operation/operation_list.js"></script>
</html>

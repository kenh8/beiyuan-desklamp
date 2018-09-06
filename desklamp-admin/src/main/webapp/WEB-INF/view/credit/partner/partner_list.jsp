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
        <h4 class="pull-left page-title">商户信息</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">商户信息</a></li>
            <li class="active">商户列表</li>
        </ol>
    </div>
</div>

 <div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="partnerTable" onsubmit="return false;">
                    <label>商户名称：<input name="partnerName" id="partnerName" type="text" class="form-control" placeholder="商户名称"></label>
                    <label>商户ID：<input name="partnerId" id="partnerId" type="text" class="form-control" placeholder="商户ID"></label>
                    <div class="form-group fr">
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                </form>
            </div>
            <table  data-toggle="table"  data-classes="table table-hover"
                    data-pagination="true"
                    data-url="${pageContext.request.contextPath}/credit/partner/listData" id="partnerTable"
                    data-side-pagination="server">
                <thead>
                <tr>
                    <th data-checkbox="true" data-align="left">序号</th>
                   <%-- <th data-field="" data-align="left" data-formatter="operateRender">操作</th>--%>
                    <th data-field="partnerId" data-align="left">商户ID</th>
                    <th data-field="partnerName" data-align="left">商户名称</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/partner/partner_list.js"></script>
</html>
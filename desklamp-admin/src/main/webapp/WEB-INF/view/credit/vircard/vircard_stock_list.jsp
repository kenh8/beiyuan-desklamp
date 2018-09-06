<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="/WEB-INF/tld/sys-permission.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
    .select-zdy {
        width: 150px;
        height: 32px;
        margin-top: 3px;
        border-radius: 2px;
        border: 1px solid #e2e2e2;
    }
</style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">虚拟卡库存</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">虚拟卡库存</a></li>
            <li class="active">虚拟卡库存</li>
        </ol>
    </div>
</div>
<%--<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">虚拟卡库存 </h4>
</div>--%>
 <div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="virCardStockTable" onsubmit="return false;">
                    <label style="display:inline-block;">兑换码使用状态:</label>
                    <select id="searchUseStatus" name="useStatus" class="select-zdy" data-placeholder="请选择" tabindex="" title="">
                        <option value="">全部</option>
                        <option value="1">未使用</option>
                        <option value="2">已使用</option>
                       <%-- <option value="3">已兑换</option>--%>
                    </select>
                    <input type="hidden" id="virtualCardId" name="virtualCardId" value="${virtualCardId}" />
                    &nbsp;&nbsp;
                    <label style="display:inline-block;">兑换码状态：</label>
                    <select id="searchRedeemCodeStatus" name="redeemCodeStatus" class="select-zdy" data-placeholder="请选择" tabindex="" title="">
                        <option value="">全部</option>
                        <option value="0">出库</option>
                        <option value="1">占用</option>
                        <option value="2">有效</option>
                        <option value="3">无效</option>
                        <option value="4">兑换未销库</option>
                        <option value="5">兑换且销库</option>
                    </select>
                    &nbsp;&nbsp;
                    <label style="display:inline-block;">手机号：</label>
                    <input id="searchTelephone" name="telephone" type="text" class="form-control" placeholder="手机号">
                    &nbsp;&nbsp;
                    <label>兑换码有效期：
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' id="startTime" style="width: 170px;" name="startTime" autocomplete="off" class="form-control" />
                        </div>
                        ~
                        <div class='input-group date' id='datetimepicker2'>
                            <input type='text' id="endTime" name="endTime" style="width: 170px;" autocomplete="off" class="form-control" />
                        </div>
                    </label>
                    &nbsp;&nbsp;
                    <div class="form-group fr">
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                </form>
            </div>
            <table data-toggle="table" data-classes="table table-hover"
                   data-pagination="true"
                   data-url="${pageContext.request.contextPath}/credit/virCardStock/listData?virtualCardId=${virtualCardId}"
                   id="virCardStockTable"
                   data-show-jumpto="true"
                   data-side-pagination="server">
                <thead>

                <tr>
                    <th data-field="redeemCodeId" data-align="left">兑换码id</th>
                    <th data-field="redeemCodeName" data-align="left" <%--data-formatter="autoWrapRender"--%>>兑换码名称</th>
                    <th data-field="useStatus" data-align="left" data-formatter="useStatusRender">兑换码使用状态</th>
                    <th data-field="redeemCodeStatus" data-align="left" data-formatter="redeemCodeStatusRender">兑换码状态</th>
                    <th data-field="expireDate" data-align="left" data-formatter="defaultDateFormatter">兑换码有效期</th>
                    <th data-field="phone" data-align="left">手机号</th>
                    <th data-field="name" data-align="left">姓名</th>
                    <th data-field="address" data-align="left">地址</th>
                    <th data-field="userId" data-align="left">userID</th>
                    <th data-field="flowTo" data-align="left" data-formatter="flowToRender">流向</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
 </div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/vircard_stock_list.js"></script>
</html>
<%--
  Created by IntelliJ IDEA.
  User: qxb
  Date: 2017/9/6
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
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
        <h4 class="pull-left page-title">账户列表</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">商户管理</a></li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="userAdminTableId" onsubmit="return false;">
                    <label>名称/登录账号：<input name="partnerNoId" id="partnerNoId" type="text" class="form-control" placeholder="名称/登录账号"></label>
                    <label>状态：
                        <select class="select2 select2-offscreen" id="status" name="status" style="width: 240px;" data-placeholder="请选择" tabindex="" title="">
                            <option value=" ">全部</option>
                            <option value="1">有效</option>
                            <option value="0">无效</option>
                        </select>
                    </label>
                    <div class="form-group fr">
                        <a class="btn btn-primary"  href="${pageContext.request.contextPath}/user/add?partnerId=${partnerId}" data-toggle="modal" data-target="#base_modal">添加账户</a>
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                </form>
            </div>
            <table  data-toggle="table"  data-classes="table table-hover"
                    data-pagination="true"
                    data-url="${pageContext.request.contextPath}/partner/listAdminData?partnerId=${partnerId}" id="userAdminTableId"
                    data-side-pagination="server">
                <thead>
                <tr>
                    <th data-field="admin.name" data-align="left">名称</th>
                    <th data-field="userName" data-align="left">登录账号</th>
                    <th data-field="admin.email" data-align="left">邮箱</th>
                    <th data-field="admin.status" data-align="left" data-formatter="commonStatusRender">状态</th>
                    <th data-field="admin.createBy.userName" data-align="left" >创建者</th>
                    <th data-field="admin.createDate" data-align="left"  data-formatter="defaultDateFormatter">创建日期</th>
                    <th data-field="admin.lastUpdateBy.userName" data-align="left" >最后修改人</th>
                    <th data-field="admin.lastUpdateDate" data-align="left"  data-formatter="defaultDateFormatter">最后修改日期</th>
                    <th data-field="" data-align="left" data-formatter="operateRender">操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/partner/seller_list.js"></script>
</html>

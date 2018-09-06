<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://sec.hiveview.com/sec-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
</head>
<style>
    @media screen and (max-device-width: 1920px) {
        .formDiv {
            width: 84.5%;
        }
    }

    @media screen and (max-device-width: 1366px) {
        .formDiv {
            width: 78.2%;
        }

        .fixed-table-loading {
            padding-top: 10px;
        }
    }

    .panel .panel-body {
        padding: 0px;
    }

    .panel-body {
        padding: 0px;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">积分商城</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">积分商城</a></li>
            <li class="active">商品列表</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div>
            <div class="m-b-10 formDiv"
                 style="position: fixed;background: #ffffff;opacity: 1;display: block;z-index: 100;padding-top: 3px;">
                <form id="paramForm" class="form-inline" tableId="goodsTableId" onsubmit="return false;">
                    <label style="display:inline-block;margin-left: 10px; ">商品名称：</label>
                    <input type="text" id="goodsName" name="goodsName" type="text" class="form-control"
                           placeholder="商品名称">
                    <label style="display:inline-block;">状态：</label>
                    <select id="goodsStatus" name="goodsStatus"
                            style="width: 240px;height: 32px;margin-top: 3px;border-radius: 2px;    border: 1px solid #eee;"
                            data-placeholder="请选择" tabindex="" title="">
                        <option value="">全部</option>
                        <option value="0">待审核</option>
                        <option value="1">审核中</option>
                        <option value="2">已上架</option>
                        <option value="3">审核未通过</option>
                        <option value="4">已下架</option>
                    </select>
                    &nbsp;&nbsp;
                    <label>上架时间：
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' id="startTime" style="width: 170px;" autocomplete="off" name="startTime"
                                   class="form-control"/>
                        </div>
                        ~
                        <div class='input-group date' id='datetimepicker2'>
                            <input type='text' id="endTime" name="endTime" style="width: 170px;" autocomplete="off"
                                   class="form-control"/>
                        </div>
                    </label>
                    <div class="form-group fr">
                        <c:if test="${role != SHOP_OWNER }">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/credit/goods/add"
                               data-target="divload" data-div="baseContainer">添加商品</a>
                        </c:if>

                        <%--<c:if test="${role ne 'shopowner' }">--%>
                        <sec:requiredPermission resource="goods:permission:virtualCardList">
                            <a class="btn btn-primary"
                               href="${pageContext.request.contextPath}/credit/goods/virtualCardList"
                               data-target="divload" data-div="baseContainer">创建虚拟卡商品</a>
                        </sec:requiredPermission>
                        <sec:requiredPermission resource="massage:permission:add">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/credit/message/add"
                               data-toggle="modal" data-target="#base_modal">短信模板</a>
                        </sec:requiredPermission>
                        <%-- </c:if>--%>
                        <button class="btn btn-primary waves-effect searchBtn">查询</button>
                        <button class="btn btn-primary waves-effect clearSearch">清空</button>
                    </div>
                    <table class="table table-striped table-bordered table-hover dataTable" id="goodsList"
                           aria-describedby="sample_1_info">
                    </table>
                    <div class="row-fluid">
                        <div class="span6" style="display:none">
                            <div class="dataTables_info" id="sample_1_info"></div>
                        </div>
                    </div>
                </form>
            </div>
            <input type="hidden" value="${role}" id="role"/>
            <div style="position:  relative;top: 77px;">
                <table data-toggle="table" data-classes="table table-hover"
                       data-pagination="true" data-striped="true"
                       data-url="${pageContext.request.contextPath}/credit/goods/listData" id="goodsTableId"
                       data-show-jumpto="true"
                       data-side-pagination="server">
                    <thead>
                    <tr>
                        <th data-checkbox="true" data-align="center">序号</th>
                        <th data-field="" data-align="center" data-formatter="operateRender">操作</th>
                        <th data-field="id" data-align="center">商品ID</th>
                        <%--<th data-field="sequenceNumber" data-align="center">顺序</th>--%>
                        <th data-field="goodsName" data-align="center" data-formatter="goodsNameRender">商品名称</th>
                        <th data-field="goodsSubtitle" data-align="center" data-formatter="goodsSubtitleRender">商品副标题
                        </th>
                        <th data-field="goodsType" data-align="center" data-formatter="renderGoodsType">商品类型</th>
                        <th data-field="goodsPrice" data-align="center" data-formatter="renderGoodsPrice">商品价格</th>
                        <th data-field="goodsStock" data-align="center" data-formatter="renderGoodsStock" >库存</th>
                        <th data-field="goodsStatus" data-align="center" data-formatter="renderGoodsStatus">审核状态</th>
                        <th data-field="goodsAuditDescription" data-align="center" data-formatter="renderReason">审核原因
                        </th>
                        <th data-field="goodsCoverUrl" data-align="center" data-formatter="commonRenderImg">封面图片</th>
                        <th data-field="goodsShelfTime" data-align="center" data-formatter="goodsShelfTimeFormatter">
                            上架时间
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<%-----------------------权限-------------------------%>
<sec:requiredPermission resource="goods:permission:approve">
    <input id="goodsApprovePermission" type="hidden" name="goodsApprovePermission">
</sec:requiredPermission>



<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_list.js"></script>
</html>

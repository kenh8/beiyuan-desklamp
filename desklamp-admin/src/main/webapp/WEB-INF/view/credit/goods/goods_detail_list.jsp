<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div class="row">
    <div class="col-sm-12">
        <h4 class="pull-left page-title">商品管理</h4>
        <ol class="breadcrumb pull-right">
            <li><a data-target="divload" data-div="baseContainer">商品管理</a></li>
            <li class="active">商品详情图</li>
        </ol>
    </div>
</div>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form id="paramForm" class="form-inline" tableId="goodsDetailTableId" onsubmit="return false;">
                    <div class="btn-group">
                        <input type="hidden" id="goodsId" name="goodsId" class="form-control" value="${goodsId}"/>
                    </div>
                    <div class="m-b-10">
                        <a class="btn btn-primary"  href="${pageContext.request.contextPath}/file/toUpload?maxNum=20&callBackMethod=uploadInfoImgCallBack" data-toggle="modal" data-target="#base_modal">上传详情图片</a>
                        <a class="btn btn-primary" href="javascript:;" onclick="sortList();">刷新列表</a>
                    </div>
                    <table class="table table-striped table-bordered table-hover dataTable" id="goodsDetailList"
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
                   data-url="${pageContext.request.contextPath}/credit/goodsDetail/listData" id="goodsDetailTableId"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-field="" data-align="left" data-formatter="operateRender">操作</th>
                    <th data-field="sequence" data-align="left">顺序</th>
                    <th data-field="goodsDetailUrl" data-align="left" data-formatter="renderImgNoLazyLoad">图片</th>
                </tr>
                </thead>
            </table>
        </div>
        <div class="form-group">
            <div style="text-align: center;">
                <a href="javascript:void(0);" onclick="returnToListPage('${pageContext.request.contextPath}/credit/goods/list');" class="btn btn-info waves-effect waves-light" data-dismiss="modal">确定</a>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_detail_list.js"></script>
</html>

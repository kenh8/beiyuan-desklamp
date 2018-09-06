<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #operation li{
            font-size: 14px;
            border: 1px solid #CCCCCC;
            padding: 5px;
            width: 300px;

        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form class="form-horizontal tasi-form"
                      method="post" id="clearStockSingle"
                <%--action="${pageContext.request.contextPath}/credit/operation/saveData"--%>
                      data-toggle="validator"
                      onsubmit="return saveData();">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <div class="modal-header">
                        <h4 class="modal-title">
                            单个销库
                        </h4>
                    </div>

                    <div class="">
                        <div class="modal-body" style="align-content: center">
                            <input type="hidden" id="redeemCodeStatus"/>
                            <label class="col-lg-2 control-label" for="redeemCodeName">
                                兑 换 码 :</label>
                            <input type="text" name="redeemCodeName" style="width: 300px;margin-bottom: 10px" class="form-control"
                             id="redeemCodeName" placeholder="">

                            <label class="col-lg-2 control-label" for="uniIdentifier">
                                唯一标示：</label>
                                <input type="text" name="redeemCode" style="width: 300px" class="form-control" id="uniIdentifier"
                                       placeholder="">
                        </div>
                        <div id="showContext" class="alert alert-warning alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">
                                &times;
                            </button>
                        </div>
                        <div class="loading loading2">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                    <div class="">
                        <div style="text-align: center;">
                            <button id="do" name="button" type="button" class="btn btn-info" onclick="do_single();">
                                保存信息
                            </button>
                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/stock/stock_list.js"></script>
</html>

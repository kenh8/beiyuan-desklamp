<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
        .show-img-div {
            float: left;
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
                      method="post" id="addOperation"
                      <%--action="${pageContext.request.contextPath}/credit/operation/saveData"--%>
                      data-toggle="validator"
                      onsubmit="return saveData();">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            批量销库
                        </h4>
                    </div>
                    <div class="form-group">
                        <div class="form-group col-sm-8">
                            <label class="col-lg-2 control-label " for="excelUrl"> 上传文件</label>
                            <div class="col-lg-10 div-img" id="override-img-show-div">
                                <a class="btn btn-info waves-effect waves-light m-b-10" href="javascript:void(0);"
                                   onclick="uploadExcel();">
                                    <i class="fa fa-cloud"></i>
                                    <span>上传表格</span>
                                </a>
                                <div style="display: none;" class="show-img-div">
                                    <input type="hidden" id="excelUrl" name="excelUrl" value=""/>
                                    <%--<img data-original="" src="" style="width: 50px;height: 50px; cursor: pointer;">
                                    <a href="javascript:void(0);" class="delete-image"
                                       onclick="deleteCommonImg(this);">删除文件</a>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div style="text-align: center;">
                            <button id="sure_clear_more" name="button" type="button" class="btn btn-info" >确认销库</button>
                             <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%--<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/credit/virCardStock/clearVirtualCardStockMore">
    <input type="file" id="myfile" name="file"/>
    <input type="submit" value="提交">

</form>--%>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/stock/stock_list.js"></script>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #feedback > li{text-align: center; width: 240px; height: 45px; border: 1px solid #9999FF; background-color:#9999FF; padding: 5px; border-radius: 4px; float: left; margin: 3px; color: #ffffff; line-height: 2;} .input-zdy{padding: 6px 12px; border-radius: 3px; border: 1px solid #e2e2e2; float: left;}
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<div class="panel adapt-window-height">
    <div class="panel-body" id="clearMoreThanOne">
        <div class="mt20">
            <div class="m-b-10">
                <form id="signupListImportForm" acclass="form-horizontal tasi-form" enctype="multipart/form-data">
                    <div style="width: 50%;margin-bottom: 15px;">
                        <input type="file" name="excelFile" class="form-control " id="excelFile" style="display: none"
                               value="选择文件"  onchange="adduploadExcel(this)">
                        <input class="input-zdy" type="text" id="fileName">
                        <div class="btn-group">
                            <button type="button" class="btn  btn-secondary" onclick="fileClick();">选择上传的文件</button>
                            <button type="button" class="btn  btn-secondary" onclick="fileEmpty();">清除</button>
                            <a href="${pageContext.request.contextPath}/upload/excel_temp.xlsx"
                               class="btn btn-primary waves-effect">下载EXCEL模板</a>
                        </div>
                    </div>
                    <div id="showContext" class="alert alert-warning alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert"
                                aria-hidden="true">
                            &times;
                        </button>

                    </div>
                    <button name="button" type="button" class="btn btn-info" onclick="submitExcel(); ">确认销库</button>
                    <button name="button" type="button" class="btn btn-info" onclick="returnListPag(); ">返回列表</button>
                    <div class="loading">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <ul id="feedback">

                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assets/js/module/credit/stock/stock_list.js"></script>
</html>

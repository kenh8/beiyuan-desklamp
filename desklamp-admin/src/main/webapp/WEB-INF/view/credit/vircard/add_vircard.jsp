<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #feedback > li{text-align: center; width: 251px; height: 45px; border: 1px solid #9999FF; background-color:#9999FF; padding: 5px; border-radius: 4px; float: left; margin: 3px; color: #ffffff; line-height: 2;}
        .input-zdy{padding: 6px 12px; border-radius: 3px; border: 1px solid #e2e2e2; float: left;}
    </style>
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<div class="panel adapt-window-height">
    <div class="panel-body" id="clearMoreThanOne">
        <div class="mt20">
            <div class="m-b-10">
                <form class="form-horizontal tasi-form"
                      method="post" id="addVircard"
                      action=""
                      enctype="multipart/form-data"
                      data-toggle="validator"
                      onsubmit="return saveData();">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">×</button>
                        <h4 class="modal-title">
                            导入库存
                        </h4>
                    </div>
                    <div class="">
                        <div class="">
                            <input type="hidden" name="id" class="form-control" id="id"
                                   value="${id}">
                        </div>
                    </div>
                    <div class="" style="margin-top: 40px;">
                        <div class="">
                            <input type="file" name="excelFile" class="form-control" id="excelFile" style="display: none;"
                                   onchange="adduploadExcel(this)"     value="选择文件">
                            <input class="input-zdy" type="text" id="fileName">
                            <div class="btn-group">
                                <button type="button" class="btn  btn-secondary" onclick="fileClick();">选择上传的文件</button>
                                <button type="button" class="btn  btn-secondary" onclick="fileEmpty();">清除</button>
                                <a href="${pageContext.request.contextPath}/upload/excel_temp.xlsx"
                                   class="btn btn-primary waves-effect">下载EXCEL模板</a>
                            </div>

                        </div>
                    </div>

                    <div class="">
                        <div class="loading">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <ul id="feedback" style="display: inline-block">

                        </ul>
                        <div class="" style="text-align: center;margin-top: 30px">
                            <button id="subExcel" name="button" type="button" class="btn btn-info waves-effect waves-light"
                                    onclick="submitExcel( ); ">确认导入
                            </button>
                            <button type="reset" class="btn btn-default waves-effect" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/add_vircard.js"></script>
</html>

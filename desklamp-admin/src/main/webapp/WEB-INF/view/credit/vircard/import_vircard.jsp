<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
    <style type="text/css">
        .input-zdy{
            padding: 6px 12px;
            border-radius: 3px;
            border: 1px solid #e2e2e2;
            float: left;
        }
    </style>
</head>
<div class="panel adapt-window-height">
    <div class="panel-body" id="clearMoreThanOne">
        <div class="mt20">
            <div class="m-b-10">
                <form class="form-horizontal tasi-form"
                      method="post" id="importVircard"
                      action=""
                      enctype="multipart/form-data"
                      data-toggle="validator"
                      onsubmit="return saveData();">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            导入库存
                        </h4>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8" style="margin-top: 30px">
                            <input type="file" name="excelFile" class="form-control" id="excelFile" style="display: none"
                                   onchange="adduploadExcel(this)"    value="选择文件">
                            <input class="input-zdy" type="text" id="fileName">
                            <div class="btn-group">
                                <button type="button" class="btn  btn-secondary" onclick="fileClick();">选择上传的文件</button>
                                <button type="button" class="btn  btn-secondary" onclick="fileEmpty();">清除</button>
                                <a href="${pageContext.request.contextPath}/upload/excel_temp.xlsx"
                                   class="btn btn-primary waves-effect">下载EXCEL模板</a>
                            </div>
                        </div>
                    </div>
                    <input id="IdWorker" type="hidden" name="IdWorker" value="${IdWorker}"/>

                    <div class="form-group">


                        <div style="text-align: center;">
                            <button name="button" type="button" class="btn btn-info waves-effect waves-light"
                                 id="btnExcel"   onclick="finishBtnClick(this); ">确认导入
                            </button>
                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/import_vircard.js"></script>
</html>

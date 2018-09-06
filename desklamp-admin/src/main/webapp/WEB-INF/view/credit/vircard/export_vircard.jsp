<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<style>
    .input-zdy{
        width: 320px;
        padding: 6px 12px;
        border-radius: 3px;
        border: 1px solid #e2e2e2;
    }
    input[type=range] {
        display: block;
        width: 320px;
    }
</style>
<div class="panel adapt-window-height">
    <div class="panel-body" id="clearMoreThanOne">
        <div class="mt20">
            <div class="m-b-10">
                <form class="form-horizontal tasi-form"
                      method="post" id="exportVircard"
                      action=""
                      enctype="multipart/form-data"
                      data-toggle="validator"
                      onsubmit="return saveData();">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">×</button>
                        <h4 class="modal-title">
                            出库
                        </h4>
                    </div>
                    <input type="hidden" value="" id="maxExportNum"/>
                    <div style="overflow: hidden;margin-top: 20px">
                        <div class="col-sm-8">
                            <input type="hidden" name="id" value="${id}"/>
                            <input type="text" class="input-zdy" id="stockNumber" placeholder="请输入需要出库的数量!" name="stockNumber"
                                   onKeyUp="value=value.replace(/[^0-9]/g,'')"  onblur="judgeStock()"/>
                           <%-- <input type="range" id="howR" class="" min="1" max="" onchange="showVal(this.value);">--%>
                        </div>
                    </div>

                    <div class="form-group">

                        <div style="text-align: center;">
                            <button name="button" type="button" class="btn btn-info waves-effect waves-light"
                                    onclick="exportVirCard()">确认出库
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


<script src="${pageContext.request.contextPath}/assets/js/module/credit/vircard/export_vircard.js"></script>
</html>

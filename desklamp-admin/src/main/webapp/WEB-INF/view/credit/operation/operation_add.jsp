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
                      action="${pageContext.request.contextPath}/credit/operation/saveData"
                      data-toggle="validator"
                      onsubmit="return saveData();">
                    <div class="modal-header">
                        <h4 class="modal-title">
                          <c:if test="${requestScope.tOperationDto.id ne null}">
                            修改运营方式
                          </c:if>
                            <c:if test="${requestScope.tOperationDto.id eq null}">
                                添加运营方式
                            </c:if>
                        </h4>
                    </div>

                    <div class="">
                        <li role="tab" style="  width: 25%;" class="disabled" aria-disabled="true">
                            <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                <span class="number"></span>
                                运营资料
                            </a>
                        </li>
                    </div>
                    <div class="form-group">
                        <%--<div class="form-group clearfix">--%>
                        <label class="col-lg-2 control-label" for="operateName"> 运营名称</label>
                        <div class="col-lg-3">
                            <input id="operateid" name="id" type="hidden" value="${requestScope.tOperationDto.id}"/>
                            <input id="operateName" name="operateName" type="text" placeholder="请输入运营名称"
                                   value="${requestScope.tOperationDto.operateName}" data-error="请输入运营名称"
                                   class="form-control" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <%--</div>--%>
                    </div>
                    <div class="form-group">
                        <div class="form-group col-sm-8">
                            <label class="col-lg-3 control-label" for="operateType"> 来源方式</label>
                            <div id="operateType" class="col-sm-9">
                                <div class="radio radio-info radio-inline">
                                    <c:if test="${requestScope.tOperationDto.operateType!=null}">
                                        <input type="radio" id="operateType1" value="1" name="operateType" checked>
                                    </c:if>
                                    <c:if test="${requestScope.tOperationDto.id==null}">
                                        <input type="radio" id="operateType1" value="1" name="operateType" checked>
                                    </c:if>
                                    <label for="operateType1">轮播图</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="hidden" id="operationAddIsSave" value="false"/>
                        <input type="hidden" id="operateIdHidden" value="${requestScope.tOperationDto.id}"/>
                        <div style="text-align: center;">
                            <button id="addOperationButton" name="button" type="button" class="btn btn-info">保存信息
                            </button>
                            <c:if test="${requestScope.tOperationDto.id ne null}">
                                <a class="btn btn-primary"
                                   href="${pageContext.request.contextPath}/credit/carouseFigure/add?operateId=${requestScope.tOperationDto.id}"
                                   data-target="divload" data-div="baseContainer">添加轮播图信息</a>
                                <button id="sortBtn" onclick="sortClick();" name="button" type="button" class="btn btn-info">刷新排序</button>
                            </c:if>
                                 <button id="sortBtn" onclick="operationList();" name="button" type="button" class="btn btn-info">返回列表</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="form-group fr" style="float: left">

            </div>
            <input type="hidden" id="maxSeqByOperaId" value="${requestScope.maxSeqByOperaId}">
            <form id="paramForm" class="form-inline" tableId="operationAddTableId" onsubmit="return false;"></form>
            <c:if test="${requestScope.tOperationDto.id ne null}">
                <table data-toggle="table" data-classes="table table-hover"
                       data-pagination="true" data-striped="true" id="operationAddTableId"
                       data-url="${pageContext.request.contextPath}/credit/carouseFigure/findListByOperationId?operateId=${requestScope.tOperationDto.id}"
                       id="operationTableId"
                       data-side-pagination="server">
                    <thead>
                    <tr>
                        <th data-checkbox="true" data-align="left">序号</th>
                        <th data-field="" data-align="left" data-formatter="operateRender2">操作</th>
                        <th data-field="id" data-align="left">id</th>
                        <th data-field="operateId" data-align="left">运营id</th>
                        <th data-field="url" data-align="left" data-formatter="commonRenderImg">图片</th>
                        <th data-field="sequence" data-align="left" <%-- data-formatter="renderOperateType"--%>>顺序</th>
                    </tr>
                    </thead>
                </table>
            </c:if>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/operation/operation_add.js"></script>
</html>

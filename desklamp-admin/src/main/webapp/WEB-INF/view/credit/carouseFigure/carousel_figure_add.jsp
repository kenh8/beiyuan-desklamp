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
</head>
<div class="panel adapt-window-height">
    <div class="panel-body">
        <div class="mt20">
            <div class="m-b-10">
                <form class="form-horizontal tasi-form"
                      method="post" id="addCarouselFigure"
                      data-toggle="validator"
                      onsubmit="return saveData();">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            添加轮播图
                        </h4>
                    </div>
                    <input id="operateId" name="operateId" type="hidden" value="${requestScope.operateId}"/>
                    <div style="margin: 20px">
                        <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                            <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                <span class="number"></span>
                                轮播图详情信息
                            </a>
                        </li>
                    </div>
                    <div class="form-group">
                        <div class="form-group col-sm-8">
                            <label class="col-lg-2 control-label " for="imageUrls"> 封面图片</label>
                            <div class="col-lg-10 div-img" id="override-img-show-div">
                                <a class="btn btn-info waves-effect waves-light m-b-10" href="javascript:void(0);" onclick="uploadCoverImg();">
                                    <i class="fa fa-cloud"></i>
                                    <span>上传图片</span>
                                </a>
                                <div style="display: none;" class="show-img-div">
                                    <input type="hidden" id="imageUrls" name="url" value=""/>
                                    <img data-original="" src="" style="width: 50px;height: 50px; cursor: pointer;">
                                    <a href="javascript:void(0);" class="delete-image" onclick="deleteCommonImg(this);">删除图片</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group clearfix">
                            <div id="status" class="col-lg-3">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="text-align: center;">
                            <button id="addCarouselFigureButton" name="button" type="button" class="btn btn-info"
                                    onclick="carouselFigure_submit();">
                                保存
                            </button>
                            <a href="javascript:void(0);"
                               onclick="returnToListPage('${pageContext.request.contextPath}/credit/operation/edit?id=${requestScope.operateId}');" class="btn btn-default waves-effect" data-dismiss="modal">取消</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/carouseFigure/carouseFigure.js"></script>
</html>
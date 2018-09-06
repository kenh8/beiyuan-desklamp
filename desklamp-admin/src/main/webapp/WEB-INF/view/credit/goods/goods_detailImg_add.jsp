<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<form class="form-horizontal tasi-form" method="post" id="goodsDetailForm"
      action="${pageContext.request.contextPath}/credit/goodsDetail/saveData?callbackMethod=refreshTable"
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            商品详情图添加
        </h4>
    </div>
    <input type="hidden" id="goodsId" name="goodsId" value="${goodsId}"/>
    <div class="modal-body">
        <div class="form-group">
            <label class="col-lg-2 control-label " for="goodsCoverUrl"> 详情图片</label>
            <div class="col-lg-10 div-img" id="override-img-show-div">
                <a class="btn btn-info waves-effect waves-light m-b-10" href="javascript:void(0);" onclick="uploadDetailImg();">
                    <i class="fa fa-cloud"></i>
                    <span>上传图片</span>
                </a>
                <div style="display: none;" class="show-img-div">
                    <input type="hidden" id="goodsCoverUrl" name="goodsCoverUrl" value=""/>
                    <img data-original="" src="" style="width: 50px;height: 50px; cursor: pointer;">
                    <a href="javascript:void(0);" class="delete-image" onclick="deleteCommonImg(this);">删除图片</a>
                </div>
            </div>
        </div>
        <div class="form-group no-margin">
            <label for="description" class="col-sm-2 col-xs-2 control-label">描述 </label>
            <div class="col-sm-4 col-md-offset-2">
                <textarea class="form-control autogrow" id="description" name="description" data-error="请输入描述" style="width: 400px;height: 160px;"></textarea>
                <div class="help-block with-errors"></div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function(){
        $(".isApprove").select2({
            width:'50%'
        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_detailImg_add.js"></script>
</html>
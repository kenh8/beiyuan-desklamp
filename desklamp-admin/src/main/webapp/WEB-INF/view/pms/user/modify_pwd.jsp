<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>
</head>
<body>
<form class="form-horizontal tasi-form" method="post"
      action="${pageContext.request.contextPath}/pms/user/modifyPwd?callbackMethod=refreshTable"
      data-toggle="validator"
      onsubmit="return modifyPwdSave(this,modalAjaxDone);">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            修改密码
        </h4>
    </div>
    <div class="modal-body">
        <div class="form-group no-margin">
            <label for="passWord" class="col-sm-2 col-xs-2 control-label">旧密码 </label>
            <div class="col-sm-4 col-md-offset-2">
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="旧密码" data-error="请输入旧密码" value="" required/>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group no-margin">
            <label for="passWord" class="col-sm-2 col-xs-2 control-label">新密码 </label>
            <div class="col-sm-4 col-md-offset-2">
                <input type="password" class="form-control" id="password" name="password" placeholder="新密码" data-error="请输入新密码密码" value="" required/>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group no-margin">
            <label for="confirmPassword" class="col-sm-2 col-xs-2 control-label">确认新密码 </label>
            <div class="col-sm-4 col-md-offset-2">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" data-error="请输入确认新密码" placeholder="确认新密码" value="" required/>
                <div class="help-block with-errors"></div>
            </div>
        </div>

    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">确定</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<div id="cover_img_modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"></div>
    </div>
</div>
<script type="text/javascript">
   function modifyPwdSave(form,modalAjaxDone){
       if($("#confirmPassword").val() != $("#password").val()){
           _errorTipsFun("新密码和确认密码不匹配");
           return false;
       }

       if($("#oldPassword").val() != '' && $("#oldPassword").val() == $("#password").val()){
           _errorTipsFun("旧密码和新密码不能相同");
           return false;
       }
       return validateCallback(form,modalAjaxDone);
   }
</script>
</body>
</html>

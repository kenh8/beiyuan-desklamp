<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--    <script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>--%>
</head>
<form class="form-horizontal tasi-form" method="post"
      id="addForm"
     <%-- action="${pageContext.request.contextPath}/credit/integralStrategy/saveData"--%>
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×</button>
        <h4 class="modal-title">
            策略信息
        </h4>
    </div>
    <div class="modal-body">
        <div class="form-group">
            <label for="strategyName" class="col-sm-2 col-xs-2 control-label">策略名称</label>
            <div class="col-sm-4">
                <input type="text" name="strategyName" class="form-control" id="strategyName" placeholder="请输入策略名称" data-error="请输入策略名称" required>
                <div class="help-block with-errors"></div>
            </div>
        </div>
        <div class="form-group">
            <label for="clientId" class="col-sm-2 col-xs-2 control-label">客户端</label>
            <div id="clientId" class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" checked id="clientId1" value="1" name="clientId">
                    <label for="clientId1">盒子端</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="clientId2"  value="2" name="clientId">
                    <label for="clientId2">移动端</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="clientId3"  value="3" name="clientId">
                    <label for="clientId3">PC端</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-xs-2 control-label" for="ifEffective"> 状态</label>
            <div id="ifEffective" class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" checked id="ifEffective1" value="1" name="ifEffective">
                    <label for="ifEffective1">有效</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="ifEffective2"  value="0" name="ifEffective">
                    <label for="ifEffective2">无效</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="businessId" class="col-sm-2 col-xs-2 control-label">选择业务</label>
            <div id="businessId" class="col-sm-10">
                <div class="checkbox checkbox-info checkbox-inline">
                    <input type="checkbox" id="businessId1" value="1" name="businessId">
                    <label for="businessId1">会员购买</label>
                </div>
                <div class="checkbox checkbox-info checkbox-inline">
                    <input type="checkbox" id="businessId2"  value="2" name="businessId">
                    <label for="businessId2">积分商城</label>
                </div>
                <div class="checkbox checkbox-info checkbox-inline">
                    <input type="checkbox" id="businessId3"  value="3" name="businessId">
                    <label for="businessId3">商品包</label>
                </div>
                <div class="checkbox checkbox-info checkbox-inline">
                    <input type="checkbox" id="businessId5"  value="5" name="businessId">
                    <label for="businessId5">充值</label>
                </div>
                <div class="checkbox checkbox-info checkbox-inline">
                    <input type="checkbox" id="businessId6"  value="6" name="businessId">
                    <label for="businessId6">极清</label>
                </div>
                <div class="checkbox checkbox-info checkbox-inline">
                    <input type="checkbox" id="businessId7"  value="7" name="businessId">
                    <label for="businessId7">应用</label>
                </div>
               <%-- <div class="checkbox checkbox-info checkbox-inline">
                    <input type="checkbox" id="businessId4"  value="4" name="businessId">
                    <label for="businessId4">大麦优购</label>
                </div>--%>
                <input type="hidden" id="box" name="businessIds">
            </div>
        </div>
        <div class="form-group">
            <label for="strategyRuleYuan" class="col-sm-2 col-xs-2 control-label">消费策略</label>
            消费<input type="text" id="strategyRuleYuan" name="strategyRuleYuan" id="strategyRuleYuan"
                    placeholder="请输入消费策略" data-error="请输入消费策略"  onkeyup="limitInputNumber(this);"
                     onafterpaste="limitInputNumber(this);" required>元,得
            <input type="text"id="strategyRuleIntegrals" name="strategyRuleIntegrals" placeholder="请输入策略积分" data-error="请输入策略积分" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>积分
            </label>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-info waves-effect waves-light">保存</button>
        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">取消</button>
    </div>
</form>
<div id="cover_img_modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"></div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/strategy/integral_strategy_add.js"/>
<script>
    $(function(){
        $.post(rootPath+"/credit/integralStrategy/judge",{"clientId":2,"businessId":1},function (result) {
        })
    })

</script>

</html>

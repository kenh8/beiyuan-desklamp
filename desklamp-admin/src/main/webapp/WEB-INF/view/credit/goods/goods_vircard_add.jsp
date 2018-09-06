<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
        .show-img-div{
            float:left;
        }
    </style>
    <link href="${ctx}/assets/css/myStyle.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<script src="${pageContext.request.contextPath}/assets/js/common/bootstrapValidator.js"></script>--%>
</head>
<form class="form-horizontal tasi-form"
      method="post" id="goodsAddForm"
     <%-- action="${pageContext.request.contextPath}/credit/goods/saveData?callbackMethod=refreshTable"--%>
      data-toggle="validator"
      onsubmit="return saveData();">
    <div class="modal-header">
        <h4 class="modal-title">
            虚拟卡添加
        </h4>
    </div>
    <input type="hidden" id="viralCardId" name="viralCardId" value="${viralCardId}"/>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="panel adapt-window-height panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="">
                                <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                                    <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                        <span class="number">1.</span>
                                        基础信息
                                    </a>
                                </li>
                            </div>
                            <div class="form-group">
                                <input id="maxStock" name="maxStock" type="hidden" value=""
                                       type="hidden"/>
                                <input id="orginalPrice" name="orginalPrice" value="${price}"
                                       type="hidden"/>
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="goodsName"> 商品名称</label>
                                    <div class="col-lg-10">
                                        <input id="goodsName" name="goodsName" type="text" value="${virtualCardName}" class="required form-control" readonly="readonly">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="goodsType"> 商品形式</label>
                                    <div id="goodsType" class="col-sm-4 col-md-offset-2">
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="goodsType2"  value="2" name="goodsType" checked>
                                            <label for="goodsType2">虚拟</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="goodsSubtitle"> 商品副标题</label>
                                    <div class="col-lg-10">
                                        <input id="goodsSubtitle" name="goodsSubtitle" type="text" placeholder="请输入商品副标题" data-error="请商品副标题" class="required form-control" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label " for="goodsCoverUrl"> 封面图片</label>
                                    <div class="col-lg-10 div-img" id="override-img-show-div">
                                        <a class="btn btn-info waves-effect waves-light m-b-10" href="javascript:void(0);" onclick="uploadCoverImg();">
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
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="goodsStock"> 商品库存</label>
                                    <div class="col-lg-5">
                                        <input id="goodsStock" name="goodsStock" class="input-zdy" type="text"
                                               placeholder="请输入商品库存" data-error="请输入商品库存" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="freight"> 商品运费</label>
                                    <div class="col-lg-10">
                                        <input id="freight" name="freight" type="text" class="input-zdy" placeholder="请输入商品运费" data-error="请输入商品运费"  onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" required>元  精确到小数点后两位
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="">
                                <li role="tab" style="width: 25%;" class="disabled" aria-disabled="true">
                                    <a href="javascript:void(0);" aria-controls="steps-uid-0-p-1">
                                        <span class="number">2.</span>
                                        兑换规则
                                    </a>
                                </li>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="oldprice"> 原价虚拟卡信息</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-5">
                                            原价<input type="text" id="oldprice" class="input-zdy"
                                                   name="oldprice" value="${price}" readonly="readonly">元
                                        </div>
                                        <div class="col-sm-5">
                                            原运费 <input type="text" id="oldfreightPrice" value="${freightPrice}"
                                                       class="input-zdy"
                                                   name="oldfreightPrice"
                                                   readonly="readonly">元
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="integralRuleId"> 积分使用规则</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-3">
                                            <select id="integralRuleId" class="select-zdy" name="integralRuleId" onchange="changeIntegralRule()">
                                                <option value="2">积分+现金</option>
                                                <option value="3">纯现金</option>
                                                <option value="1">纯积分</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="text" id="goodsExchangeIntegral" class="input-zdy" name="goodsExchangeIntegral" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>积分
                                        </div>
                                        <div class="">
                                            <input type="text" id="goodsPrice" class="input-zdy" name="goodsPrice" onkeyup="limitTwoPoint(this);" onafterpaste="limitTwoPoint(this);" required>元
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameDeviceLimitedNumber"> 同设备限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" name="sameDeviceLimited" onclick="InputDisabled('u')" value="1" checked>是
                                            <input type="radio" name="sameDeviceLimited" onclick="InputDisabled('u')" value="2">否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" id="sameDeviceLimitedNumber" class="input-zdy" name="sameDeviceLimitedNumber" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <div class="form-group col-sm-10">
                                    <label class="col-lg-2 control-label" for="sameUserLimitedNumber"> 同用户限次</label>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                            <input type="radio" name="sameUserLimited" onclick="InputDisabled('s')" value="1" checked>是
                                            <input type="radio" name="sameUserLimited" onclick="InputDisabled('s')" value="2">否
                                        </div>
                                        <div class="col-sm-10">
                                            <input type="text" class="input-zdy" id="sameUserLimitedNumber" name="sameUserLimitedNumber" onKeyUp="value=value.replace(/[^0-9]/g,'')" required>次
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <div style="text-align: center;">
                                    <button type="submit" class="btn btn-info waves-effect waves-light">下一步</button>
                                    <a href="javascript:void(0);" onclick="returnToListPage('${pageContext.request.contextPath}/credit/goods/list');" class="btn btn-default waves-effect" data-dismiss="modal">取消</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function(){
        $(".select2").select2({

        });
    });
</script>
<script src="${pageContext.request.contextPath}/assets/js/module/credit/goods/goods_vircard_add.js"></script>
</html>

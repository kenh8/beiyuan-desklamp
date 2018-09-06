$(function () {
    var integralRuleId = $('#integralRuleId').val();
    if (integralRuleId == 2) {
    } else if (integralRuleId == 3) {
        $('#goodsExchangeIntegral').attr("disabled", true).next('em').html("");
    } else if (integralRuleId == 1) {
        $('#goodsPrice').attr("disabled", true).next('em').html("");
    }
    var valDe = $('input:radio[name="sameDeviceLimited"]:checked').val();
    var valUs = $('input:radio[name="sameUserLimited"]:checked').val();
    if (valDe == 2) {
        $("#sameDeviceLimitedNumber").attr("disabled", true).val("");
    }
    if (valUs == 2) {
        $("#sameUserLimitedNumber").attr("disabled", true).val("");
    }

});

/**
 * 上传封面图片
 */
var sameDeviceLimitedNumber = $("#sameDeviceLimitedNumber").val();
var sameUserLimitedNumber = $("#sameUserLimitedNumber").val();
function editInputDisable(text) {
    if (text == "Device") {
        var val = $('input:radio[name="sameDeviceLimited"]:checked').val();
        if (val == 1) {
            $("#sameDeviceLimitedNumber").val(sameDeviceLimitedNumber).attr("disabled", false);
        } else {
            $("#sameDeviceLimitedNumber").attr("disabled", true).val("");
        }
    }
    if (text == "user") {
        var val = $('input:radio[name="sameUserLimited"]:checked').val();
        if (val == 1) {
            $("#sameUserLimitedNumber").val(sameUserLimitedNumber).attr("disabled", false);
        } else {
            $("#sameUserLimitedNumber").val("").attr("disabled", true);
        }
    }
}
function uploadCoverImg() {
    manualModal(rootPath + '/file/toUpload?fileMaxSize=3000&maxNum=1&callBackMethod=uploadCoverImgBack', 'base_modal');
}

/**
 * 封面图片 回调函数
 * @param fileData
 */
function uploadCoverImgBack(fileData) {
    wrapperHideModal("base_modal");
    var _file = fileData[0];
    showImgCommonWrapper("goodsCoverUrl", _file);
}

/**
 * 通用显示图片方法
 * @param _inputId 标签id
 * @param _file 文件对象
 */
function showImgCommonWrapper(_inputId, _file) {
    var _input = $("#" + _inputId);
    _input.val(_file.filepath);
    var _div = _input.parents(".show-img-div");
    _div.find("img").attr("src", imgPath + "/" + _file.filepath).attr("data-original", imgPath + "/" + _file.filepath);
    _div.show();
    _input.parents(".div-img").find(".btn").hide();
}


/**
 * 删除图片
 * @param obj
 */
function deleteCommonImg(obj) {
    var _parent = $(obj).parents(".div-img");
    var _div = $(obj).parents(".show-img-div");
    _div.find("img").removeAttr("src");
    _div.hide();
    _parent.find(".btn").show();
}
/**
 * 改变积分规则时候触发的事件
 */
function changeIntegralRule() {
    var integralRuleId = $('#integralRuleId').val();
    if (integralRuleId == 2) {//积分+现金
        $('#goodsExchangeIntegral').val($('#integral').val());
        $('#goodsPrice').val($('#price').val());
        $('#goodsPrice').attr("disabled", false);
        $('#goodsExchangeIntegral').attr("disabled", false);
        $('#goodsPrice').next('em').html("*");
        $('#goodsExchangeIntegral').next('em').html("*");
    } else if (integralRuleId == 3) {//纯现金情况
        $('#goodsExchangeIntegral').val(0);
        $('#goodsExchangeIntegral').attr("disabled", true);
        $('#goodsPrice').attr("disabled", false);
        $('#goodsPrice').val($('#price').val());
        $('#goodsPrice').next('em').html("*");
        $('#goodsExchangeIntegral').next('em').html("");
    } else if (integralRuleId == 1) {//纯积分情况
        $('#goodsPrice').val(0);
        $('#goodsPrice').attr("disabled", true);
        $('#goodsExchangeIntegral').attr("disabled", false);
        $('#goodsExchangeIntegral').val($('#integral').val());
        $('#goodsExchangeIntegral').next('em').html("*");
        $('#goodsPrice').next('em').html("");
    }
}

function saveData() {

    var integralRuleId = $("#integralRuleId option:selected").val()
    if (integralRuleId != 1) {
        var goodsPrice = $("#goodsPrice").val();
        if (isNaN(goodsPrice) || goodsPrice < 0.01) {
            errorJqueryConfirm("金额必须为数字且大于1分!");
            return false;
        }
    }

    if (integralRuleId != 3) {
        var goodsExchangeIntegral = $("#goodsExchangeIntegral").val();
        if (isNaN(goodsExchangeIntegral) || goodsExchangeIntegral <= 0) {
            errorJqueryConfirm("积分必须为数字且大于零!");
            return false;
        }
    }

    var sameDeviceLimited = $("input[name=sameDeviceLimited]:checked").val();
    var sameUserLimited = $("input[name=sameUserLimited]").val();
    if (sameDeviceLimited == 1) {//同设备限次
        var sameDeviceLimitedNumber = $("#sameDeviceLimitedNumber").val();
        if (sameDeviceLimitedNumber == null || sameDeviceLimitedNumber == undefined || sameDeviceLimitedNumber == "" || sameDeviceLimitedNumber == 0) {
            warnJqueryConfirm("请填写同设备限次！");
            return false;
        }
    }
    var sameUserLimited = $("input[name=sameUserLimited]:checked").val();
    if (sameUserLimited == 1) {
        var sameUserLimitedNumber = $("#sameUserLimitedNumber").val();
        if (sameUserLimitedNumber == null || sameUserLimitedNumber == undefined || sameUserLimitedNumber == "" || sameUserLimitedNumber == 0) {
            warnJqueryConfirm("请填写同用户限次");
            return false;
        }
    }

    $.ajax({
        type: 'POST',
        url: rootPath + '/credit/goods/editData',
        data: $('form').serializeArray(),
        cache: false,
        dataType: 'json',
        success: function (resObj) {
            if (resObj.code == 0) {
                _successTipsFun("商品保存成功");
                setTimeout(function () {
                    returnToListPage(rootPath + '/credit/goods/list');
                }, 1500);
            } else {
                btnSwitchStatus('able');
                _errorTipsFun(resObj.msg);
               // returnToListPage(rootPath + '/credit/goods/edit?id='+$("#id").val());
            }
        },
        error: function (response) {
            _errorTipsFun("商品编辑失败");//提示错误信息
            btnSwitchStatus('able');
        }
    });
    return false;
}

/**
 * 完成
 */
function finishBtnClick() {
    btnSwitchStatus('disable');
    $("#goodsForm").submit();//提交表单
}

/**
 * 保存按钮切换启用禁用
 */
function btnSwitchStatus(type) {
    if (type == 'disable') {
        $(".btn-group a:eq(0)").unbind("click").text("保存中...");
    } else if (type == 'able') {
        $(".btn-group a:eq(0)").bind("click", function () {
            finishBtnClick();
        }).text("保存");
    }
}
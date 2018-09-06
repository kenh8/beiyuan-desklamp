/**
 * 商品列表
 * */
$(document).ready(function () {
    $(".select2").select2({})
    $("#startDate").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change', function (ev) {
        var startDate = $('#startDate').val();
        $("#endDate").datetimepicker('setStartDate', startDate);
        $("#startDate").datetimepicker('hide');
    });
    $("#endDate").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change', function (ev) {
        var endDate = $("#endDate").val();
        $("#startDate").datetimepicker('setEndDate', endDate);
        $("#endDate").datetimepicker('hide');
    });


    $("input[name='sameDeviceLimited']").click(function () {
        lockLimitedNumber("sameDeviceLimited", "sameDeviceLimitedNumber");
    });
    $("input[name='sameUserLimited']").click(function () {
        lockLimitedNumber("sameUserLimited", "sameUserLimitedNumber");
    });
});


var sameDeviceLimitedNumber = "";
var sameUserLimitedNumber = "";
function lockLimitedNumber(_radioName, _inputId) {
    if ($("input[name='" + _radioName + "']:checked").val() == 2) {
        $("#" + _inputId + "").attr("disabled", "disabled");
        var value = $("#" + _inputId + "").val();
        _inputId == "sameUserLimitedNumber" ? sameUserLimitedNumber = value : sameDeviceLimitedNumber = value;
        $("#" + _inputId + "").val("");
    } else {
        _inputId == "sameUserLimitedNumber" ? $("#" + _inputId + "").val(sameUserLimitedNumber) : $("#" + _inputId + "").val(sameDeviceLimitedNumber);
        $("#" + _inputId + "").removeAttr("disabled");
    }
}
/**
 * 上传封面图片
 */
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
        $('#goodsExchangeIntegral').val('');
        $('#goodsPrice').val('');
        $('#goodsPrice').attr("disabled", false);
        $('#goodsExchangeIntegral').attr("disabled", false);
        $('#goodsPrice').next('em').html("*");
        $('#goodsExchangeIntegral').next('em').html("*");
    } else if (integralRuleId == 3) {//纯现金情况
        $('#goodsExchangeIntegral').val(0);
        $('#goodsExchangeIntegral').attr("disabled", true);
        $('#goodsPrice').attr("disabled", false);
        $('#goodsPrice').val('');
        $('#goodsPrice').next('em').html("*");
        $('#goodsExchangeIntegral').next('em').html("");
    } else if (integralRuleId == 1) {//纯积分情况
        $('#goodsPrice').val(0);
        $('#goodsPrice').attr("disabled", true);
        $('#goodsExchangeIntegral').attr("disabled", false);
        $('#goodsExchangeIntegral').val('');
        $('#goodsExchangeIntegral').next('em').html("*");
        $('#goodsPrice').next('em').html("");
    }
}

function saveData() {

    var goodsCoverUrl = $("#goodsCoverUrl").val();
    if (goodsCoverUrl == null || goodsCoverUrl == undefined || goodsCoverUrl == "") {
        warnJqueryConfirm("请上传封面图片！");
        return false;
    }

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
    var context = $("button[type=submit] ").text();
    if (context == '确定') {
        $("button[type=submit] ").attr("disabled", "disabled").text("保存中...");
    }
    $.ajax({
        type: 'POST',
        url: rootPath + '/credit/goods/saveData', //?callbackMethod=refreshTable
        data: $('form').serializeArray(),
        cache: false,
        dataType: 'json',
        success: function (resObj) {
            if (resObj.code == 0) {
                //保存成功 跳转至 列表页
                // _successTipsFun("商品保存成功");
                returnToListPage(rootPath + '/credit/goodsDetail/list/' + resObj.data + '');
            } else {
                _errorTipsFun("商品添加失败");//提示错误信息
            }
            removedisabled();
        },
        error: function (response) {
            removedisabled();
            console.log(response);
        }
    });
    return false;
}
//将按钮去除竟用状态
function removedisabled() {
    $("button[type=submit] ").removeAttr("disabled").text("确定");
}


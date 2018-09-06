$(document).ready(function () {

    $("#MOVIES_TV_TABLE").bootstrapTable();
    $("#MEMBER_VIP_TABLE").hide();
    $("#COMMODITY_PACKAGE_TABLE").hide();
    $("#APPLICATION_APP_TABLE").hide();
    $(".nav-tabs a").bind("click", function () {
        $(".nav-tabs a,li").removeClass("active");
        $(this).addClass("active").parent().addClass("active");
        var _key = $(this).parent().attr("key");
        $("#type").val(_key);
        switchTable(_key);
    });
    $("#date").datetimepicker({
        format: "yyyy-mm-dd",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change', function (ev) {
        /* var startTime = $('#startTime').val();
         $("#endTime").datetimepicker('setStartDate',startTime);
         $("#startTime").datetimepicker('hide');*/
    });
    var _allowedFile = ['jpg', 'png', 'gif', 'apk', 'zip', 'xlsx', 'xls'];
    var _maxFileSize = 10000;
    $("#file").fileinput({
        uploadUrl: rootPath + '/file/upload', // you must set a valid URL here else you will get an error
        allowedFileExtensions: _allowedFile,
        overwriteInitial: false,
        showPreview: false,
        maxFileSize: _maxFileSize,
        maxFileCount: 1,
        fileActionSettings: {showZoom: false},//不显示 预览按钮 因 用modal有问题
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        },
        preferIconicPreview: true,//自定义上传类型图标
        previewFileIconSettings: {
            'doc': '<i class="fa fa-file-word-o text-primary"></i>',
            'xls': '<i class="fa fa-file-excel-o text-success"></i>',
            'ppt': '<i class="fa fa-file-powerpoint-o text-danger"></i>',
            'pdf': '<i class="fa fa-file-pdf-o text-danger"></i>',
            'zip': '<i class="fa fa-file-archive-o text-muted"></i>',
            'htm': '<i class="fa fa-file-code-o text-info"></i>',
            'txt': '<i class="fa fa-file-text-o text-info"></i>',
            'mov': '<i class="fa fa-file-movie-o text-warning"></i>',
            'mp3': '<i class="fa fa-file-audio-o text-warning"></i>',
            'apk': '<i class="fa fa-file-archive-o text-muted"></i>',
        },
        previewFileExtSettings: {
            'doc': function (ext) {
                return ext.match(/(doc|docx)$/i);
            },
            'xls': function (ext) {
                return ext.match(/(xls|xlsx)$/i);
            },
            'ppt': function (ext) {
                return ext.match(/(ppt|pptx)$/i);
            },
            'zip': function (ext) {
                return ext.match(/(zip|rar|tar|gzip|gz|7z)$/i);
            },
            'htm': function (ext) {
                return ext.match(/(htm|html)$/i);
            },
            'txt': function (ext) {
                return ext.match(/(txt|ini|csv|java|php|js|css)$/i);
            },
            'mov': function (ext) {
                return ext.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
            },
            'mp3': function (ext) {
                return ext.match(/(mp3|wav)$/i);
            },
            'apk': function (ext) {
                return ext.match(/(apk)$/i);
            }
        }
    });
});

/**
 * 文件上传成功事件
 * $.Event
 */
$("#file").on("fileuploaded", function (event, data, previewId, index) {
    replaceImg(data.response.data.filename, "coverUrl");
});
function replaceImg(fileName, targetId) {
    $("#imgUrl").val(imgPath + '/' + fileName)
}

function selectData() {
    var type = $("#type").val();
    if (type == "MOVIES_TV") {
        $(".nav-tabs a:eq(0)").click();
    } else if (type == "MEMBER_VIP") {
        $(".nav-tabs a:eq(1)").click();
    } else if (type == "COMMODITY_PACKAGE") {
        $(".nav-tabs a:eq(2)").click();
    } else if (type == "APPLICATION_APP") {
        $(".nav-tabs a:eq(3)").click();
    } else {
        $(".nav-tabs a:eq(0)").click();
    }
    //
}
function switchTable(key) {
    var _table = $("#" + key + "_TABLE");
    $(".bootstrap-table").hide();
    _table.parents(".bootstrap-table").show();
    //刷新数据
    var _form = $("#paramForm");
    var _param = _form.serialize();
    var baseUrl = _table.attr("data-url");

    if (baseUrl.indexOf("?") == -1) {
        baseUrl += "?" + _param;
    } else {
        baseUrl += "&" + _param;
    }
    var urlJson = {};
    urlJson.url = baseUrl;


    if ((_table).parents(".bootstrap-table").length > 0) {
        _table.bootstrapTable('refresh', urlJson);
    } else {
        _table.bootstrapTable(urlJson);
    }
    if ((_table.is(":hidden"))) {
        _table.show();
    }
}
function colseModel() {
    $("#my_model").removeClass("box-show").addClass("box-hide");
    ;
    $("#model_context").addClass("box-hide");
    $("#myRufe")[0].reset();
    $(".model-Exhibition").css("display", "none");
    $(".loadEffect").css("display", "block");
    /* returnToListPage(rootPath + '/credit/vip/list');*/
    selectData();
}
function resetPage() {
    returnToListPage(rootPath + '/credit/vip/list');
}
function showModel() {
    $("#my_model").addClass("box-show");
    $("#model_context").removeClass("box-hide");
}
function operateRender(value, row, index) {
    var _option = _bootStrapOptions("vipMoviesTableId");
    var action = '';
    if (row.isRefund == 0) {
        action += ' <a href="javascript:void(0);" onclick="adjustmentSort(\'' + row.tradeNo + '\',\'' + row.productType + '\')" class="view-link">退款</a>';
        action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/vip/seeOperation?tradeNo=' + row.tradeNo + '"  class="view-link">查看详细信息</a>';
    } else {
        action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/vip/seeOperation?tradeNo=' + row.tradeNo + '"  class="view-link">查看详细信息</a>';
    }
    return _commonDropDownLink(action);
}
function fenzyuan(value, row, index) {
    var _drop = $("<span>" + Fen2Yuan(value) + "</span>");
    return _drop.prop("outerHTML");
}
function Fen2Yuan(num) {
    if (typeof num !== "number" || isNaN(num)) return null;
    return ( num / 100 ).toFixed(2);
}

function adjustmentSort(tradeNo, productType) {
    showModel();
    $("#jqtradeNo").val(tradeNo);
    $.ajax({
        type: 'Post',
        url: rootPath + '/credit/vip/sendIntegrals',
        cache: false,
        data: {
            tradeNo: tradeNo,
            productType: productType
        },
        dataType: 'json',
        success: function (resp) {
            $("#refundWay").empty();
            var result = resp.data.status;
            if (result == true) {
                var list = resp.data.result;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    html += "<option value='" + list[i].id + "'>" + list[i].text + "</option>";
                }
                $("#refundWay").append(html);
                $.ajax({
                    type: 'POST',
                    url: rootPath + '/credit/vip/getInfoMoney',
                    data: {
                        tradeNo: tradeNo,
                    },
                    cache: false,
                    dataType: 'json',
                    success: function (resp) {
                        var code = resp.code;
                        if (code == 0) {
                            hideLoding();
                            $("#refundableMoney").val(change(resp.data.refundableMoney));
                            $("#orderMoney").val(change(resp.data.orderMoney));
                            $("#discountMoney").val(change(resp.data.discountMoney));
                            /*请求后台需要锁定的用户积分*/
                            $("#deductionIntegrals").val(resp.data.deductionIntegrals);
                        } else {
                            errorJqueryConfirm(resp.msg);
                            hideLoding();
                        }
                    },
                    error: function (response) {
                        hideLoding();
                    }
                });
            } else {
                errorJqueryConfirm("操作失败!");
            }
        },
        error: function (response) {
            errorJqueryConfirm("操作异常!");
        }
    });


}
function VerificationMoney(obj) {
    /*可退金额*/
    var refundableMoney = $("#refundableMoney").val();
    /*预退款金额*/
    var inputMonet = $(obj).val();
    var regEn = /[`~!@#$%^&*()_+<>?:"{},\/;'[\]]/im,
        regCn = /[·！#￥（——）：；“”‘、，|《。》？、【】[\]]/im;
    if (regEn.test(inputMonet) || regCn.test(inputMonet)) {
        $(obj).val("");
        $("#refundMoney").val("");
        errorJqueryConfirm("输入项预退款金额不符合数字规则!");
        return false;
    }
    var regP = /^[0-9]+(.[0-9]{1,2})?$/;
    if (!regP.test(inputMonet)) {
        $(obj).val("");
        $("#refundMoney").val("");
        errorJqueryConfirm("必须是整数或者小数且保留后面两位!");
        return false;
    }
    var val_1 = inputMonet * 100;
    var val_2 = $("#discountMoney").val() * 100;
    if (val_1 < val_2) {
        errorJqueryConfirm("预退款金额不能小于抵扣金额!");
        $("#refundMoney").val("");
        $("#probablyMoney").val("");
        return false;
    }
    var money = parseInt(val_1) - parseInt(val_2);
    $("#refundMoney").val(change(money));

}
function change(fen) {
    var yuan = fen / 100.0;
    return yuan.toFixed(2);
}
function hideLoding() {
    $(".model-Exhibition").css("display", "block");
    $(".loadEffect").css("display", "none");
}

function saveData() {
    var checkValue = $('#refundWay option:selected').val();
    $("#checkValue").val(checkValue);
    var imgUrl = $("#imgUrl").val();
    if (imgUrl == "" || imgUrl == null) {
        errorJqueryConfirm("你还没有上传附件!");
        return false;
    }
    $("#determineBtn").prop("disabled", true);
    $.ajax({
        type: 'POST',
        url: rootPath + '/credit/vip/exchangeMoney',
        data: $('#myRufe').serializeArray(),
        cache: false,
        dataType: 'json',
        success: function (resp) {
            if (resp.code == -1) {
                errorJqueryConfirm(resp.msg);
            }
            if (resp.code == 0) {
                successJqueryConfirm(resp.msg);
                returnToListPage(rootPath + '/credit/vip/list');
            }
            $("#determineBtn").prop("disabled", false);
        },
        error: function (response) {
            console.log(JSON.stringify(response) + "");
        }
    });
    return false;
}

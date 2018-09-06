$(document).ready(function () {
    $(".select2").select2({});
    $("#totalPrice").attr("disabled", true);
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

    /**
     * 文件上传成功事件
     * $.Event
     */
    $("#file").on("fileuploaded", function (event, data, previewId, index) {
        replaceImg(data.response.data.filename, "coverUrl");
    })

    $("#expirationDate").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change', function (ev) {
        var expirationDate = $('#expirationDate').val();
        $("#expirationDate").datetimepicker('hide');
    });
    getAllProName(1);
    getMerchant();

    $("input[name='isForever']").click(function () {
        lockInput();
    });
});
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
 * 禁用是输入框
 */
var expirationDate = "";
function lockInput() {
    if ($("input[name='isForever']:checked").val() == 1) {
        expirationDate = $("#expirationDate").val();
        $("#expirationDate").val("");
        $("#expirationDate").attr("disabled", "disabled");
    } else {
        $("#expirationDate").val(expirationDate);
        $("#expirationDate").removeAttr("disabled");
    }
}
//定义变量接受填入的运费和价格
var oldprice = 0;
var freightPrice = 0;
var totalPrice = 0;
function showPrice() {
    var _price = $("#price").val();
    var _freightPrice = $("#freightPrice").val();
    if (isNaN(_price)) {
        errorJqueryConfirm("售价不合法!");
        $("#totalPrice").val("");
        $("#price").val("");
        return false;
    }
    if (isNaN(_freightPrice)) {
        errorJqueryConfirm("运费不合法!");
        $("#totalPrice").val("");
        $("#_freightPrice").val("");
        return false;
    }
    oldprice = _price;
    freightPrice = _freightPrice;
    var _TotalPrice = accAdd(_price, _freightPrice);
    totalPrice = _TotalPrice;
    $("#totalPrice").val(_TotalPrice);
}
/**
 * 替换图片
 * @param fileName
 */
function replaceImg(fileName, targetId) {
    $("#" + targetId).val(fileName);
    //图片 处理
    if (_commonCheckImg(fileName)) {
        var _parent = $("#" + targetId).parent();
        _parent.find("img").attr("src", imgPath + '/' + fileName);
        _parent.show();
        setTimeout(function () {
            $("#" + targetId).parents(".form-group").find(".fileinput-remove-button").click();
        }, 1000);
    }
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

function changePrice() {
    var type = $("#settlementType").val();
    if (type == 1) {
        $("#price").attr("disabled", false);
        $("#freightPrice").attr("disabled", false);
        $("#totalPrice").attr("disabled", true);
        $("#price").val(oldprice);
        $("#freightPrice").val(freightPrice);
        $("#totalPrice").val(totalPrice);


    } else {
        /*  $("#price").attr("disabled", true).val("");
         $("#freightPrice").attr("disabled", true).val("");*/
        $("#totalPrice").attr("disabled", false).val("");
    }
}
function getAllProName(type) {//type 1是 获取所有的省  2是省下面的市
    var proName = '';
    if (type == 2) {
        var proName = $("#proName option:selected").val();
    }
    $.ajax({
        type: 'GET',
        url: rootPath + '/credit/virCard/getCityDataByCode?parentCode=' + proName,
        data: '',
        cache: false,
        dataType: 'json',
        success: function (resObj) {
            $("#cityName").empty();
            if (resObj.code == 0) {
                var html = "<option value=''>请选择</option>";
                var json = eval("(" + resObj.msg + ")");
                var arr = json.data;
                for (var i = 0; i < arr.length; i++) {
                    html += "<option value='" + arr[i].code + "'>" + arr[i].name + "</option>";
                }
                if (type == 1) {
                    $("#proName").html(html);
                } else {
                    $("#cityName").html(html);
                }
            }
        },
        error: function (response) {
            console.log(response);
        }
    });
}
/**
 * 获取商户信息
 */
function getMerchant() {
    $.ajax({
        type: "get",
        url: rootPath + "/credit/virCard/getMerchants",
        cache: false,
        data: {},
        dataType: "json",
        success: function (res) {
            if (res.code == 0) {
                var htmlTxt = "";
                var arr = res.data;
                if (arr.length >0) {
                    for (var i = 0; i < arr.length; i++) {
                        htmlTxt += "<option value='" + arr[i].partnerId + "'>" + arr[i].partnerName + "</option>";
                    }
                }
                $("#optionOne").after(htmlTxt);
            }
        }
    });
}
function obtainMerchant() {
    var options = $("#merchantSelect option:selected");
    $("#merchantId").val(options.text());
}

/**
 * 保存按钮切换启用禁用
 */
function btnSwitchStatus(type) {
    if (type == 'disable') {
        $("button[type=submit] ").unbind("click").text("保存中...");
    } else if (type == 'able') {
        $("button[type=submit]").bind("click", function () {
            finishBtnClick();
        }).text("保存");
    }
}
//将按钮去除竟用状态
function removedisabled() {
    $("#subBtn").removeAttr("disabled").val("确定");
}
function RefreshPage() {
    $(".panel").animate({height: "100px"}, '1000');
    $(".panel").animate({height: "500px"}, '1000');
}
function cardList() {
    returnToListPage(rootPath + '/credit/virCard/list');
}

function saveData() {
    var context = $("#subBtn").val();
    var sn = $("#stockNumber").val();
    var price = $("#price").val();
    var freightPrice = $("#freightPrice").val();
    var merchantId = $("#merchantId").val();
    //结算方式
    var settlementType = $("#settlementType option:selected").val();
    var totalPrice = $("#totalPrice").val();

    var coverUrl = $("#coverUrl").val();
    if (coverUrl == "" || coverUrl == null) {
        warnJqueryConfirm("请上传图片!");
        return false;
    }

    if (isNaN(sn) || sn <= 0) {
        warnJqueryConfirm("库存不能为空!");
        return false;
    }

    if ($("input[name='isForever']:checked").val() == 0) {
        var expirationDate = $("#expirationDate").val();
        if (expirationDate == '' || expirationDate==null || expirationDate ==undefined){
            warnJqueryConfirm("请选择有效期!");
            return false;
        }
    }


    var  receivePlace = $("#receivePlace").val();
    if (receivePlace == "" || receivePlace == null) {
        warnJqueryConfirm("领取地址不能为空!");
        return false;
    }

    if (isNaN(price) || price <= 0) {
        if (price < 0.01) {
            warnJqueryConfirm("售价不能小于1分!");
        }
        return false;
    }

    if (isNaN(freightPrice) && freightPrice < 0.01) {
        warnJqueryConfirm("运费不能小于1分!");
        return false;
    }

    if (merchantId == "" || merchantId == null) {
        warnJqueryConfirm("商户不能为空!");
        return false;
    }

    if (settlementType == 2) {
        if (isNaN(totalPrice) || totalPrice < 0.01) {
            warnJqueryConfirm("自拟结算价不能小于1分!");
            return false;
        }
    }

    if (context == "确定") {
        $("#subBtn").attr('disabled', "true").val("保存中...");
    }

    $.ajax({
        type: 'POST',
        url: rootPath + '/credit/virCard/saveData',
        data: $('#addVirCardForm').serializeArray(),
        cache: false,
        dataType: 'json',
        success: function (resObj) {
            if (resObj.code == 0) {
                $('#addVirCardForm')[0].reset();
                document.getElementById("addVirCardForm").reset();
                var html = "";
                if (resObj.data.errNum > 0) {
                    var array = resObj.data.errorMes;
                    for (var i = 0; i < array.length; i++) {
                        html += "<li>" + array[i] + "</li>"
                    }
                    $(".err_mes").html(html);
                    $("#successNum").text(resObj.data.sucNum);
                    $("#errorNum").text(resObj.data.errNum);
                    showModel();
                } else {
                    _successTipsFun("操作成功");
                    returnToListPage(rootPath + '/credit/virCard/list');
                }
                /**/
            } else {
                _errorTipsFun("添加失败");//提示错误信息
            }
            removedisabled();
        },
        error: function (response) {
            _errorTipsFun("添加会员卡失败");
            removedisabled();
        }
    });
    return false;
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
    showImgCommonWrapper("coverUrl", _file);
}
function colseModel() {
    $("#my_model").remove();
    $("#model_context").addClass("box-hide");
    returnToListPage(rootPath + '/credit/virCard/list');
}
function showModel() {
    $("#my_model").addClass("box-show");
    $("#model_context").removeClass("box-hide");
}
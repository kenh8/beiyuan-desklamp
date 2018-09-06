var _totalPrice = $("#totalPrice").val();
var expirationDate = $("#expirationDate").val();
$(document).ready(function () {
    getMerchant();
    getAllProName(1);
    getAllProName($("#proNameId").val());
    lockdateInput();
    changePrice("t1");
    $("input[name='isForever']").click(function () {
        lockdateInput();
    });
    $(".select2").select2({});
    /**
     * 获取文件上传参数
     */
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
    showImg();
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
});


function showImg() {
    replaceImg($("#coverUrl").val(),"coverUrl");
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
function saveData() {
    //对日期进行控制
    if ($("input[name='isForever']:checked").val() == 0) {
        var expirationDate = $("#expirationDate").val();
        var date = new Date();
        var str = date.getTime();
        var time = parserDate(expirationDate).getTime();
        if(time<str){
            warnJqueryConfirm("选择的时间必须比当前时间大!");
            return false;
        }
        if (expirationDate == '' || expirationDate==null || expirationDate ==undefined){
            warnJqueryConfirm("过期时间不能为空!");
            return false;
        }
    }
    $("#subBtn").attr('disabled', "true").val("保存中...");
    $.ajax({
        type: 'POST',
        url: rootPath + '/credit/virCard/saveData?callbackMethod=refreshTable',
        data: $('#editForm').serializeArray(),
        cache: false,
        dataType: 'json',
        success: function (resObj) {
            modalAjaxDone(resObj);
        },
        error: function (response) {
            console.log(response);
        }
    });
    return false;
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

function getAllProName(type) {
    var proName = '';
    if (type != 1) {
        proName = type;
        /* var proName = $("#proName option:selected").val();*/
    }
    if (type == 2) {
        proName = $("#proName option:selected").val();
    }
    $.ajax({
        type: 'GET',
        url: rootPath + '/credit/virCard/getCityDataByCode?parentCode=' + proName,
        data: '',
        cache: false,
        dataType: 'json',
        success: function (resObj) {
            if (resObj.code == 0) {
                var html = "<option value=''>请选择</option>";
                var json = eval("(" + resObj.msg + ")");
                var arr = json.data;
                for (var i = 0; i < arr.length; i++) {
                    if (type == 1) {
                        if (arr[i].code == $("#proNameId").val()) {
                            html += "<option selected value='" + arr[i].code + "'>" + arr[i].name + "</option>";
                        } else {
                            html += "<option value='" + arr[i].code + "'>" + arr[i].name + "</option>";
                        }
                    } else {
                        if (arr[i].code == $("#cityNameId").val()) {
                            html += "<option selected value='" + arr[i].code + "'>" + arr[i].name + "</option>";
                        } else {
                            html += "<option value='" + arr[i].code + "'>" + arr[i].name + "</option>";
                        }
                    }
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

function obtainMerchant() {
    var options = $("#merchantSelect option:selected");
    $("#merchantName").val(options.text());
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
            var merchantId = $("#orgMerchantId").val();
            if (res.code == 0) {
                var htmlTxt = "";
                var json = JSON.parse(res.msg);
                if (json != null) {
                    var arr = json.result;
                    for (var i = 0; i < arr.length; i++) {
                        if (merchantId == arr[i].partnerId) {
                            htmlTxt += "<option selected='selected' value='" + arr[i].partnerId + "'>" + arr[i].partnerName + "</option>";
                        } else {
                            htmlTxt += "<option value='" + arr[i].partnerId + "'>" + arr[i].partnerName + "</option>";
                        }
                    }
                }
                $("#optionOneUp").after(htmlTxt);
            } else {
                /*alert('筛选失败！');*/
            }
        }
    });
}
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
    var _TotalPrice = accAdd(_price, _freightPrice);
    $("#totalPrice").val(_TotalPrice);
}

/**
 * 禁用是输入框
 */

function lockdateInput() {
    if ($("input[name='isForever']:checked").val() == 1) {
        $("#expirationDate").attr("disabled", "disabled").val("");
    } else {
        $("#expirationDate").val(expirationDate);
        $("#expirationDate").removeAttr("disabled");
    }
}
function changePrice(Choice) {
    showPrice();
    var _mentType = "";
    if (Choice == "t1") {
        _mentType = $("#settlement").val();
    } else {
        _mentType = $("#settlementType").val();
    }
    if (_mentType == 1) {
        $("#price").attr("disabled", false);
        $("#freightPrice").attr("disabled", false);
        $("#totalPrice").attr("disabled", true);
    } else {
        /*$("#price").attr("disabled", true).val("");
        $("#freightPrice").attr("disabled", true).val("");*/
        $("#totalPrice").attr("disabled", false).val(_totalPrice);
    }
}


 function parserDate(date) {
    var t = Date.parse(date);
    if (!isNaN(t)) {
        return new Date(Date.parse(date.replace(/-/g, "/")));
    } else {
        return new Date();
    }
};
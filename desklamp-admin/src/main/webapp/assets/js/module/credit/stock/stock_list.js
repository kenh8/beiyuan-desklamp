$(function () {
    $("#showContext").hide();
    $(".loading").hide();
});

/**
 * 兑换码状态 渲染
 * @param value
 * @param row
 * @param index
 */
function redeemStatusRender(value, row, index){
    var result='';
    switch (value){
        case 0:result='出库';break;
        case 1:result='占用';break;
        case 2:result='有效';break;
        case 3:result='无效';break;
        case 4:result='兑换未销库';break;
        case 5:result='兑换且销库';break;
        default:result;break;
    }
    return result;
 /*   if(value == 1){
        return '占用';
    }else if(value == 2){
        return '有效';
    }else if(value == 3){
        return '已消库存';
    }*/
}


/**
 * 转到单个消库模块
 * @constructor
 */
function single(){
    $('#clearSingle').modal('show');
}

/**
 * 转到批量消库模块
 * @constructor
 */
function more() {
    $('#clearMore').modal('show');
   }
function close_single(){
    $('#clearSingle').modal('hide');
}
/**
 * 取消批量消库
 */
function cancel_more() {
    $('#clearMore').modal('hide');
}
/**
 * 修改有效期状态
 */
function do_single() {
    $(".loading").show();
    var redeemCodeName = $('#redeemCodeName').val();//兑换码
    var redeemCodeStatus=5;//状态兑换且销库
    var param = {
        'redeemCodeName': redeemCodeName,//兑换码
        'redeemCodeStatus':redeemCodeStatus
    };
    if (redeemCodeName != null && redeemCodeName != '') {
        $("#showContext").hide();
        var html="";
        $.ajax({
            type: 'POST',
            url: rootPath + "/credit/virCardStock/clearVirtualCardStock",
            data: param,
            cache: false,
            dataType: 'json',
            success: function (resp) {
                if(resp.code == 0){
                    var result = resp.data.result;
                    var count = resp.data.count;
                    if(count > 0){
                        var array = resp.data.errorMes;
                        for (var i = 0; i<array.length; i++){
                            html+=""+array[i]+""
                        }
                        $("#showContext").text(html).show();
                    }else if(result > 0){
                        successJqueryConfirm("操作成功！");
                        wrapperHideModal("base_modal");
                        $("#stockTableId").bootstrapTable('refresh', "/credit/virCardStock/listData");
                    }
                }else{
                    $("#showContext").text("操作失败,请重试").show();
                }
                $(".loading").hide();
            },
            error : function(response){
                $(".loading").hide();
                $("#showContext").text("操作失败,请重试").show();
            }
        });
    }else{
        $(".loading").hide();
        _errorTipsFun('兑换码不能为空');
    }
}

function check() {
    var excel_file = $("#redeemCodeName").val();
    if (excel_file == "" || excel_file.length == 0) {
        _warnTipsFun("请选择文件路径！");
        return false;
    } else {
        return true;
    }
}

$("#sure_clear_more").click(function(){
    sure_single();
});
function sure_single(){
    var param=$("#clearStockMore").serialize();
    $.post(rootPath + "/credit/virCardStock/clearVirtualCardStockMore",param, function (data) {
        if (data.returnValue == 0) {
            _successTipsFun('修改成功！');
            $("#clearSingle").modal('hide');
            $("#cardInfoList").bootstrapTable('refresh', param);
        } else {
            _errorTipsFun('修改失败！');
        }
    }, "json");
}


/**
 * 上传封面图片
 */
function uploadExcel(){
    manualModal(rootPath+'/credit/virCardStock/toExcelUpload?fileMaxSize=3000&maxNum=1' +
        '&callBackMethod=uploadCoverImgBack'+
        '&uploadSuccessMethod='+rootPath+'/credit/virCardStock/list','base_modal');
}

/**
 * 封面图片 回调函数
 * @param fileData
 */
function uploadCoverImgBack(fileData){
    wrapperHideModal("base_modal");
    var _file=fileData[0];
   /* showImgCommonWrapper("excelUrl",_file);*/
}

/**
 * 通用显示图片方法
 * @param _inputId 标签id
 * @param _file 文件对象
 */
function showImgCommonWrapper(_inputId,_file){
    var _input=$("#"+_inputId);
    _input.val(_file.filepath);
    var _div=_input.parents(".show-img-div");
    _div.find("img").attr("src",imgPath+"/"+_file.filepath).attr("data-original",imgPath+"/"+_file.filepath);
    _div.show();
    _input.parents(".div-img").find(".btn").hide();
}

/**
 * 提交表单
 */
/*验证上传的*/
function adduploadExcel(obj){
    verificationFile(obj);
}
/*批量消库*/
function submitExcel() {
    $("#feedback").html("");
    var option = {
        url : rootPath+'/credit/virCardStock/clearVirtualCardStockMore',
        type : 'POST',
        dataType : 'json',
        clearForm: true,
        target:'#clearMoreThanOne',
        success : function(resp) {
            console.log(resp)
            $(".loading").hide();
            var html="";
            if(resp.code != -1){
                var result = resp.data.result;
                var count = resp.data.count;
                if(count > 0){
                    var array = resp.data.errorMes;
                    for (var i = 0; i<array.length; i++){
                        html+="<li>"+array[i]+"</li>"
                    }
                    $("#feedback").html(html);
                }else if(count ==0){
                    _successTipsFun("操作成功!");
                }else {
                    errorJqueryConfirm("操作失败了！");
                    return false;
                }
            }else{
                $("#showContext").text("操作失败,请重试").show();
                return false;
            }
        },
        error : function(){
            $(".loading").hide();
            _errorTipsFun("销库失败!");
        }
    };
    var fileName = $("#excelFile").val(); //得到文件名数组fileName[2]文件名
    if(fileName==""){
        errorJqueryConfirm("你还没有选择上传的文件!");
        return false;
    }
    $("#signupListImportForm").ajaxSubmit(option);
    $(".loading").show();
}
function returnListPag() {
    returnToListPage(rootPath+'/credit/virCardStock/listStock');
}
function fileClick() {
    $("#excelFile").trigger("click");
}
function fileEmpty() {
    var file = $("#excelFile");
    file.after(file.clone().val(""));
    file.remove();
    $("#fileName").val("");
}


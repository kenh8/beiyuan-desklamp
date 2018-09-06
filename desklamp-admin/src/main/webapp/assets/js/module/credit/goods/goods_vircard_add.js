/**
 * 上传封面图片
 */
function uploadCoverImg(){
    manualModal(rootPath+'/file/toUpload?fileMaxSize=3000&maxNum=1&callBackMethod=uploadCoverImgBack','base_modal');
}

/**
 * 封面图片 回调函数
 * @param fileData
 */
function uploadCoverImgBack(fileData){
    wrapperHideModal("base_modal");
    var _file=fileData[0];
    showImgCommonWrapper("goodsCoverUrl",_file);
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
 * 删除图片
 * @param obj
 */
function deleteCommonImg(obj){
    var _parent=$(obj).parents(".div-img");
    var _div=$(obj).parents(".show-img-div");
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
    } else if (integralRuleId == 3) {//纯现金情况
        $('#goodsExchangeIntegral').val(0);
        $('#goodsExchangeIntegral').attr("disabled", true);
        $('#goodsPrice').attr("disabled", false);
        $('#goodsPrice').val('');
    } else if (integralRuleId == 1) {//纯积分情况
        $('#goodsPrice').val(0);
        $('#goodsPrice').attr("disabled", true);
        $('#goodsExchangeIntegral').attr("disabled", false);
        $('#goodsExchangeIntegral').val('');
    }
}

function saveData(){

    var goodsCoverUrl = $("#goodsCoverUrl").val();
    if (goodsCoverUrl == null || goodsCoverUrl == undefined || goodsCoverUrl == "") {
        warnJqueryConfirm("请上传封面！");
        return false;
    }

    var sameDeviceLimited = $("input[name=sameDeviceLimited]:checked").val();
    var sameUserLimited = $("input[name=sameUserLimited]").val();
    if (sameDeviceLimited == 1) {//同设备限次
        var sameDeviceLimitedNumber = $("#sameDeviceLimitedNumber").val();
        if (sameDeviceLimitedNumber == null || sameDeviceLimitedNumber == undefined || sameDeviceLimitedNumber == "") {
            warnJqueryConfirm("请填写同设备限次！");
            return false;
        }

    }
    var sameUserLimited = $("input[name=sameUserLimited]:checked").val();
    if (sameUserLimited == 1) {
        var sameUserLimitedNumber = $("#sameUserLimitedNumber").val();
        if (sameUserLimitedNumber == null || sameUserLimitedNumber == undefined || sameUserLimitedNumber == "") {
            warnJqueryConfirm("请填写同用户限次数量");
            return false;
        }
    }
    var maxStock=$("#maxStock").val();
    var goodsStock=$("#goodsStock").val();
    if(parseInt(maxStock)<parseInt(goodsStock)){

        _errorTipsFun("库存已经超过最大可用库存!");//提示错误信息
        return false;
    }
    var context = $("button[type=submit] ").text();
    if (context == '确定') {
        $("button[type=submit] ").attr("disabled", "disabled").text("保存中...");

    }
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/goods/saveData',
        data : $('form').serializeArray(),
        cache : false,
        dataType : 'json',
        success : function(resObj){
            if(resObj.code == 0){
                //保存成功 跳转至 列表页
                _successTipsFun("保存成功");
                returnToListPage(rootPath + '/credit/goodsDetail/list/' + resObj.data + '');
                removedisabled();

            }else{
                removedisabled();
                _errorTipsFun("商品添加失败");//提示错误信息
            }
        },
        error : function(response){
            removedisabled();
            console.log(response);
        }
    });
    return false;
}
//将按钮去除竟用状态
function  removedisabled() {
    $("button[type=submit] ").removeAttr("disabled").text("确定");
}
/**
 * 完成
 */
function InputDisabled(context) {
    if(context == "u" ){
        var val = $('input[name="sameDeviceLimited"]:checked').val();
        if(val == 1){
            $("#sameDeviceLimitedNumber").attr("disabled",false);
        }else{
            $("#sameDeviceLimitedNumber").attr("disabled",true)
        }
    }
    if(context == "s" ){
        var val = $('input[name="sameUserLimited"]:checked').val();
        if(val == 1){
            $("#sameUserLimitedNumber").attr("disabled",false);
        }else{
            $("#sameUserLimitedNumber").attr("disabled",true)
        }
    }
}

$("#goodsStock").blur(function(){
    var cardId=$("#viralCardId").val();
    var goodsStock=$("#goodsStock").val();
    if(cardId!=null|cardId!=''|cardId!=undefined){
        $.ajax({
            type : 'GET',
            url : rootPath+'/credit/virCard/getCanUseStock?cardId='+cardId,
            data : '',
            cache : false,
            dataType : 'json',
            success : function(resObj){
                $("#maxStock").val(resObj.data);
                if(resObj.data<goodsStock){
                    _errorTipsFun("当前最大的有效可用库存为:"+resObj.data);//提示错误信息
                }
            },
            error : function(response){
                console.log(response);

            }
        });
    }
})

/**
 * 完成
 */


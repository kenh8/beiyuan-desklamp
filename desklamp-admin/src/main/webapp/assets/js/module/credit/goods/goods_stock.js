$(function () {
    $("#fromStock").attr("disabled",true);
})

function saveData() {

    var toStock=$("#toStock").val();
    var fromStock=$("#fromStock").val();
    var maxStock=$("#maxStock").val();
    if((toStock==null||toStock=="")&&(fromStock==null||fromStock=="")){
        warnJqueryConfirm("请填写完整的数据!")
        return false;
    }

    var ext;
    var canUseStock=$("#goodsStock").val();
    if($("input[name='stockType']:checked").val() == 1){
        $("#modifyType").val("toStock");
        ext = $("#toStock").val();
    }else {
        $("#modifyType").val("fromStock");
        ext = $("#fromStock").val();
        //  判断出库的数量是不是大于最大可用的数量
        if(parseInt(canUseStock)<parseInt(ext)){
            warnJqueryConfirm("出库数量不能大于当前的可用库存!")
            return false;
        }
    }
    if(maxStock!=""&&parseInt(maxStock)<toStock){
        warnJqueryConfirm("入库数量大于当前对应的虚拟卡的最大可用库存!")
        return false;
    }
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/goods/stockManage?callbackMethod=refreshTable',
        data : {
            id:$("#id").val(),
            modifyType:$("#modifyType").val(),
            ext:ext
        },
        cache : false,
        dataType:'json',
        success : function(resp){
            modalAjaxDone(resp);
        },
        error : function(response){
            btnSwitchStatus('able');
        }
    });
    return false;
}

/**
 * 完成
 */
function finishBtnClick(){
    btnSwitchStatus('disable');
    $("#approveUpForm").submit();//提交表单
}

/**
 * 保存按钮切换启用禁用
 */
function btnSwitchStatus(type){
    if(type == 'disable'){
        $(".btn-group a:eq(0)").unbind("click").text("保存中...");
    }else if(type == 'able'){
        $(".btn-group a:eq(0)").bind("click",function(){
            finishBtnClick();
        }).text("保存");
    }
}
function InputDisable() {
    var val = $('input:radio[name="stockType"]:checked').val();
    if(val == 1){
        $("#fromStock").val("");
        $("#fromStock").attr("disabled",true);
        $("#toStock").attr("disabled",false);
    }else{
        $("#toStock").val("");
        $("#toStock").attr("disabled",true);
        $("#fromStock").attr("disabled",false);
    }
}


function getCanUseStock() {
    $.ajax({
        type : 'GET',
        url : rootPath+'/credit/goods/stockManage',
        data : {
            id:$("#id").val(),
        },
        cache : false,
        dataType:'json',
        success : function(resp){
            modalAjaxDone(resp);
        },
        error : function(response){
            btnSwitchStatus('able');
            console.log(response);
        }
    });


}


$("#toStock").blur(function(){
    var toStock=$("#toStock").val();
    var cardId=$("#viralCardId").val();
    var goodsType=$("#goodsType").val();
    if(cardId!=null&&cardId!=''&&cardId!=undefined&&parseInt(goodsType)==2){
        $.ajax({
            type : 'GET',
            url : rootPath+'/credit/virCard/getCanUseStock?cardId='+cardId,
            data : '',
            cache : false,
            dataType : 'json',
            success : function(resObj){
                $("#maxStock").val(resObj.data);
                if(resObj.data<toStock){
                    _errorTipsFun("当前最大的有效可用库存为:"+resObj.data);//提示错误信息
                }
            },
            error : function(response){
                console.log(response);

            }
        });
    }
})

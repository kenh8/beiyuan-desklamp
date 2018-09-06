$(function () {
    $(".select2").select2({
    });
    $('#base_modal').on('hide.bs.modal', function () {
        $("#paramForm").attr("tableId","productMetaTable");
    });
});
/**
 * 点击确定按钮将页面的form的table的属性进行调整
 * product_meta_list.js
 */

function saveData() {
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/product/saveDataMoreOne',
        data : $('#addForm').serializeArray(),
        cache : false,
        dataType:'json',
        success : function(respdata){
            var resp=respdata.data;
            var successSave=resp.successSave;
            var failSave=resp.failSave;
            var successSaveList=resp.successSaveList;
            var failSaveList=resp.failSaveList;
            var tDamaiIntegralStrategyDtoList=resp.tDamaiIntegralStrategyDtoList;
            var msg="保存成功"+successSave+"条,"+"保存失败"+failSave +"条";
            var successId="";
            var failId="";
            var repeat="";
            for(var m=0;m<successSaveList.length;m++){
                successId+=successSaveList[m];
            }

            for(var i=0;i<tDamaiIntegralStrategyDtoList.length;i++){
                failId+=failSaveList[i];
                var tDamaiIntegralStrategyDto=tDamaiIntegralStrategyDtoList[i];
                repeat+=" ID:"+failSaveList[i]+"与策略名称:"+tDamaiIntegralStrategyDto.strategyName+"重复;"

            }
            confirmJqueryConfirm(null,msg+repeat,null,null);
            modalAjaxDone(respdata);
        },
        error : function(response){
            btnSwitchStatus('able');
            console.log(response);
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
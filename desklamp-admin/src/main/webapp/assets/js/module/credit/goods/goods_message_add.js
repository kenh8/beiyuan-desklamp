$(document).ready(function () {
    checkBoxChange();
});
function checkBoxChange() {
    if ($('#status').is(':checked')) {
        $('#message').removeAttr('readonly');
        $('#defaultMessage').attr('readonly', 'readonly');
        $("#status").val(1);
    }
    else {
        $('#message').attr('readonly', 'readonly');
        $('#defaultMessage').attr('readonly', 'readonly');
       /* $('#defaultMessage').removeAttr('readonly');*/
        $("#status").val(0);
    }
}

function saveData() {
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/message/saveData',
        data : $('#messageForm').serializeArray(),
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
    $("#goodsAddForm").submit();//提交表单
}

/**
 * 保存按钮切换启用禁用
 */
function btnSwitchStatus(type){
    if(type == 'disable'){
        // $(".btn-group a:eq(0)").unbind("click").text("保存中...");
        $("button[type=submit] ").unbind("click").text("保存中...");
    }else if(type == 'able'){
        /* $(".btn-group a:eq(0)").bind("click",function(){
         finishBtnClick();
         }).text("保存");*/
        $("button[type=submit]").bind("click",function(){
            finishBtnClick();
        }).text("保存");
    }
}
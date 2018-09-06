function saveData() {
    var exchangeRate =$("#exchangeRate").val();
    var re = /^[0-9]*[1-9][0-9]*$/ ;
    if(!re.test( exchangeRate )){
        warnJqueryConfirm("汇率必须为正整数!");
        return false;
    }
    $("button[type=submit] ").attr("disabled","disabled") .text("保存中...");
    $.ajax({
        type : 'POST',
        url : '/credit/rate/saveData',
        data : $('#rateForm').serializeArray(),
        cache : false,
        dataType : 'json',
        success : function(resObj){
            $("button[type=submit] ").removeAttr("disabled").text("确定");
            modalAjaxDone(resObj);
            returnToListPage(rootPath+'/credit/rate/list');
        },
        error : function(response){
            btnSwitchStatus('able');
        }
    });
    return false;
}/**
 * Created by lijuan on 2018/2/8.
 */
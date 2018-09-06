$(function(){
    var arr= new Array();
    var str = $("#businessIdArr").val();
    arr = str.split(",");
    if(arr.length>0){//跟据business_id选中复选框
        for (var i = 0; i < arr.length; i++) {
            $("#businessId"+arr[i]).prop('checked','true');
        }
    }
});
function saveData(){
    var box_arr=[];
    $("input[name=businessId]:checked").each(function(i,index){
        box_arr.push($(this).val());
    });
    $("#box").val(box_arr);
    if(box_arr.length == 0){
        warnJqueryConfirm("您还没有选择对应的业务！");
        return false;
    }
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/integralStrategy/saveData',
        data : $('#editForm').serializeArray(),
        cache : false,
        dataType : 'json',
        success : function(resObj){
            if(resObj.code=="-1"){
                warnJqueryConfirm(resObj.msg);
            }else{
                modalAjaxDone(resObj);
            }
        },
        error : function(response){
            errorJqueryConfirm(response.msg);
        }
    });
    return false;
}

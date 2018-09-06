function saveData(){
    var box_arr=[];
    $("input[name=businessId]:checked").each(function(i,index){
        box_arr.push($(this).val());
    });
    if(box_arr.length == 0){
        warnJqueryConfirm("您还没有选择对应的业务！");
        return false;
    }
    $("#box").val(box_arr);
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/integralStrategy/saveData',
        data : $('#addForm').serialize(),
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

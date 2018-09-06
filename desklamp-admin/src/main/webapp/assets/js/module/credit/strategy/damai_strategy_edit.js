function saveData(){
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/damaiStrategy/saveData',
        data : $('#editForm').serializeArray(),
        cache : false,
        dataType : 'json',
        success : function(resObj){
            modalAjaxDone(resObj);
        },
        error : function(response){
            btnSwitchStatus('able');
        }
    });
    return false;
}

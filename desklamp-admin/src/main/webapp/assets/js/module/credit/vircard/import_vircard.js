/**
 * 提交表单
 */
function submitExcel() {
    var option = {
        url: rootPath + '/credit/virCard/getImportVirtualCard',
        type: 'POST',
        dataType: 'json',
        clearForm: true,
        target: '#importVircard',
        success: function (data) {
            if (data.code == "0") {
                modalAjaxDone(data)
                $("#stockNumber").val(data.data);
            }else{
                errorJqueryConfirm("导入异常！");
                ("#btnExcel").removeProp("disabled").text("确认导入");
                return false;
            }
        },
        error: function () {
            _errorTipsFun("导入失败!");
            ('#btnExcel').removeProp("disabled").text("确认导入");
        }
    };
    $("#importVircard").ajaxSubmit(option);
}


/**
 * 完成
 */
function finishBtnClick(obj){
    var fileName = $("#excelFile").val(); //得到文件名数组fileName[2]文件名
    if(fileName==""){
        errorJqueryConfirm("你还没有选择上传的文件!");
        return false;
    }
    $(obj).unbind("click").text("上传中...").attr('disabled',"true");
    submitExcel();
}
function adduploadExcel(obj){
    verificationFile(obj);
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
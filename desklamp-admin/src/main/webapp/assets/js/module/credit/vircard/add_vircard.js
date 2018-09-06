$(function () {
    $("#showContext").hide();
    $(".loading").hide();
});
/**
 * 提交表单
 */
function submitExcel() {
    var fileName = $("#excelFile").val(); //得到文件名数组fileName[2]文件名
    if(fileName==""){
        errorJqueryConfirm("你还没有选择上传的文件!");
        return false;
    }
    $("#subExcel").attr('disabled',"true").text("导入数据中...");
    var option = {
        url: rootPath + '/credit/virCard/addVirtualCard',
        type: 'POST',
        dataType: 'json',
        clearForm: true,
        target: '#addVircard',
        success: function (resp) {
            var html="";
            if (resp.code == 0) {
                _successTipsFun("操作成功");
                var mes = resp.data.errorMes;
                var errNum = resp.data.errNum;
                if(errNum > 0){
                    for (var i=0;i < mes.length; i++){
                        html+="<li>"+mes[i]+"</li>"
                    }
                    $("#feedback").html(html);
                }
            }else {
                _errorTipsFun("导入文件异常!");
                $("#subExcel").removeProp('disabled').text("确认导入");
                $(".loading").hide();
                return false;
            }
            $(".loading").hide();
            returnToListPage(rootPath + '/credit/virCard/list');
            $("#subExcel").removeProp('disabled').text("确认导入");
        },
        error: function () {
            $(".loading").hide();
            _errorTipsFun("导入失败!");
            $("button[type=submit] ").removeProp("disabled").text("确认导入");
        }
    };
    $("#addVircard").ajaxSubmit(option);
    $("#showContext").hide();
    $(".loading").show();
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

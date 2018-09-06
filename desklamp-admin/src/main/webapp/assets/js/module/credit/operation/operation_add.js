$(document).ready(function(){

    $(".select2").select2({

    });

    $("#button").attr("disabled", false);
    /**
     * 获取文件上传参数
     */
    var  _allowedFile=['jpg', 'png','gif','apk', 'zip', 'xlsx','xls'];

    var _maxFileSize=10000;

    $("#file").fileinput({
        uploadUrl: rootPath+'/file/upload', // you must set a valid URL here else you will get an error
        allowedFileExtensions : _allowedFile,
        overwriteInitial: false,
        showPreview: false,
        maxFileSize: _maxFileSize,
        maxFileCount: 1,
        fileActionSettings: {showZoom: false},//不显示 预览按钮 因 用modal有问题
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        },
        preferIconicPreview: true,//自定义上传类型图标
        previewFileIconSettings: {
            'doc': '<i class="fa fa-file-word-o text-primary"></i>',
            'xls': '<i class="fa fa-file-excel-o text-success"></i>',
            'ppt': '<i class="fa fa-file-powerpoint-o text-danger"></i>',
            'pdf': '<i class="fa fa-file-pdf-o text-danger"></i>',
            'zip': '<i class="fa fa-file-archive-o text-muted"></i>',
            'htm': '<i class="fa fa-file-code-o text-info"></i>',
            'txt': '<i class="fa fa-file-text-o text-info"></i>',
            'mov': '<i class="fa fa-file-movie-o text-warning"></i>',
            'mp3': '<i class="fa fa-file-audio-o text-warning"></i>',
            'apk': '<i class="fa fa-file-archive-o text-muted"></i>',
        },
        previewFileExtSettings: {
            'doc': function(ext) {
                return ext.match(/(doc|docx)$/i);
            },
            'xls': function(ext) {
                return ext.match(/(xls|xlsx)$/i);
            },
            'ppt': function(ext) {
                return ext.match(/(ppt|pptx)$/i);
            },
            'zip': function(ext) {
                return ext.match(/(zip|rar|tar|gzip|gz|7z)$/i);
            },
            'htm': function(ext) {
                return ext.match(/(htm|html)$/i);
            },
            'txt': function(ext) {
                return ext.match(/(txt|ini|csv|java|php|js|css)$/i);
            },
            'mov': function(ext) {
                return ext.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
            },
            'mp3': function(ext) {
                return ext.match(/(mp3|wav)$/i);
            },
            'apk': function(ext) {
                return ext.match(/(apk)$/i);
            }
        }



    });

    /**
     * 文件上传成功事件
     * $.Event
     */
    $("#file").on("fileuploaded", function (event, data, previewId, index){
        replaceImg(data.response.data.filename,"coverUrl");
    })

    $("#expirationDate").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change',function(ev){
        var expirationDate = $('#expirationDate').val();
        $("#expirationDate").datetimepicker('hide');
    });


});

/**
 * 替换图片
 * @param fileName
 */
function replaceImg(fileName,targetId){
    $("#"+targetId).val(fileName);
    //图片 处理
    if(_commonCheckImg(fileName)){
        var _parent=$("#"+targetId).parent();
        _parent.find("img").attr("src",imgPath+'/'+fileName);
        _parent.show();
        setTimeout(function(){
            $("#"+targetId).parents(".form-group").find(".fileinput-remove-button").click();
        },1000);
    }
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


$("#addOperationButton").click(function(){
    saveData();
    $("#addOperationButton").val(true);
});

function saveData(){
    var _operateName=$("#operateName").val();
    var _operateType=$("input[name='operateType']:checked").val();
    if (_operateName==null|| "" ==_operateName){
        warnJqueryConfirm("填写运营名称！");
        return false;
    }
    if (!_operateType){
        warnJqueryConfirm("选择来源方式！");
        return false;
    }
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/operation/saveData',
        data : $('#addOperation').serializeArray(),
        cache : false,
        dataType : 'json',
        success : function(resObj){
            modalAjaxDone(resObj);
            returnToListPage(rootPath+'/credit/operation/list');
            clearInput();
        },
        error : function(response){
            console.log(response);
        }
    });
    return false;
}
//刷新父页面，或指定div 或根据回调函数刷新
/*function modalAjaxDone(json){
    if(null != json && json.hasOwnProperty('code') && json.code == 0){
        //提示成功消息
        _successTipsFun(json.msg);
        var _call=checkHasCallBack(json);
        if(_call){
            eval(_call+'()');
        }else{
            refreshTable();
        }
    }else{
        _errorTipsFun(json.data);
        ableSubmitBtn();
    }
}*/
/**
 * 操作栏
 * @param value
 * @param row
 * @param index
 * @returns {*}
 */

function operateRender2(value, row, index){
    var action='';
    /*action+='<a data-div="baseContainer" data-target="divload" href="'+rootPath+'/credit/carouseFigure/edit?id='+row.id+'"  class="view-link">编辑</a>';*/

    action += ' <a href="javascript:void(0);" onclick="adjustmentSort(\'' + rootPath + '/credit/carouseFigure/changeSequence?id=' + row.id +'&flag=0'+'&sequence='+row.sequence+'&operateId='+row.operateId+'\',\''+rootPath+'/credit/operation/edit?id=/'+row.operateId+'\')" class="view-link">上移</a>';
    action += ' <a href="javascript:void(0);" onclick="adjustmentSort(\'' + rootPath + '/credit/carouseFigure/changeSequence?id=' + row.id +'&flag=-1'+'&sequence='+row.sequence+'&operateId='+row.operateId+ '\',\''+rootPath+'/credit/operation/edit?id=/'+row.operateId+'\')" class="view-link">下移</a>';
    action += ' <a href="javascript:void(0);" onclick="adjustmentSort(\'' + rootPath + '/credit/carouseFigure/delete?id=' + row.id + '\',\''+rootPath+'/credit/operation/edit?id=/'+row.operateId+'\')" class="view-link">删除</a>';
    return _commonDropDownLink(action);
}
function sortClick() {
    $("#operationAddTableId").bootstrapTable('refresh', "credit/carouseFigure/findListByOperationId?operateId="+$("#operateIdHidden").val());
}
function adjustmentSort(url) {
    $.ajax({
        type : 'POST',
        url : url,
        cache : false,
        dataType : 'json',
        success : function(resObj){
            if(resObj.code == "0"){
                sortClick();
                successJqueryConfirm(resObj.msg);
            }else{
                sortClick();
                errorJqueryConfirm(resObj.msg)
            }
        },
        error : function(response){
            errorJqueryConfirm(response.msg);
            sortClick();
        }
    });
}
function clearInput() {
    $("form input").val("");
}
function operationList() {
    returnToListPage(rootPath+'/credit/operation/list');
}

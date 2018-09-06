/**
 * Created by leo on 2017/12/22.
 * 系统提示信息 插件封装
 */
/**
 * 错误消息提示
 * @param msg
 */
function _errorTipsFun(msg,delayTime){
    errorJqueryConfirm(msg);
    // if(delayTime == undefined){
    //     delayTime=1500;//默认1.5秒
    // }
    // //解决 多个提示同时弹出
    // if($(".notifyjs-wrapper").length == 0){
    //     $.Notification.autoHideNotify('error', 'top center', '消息提示！',msg, delayTime);
    // }
}

/**
 * 警告消息提示
 * @param msg
 */
function _warnTipsFun(msg, delayTime){
    warnJqueryConfirm(msg);
    // if(delayTime == undefined){
    //     delayTime=1500;//默认1.5秒
    // }
    // if($(".notifyjs-wrapper").length == 0) {
    //     $.Notification.autoHideNotify('warning', 'top center', '消息提示！', msg, delayTime);
    // }
}

/**
 * 提示信息
 * @param msg
 * @private
 */
function _infoTipsFun(msg,delayTime){
    infoJqueryConfirm(msg);
    // if(delayTime == undefined){
    //     delayTime=1500;//默认1.5秒
    // }
    // if($(".notifyjs-wrapper").length == 0){
    //     $.Notification.autoHideNotify('info', 'top center', '消息提示！',msg, delayTime);
    // }
}

/**
 * 成功消息提示
 * @param msg
 */
function _successTipsFun(msg,delayTime){
    // successJqueryConfirm(msg);
    if(delayTime == undefined){
        delayTime=1500;//默认1.5秒
    }
    if($(".notifyjs-wrapper").length == 0) {
        $.Notification.autoHideNotify('success', 'top center', '消息提示！', msg, delayTime);
    }
}


function wrapperConfirmFun(sureFun,content,sureExt,cancelFun){
    confirmJqueryConfirm(sureFun,content,sureExt,cancelFun);
}
function verificationFile(obj) {
    var fileid= $(obj);
    var fileName = fileid.val().split('\\'); //得到文件名数组fileName[2]文件名
    $("#fileName").val(fileName[2]);
    var fileSize =  $("#"+fileid.attr('id'))[0].files[0]; //获得文件大小；
    var filePath = fileid.val().toLowerCase().split(".");
    var fileType =  filePath[filePath.length - 1]; //获得文件结尾的类型如 zip rar 这种写法确保是最后的
    if(!(fileType == "xls" || fileType =="xlsx")){
        $("#fileName").val("");
        ResetFile(fileid);
        warnJqueryConfirm('文件格式不符合要求！');
        return false;
    }else if(fileSize.size>10485760){
        warnJqueryConfirm('错误！请上传不超过10M的文件');
        ResetFile(fileid);
        return false;
    }
}
function ResetFile(obj) {
    var file = obj;
    file.after(file.clone().val(""));
    file.remove();
}
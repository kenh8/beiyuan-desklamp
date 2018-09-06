/**
 * 上传详情图片
 */
function uploadDetailImg(){/*
    var curLen=$("#goodsDetailUrl").parents(".div-img").find(".show-img-div").length;
    if(curLen >= 20){
        _errorTipsFun("最多只能上传20张");
        return;
    }*/
    manualModal(rootPath+'/file/toUpload?fileMaxSize=3000&maxNum=1&callBackMethod=uploadDetailImgBack','base_modal');
}

/**
 * 详情图片 回调函数
 * @param fileData
 */
function uploadDetailImgBack(fileData){
    wrapperHideModal("base_modal");
    var _file=fileData[0];
    showImgCommonWrapper("goodsDetailUrl",_file);
}

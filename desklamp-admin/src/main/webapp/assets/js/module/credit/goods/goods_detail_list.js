/**
 * 查看大图
 * @param obj
 */
function showOriginalImg(obj){
    $(obj).parents("tr").find("img").click();
}

/**
 * 上传详情图 回调
 * @param upData
 */
function uploadInfoImgCallBack(upData){
    wrapperHideModal("base_modal");
    var goodsDetailUrl=[];
    $.each(upData,function(){
        goodsDetailUrl.push(this.filepath);
    });
    if(goodsDetailUrl.length>0){
        $.post(rootPath+'/credit/goodsDetail/saveData',{
            goodsDetailUrl: JSON.stringify(goodsDetailUrl),
            goodsId: $("#goodsId").val()
        },function(resp){
            if(resp.code == 0){
                setTimeout(function(){
                    returnToListPage(rootPath+'/credit/goodsDetail/list?goodsId='+$("#goodsId").val());
                },1000);
            }else{
                _errorTipsFun(resp.data);
            }
        },'json');
    }
}

/**
 * 图片渲染方法 没有图片延迟加载
 * @param value
 * @param row
 * @param index
 * @returns {*}
 */
function renderImgNoLazyLoad(value, row, index){
    if(value != '' && value != undefined){
        if(_commonCheckImg(value)){
            return '<img src="'+imgPath+'/'+value+'" style="width: 60px;height: 40px; cursor: pointer;">';
        }
    }
    return '';
}

function operateRender(value, row, index){
    var _option=_bootStrapOptions("goodsDetailTableId");


    var action='';
    if(_option.listSize>1){
        if(index == 0){
            action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goodsDetail/moveData?id='+row.id+'&modifyType=down\')" class="view-link">下移</a>';
            /* action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goodsDetail/moveData?id='+row.id+'&modifyType=top\')" class="view-link">上移</a>';*/
        }else if(index == _option.listSize-1){
            /*action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goodsDetail/moveData?id='+row.id+'&modifyType=down\')" class="view-link">下移</a>';*/
            action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goodsDetail/moveData?id='+row.id+'&modifyType=top\')" class="view-link">上移</a>';
        }else{
            action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goodsDetail/moveData?id='+row.id+'&modifyType=top\')" class="view-link">上移</a>';
            action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goodsDetail/moveData?id='+row.id+'&modifyType=down\')" class="view-link">下移</a>';
        }
    }


    action+=' <a href="javascript:void(0);" onclick="showOriginalImg(this);" class="view-link">查看大图</a>';
    action += ' <a href="javascript:void(0);" onclick="adjustmentSort(\'' + rootPath + '/credit/goodsDetail/delete?id=' + row.id + '\')" class="view-link">删除</a>';
    return _commonDropDownLink(action);
}
function adjustmentSort(url) {
    $.ajax({
        type : 'POST',
        url : url,
        cache : false,
        dataType : 'json',
        success : function(resObj){
            if(resObj.code == "0"){
                sortList();
         //       successJqueryConfirm(resObj.msg);
            }else{
                sortList();
                errorJqueryConfirm(resObj.msg)
            }
        },
        error : function(response){
            errorJqueryConfirm(response.msg);
            sortList();
        }
    });
}
function sortList() {
    $("#goodsDetailTableId").bootstrapTable("refresh","/credit/goodsDetail/listData");
}
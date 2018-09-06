/**
 * 运营列表
 * */
$(document).ready(function(){
    $(".goods-select2").select2({

    });
});

/**
 * 类型 渲染
 * @param value
 * @param row
 * @param index
 */
function renderOperateType(value, row, index){
    if(value == 1){
        return '轮播图';
    }
}

/**
 * 状态
 * @param value
 * @param row
 * @param index
 */
function renderOperateStatus(value, row, index){
    if(value == 1){
        return '有效';
    }else{
        return '无效';
    }
}


function operateRender(value, row, index){
    var action='';
    action+='<a data-div="baseContainer" data-target="divload" href="'+rootPath+'/credit/operation/edit?id='+row.id+'"  class="view-link">编辑</a>';
    if(row.status == 0) {
        action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/operation/changeStatus?id=' + row.id +'&status=1&callbackMethod=refreshTable'+ '\')" class="view-link">上线</a>';
    }else if(row.status == 1){
        action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/operation/changeStatus?id=' + row.id + '&status=0&callbackMethod=refreshTable'+'\')" class="view-link">下线</a>';
    }
    return _commonDropDownLink(action);
}
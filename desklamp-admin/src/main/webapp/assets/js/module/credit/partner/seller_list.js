
/**
 * 操作栏渲染
 * @param value
 * @param row
 * @param index
 */


$(document).ready(function(){
    $(".select2").select2({

    });
});

function operateRender(value, row, index){
  var action='';
    action+='<a data-toggle="modal" data-target="#base_modal" href="'+rootPath+'/user/edit?userName='+row.userName+'"  class="view-link">编辑</a>';
    action+=' <a href="javascript:void(0);" onclick="ajaxDel(\''+rootPath+'/partner/deletePartner?userName='+row.userName+'&modifyType=delete\')" class="view-link">删除</a>';
  return action;
}

/**
 * 刷新商户账户信息
 */
function reqPartner(){
    $.post(rootPath+'/partner/reqPartner',{},function(resp){
        if(resp.returnValue == 0){
            _successTipsFun("操作成功");
            refreshTable();
        }else{
            _errorTipsFun(resp.data);
        }
    },'json');
}

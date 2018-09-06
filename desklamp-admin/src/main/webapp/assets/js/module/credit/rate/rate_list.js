
function operateRender(value, row, index){
    var action='';
    action+='<a data-toggle="modal" data-target="#base_modal" href="'+rootPath+'/credit/rate/edit?id='+row.id+'"  class="view-link">编辑</a>';
    return _commonDropDownLink(action);
}

$(document).ready(function() {

    $(".select2").select2({});
    
});
/**
 * 修改form表单的tableId的属性禁止点击回车刷新
 */
function upFormTableId() {
    $("#paramForm").attr("tableId","no");
}
/**
 * 使用状态 渲染
 * @param value
 * @param row
 * @param index
 */
function typeRender(value, row, index){
    if(value == 1){
        return '一级分类';
    }
    if(value == 2){
        return '二级分类';
    }
    if(value == 3){
        return '三级分类';
    }
    if(value == 4){
        return '单品 ';
    }
}
function operateRender(value, row, index){
    var action='';
    action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/product/delete?id=' + row.id + '\')" class="view-link">删除</a>';
    return _commonDropDownLink(action);
}
function upperPage(obj) {
    $(obj).text("跳转中...")
    returnToListPage(rootPath+'/credit/damaiStrategy/list');
}
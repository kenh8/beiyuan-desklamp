/**
 * Created by leo on 2017/6/5.
 */
$(document).ready(function(){
    $(".req-partner").bind("click",function(){
        reqPartner();
    })
});


/**
 * 操作栏渲染
 * @param value
 * @param row
 * @param index
 */
function operateRender(value, row, index){
  var action='';
  action+= '<a data-toggle="modal" data-target="#base_modal" href="'+rootPath+'/partner/view?partnerId='+row.partnerId+'"  class="view-link">查看</a>';
  action+=' <a data-target="divload" data-div="baseContainer" href="'+rootPath+'/partner/listAdmin?partnerId='+row.partnerId+'"  class="view-link">商户管理员管理</a>';
  //V1.1.2
  action+=' <a data-toggle="modal" data-target="#base_modal" href="'+rootPath+'/partner/editPartnerPhone?partnerId='+row.partnerId+'"  class="view-link">编辑电话</a>';
  return _commonDropDownLink(action);
}

/**
 * 刷新商户信息
 */
function reqPartner(){
    $(".req-partner").text("刷新中...").unbind();
    $.ajax({
        type : 'POST',
        url : rootPath+'/partner/reqPartner',
        data : {},
        cache : false,
        dataType:'json',
        success : function(resp){
            if(resp.returnValue == 0){
                _successTipsFun("操作成功");
                refreshTable();
            }else{
                _errorTipsFun(resp.data);
            }
        },error: function(resp){

        },complete: function(){
            $(".req-partner").text("刷新商户").bind("click",function(){
                reqPartner();
            });
        }
    });
}

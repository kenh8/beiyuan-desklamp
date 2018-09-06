/**
 * Created by leo on 2017/11/9.
 */
$(document).ready(function(){
    initCategoryChangePlugin("skuSelectTableId","categorySn");
});

/**
 * 完成
 */
function finishBtnClick(){
    btnSwitchStatus('disable');
    $("#goodsAddForm").submit();//提交表单
}

/**
 * 保存按钮切换启用禁用
 */
function btnSwitchStatus(type){
    if(type == 'disable'){
        $(".btn-group a:eq(0)").unbind("click").text("保存中...");
    }else if(type == 'able'){
        $(".btn-group a:eq(0)").bind("click",function(){
            finishBtnClick();
        }).text("保存");
    }
}
/**
 * 确认选择 方法
 */
function selectSureBtn(status){
    //获取选中数据
    var checkedData=$("#skuSelectTableId").bootstrapTable('getSelections');
    var param=new Array;
    if(checkedData.length == 0){
        _warnTipsFun("你还没有选择商品");
        return;
    }
    $.each(checkedData,function(){
        var params={
            'integralStrategyId':$("#integralStrategyId").val(),
            'productName':this.goodsName,
            'categoryId':this.goodskuSn,
            'categoryIdType':4,
            'status':status
        }
        param.push(params);
    });
    var url=encodeURI('/credit/product/saveData?data='+JSON.stringify(param));
    if(url.indexOf("&") != -1){
        url=url.replace('&', '%26');
    }
    if(url.indexOf("#") != -1){
        url=url.replace('#', '%23');
    }

    $.post(rootPath+url,function (result){
            var errArr = result.data.mes;
            if(result.code == 0){//访问成功
                if(errArr.length != 0){
                    var text="";
                    for(var i = 0 ; i < errArr.length; i++){
                        text += "<li>"+errArr[i]+"</li>";
                    }
                    $(".errorMes").html(text);
                    errorJqueryConfirm(text);
                    return false;
                }else{
                    modalAjaxDone(result);
                }
            }else{
                _warnTipsFun("保存失败");
            }

    });
}

/**
 * 商品状态 渲染
 * @param value
 * @param row
 * @param index
 */
function renderGoodsStatus(value, row, index){
    return '上架';
}




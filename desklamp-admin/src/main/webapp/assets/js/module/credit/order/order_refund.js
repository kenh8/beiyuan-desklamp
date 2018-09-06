

//提交物流信息
function  submitlogistics() {

    var reason = $("#reason").val()
    if (reason == null || reason == '' || reason == "undefined"){
        errorJqueryConfirm("请填写原因！！！");
        return false;
    }

    var orderSn=$("#orderSn").val(); //订单编号
    var reason=$("#reason").val(); //订单编号
    var param = {
        'orderSn': orderSn,
        'reason':reason
    };
    $.ajax({
        type: 'POST',
        url: rootPath + '/credit/order/saveRefund?callbackMethod=refreshTable',
        data: param,
        cache: false,
        dataType: 'json',
        success: function (data) {
            if (data.code == 0) {
                _successTipsFun('添加成功！');
                wrapperHideModal("base_modal");
                returnToListPage(rootPath + '/credit/order/list');
            }else{
                errorJqueryConfirm(data.msg);
                return false;
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest.status);//状态码
            console.log(XMLHttpRequest.readyState);//状态
            console.log(textStatus);//错误信息
        }
    });
}


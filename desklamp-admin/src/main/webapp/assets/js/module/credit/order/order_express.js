/**
 * Created by mikejiang on 2017/5/25.
 */
$(function () {
    getDelivery();
    $("#merchantName").select2({
        placeholder: '请选择快递'
    }).height(32);
});

function getDelivery() {
    $.ajax({
        type: "get",
        url: rootPath + "/credit/order/getLogistics",
        cache: false,
        dataType: "json",
        success: function (res) {
            if (res.code == 0) {
                var htmlTxt = "";
                if (res != null) {
                    var arr = res.data;
                    for (var i = 0; i < arr.length; i++) {
                        htmlTxt += "<option value='" + arr[i].code + "'>" + arr[i].name + "</option>";
                    }
                }
                $("#optionOne").after(htmlTxt);
            } else {
                /*  alert('筛选失败！');*/
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("服务器异常");
        }
    });
}

//提交物流信息
function submitlogistics() {
    var orderSn = $("#orderNum").val(); //订单编号
    var deliveryCode = $("#deliveryCode").val(); //快递编码
    var deliveryCorp = $("#deliveryCode").find("option:selected").text(); //快递名称
    var trackingNo = $("#trackingNo").val(); //快递订单号
    var param = {
        'orderSn': orderSn,
        'deliveryCode': deliveryCode,
        'deliveryCorp': deliveryCorp,
        'trackingNo': trackingNo
    };
    $.ajax({
        type: 'POST',
        url: rootPath + '/credit/order/saveShipping?callbackMethod=refreshTable',
        data: param,
        cache: false,
        dataType: 'json',
        success: function (data) {
            if (data.code == 0) {
                _successTipsFun('添加成功！');
                wrapperHideModal("base_modal");
                returnToListPage(rootPath + '/credit/order/list');
            } else {
                errorJqueryConfirm(data.msg);
                return false;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest.status);//状态码
            console.log(XMLHttpRequest.readyState);//状态
            console.log(textStatus);//错误信息
        }
    });
}


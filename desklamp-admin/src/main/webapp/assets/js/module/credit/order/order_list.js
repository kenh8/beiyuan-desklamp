/**
 * Created by mikejiang on 2017/5/25.
 */
/**
 * 订单列表
 */

$(document).ready(function () {
    $(".select2").select2({});
    /**
     * 选项页
     * @type {jQuery}
     */
    $("#DAI_FA_HUO_TABLE").bootstrapTable();
    $("#DAI_SHOU_HUO_TABLE").hide();
    $("#JIAO_YI_SUCCESS_TABLE").hide();
    $("#TUI_KUAN_Z_TABLE").hide();
    $("#YI_TUI_KUAN_TABLE").hide();
    $("#JIAO_YI_CLOSE_TABLE").hide();


    $(".nav-tabs a").bind("click", function () {
        $(".nav-tabs a,li").removeClass("active");
        $(this).addClass("active").parent().addClass("active");
        var _key = $(this).parent().attr("key");
        $("#type").val(_key);
        switchTable(_key);
    });

    /**
     * 时间
     */
    $("#startTime").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change', function (ev) {
        var startTime = $('#startTime').val();
        $("#endTime").datetimepicker('setStartDate', startTime);
        $("#startTime").datetimepicker('hide');
    });
    $("#endTime").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change', function (ev) {
        var endTime = $("#endTime").val();
        $("#startTime").datetimepicker('setEndDate', endTime);
        $("#endTime").datetimepicker('hide');
    });
});
/**
 * 查询按钮
 */
function selectData() {
    var type = $("#type").val();
    if (type == "DAI_SHOU_HUO") {
        $(".nav-tabs a:eq(1)").click();
    } else if (type == "JIAO_YI_SUCCESS") {
        $(".nav-tabs a:eq(2)").click();
    } else if (type == "TUI_KUAN_Z") {
        $(".nav-tabs a:eq(3)").click();
    } else if (type == "YI_TUI_KUAN") {
        $(".nav-tabs a:eq(4)").click();
    } else if (type == "JIAO_YI_CLOSE") {
        $(".nav-tabs a:eq(5)").click();
    } else {
        $(".nav-tabs a:eq(0)").click();
    }
    //
}

/**
 * 操作栏
 * @param value
 * @param row
 * @param index
 * @returns {*}
 */

function operateRender2(value, row, index) {
    var action = '';

    if (row.orderStatus == 1) {
        action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/order/express?orderNumber=' + row.orderNumber + '"  class="view-link">填写物流信息</a>';

        if (row.goodsType == 1) {
            action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/order/refundOrder?orderNumber=' + row.orderNumber + '"  class="view-link">退款</a>';
        }
        action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/order/address?orderNumber=' + row.orderNumber + '"  class="view-link">提取收货地址</a>';
    }

    if ((row.orderStatus == 2 || row.orderStatus == 3) && row.goodsType == 1 ) {
        action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/order/refundOrder?orderNumber=' + row.orderNumber + '"  class="view-link">退款</a>';
    }

    if (row.orderStatus == 4 && $("#orderUpdateOrderStatus").length>0) {
        //action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/order/updateOrderStatus?goodsId=' + row.goodsId + '&orderNumber=' + row.orderNumber + '\')" class="view-link">退款</a>';
        action += ' <a href="javascript:void(0);" onclick="ajaxDelReturn(\'' + row.goodsId + '\',\'' + row.orderNumber + '\')" class="view-link">退款</a>';
    }

    return _commonDropDownLink(action);
}


function ajaxDelReturn(goodsId,orderNumber){
    $.confirm({
        title: '操作提示',
        content:  '确认执行该操作吗?',
        useBootstrap: false,
        boxWidth: '420px',
        theme: 'material',
        type: 'orange',
        icon: 'md md-warning',
        buttons: {
            sureBtn: {
                text: '确定',
                action: function(){
                    try{
                        $.ajax({
                            type: 'Post',
                            url: rootPath + '/credit/order/updateOrderStatus',
                            cache: false,
                            data:{
                                goodsId:goodsId,
                                orderNumber:orderNumber
                            },
                            dataType: 'json',
                            success: function (resp) {
                                var result = resp.code;
                                if(result == 0){
                                    selectData();
                                }else{
                                    errorJqueryConfirm(resp.msg);
                                }
                            },
                            error : function(response){
                                errorJqueryConfirm("操作异常!");
                            }
                        });
                    }catch(e){
                        console.log(e);
                    }
                }
            },
            closeBtn: {
                text: '取消',
            }
        }
    });
}

function logisticFormatter(value, row, index) {

    if (row.orderStatus == 2) {
        return "待收货";
    } else if (row.orderStatus == 3) {
        return "已签收";
    }
}
function logisticStatusFormatter(value, row, index) {
    if (row.logisticState == 2) {
        return "在途中";
    } else if (row.logisticState == 3) {
        return "已签收";
    }
}

function invoiceFormatter(value, row, index) {
    if (row.invoiceType == 1) {
        return "个人";
    } else if (row.invoiceType == 2) {
        return "公司";
    }
}
function refundFormatter(value, row, index) {

    if (row.orderStatus == 4) {
        return '退款中';
    } else if (row.orderStatus == 5) {
        return '已退款';
    }
}
function parseInvoice(value, row, index) {
    return row.invoiceOrNot == false ? '否' : '是';
}

function switchTable(key) {
    var _table = $("#" + key + "_TABLE");
    $(".bootstrap-table").hide();
    _table.parents(".bootstrap-table").show();
    //刷新数据
    var _form = $("#paramForm");
    var _param = _form.serialize();
    var baseUrl = _table.attr("data-url");

    if (baseUrl.indexOf("?") == -1) {
        baseUrl += "?" + _param;
    } else {
        baseUrl += "&" + _param;
    }
    var urlJson = {};
    urlJson.url = baseUrl;
    if ((_table).parents(".bootstrap-table").length > 0) {
        _table.bootstrapTable('refresh', urlJson);
    } else {
        _table.bootstrapTable(urlJson);
    }
    if ((_table.is(":hidden"))) {
        _table.show();
    }
}

function deliveryDateRender(value, row, index) {
    return row.goodsType == 1 ? defaultDateFormatter(row.deliveryDate) : defaultDateFormatter(row.payTime);
}


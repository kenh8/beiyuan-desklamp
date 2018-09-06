$(document).ready(function () {
    $("#ALREADY_COMMIT_TABLE").bootstrapTable();
    $("#ALREADY_REVOKE_TABLE").hide();
    $("#ALREADY_REFUND_TABLE").hide();
    $("#ALREADY_PARE_TABLE").hide();
    $(".nav-tabs a").bind("click", function () {
        $(".nav-tabs a,li").removeClass("active");
        $(this).addClass("active").parent().addClass("active");
        var _key = $(this).parent().attr("key");
        $("#type").val(_key);
        switchTable(_key);
    });
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


function selectData() {
    var type = $("#type").val();
    if (type == "ALREADY_COMMIT") {
        $(".nav-tabs a:eq(0)").click();
    } else if (type == "ALREADY_REVOKE") {
        $(".nav-tabs a:eq(1)").click();
    } else if (type == "ALREADY_REFUND") {
        $(".nav-tabs a:eq(2)").click();
    } else if (type == "ALREADY_PARE") {
        $(".nav-tabs a:eq(3)").click();
    } else {
        $(".nav-tabs a:eq(0)").click();
    }
    //
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
function operateRender(value, row, index) {
    var product_type = $("#product").val();
    var _option = _bootStrapOptions("vipRefundTableId");
    var action = '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/refund/seeDetailsOperation?tradeNo=' + row.tradeNo + '&type=' + product_type + '&refundNo=' + row.refundNo + '"  class="view-link">查看详细信息</a>';
    return _commonDropDownLink(action);
}
function clickEmpty() {
    $('form')[0].reset();
    selectData();
}
function fenzyuan(value, row, index) {
    var _drop = $("<span>" + Fen2Yuan(value) + "</span>");
    return _drop.prop("outerHTML");
}
function Fen2Yuan(num) {
    if (typeof num !== "number" || isNaN(num)) return null;
    return ( num / 100 ).toFixed(2);
}

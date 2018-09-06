$(document).ready(function(){

    $("#startTime").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change',function(ev){
        var startTime = $('#startTime').val();
        $("#endTime").datetimepicker('setStartDate',startTime);
        $("#startTime").datetimepicker('hide');
    });
    $("#endTime").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        language: 'zh-CN',//显示中文
        todayBtn: true,
        minuteStep: 10
    }).on('change',function(ev){
        var endTime = $("#endTime").val();
        $("#startTime").datetimepicker('setEndDate',endTime);
        $("#endTime").datetimepicker('hide');
    });
});

/**
 * 使用状态 渲染
 * @param value
 * @param row
 * @param index
 */
function useStatusRender(value, row, index){

    if(value == 1){
        return '未使用';
    }
    if(value == 2){
        return '已使用';
    }
}

/**
 * 兑换码状态 渲染
 * @param value
 * @param row
 * @param index
 */
function redeemCodeStatusRender(value, row, index){
    var result='';
    switch (value){
        case 0:result='出库';break;
        case 1:result='占用';break;
        case 2:result='有效';break;
        case 3:result='无效';break;
        case 4:result='兑换未销库';break;
        case 5:result='兑换且销库';break;
        default:result;break;
    }
    return result;


}


/**
 * 0表示未流向别的地方,1表示流向积分商城,2,表示流向抽奖)
 * @param value
 * @param row
 * @param index
 */
function flowToRender(value, row, index){
    var result='';
    var flowTo=row.flowTo;
    switch (parseInt(flowTo)){
        case 1:result='积分商城';break;
        case 2:result='流向抽奖';break;
        default:result;break;
    }
    return result;


}
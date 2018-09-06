$(document).ready(function(){
    $(".select2").select2({

    });


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
 * 客户端 渲染
 * @param value
 * @param row
 * @param index
 */
function renderClientId(value, row, index){
    if(value == 1){
        return '盒子端';
    }else if(value == 2){
        return '手机端';
    }else if(value == 3){
        return 'PC端';
    }
}

/**
 * 策略类型 渲染
 * @param value
 * @param row
 * @param index
 */
function orderTypeRender(value, row, index){
    if(value == 1){
        return '消费';
    }else if(value == 2){
        return '退单';
    }else if(value == 3){
        return '到期';
    }
}

/**
 * 积分类型 渲染
 * @param value
 * @param row
 * @param index
 */
function integralTypeRender(value, row, index){
    if(value == 1){
        return '发放';
    }else if(value == 2){
        return '扣除';
    }else if(value == 3){
        return '现金抵扣';
    }
}

/**
 * 积分来源 渲染
 * @param value
 * @param row
 * @param index
 */
function integralSourceRender(value, row, index){
    if(value == 1){
        return '家视天下';
    }else if(value == 2){
        return '其他';
    }
}
/**
 * 积分金额
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
function integralMoneyRender(value, row, index) {
    return row.integralExchange==null?'-':(row.integralNum/row.integralExchange).toFixed(2);
}
/**
function defaultDateFormatter(value, row, index) {
    var createTime = row.createTime;
    if(createTime == undefined){//没有值 不显示
        return '';
    }
    var d = new Date(createTime);

    var month;
    var date;
    var hours;
    var minutes;
    var seconds;

    if ((d.getMonth() + 1) < 10 ) {
        month = "0" + (d.getMonth()+1);
    } else
        month = d.getMonth()+1;

    if (d.getDate() < 10 ) {
        date = "0" + d.getDate();
    } else
        date = d.getDate();

    if (d.getHours() < 10 ) {
        hours = "0" + d.getHours();
    } else
        hours = d.getHours();

    if (d.getMinutes() < 10 ) {
        minutes = "0" + d.getMinutes();
    } else
        minutes = d.getMinutes();

    if (d.getSeconds() < 10 ) {
        seconds = "0" + d.getSeconds();
    } else
        seconds = d.getSeconds();


    var formatdate= d.getFullYear()+"-"+(month)+"-"+date+" "+hours+":"+minutes+":"+seconds;
    return formatdate;
}
*/
function exportOrders(){

    var params=$("#paramForm").serialize();
    console.log(params);

    //执行查询导出
    var submitUrl=rootPath+"/credit/integralOrder/export?"+params;
    $("#commonExportForm").attr("action",submitUrl);
    //将查询表单中的查询条件赋值到表格中
    $("#commonExportForm").submit();
}

function sureExport() {
    var msg = "确定要导出文件么？";
    wrapperConfirmFun("exportOrders",msg);
}

/**
 * 导出订单数据
 */
function exportExcel() {
    //***********************导出excel时，可以先查询后再导出匹配记录*********************************
   /* var msg = "确定要导出文件么？";
    wrapperConfirmFun(msg);*/
   /* if (wrapperConfirmFun(msg)==true) {*/
        var integralOrderId = $('#searchIntegralOrderId').val();
        var businessOrderId = $('#searchBusinessOrderId').val();
        var unionId = $('#searchUnionId').val();
        var integralStrategyName = $('#searchIntegralStrategyName').val();
        var clientId = $('#searchClientId').val();
        var orderType = $('#searchOrderType').val();
        var integralSource = $('#searchIntegralSource').val();
        var startTime = $('#startTime').val();
        var endTime = $('#endTime').val();
        /*if(unionId == ''){
         unionId = -1;
         }
         if(clientId == ''){
         clientId = -1;
         }
         if(orderType == ''){
         orderType = -1;
         }*/
        if (startTime != null && startTime != '') {
            startTime = new Date(Date.parse(startTime.replace(/-/g, "/")))
        } else {
            startTime = new Object();
        }
        if (endTime != null && endTime != '') {
            endTime = new Date(Date.parse(endTime.replace(/-/g, "/")))
        } else {
            endTime = new Object();
        }
        if (startTime > endTime) {
            alert("开始时间应该大于结束时间！！")
            return;
        }
        var paramData = {
            "integralOrderId": integralOrderId,
            "businessOrderId": businessOrderId,
            "integralStrategyName": integralStrategyName,
            "unionId": unionId,
            "clientId": clientId,
            "orderType": orderType,
            "integralSource": integralSource,
            "startTime": startTime,
            "endTime": endTime,
            "page": -1   //导出功能不能启用分页信息
        };
        $.ajax({
            type: 'post',
            url: rootPath + "/credit/integralOrder/export",
            data: paramData,
            dataType: 'json',
            async: false,
            success: function (res) {
                console.log(res);
                orderList = res.rows;
                var mgs="文件的导出路径为"+res.msg;
                _successTipsFun(mgs,20000);
            //   wrapperConfirmFun(undefined,mgs);
               // confirm(mgs);
            }
        });
        //获取所有选中的列进行导出
        //**************************所选择列导出**********************************
        // $('input[type="checkbox"]:checked').each(function () {
        //     // alert($(this).attr('data-field')+$(this).parent('label').text());
        //     var tempParam = "'"+$(this).attr('data-field')+"':'"+$(this).parent('label').text()+"',";
        //     exportColume+=tempParam;
        // });
        //传入什么字段就会导出什么字段
        //格式 === 》 字段名:自定义导出的列名称
        //组装需要导出的头信息
        // var header = "{"+exportColume.substring(0,exportColume.length-1)+"}";
        /* var header ={
         "id":"序号ID",
         "integralOrderId":"积分订单号",
         "businessOrderId":"业务订单号",
         "clientId":"客户端",
         "integralStrategyName":"策略名称",
         "orderType":"订单类型",
         "integralType":"积分类型",
         "integralNum":"积分数量",
         "integralForYuan":"金额",
         "integralSource":"积分来源",
         "businessId":"业务系统id",
         "integralExchange":"当时积分兑换汇率(积分)",
         "integralExchangeCash":"当时积分兑换汇率(元)",
         "integralReleaseTime":"积分发放时间",
         "goodsOrderId":"商品订单号",
         "price":"商品价格（分）",
         "isSuccessed":"发放或者扣除积分标识（0未成功，1成功）",
         "integralFailureTime":"积分失效时间",
         "ifIntegralFailure":"积分是否失效",
         "ifRelease":"积分是否发放",
         "integralStrategyId":"积分策略id",
         "unionId":"新用户唯一id",
         "userName":"用户名称",
         "goodsId":"商品id",
         "year":"积分可用年度",
         "createTime":"创建时间",
         "updateTime":"更新时间"
         }
         var dataParam = {
         "data":orderList,//需要导出的数据
         "excelFileNamePath":"e:/"+"Data_"+getNowDateForExport()+".xls",//文件导出的位置
         "header":header//设置导出excel的头
         };
         $.ajax({
         type: 'post',
         contentType:'application/json; charset=utf-8',
         url: ctx + "/exportExcel/exportIntegralOrder",
         data:JSON.stringify(dataParam),
         dataType: 'json',
         async: false,
         success: function (data) {
         switch (data.code){
         case 500:alert("系统错误");break;
         case 503:alert("文件不存在或者文件处于打开状态");break;
         case 200:alert("导出成功至"+dataParam.excelFileNamePath);break;
         }
         }
         });
         }else{
         return false;
         }*/
   // }
}


/**
 * 获取当前时间（由于冒号不能作为文件名中的字符，所以改成了下划线）
 * @returns {string}
 */
function getNowDateForExport() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = "_";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + "_" + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}

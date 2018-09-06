$(document).ready(function () {
    changePrice();
});

function changePrice() {
    getMerchant();
    var nowRate=$("#nowRate").val();
    var settlementBasisId = $('#settlementBasisId').val();
    var exchangeIntegral = $('#goodsExchangeIntegral').val();
    var goodsExchangeIntegral =0;//积分对应的价值
    if(null!=exchangeIntegral&&exchangeIntegral!=""&&exchangeIntegral!=undefined){
        goodsExchangeIntegral = parseFloat(exchangeIntegral);
        if(nowRate!=null&&nowRate!=0){
            goodsExchangeIntegral = parseFloat(exchangeIntegral/nowRate)<0.01&&parseFloat(exchangeIntegral/nowRate)>0?0.01:parseFloat(exchangeIntegral/nowRate);
            goodsExchangeIntegral=goodsExchangeIntegral.toFixed(2);
        }
    }
    var goodsPrice =0;
    var dsPrice = $('#goodsPrice').val();
    if(null!=dsPrice&&dsPrice!=""&&dsPrice!=undefined){
        goodsPrice = parseFloat(dsPrice);
    }

    var bfreight=$("#freight").val();
    var freight=0;
    if(null!=bfreight&&bfreight!=""&&bfreight!=undefined){
        freight = parseFloat(bfreight);
    }
    var finalresult=parseFloat(goodsExchangeIntegral) +parseFloat(goodsPrice)  + parseFloat(freight);
    console.log(freight);
    if (settlementBasisId == 1) {//自拟结算价  自拟价即为自定结算价（成本价）
        $('#orginalPrice').val(goodsPrice);
        $('#orginalPrice').val(finalresult.toFixed(2));//自拟价格默认为运非+商品价格+积分价值
        $('#orginalPrice').removeAttr("readonly");//选择原价时不显示
        /* $('#orginalPrice').val(goodsPrice);*/
    } else if (settlementBasisId == 2) {//原价值 计算方式积分价值+现金+运费
        $('#orginalPrice').val(goodsExchangeIntegral + goodsPrice + freight);
        $('#orginalPrice').val(finalresult.toFixed(2));
        $('#orginalPrice').prop("readonly","readonly");//选择原价时不显示
    }else {
        $("#settlementBasisId").val(1);
        $('#orginalPrice').val(goodsPrice);
        $('#orginalPrice').val(finalresult.toFixed(2));
    }
}


/*
function changePrice() {
    debugger;
    var settlementBasisId = $('#settlementBasisId').val();
    var exchangeIntegral = $('#goodsExchangeIntegral').val();
    var goodsExchangeIntegral =0;
    if(null!=exchangeIntegral&&exchangeIntegral!=""&&exchangeIntegral!=undefined){
        goodsExchangeIntegral = parseFloat(exchangeIntegral);
    }

    console.log($('#goodsExchangeIntegral').val());
    var goodsPrice =0;
    var dsPrice = $('#goodsPrice').val();
    if(null!=dsPrice&&dsPrice!=""&&dsPrice!=undefined){
        goodsPrice = parseFloat(dsPrice);
    }
    console.log(goodsPrice);
    var freight =0;
    var bfreight = $('#freight').val();
    if(null!=bfreight&&bfreight!=""&&bfreight!=undefined){
        freight = parseFloat(bfreight);
    }
    console.log(freight);
    if (settlementBasisId == 1) {//自拟结算价  自拟价即为自定结算价（成本价）
        $('#orginalPrice').val(goodsPrice);
    } else if (settlementBasisId == 2) {//原价值 计算方式积分价值+现金+运费
        $('#orginalPrice').val(goodsExchangeIntegral + goodsPrice + freight);
    }else {
        $("#settlementBasisId").val(1);
        $('#orginalPrice').val(goodsPrice);
    }
}*/

function saveData() {

    var  goodsStatus  = $("#isApprove option:selected").val();

    var goodsAuditDescription=$("#goodsAuditDescription").val();
    if (goodsAuditDescription == null || goodsAuditDescription == undefined || goodsAuditDescription == "") {
        warnJqueryConfirm("请填写审核原因！");
        return false;
    }


    var dto = $("#approveUpForm").serializeArray();

    dto.push({"name":"goodsStatus","value":goodsStatus});
    $.ajax({
        type : 'POST',
        url : rootPath+'/credit/goods/saveData',
        data : dto,
        cache : false,
        dataType:'json',
        success : function(resp){
            modalAjaxDone(resp);
        },
        error : function(response){
            btnSwitchStatus('able');
            console.log(response);
        }
    });
    return false;
}

/**
 * 完成
 */
function finishBtnClick(){
    btnSwitchStatus('disable');
    $("#approveUpForm").submit();//提交表单
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
 * 获取商户信息
 */
function getMerchant() {
    $.ajax({
        type: "get",
        url: rootPath + "/credit/virCard/getMerchants",
        cache: false,
        data: {},
        dataType: "json",
        success: function (res) {
            if (res.code == 0) {
                var htmlTxt = "";
                var json = JSON.parse(res.msg);
                if(json != null){
                    var arr = json.result;
                    for (var i = 0; i < arr.length; i++) {
                        htmlTxt += "<option value='" + arr[i].partnerId + "'>" + arr[i].partnerName + "</option>";
                    }
                }
                $("#merchantName").html(htmlTxt);
            }
        }
    });
}
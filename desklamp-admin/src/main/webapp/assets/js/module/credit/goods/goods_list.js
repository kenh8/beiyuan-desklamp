/**
 * 商品列表
 * */
$(document).ready(function () {
    /* $(".searchBtn").trigger("click");*/
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
 * 商品类型 渲染
 * @param value
 * @param row
 * @param index
 */
function renderGoodsType(value, row, index) {
    if (value == 1) {
        return '实物';
    }
    if (value == 2 || value == 3) {
        return '虚拟';
    }
}

/**
 * 商品价格渲染
 * @param value
 * @param row
 * @param index
 */
function renderGoodsPrice(value, row, index) {
    var result = null;
    if (null != row.goodsPrice && "" != row.goodsPrice && undefined != row.goodsPrice) {
        result = row.goodsPrice + "元 ";
    }
    if (null == result) {
        if (null != row.goodsExchangeIntegral && "" != row.goodsExchangeIntegral && undefined != row.goodsExchangeIntegral) {
            result = row.goodsExchangeIntegral + "积分";
        }
    } else {
        if (null != row.goodsExchangeIntegral && "" != row.goodsExchangeIntegral && undefined != row.goodsExchangeIntegral) {
            result += "+" + row.goodsExchangeIntegral + "积分"
        }
    }

    return result;
}

var statusObj = {0: '待审核', 1: '审核中', 2: '已上架', 3: '审核未通过', 4: '已下架'};
function renderGoodsStatus(value, row, index) {
    return statusObj[value];
}

/**
 * 渲染操作栏
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
/*function renderGoodsStatus(value, row, index) {
 var _drop=$(_getFixedDropDowneditRow(row.goodsStatus));
 return _drop.prop("outerHTML");
 }
 function _getFixedDropDowneditRow(val){
 var _dropDown="<div class=\"btn-group\"><input type='text' value='"+val+"'></div>";
 return _dropDown;
 }*/

function operateRender(value, row, index) {
    var role = $("#role").val();
    var _option = _bootStrapOptions("goodsTableId");
    var action = '';
    /* if(index != 0){
     action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goods/moveData?id='+row.id+'&modifyType=up\')" class="view-link">上移</a>';
     action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goods/moveData?id='+row.id+'&modifyType=top\')" class="view-link">置顶</a>';
     }
     if(index != _option.listSize-1){
     action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goods/moveData?id='+row.id+'&modifyType=down\')" class="view-link">下移</a>';
     action+=' <a href="javascript:void(0);" onclick="adjustmentSort(\''+rootPath+'/credit/goods/moveData?id='+row.id+'&modifyType=tbo\')" class="view-link">置底</a>';
     }*/
    action += '<a data-target="divload" data-div="baseContainer" href="' + rootPath + '/credit/goods/check?id=' + row.id + '"  class="view-link">查看</a>';
    //未提交审核
    if (row.goodsStatus == 0 || row.goodsStatus == 3) {
        action += '<a data-target="divload" data-div="baseContainer" href="' + rootPath + '/credit/goods/edit?id=' + row.id + '"  class="view-link">编辑</a>';
        action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/goods/submitApprove?id=' + row.id + '&modifyType=submitApprove&callbackMethod=refreshTable\')" class="view-link">上架</a>';
        if (row.goodsStatus == 0) {
            action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/goods/delete?id=' + row.id + '\')" class="view-link">删除</a>';
        }
    }
    if (row.goodsStatus == 1&&$("#goodsApprovePermission").length>0) {
        action += ' <a data-toggle="modal"' +
            ' data-target="#base_modal" href="' + rootPath + '/credit/goods/approve?id=' + row.id + '&modifyType=approve&callbackMethod=refreshTable\" class="view-link">审核</a>';
    }
    if (row.goodsStatus == 2) {
        action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/goods/offMarket?id=' + row.id + '&modifyType=offMarket&callbackMethod=refreshTable\')" class="view-link">下架</a>';
    }
    //已下架
    if (row.goodsStatus == 4) {
        action += '<a data-target="divload" data-div="baseContainer" href="' + rootPath + '/credit/goods/edit?id=' + row.id + '"  class="view-link">编辑</a>';
        action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/goods/submitApprove?id=' + row.id + '&modifyType=submitApprove&callbackMethod=refreshTable\')" class="view-link">上架</a>';
    }
    action += ' <a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/goods/stock?id=' + row.id + '" class="view-link">库存管理</a>';
    action += '<a data-target="divload" data-div="baseContainer" href="' + rootPath + '/credit/goodsDetail/list?goodsId=' + row.id + '"  class="view-link">详情图片管理</a>';
    return _commonDropDownLink(action);
}
function adjustmentSort(url) {
    $.ajax({
        type: 'POST',
        url: url,
        cache: false,
        dataType: 'json',
        success: function (resObj) {
            if (resObj.code == "0") {
                sortClick();
                successJqueryConfirm(resObj.msg);
            } else {
                sortClick();
                errorJqueryConfirm(resObj.msg)
            }
        },
        error: function (response) {
            errorJqueryConfirm(response.msg);
            sortClick();
        }
    });
}

function goodsShelfTimeFormatter(value, row, index) {
    if (row.goodsStatus == 2) {
        return defaultDateFormatter(row.goodsShelfTime);
    }
}
function renderReason(value, row, index) {
    if (row.goodsStatus == 2 || row.goodsStatus == 3) {
        return row.goodsAuditDescription;
    }
}

function goodsNameRender(value, row, index) {
    return row.goodsName;
}

function goodsSubtitleRender(value, row, index) {
    return row.goodsSubtitle;
}

function renderGoodsStock(value, row, index) {
    if (row.goodsType==2){
        if (row.goodsVirtualStockDto!=null){
            return row.goodsVirtualStockDto.stock+row.goodsVirtualStockDto.lockStock;
        }else{
            return '0';
        }
    }else {
        return row.actualGoodsStockDto.stock+row.actualGoodsStockDto.lockStock;
    }
}

function sortClick() {
    $("#goodsTableId").bootstrapTable('refresh', "/credit/goods/listData");
}
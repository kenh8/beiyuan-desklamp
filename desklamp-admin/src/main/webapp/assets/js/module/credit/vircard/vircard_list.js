$(function () {
    getMerchant();
    $("#merchantId").select2({//merchantId
        placeholder: '请选择商家'
    }).height(32);
});

function getMerchant() {
    $.ajax({
        type: "get",
        url: rootPath + "/credit/virCard/getMerchants",
        cache: false,
        dataType: "json",
        success: function (res) {
            if (res.code == 0) {
                var htmlTxt = "";
                var arr = res.data;
                if (arr.length >0) {
                    for (var i = 0; i < arr.length; i++) {
                        htmlTxt += "<option value='" + arr[i].partnerId + "'>" + arr[i].partnerName + "</option>";
                    }
                }
                $("#optionOne").after(htmlTxt);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("服务器异常");
        }
    });
}
/**
 * 卡类型 渲染
 * @param value
 * @param row
 * @param index
 */
function renderVirCardType(value, row, index) {
    if (value == 1) {
        return '提货卡';
    }
    if (value == 2) {
        return '激活卡';
    }
    if (value == 3) {
        return '激活码';
    }
    if (value == 4) {
        return '储值卡';
    }
    if (value == 5) {
        return '礼品卡';
    }
}

/**
 * 售价
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
function renderMoney(value, row, index) {
    return value!=null?value+"元":"";

}


function operateRender(value, row, index) {
    var action = '';
    action += '<a data-target="divload" data-div="baseContainer" href="' + rootPath + '/credit/virCardStock/list?id=' + row.id + '"  class="view-link">查看库存</a>';
    action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/virCard/edit?id=' + row.id + '"  class="view-link">编辑</a>';
    if(row.isExpire==0){//'是否过期（1过期，0未过期）
        action += '<a data-target="divload" data-div="baseContainer" href="' + rootPath + '/credit/virCard/stockHandle?id=' + row.id + '"  class="view-link">库存操作</a>';
    }
    action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/virCard/delete?id=' + row.id + '&callbackMethod=refreshTable\')" class="view-link">删除</a>';
    return _commonDropDownLink(action);
}


/**
 * 增加虚拟卡是否过期判断函数  0未过期，1过期
 * @param value
 * @param row
 * @param index
 * @returns {*}
 */
function isExpireRender(value, row, index) {
    console.log("value");
    console.log(value);

        if (value == 0) {
            return '未过期';
        }else {
            return '已过期';
        }
}
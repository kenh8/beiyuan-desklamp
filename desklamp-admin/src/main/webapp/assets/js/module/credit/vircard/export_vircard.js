var flag = false;

$(function () {
    var cardId = $("input[name=id]").val();
    if (cardId != null | cardId != '' | cardId != undefined) {
        $.ajax({
            type: 'GET',
            url: rootPath + '/credit/virCard/getCanUseStock?cardId=' + cardId,
            data: '',
            cache: false,
            dataType: 'json',
            success: function (resObj) {
                $("#howR").attr("max", resObj.data);
                $("#maxExportNum").val(resObj.data);
            },
            error: function (response) {
                console.log(response);
            }
        });
    }
});

/**
 * 判断当前输入的值是否满足要求
 */
function judgeStock() {
    var cardId = $("input[name=id]").val();

    var stockNumber = $("#stockNumber").val();
    if (cardId != null | cardId != '' | cardId != undefined) {
        $.ajax({
            type: 'GET',
            url: rootPath + '/credit/virCard/getCanUseStock?cardId=' + cardId,
            data: '',
            cache: false,
            dataType: 'json',
            success: function (resObj) {
                $("#maxExportNum").val(resObj.data);
                if (resObj.data < stockNumber) {
                    _errorTipsFun("当前最大的可出库数为:" + resObj.data);//提示错误信息
                    $("#howR").attr("max", resObj.data);
                } else {
                    flag = true;
                }
            },
            error: function (response) {
                console.log(response);

            }
        });
    }
}
function showVal(newVal) {
    $("#stockNumber").val(newVal);
}

/**
 * 保存信息
 * @returns {boolean}
 */
function exportVirCard() {
    var maxExportNum = $("#maxExportNum").val();
    var stockNumber = $("#stockNumber").val();
    if (parseInt(stockNumber) <= parseInt(maxExportNum)) {
        finishBtnClick();
        $.ajax({
            type: 'POST',
            url: rootPath + '/credit/virCard/exportVirtualCard',
            data: $('#exportVircard').serializeArray(),
            cache: false,
            dataType: 'json',
            success: function (resObj) {
                if (resObj.code == 0) {
                    //保存成功 跳转至 列表页
                    _successTipsFun("添加成功");
                    wrapperHideModal("base_modal");
                    returnToListPage(rootPath + '/credit/virCard/list');
                    $("input[type=text]").val(" ");
                } else {
                    btnSwitchStatus('able');
                    _errorTipsFun("添加失败");//提示错误信息
                }
            },
            error: function (response) {
                btnSwitchStatus('able');
                console.log(response);
            }
        });

    } else {
        _errorTipsFun("请核对出库数!");
    }
    flag = false;
}

/**
 * 完成
 */
function finishBtnClick() {
    btnSwitchStatus('disable');
}

/**
 * 保存按钮切换启用禁用
 */
function btnSwitchStatus(type) {
    if (type == 'disable') {
        // $(".btn-group a:eq(0)").unbind("click").text("保存中...");
        $("button[type=button] ").unbind("click").text("保存中...");
    } else if (type == 'able') {
        /* $(".btn-group a:eq(0)").bind("click",function(){
         finishBtnClick();
         }).text("保存");*/
        $("button[type=button]").bind("click", function () {
            finishBtnClick();
        }).text("保存");
    }
}
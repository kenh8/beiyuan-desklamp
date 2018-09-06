/**
 * 策略规则
 * @param value
 * @param row
 * @param index
 */
function renderStrategyRule(value, row, index) {
    var str = '';
    str += '<p>' + row.strategyRuleYuan / 100 + '元=' + row.strategyRuleIntegrals + '积分' + '</p>';
    return str;
}

/**
 * 选择业务
 * @param value
 * @param row
 * @param index
 */
function renderBusinessType(value, row, index) {
    var result = '';
    if (value.indexOf(1) != -1) {
        result = '会员购买，';
    }
    if (value.indexOf(2) != -1) {
        result = result + '积分商城，';
    }
    if (value.indexOf(3) != -1) {
        result = result + '商品包，';
    }
    if (value.indexOf(4) != -1) {
        result = result + '大麦商城，';
    }
    if (value.indexOf(5) != -1) {
        result = result + '充值，';
    }
    if (value.indexOf(6) != -1) {
        result = result + '极清，';
    }
    if (value.indexOf(7) != -1) {
        result = result + '应用，';
    }
    return result.substring(0, result.length - 1);
}

/**
 * 客户端
 * @param value
 * @param row
 * @param index
 */
function renderClientType(value, row, index) {
    value = value.toString();
    var result = '';
    if (value.indexOf(1) != -1) {
        result = '盒子端，';
    }
    if (value.indexOf(2) != -1) {
        result = result + '移动端，';
    }
    if (value.indexOf(3) != -1) {
        result = result + 'PC端，';
    }
    return result.substring(0, result.length - 1);
}

/**
 * 策略状态
 * @param value
 * @param row
 * @param index
 */
function renderEffectiveType(value, row, index) {
    if (value == 1) {
        return '有效';
    } else {
        return '无效';
    }
}
function operateRender(value, row, index) {
    var action = '';
    action += '<a data-toggle="modal" data-target="#base_modal" href="' + rootPath + '/credit/integralStrategy/edit?strategyId=' + row.strategyId + '"  class="view-link">编辑</a>';
    // action+='<a data-toggle="modal" data-target="#base_modal" href="'+rootPath+'/credit/integralStrategy/listDetail?strategyId='+row.strategyId+'"  class="view-link">关联内容</a>';
    if (row.ifEffective != 1) {
        action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/integralStrategy/delete?strategyId=' + row.strategyId + '\')" class="view-link">删除</a>';
    }
    return _commonDropDownLink(action);
}

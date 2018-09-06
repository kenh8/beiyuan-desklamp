

/**
 * 策略规则
 * @param value
 * @param row
 * @param index
 */
function renderStrategyRule(value, row, index){
    var str = '';
    str += '<p>' + row.strategyRuleYuan/100+'元='+row.strategyRuleIntegral+'积分' + '</p>';
    return str;
}
/**
 * 客户端
 * @param value
 * @param row
 * @param index
 */
function renderClientType(value, row, index){
    if(value == 1){
        return '盒子端';
    }else if(value == 2){
        return '移动端';
    }else{
        return 'PC端';
    }
}

/**
 * 策略状态
 * @param value
 * @param row
 * @param index
 */
function renderEffectiveType(value, row, index){
    if(value == 1){
        return '有效';
    }else{
        return '无效';
    }
}
function operateRender(value, row, index){
    var action='';
    action+='<a data-toggle="modal" data-target="#base_modal" href="'+rootPath+'/credit/damaiStrategy/edit?integralStrategyId='+row.integralStrategyId+'"  class="view-link">编辑</a>';
    action+='<a data-target="divload" data-div="baseContainer" href="'+rootPath+'/credit/product/list?integralStrategyId='+row.integralStrategyId+'"  class="view-link">关联内容</a>';
    if(row.isEffective != 1) {
        action += ' <a href="javascript:void(0);" onclick="ajaxDel(\'' + rootPath + '/credit/damaiStrategy/delete?integralStrategyId=' + row.integralStrategyId + '\')" class="view-link">删除</a>';
    }
    return _commonDropDownLink(action);
}

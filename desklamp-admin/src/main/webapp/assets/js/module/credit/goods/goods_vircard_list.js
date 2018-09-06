/**
 * <option value="1">提货卡</option>
 <option value="2">激活卡</option>
 <option value="3">激活码</option>
 <option value="4">储值卡</option>
 <option value="5">礼品卡</option>
 * 卡类型 渲染
 * @param value
 * @param row
 * @param index
 */
function renderVirCardType(value, row, index){
    if(value == 1){
        return '提货卡';
    }
    if(value == 2){
        return '激活卡';
    }
    if(value == 3){
        return '激活码';
    }
    if(value == 4){
        return '储值卡';
    }
    if(value == 5){
        return '礼品卡';
    }
}

function operateRender(value, row, index){
    var url=encodeURI(rootPath+'/credit/goods/vircardAdd?id='+row.id+'&ext='+row.virtualCardName+'&price='+row.price+'&freightPrice='+row.freightPrice);
    var action='';
   /* action+='<a data-target="divload" data-div="baseContainer"  href="'+rootPath+'/credit/goods/vircardAdd?id='+row.id+'&ext='+row.virtualCardName+'&price='+row.price+'&freightPrice='+row.freightPrice+'"  class="view-link">选择</a>';*/
    action+='<a data-target="divload" data-div="baseContainer"  href="'+ url+'"  class="view-link">选择</a>';
    return _commonDropDownLink(action);
}

////通用 三级商品分类联动 插件



/**
 * 初始化商品三级分类 级联插件
 * @param tableId  对应参数form 的tableId
 * @param inputName 对应 级联变动值存放input 标签name
 */
function initCategoryChangePlugin(tableId,inputName){
    // Select2
    categoryChangePluginDom(undefined,tableId,inputName);
}

function categoryChangePluginDom(formId,tableId,inputName){
    var _curDom=getOperateDom(formId,tableId);
    _curDom.find(".category-one,.category-two,.category-three").select2({
    });
    _curDom.find(".category-one,.category-two").on("change",function(){
        var _this=$(this);
        categoryChangeFun(_this,formId,tableId).then(function(){
            currentCategoryValChange(_this,inputName,formId,tableId);
        });
    });

    _curDom.find(".category-three").on("change",function(){
        var _this=$(this);
        console.log(_this);
        currentCategoryValChange(_this,inputName,formId,tableId);
    });
    //加载一级类目信息
    loadCategoryCommon({grade:1},"category-one",formId,tableId);
}

/**
 * 获取操作 dom节点
 * @param formId
 * @param tableId
 */
function getOperateDom(formId,tableId){
    var _curDom;
    if(formId != undefined){
        _curDom=$("#"+formId);
    }else if(tableId != undefined){
        _curDom=$("form[tableId='"+tableId+"']");
    }
    return _curDom;
}

function loadCategoryCommon(paramObj,className,formId,tableId){
    var _curDom=getOperateDom(formId,tableId);
    var loadDfd=$.Deferred();
    var dfd=ajaxLoadCategory(paramObj);
    dfd.then(function(){
        var _selectData=getDefaultOption();
        $.each(dfd.resData,function(){
            _selectData.push({
                id: this.sn+';'+this.treePath,//冒号隔开 编码 ; 长编码
                text: this.name
            });
        });

        //渲染一级类目
        _curDom.find("."+className).empty().select2({
            data: _selectData
        });
        loadDfd.resolve();
    });
    return loadDfd;
}

/**
 * 获取 空状态 数据
 * @returns {[*]}
 */
function getDefaultOption(){
    var _selectData=[{id:' ',text:'全部'}];
    return _selectData;
}

/**
 *
 * @param obj
 */
function categoryChangeFun(obj,formId,tableId){
    var dfd=$.Deferred();
    if(obj.val() == null || obj.val().trim() == ''){
        //如果当前 选择了全部 选项 将下级 数据都置空
        clearNextData(obj,formId,tableId);
        dfd.resolve();
        return dfd;
    }
   // var _objSn=obj.val().split(";")[0];
    var _objSns=obj.val().split(";")[1].split(",");
    var _objSn=_objSns[_objSns.length-1];
    if(obj.hasClass("category-one")){//一级商品分类 change事件

        var paramObj={parentSn:_objSn};
        //渲染二级分类
        loadCategoryCommon(paramObj,"category-two",formId,tableId).then(function(){
            //清空三级分类
            $(".category-three").empty().select2({
                data: getDefaultOption()
            });
            dfd.resolve();
        });
    }

    if(obj.hasClass("category-two")){//二级商品分类 change事件
        var paramObj={parentSn:_objSn};
        //渲染三级分类
        loadCategoryCommon(paramObj,"category-three",formId,tableId).then(function(){
            dfd.resolve();
        });
    }
    return dfd;
}

/**
 * 置空下级数据
 * @param obj
 */
function clearNextData(obj,formId,tableId){
    var _curDom=getOperateDom(formId,tableId);
    if(obj.hasClass("category-one")) {//一级商品分类 change事件
        //清空二,三级分类
        _curDom.find(".category-two").empty().select2({
            data: getDefaultOption()
        });
        _curDom.find(".category-three").empty().select2({
            data: getDefaultOption()
        });
    }
    if(obj.hasClass("category-two")){
        _curDom.find(".category-three").empty().select2({
            data: getDefaultOption()
        });
    }
}

/**
 * 分类查询参数 赋值
 * @param obj
 * @param inputName 对应隐藏域input name 必须放到同一个form标签下
 */
function currentCategoryValChange(obj,inputName,formId,tableId){
    var _curForm=getOperateDom(formId,tableId);
    var _changeVal=changeCategoryValWrapper(obj,formId,tableId);
    if(null != _changeVal){
        if(_changeVal.indexOf(";") != -1){
           // var categoryVal=_changeVal.split(";")[0];
            var categoryVal=_changeVal.split(";")[1];
            _curForm.find("input[name='"+inputName+"']").val(categoryVal);
        }else{
            _curForm.find("input[name='"+inputName+"']").val(_changeVal);
        }
    }
}

/**
 * 获取 三级分类联动 数据变动 数据取值
 * @param obj
 */
function changeCategoryValWrapper(obj,formId,tableId){
   var _form=getOperateDom(formId,tableId);//获取当前操作的form 对象
    //以下是正常 选中 一个分类 情况
    if(obj.val() != null && obj.val().trim() != ''){
       return obj.val().trim();
    }

    //这里是选中 "全部" 情况
    if(obj.hasClass("category-three")){
       //选中 第三级 全部 则 取上一级的 值
        return _form.find(".category-two").val();
    }

    if(obj.hasClass("category-two")){
        //选中 第三级 全部 则 取上一级的 值
        return _form.find(".category-one").val();
    }

    // 如果选中第一级
    return '';
}

/**
 * 根据参数获取 商品类目数据
 * @param paramObj
 * @returns {*}
 */
function ajaxLoadCategory(paramObj){
    paramObj.pageIndex=1;
    paramObj.pageSize=1000;
    /*paramObj.pageIndex=1;
    paramObj.pageSize=1000;*/
    paramObj.isValid=1;
    paramObj.categoryType=0;
    var dfd=$.Deferred();
    $.post(rootPath+'/credit/product/getCategory',paramObj,
        function(resData){
        dfd.resData=resData;
        dfd.resolve();
    },'json');
    return dfd;
}
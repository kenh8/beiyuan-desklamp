/**
 * Created by leo on 2017/8/21.
 */
$(document).ready(function(){

    // Select2
    $("#changeCategoryForm").find(".category-one,.category-two,.category-three").select2({
    });
    initChangeCategoryInfo().then(function(){
        $("#changeCategoryForm").find(".category-one,.category-two").on("change",function(){
            categoryChangeFun($(this),"changeCategoryForm",undefined);
        });
    });

});

/**
 * 加载完 该商品原本的分类信息
 * @returns {*}
 */
function initChangeCategoryInfo(){
    var dfd=$.Deferred();
    //加载一级类目信息
    var loadDfd=loadCategoryCommon({grade:1},"category-one","changeCategoryForm",undefined);
    var category_arry=$("#changeCategoryForm").find("#categoryTreePath").val().split(",");
    if(category_arry.length == 3){
        //一级类目加载完 触发加载二级类目 事件
        loadDfd.then(function(){
            //一级类目赋值
            $("#changeCategoryForm").find("#categoryOne").val(category_arry[0]+";"+category_arry[0]).trigger("change");
            //触发二级分类 变更事件
            categoryChangeFun($("#changeCategoryForm").find(".category-one"),"changeCategoryForm").then(function(){
                $("#changeCategoryForm").find("#categoryTwo").val(category_arry[1]+";"+category_arry[0]+","+category_arry[1]).trigger("change");
                categoryChangeFun($("#changeCategoryForm").find(".category-two"),"changeCategoryForm").then(function(){
                    $("#changeCategoryForm").find("#categoryThree").val(category_arry[2]+";"+$("#changeCategoryForm").find("#categoryTreePath").val()).trigger("change");
                    dfd.resolve();
                });
            });
        });
    }
    return dfd;
}
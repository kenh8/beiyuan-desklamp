/**
 * Created by Administrator on 2017/7/13.
 */
var param ={};

/**
 * 搜索功能
 */
function search() {
    var operationName=$('#searchOperationName').val();
    var status=$("#searchOperationStatus").val();
    var operateType=$('#searchOperationType').val();
    initOperationTable(operationName,status,operateType) ;
}
/**
 *运营详情图片
 * @param id  运营id
 */
function toOperationDetail(id) {
    initDetailPicTable(id);//根据运营id显示运营详情图片
    $('#operateId').val(id);
    $('#operateDetailId').val('');
    //清空图片
    $('#url').empty();
    $('.pics > ul').empty();
    $('#add').show();
    $('#update').hide();
    $('#operationDetailaddModal').modal('show')
}

/**
 * 转到编辑运营详情图
 * @param id 运营详情的主键
 */
function toEditOperationDetail(id) {
    $('#views').empty();
    $('#views').siblings('div').empty();
    $('#operateDetailId').val(id);
    $.ajax({
        type:"get",
        url:rootPath + "/homePageOperationDetail/getOperationDetailById",
        async:false,
        data:{"id":id},
        dataType:"json",
        success:function (res) {
            $('#imageUrls').val(res.rows.url);
            var a = '<a href="'+res.rows.url+'" target="_blank"><img src="'+res.rows.url+'" width="80" height="50"></a>';
            $('#views').append(a)
        }
    });

    $('#add').hide();
    $('#update').show();
    $('#operationDetailaddModal').modal({backdrop: 'static', keyboard: false});
}


/**
 * 清空表单
 */
function clear_diaglog() {
    $('#operateId').val('');
    $('#operationDetailId').val('');
    $('#operationList').val('');
    $('#homePageOperationName').val('');
    $('#homePageOperationSubtitle').val('');
    //清空封面图片回显的内容
    // $("#update").empty();
    //8****************运营图片详情***********
    $('#imageUrls').val('');
    $('#operationDetailaddModal').modal('hide');
    //运营
    $('#addModal').modal('hide');
}

/**
 * 运营上移操作
 * @param id 当前记录的主键
 * @param seq 当前记录的顺序
 */
function moveUp(id,seq) {
    var content={
        'sequenceNumber':seq
    };
    $.ajax({
        type:"get",
        url:rootPath + "/homePageOperation/getMaxContent",
        async:false,
        data:content,
        dataType:"json",
        success:function (res) {
            if(seq == res.sequenceNumber ){
                alert("已经到第一个,不用上移");
                return;
            }else{
                var content1={
                    'id':id,
                    'sequenceNumber':res.sequenceNumber
                };
                var content2={
                    'id':res.id,
                    'sequenceNumber':seq
                };
                $.ajax({
                    type:"get",
                    url:ctx + "/homePageOperation/updateStatus",
                    async:false,
                    data:content1,
                    dataType:"json",
                    success:function (res) {
                        if (res.returnValue == 0) {
                            $.ajax({
                                type:"get",
                                url:ctx + "/homePageOperation/updateStatus",
                                async:false,
                                data:content2,
                                dataType:"json",
                                success:function (res) {
                                    if (res.returnValue == 0) {
                                        $("#operationList").bootstrapTable('refresh');
                                    } else {
                                        alert( '上移失败！');
                                    }
                                }
                            });
                        } else {
                            alert( '上移失败！');
                        }
                    }
                });
            }
        }
    });
}
/**
 * 运营下移操作
 * @param id
 * @param seq
 */
function moveDown(id,seq) {
    var content={
        'sequenceNumber':seq
    }
    $.post(rootPath + "/homePageOperation/getMinContent", content, function(data) {
        if(parseInt(seq) == data.sequenceNumber){
            alert("已经到最后一个,无法下移");
        }else {
            var content1={
                'id':id,
                'sequenceNumber':data.sequenceNumber
            };
            var content2={
                'id':data.id,
                'sequenceNumber':seq
            };
            $.post(ctx + "/homePageOperation/updateStatus", content1, function(data) {
                if (data.returnValue == 0) {
                    $.post(ctx + "/homePageOperation/updateStatus", content2, function(data) {
                        if (data.returnValue == 0) {
                            $("#operationList").bootstrapTable('refresh');
                        } else {
                            alert( '下移失败！');
                        }
                    }, "json");
                } else {
                    alert( '下移失败！');
                }
            }, "json");
        }
    }, "json");
}
/**
 * 运营详情上移操作
 * @param id 当前记录的主键
 * @param seq 当前记录的顺序
 */
function homePageOperationDetaileMoveUp(id,seq) {
    var content={
        'sequence':seq
    };
    $.ajax({
        type:"get",
        url:rootPath + "/homePageOperationDetail/getMaxContent",
        async:false,
        data:content,
        dataType:"json",
        success:function (res) {
            if(seq == res.sequence ){
                alert("已经到第一个,不用上移");
                return;
            }else{
                var content1={
                    'id':id,
                    'sequence':res.sequence
                };
                var content2={
                    'id':res.id,
                    'sequence':seq
                };
                $.ajax({
                    type:"get",
                    url:ctx + "/homePageOperationDetail/update",
                    async:false,
                    data:content1,
                    dataType:"json",
                    success:function (res) {
                        if (res.returnValue == 0) {
                            $.ajax({
                                type:"get",
                                url:ctx + "/homePageOperationDetail/update",
                                async:false,
                                data:content2,
                                dataType:"json",
                                success:function (res) {
                                    if (res.returnValue == 0) {
                                        $("#operationDetailList").bootstrapTable('refresh');
                                    } else {
                                        alert( '上移失败！');
                                    }
                                }
                            });
                        } else {
                            alert( '上移失败！');
                        }
                    }
                });
            }
        }
    });
}
/**
 * 运营下移操作
 * @param id
 * @param seq
 */
function homePageOperationDetaileMoveDown(id,seq) {
    var content={
        'sequence':seq
    }
    $.post(rootPath + "/homePageOperationDetail/getMinContent", content, function(data) {
        if(parseInt(seq) == data.sequence){
            alert("已经到最后一个,无法下移");
        }else {
            var content1={
                'id':id,
                'sequence':data.sequence
            };
            var content2={
                'id':data.id,
                'sequence':seq
            };
            $.post(ctx + "/homePageOperationDetail/update", content1, function(data) {
                if (data.returnValue == 0) {
                    $.post(ctx + "/homePageOperationDetail/update", content2, function(data) {
                        if (data.returnValue == 0) {
                            $("#operationDetailList").bootstrapTable('refresh');
                        } else {
                            alert( '下移失败！');
                        }
                    }, "json");
                } else {
                    alert( '下移失败！');
                }
            }, "json");
        }
    }, "json");
}
/**
 * 运营置顶操作
 * @param id
 * @param seq
 */
function moveTop(id,seq) {
    var maxSeq = null;
    $.post(rootPath + "/homePageOperation/getMaxSeq", {}, function(data) {
        if(seq == data){
            alert('已经是最顶部！');
        }else {
            maxSeq = parseInt(data) + 1;
            var content = {
                'id': id,
                'sequenceNumber': maxSeq
            };
            $.post(ctx + "/homePageOperation/updateStatus", content, function (data) {
                if (data.returnValue == 0) {
                    alert('置顶成功！');
                    $("#operationList").bootstrapTable('refresh');
                } else {
                    alert('置顶失败！');
                }
            }, "json");
        } }, "json");
}
/**
 * 运营置底操作
 * @param id
 * @param seq
 */
function moveBottom(id,seq) {
    var minSeq = null;
    $.post(rootPath + "/homePageOperation/getMinSeq", {}, function(data) {
        if(seq == data){
            alert('已经是最低部！');
        }else {
            minSeq = parseInt(data) - 1;
            var content = {
                'id': id,
                'sequenceNumber': minSeq
            };
            $.post(ctx + "/homePageOperation/updateStatus", content, function (data) {
                if (data.returnValue == 0) {
                    alert('置低成功！');
                    $("#operationList").bootstrapTable('refresh');
                } else {
                    alert('置低失败！');
                }
            }, "json");
        } }, "json");
}

/**
 * 更新上下线
 * @param id  主键id
 * @param status 需要更新的状态
 */
function updateStatus(id,status) {
    var operation={
        "id":id,
        "status":status
    }
    $.ajax({
        type:"post",
        url:rootPath + "/homePageOperation/update",
        data:operation,
        dataType:"json",
        success:function (res) {
            if (res.returnValue == 0) {
                _successTipsFun('修改成功！');
                $("#operationList").bootstrapTable('refresh',param);
            } else {
                _errorTipsFun('修改失败！');
            }
        }
    });
}


/**
 * 上传封面图片
 */
function uploadCoverImg(){
    manualModal(rootPath+'/file/toUpload?fileMaxSize=1000000&maxNum=8&callBackMethod=uploadCoverImgBack','base_modal');
}

/**
 * 封面图片 回调函数
 * @param fileData
 */
function uploadCoverImgBack(fileData){
    wrapperHideModal("base_modal");
    var path="";
    for(var i=0;i<fileData.length;i++){
       // path+=imgPath+"/"+fileData[i].filepath+",";
        path+=fileData[i].filepath+",";
        showImgCommonWrapper("imageUrls",fileData[i]);
    }
    if(path!=""){
        path=path.substring(0,path.length-1);
    }
    $("#imageUrls").val(path);
}

/**
 * 通用显示图片方法
 * @param _inputId 标签id
 * @param _file 文件对象
 */
function showImgCommonWrapper(_inputId,_file){
    var _input=$("#"+_inputId);
    /*_input.val(_file.filepath);*/
    var _div=_input.parents(".show-img-div");
    _div.find("img").attr("src",imgPath+"/"+_file.filepath).attr("data-original",imgPath+"/"+_file.filepath);
    _div.show();
    _input.parents(".div-img").find(".btn").hide();
}

/**
 * 保存轮播图信息
 */
function carouselFigure_submit(){
    $.post(rootPath+"/credit/carouseFigure/saveData",$("#addCarouselFigure").serialize(),function(result){
        var para=$("#operateId").val();
        if(result.code==0){
            _successTipsFun("操作成功!");
            returnToListPage(rootPath+'/credit/operation/edit?id='+para);
        }else{
            _errorTipsFun("操作失败!");
        }
    });
}

/**
 * 删除图片
 * @param obj
 */
function deleteCommonImg(obj){
    var _parent=$(obj).parents(".div-img");
    var _div=$(obj).parents(".show-img-div");
    _div.find("img").removeAttr("src");
    _div.hide();
    _parent.find(".btn").show();
}
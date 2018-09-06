package com.hiveview.tv.swagger.common;

import com.alibaba.fastjson.JSON;

import java.io.Serializable;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import com.hiveview.base.util.response.RespCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * Created by mikejiang on 2017/4/25.
 */
@Data
@ApiModel(description = "返回接口类")

public class RespMessage<T> implements Serializable {

    private static final long serialVersionUID = 2L;
    /**
     * 返回值 0成功 -1失败
     *
     */
    @ApiModelProperty(value = "是否成功")
    private long returnValue;
    /**
     * 错误信息
     */
    @ApiModelProperty(value = "错误信息")
    private String errorMessage;
    /**
     * 返回数据
     */
    @ApiModelProperty(value = "返回对象")
    private T data;

    /**
     * 判断接口是否调用成功
     * @return
     */
    public boolean hasError(){
        if(this.returnValue == RespCode.FAIL.getCode()){
            return true;
        }
        return false;
    }

    public RespMessage(){
        super();
    }

    public RespMessage(RespCode code, T data){
        this.returnValue=code.getCode();
        this.errorMessage=code.getMsg();
        this.data=data;
    }

    public RespMessage(RespCode code){
        this.returnValue=code.getCode();
        this.errorMessage=code.getMsg();
    }


    /**
     * 生成返回数据
     * @param errcode
     * @param data
     * @return
     */
    public String GetReturnMessage(RespCode errcode, T data) {
        this.returnValue = errcode.getCode();
        this.errorMessage = errcode.getMsg();
        this.data = data;
        return JSON.toJSONString(this);
    }

    /**
     * 生成返回数据
     * @param errcode
     * @param errorMessage
     * @return
     */
    public String GetReturnMessage(RespCode errcode, String errorMessage) {
        this.returnValue =errcode.getCode();
        this.errorMessage = errorMessage;
        return JSON.toJSONString(this);
    }

    /**
     * 生成返回数据
     * @param errcode
     * @param result
     * @return
     */
    public String ReturnMessage(RespCode errcode, /*T jsondata,*/ String result) {
        this.returnValue = errcode.getCode();
        this.errorMessage = errcode.getMsg();
        //this.data = jsondata;
        String json = JSON.toJSONString(this);
        JSONObject jsonObjectOne = JSON.parseObject(json);
        JSONObject jsonObjectTwo = JSON.parseObject(result);
        jsonObjectOne.put("data", jsonObjectTwo);
        return jsonObjectOne.toJSONString();
    }

    /**
     * 生成返回数据
     * @param errcode
     * @return
     */
    public String GetReturnMessage(RespCode errcode) {
        this.returnValue = errcode.getCode();
        this.errorMessage = errcode.getMsg();
        return JSON.toJSONString(this);
    }

    /**
     * 生成返回数据
     *
     * @param value      返回值
     * @param errMessage 错误信息
     * @param data       返回数据
     * @return
     */
    public String GetReturnMessage(long value, String errMessage, T data) {
        this.returnValue = value;
        this.errorMessage = errMessage;
        this.data = data;
        return JSON.toJSONString(this);
    }

    /**
     * 生成返回数据
     *
     * @param value      返回值
     * @param errMessage 错误信息
     * @return
     */
    public String GetReturnMessage(long value, String errMessage) {
        this.returnValue = value;
        this.errorMessage = errMessage;
        return JSON.toJSONString(this);
    }

    /**
     * 获取JSON解析后的data数据
     *
     * @param clazz
     * @return
     */
    public <T> T getDataParse(String data, Class<T> clazz) {
        return JSON.parseObject(data, clazz);
    }
}
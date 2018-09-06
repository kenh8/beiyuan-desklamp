package com.beiyuan.base.util.response;

import com.beiyuan.base.exception.ServiceException;


/**
 * Created by leo on 2017/10/20.
 * 通用返回结果封装
 */
public class RespMsg<T> {

    private long code;

    private String msg;

    private T data;

    public static <T> RespMsg<T> successResp(String msg,T data){
        return new RespMsg<>(RespCode.SUCCESS.getCode(),msg,data);
    }

    public static <T> RespMsg<T> failResp(String msg,T data){
        return new RespMsg<>(RespCode.FAIL.getCode(),msg,data);
    }

    public static <T> RespMsg<T> successResp(String msg){
        return successResp(msg,null);
    }

    public static <T> RespMsg<T> failResp(String msg){
        return failResp(msg,null);
    }

    public static <T> RespMsg<T> successResp(T data){
        return successResp(RespCode.SUCCESS.getMsg(),data);
    }

    public static <T> RespMsg<T> failResp(T data){
        return failResp(RespCode.FAIL.getMsg(),data);
    }

    public static <T> RespMsg<T> successResp(){
        return successResp(RespCode.SUCCESS.getMsg());
    }

    public static <T> RespMsg<T> failResp(){
        return failResp(RespCode.FAIL.getMsg());
    }

    public RespMsg(long code, String msg, T data){
        this.code=code;
        this.msg=msg;
        this.data=data;
    }

    public RespMsg(long code, String msg){
        this.code=code;
        this.msg=msg;
    }


    public RespMsg(){
        super();
    }
    public long getCode() {
        return code;
    }

    public void setCode(long code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public RespMsg(RespCode code,T data){
        this.code=code.getCode();
        this.msg=code.getMsg();
        this.data=data;
    }


    public static <T> RespMsg<T> failResp(ErrCode errCode){
        return new RespMsg<>(errCode.getCode(),errCode.getMsg());
    }
    public static <T> RespMsg<T> failResp(ServiceException e){
        return new RespMsg<>(Long.valueOf(e.getCode()),e.getMessage());
    }

    public static <T> RespMsg<T> successResp(ErrCode errCode, T data){
        return new RespMsg<>(errCode.getCode(),errCode.getMsg(),data);
    }

    public static <T> RespMsg<T> successResp(ErrCode errCode){
        return new RespMsg<>(errCode.getCode(),errCode.getMsg());
    }

}

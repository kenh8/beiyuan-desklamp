package com.beiyuan.base.util.response;

/**
 * Created by ubuntu on 2018/4/8.
 */
public abstract interface ErrCode {

    /**
     * 获取返回值
     * @return
     */
    public abstract long getCode();

    /**
     * 获取错误信息
     * @return
     */
    public abstract String getMsg();
}

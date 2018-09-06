package com.beiyuan.base.util.id;


import com.beiyuan.base.util.DateUtils;

/**
 * Created by ubuntu on 2018/5/29.
 */
public class SequenceGenerate {

    /**
     * 售后退款号前缀
     */
    public static final String SERVICESN_REFUND_PREFIX = "01";

    public static String generateSn(String prefix) {
        String sn = prefix + DateUtils.getDate("HHmmss") + String.valueOf(IdWorker.getLongCode());
        return sn;
    }
}

package com.hiveview.mythread;

/**
 * Created by sh on 2018/7/30.
 */
public class RunThreadDemo implements Runnable {
    @Override
    public void run() {
        System.out.println("线程被执行了");
        try {
            throw new Exception("ceshi");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("异常后信息");

    }
}

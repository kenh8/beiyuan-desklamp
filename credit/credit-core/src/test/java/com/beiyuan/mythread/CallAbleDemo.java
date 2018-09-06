package com.hiveview.mythread;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

/**
 * Created by sh on 2018/7/30.
 */
public class CallAbleDemo implements Callable {
    @Override
    public Object call() throws Exception {
        System.out.println("call----zhixng");
        return 0;
    }

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        Callable call=new CallAbleDemo();
        FutureTask<Integer> integerFutureTask = new FutureTask<Integer>(call);

        integerFutureTask.run();

        Integer integer = integerFutureTask.get();
        System.out.println(integer);


    }
}

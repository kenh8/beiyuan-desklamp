package com.hiveview;

import com.hiveview.mythread.RunThreadDemo;
import junit.framework.TestCase;
import org.junit.Test;

/**
 * Unit test for simple App.
 */
public class AppTest  extends TestCase{
@Test
    public void testRunThreadDemo(){
    new RunThreadDemo().run();

}

}

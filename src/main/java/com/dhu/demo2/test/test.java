package com.dhu.demo2.test;

import com.dhu.demo2.Utils.DesEncrypt;
import org.junit.jupiter.api.Test;

public class test {
    @Test
    public  void test() throws Exception{
        String input="86051062";
        String us="root";
        String out= DesEncrypt.encrypt(input);
        System.out.println(DesEncrypt.encrypt(input));
        System.out.println(DesEncrypt.encrypt(us));

    }
}
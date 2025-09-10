package uz.pdp.read_more.utils;

import lombok.experimental.UtilityClass;

import java.util.Base64;

@UtilityClass
public class Base64Utils {
    public  static String  encode(String str) {
        return Base64.getEncoder().encodeToString(str.getBytes());
    }

    public static String decode(String str) {
        return new String(Base64.getDecoder().decode(str));
    }
}

package org.agilej.rtl.util;


public class Strings {

    public static String nullToEmpty(String str){
        if (str == null) return "";
        return str;
    }

    public static boolean isNullOrEmpty(String str){
        return str == null || "".equals(str.trim());
    }
}

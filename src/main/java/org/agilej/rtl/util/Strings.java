package org.agilej.rtl.util;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Strings {

    public static String nullToEmpty(String str){
        if (str == null) return "";
        return str;
    }

    public static boolean isNullOrEmpty(String str){
        return str == null || "".equals(str.trim());
    }

    public static List<String> omitEmpty(String[] strings){
        List<String> result = new ArrayList<String>();
        if (strings != null){
            for (String s : strings){
                if (!isNullOrEmpty(s)){
                    result.add(s);
                }
            }
        }
        return result;
    }

    public static List<String> uniq(List<String> strings){
        Set<String> set = new HashSet<String>(strings);
        return new ArrayList<String>(set);
    }

}

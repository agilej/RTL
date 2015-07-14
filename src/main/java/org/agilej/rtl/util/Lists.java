package org.agilej.rtl.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Lists {
    public static <T> List<T> newArrayList(Iterable<T> it){
        List<T> list = new ArrayList<T>();
        Iterator<T> iterator = it.iterator();
        while (iterator.hasNext()){
            list.add(iterator.next());
        }
        return list;
    }
}

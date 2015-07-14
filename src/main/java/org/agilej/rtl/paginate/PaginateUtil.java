/*
 * Copyright 2010.
 * 
 * This document may not be reproduced, distributed or used
 * in any manner whatsoever without the expressed written
 * permission of Boventech Corp.
 * 
 * $Rev: 27 $
 * $Author: dongming.xie $
 * $LastChangedDate: 2012-07-30 10:57:22 +0800 (一, 30  7 2012) $
 */

package org.agilej.rtl.paginate;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.agilej.rtl.util.Strings;

public class PaginateUtil {

    private static final String QUERY_STRING_STARTFIX = "?";

    private static final String PARAM_KEY_VALUE_SEPARATOR = "=";

    private static final String PARAMS_SEPARATOR = "&";

    private static final String PAGINATION_NAME_IN_PARAMS = "page";

    private String paginationNameInParams;
    
    private static PaginateUtil instance = new PaginateUtil();
    
    private PaginateUtil(){}
    
    public static PaginateUtil getInstance(){
    	return instance;
    }

    public String getPaginatePath(HttpServletRequest request){
    	String pathInfo = (String)request.getAttribute("javax.servlet.forward.path_info");
    	String url = (String)request.getAttribute("javax.servlet.forward.servlet_path");
        if (!Strings.isNullOrEmpty(pathInfo)) {
            url += pathInfo;
        }

        String queryString = (String)request.getAttribute("javax.servlet.forward.query_string");
        if (!Strings.isNullOrEmpty(queryString)) {
            url += extractQueryStringWithoutPagination(queryString, request);
        }
        return url;
    }

    private String extractQueryStringWithoutPagination(String queryString, HttpServletRequest request) {
        StringBuilder urlBuilder = new StringBuilder();
        if (!Strings.isNullOrEmpty(queryString)) {
            urlBuilder.append(QUERY_STRING_STARTFIX);

            String[] params = queryString.split(PARAMS_SEPARATOR);
            List<String> omittedEmptyStrings = Strings.omitEmpty(params);

            for(String q : omittedEmptyStrings){
                String[] kv = q.split(PARAM_KEY_VALUE_SEPARATOR);
                String name = kv.length > 0 ? kv[0] : null;
                String value = kv.length > 1 ? kv[1] : null;
                if (name != null && !getPaginationNameInParams().equals(name)) {
                    urlBuilder.append(name).append(PARAM_KEY_VALUE_SEPARATOR)
                            .append(Strings.nullToEmpty(value))
                            .append(PARAMS_SEPARATOR);
                }
            }
        }
        String result = urlBuilder.toString();
        result = result.endsWith(PARAMS_SEPARATOR) ? result.substring(0, result.length()-1)  : result ;
        return QUERY_STRING_STARTFIX.endsWith(result) ? "" : result;
    }

    public void setPaginationNameInParams(String paginationNameInParams) {
        this.paginationNameInParams = paginationNameInParams;
    }

    public String getPaginationNameInParams() {
        return Strings.isNullOrEmpty(paginationNameInParams) ? PAGINATION_NAME_IN_PARAMS
                : this.paginationNameInParams;
    }


}
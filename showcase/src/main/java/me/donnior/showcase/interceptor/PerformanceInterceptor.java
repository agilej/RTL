/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev$
 * $Author$
 * $LastChangedDate$
 *
 */

package me.donnior.showcase.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;


/**
 *
 */
class PerformanceInterceptor extends HandlerInterceptorAdapter{
    
    final Logger logger = LoggerFactory.getLogger(PerformanceInterceptor.class);
    
    boolean usePerformance = true;

    static final String HANDLER_START_AT = "HANDLER_START_AT";
    static final String HANDLER_ACTION_END_AT = "HANDLER_ACTION_END_AT";

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
    throws Exception {
        if(isPerformanceLogActived(handler)) {
            request.setAttribute(HANDLER_START_AT, System.currentTimeMillis());
        }
        return true;
    }
    
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
        if(isPerformanceLogActived(handler)) {
            request.setAttribute(HANDLER_ACTION_END_AT, System.currentTimeMillis());
        }
    }
            
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        super.afterCompletion(request, response, handler, ex);
        if(isPerformanceLogActived(handler)) {
            Long end = System.currentTimeMillis();
            Long actionEndAt = (request.getAttribute(HANDLER_ACTION_END_AT) != null) ? (Long)request.getAttribute(HANDLER_ACTION_END_AT) : System.currentTimeMillis();
            Long start = (Long)request.getAttribute(HANDLER_START_AT);

            Long total = end-start;
            Long actionTime = actionEndAt - start;
            Long viewTime = end - actionEndAt;
            
            logger.info("Completed "+request.getRequestURI() + " in " +total + "ms (Action: "+actionTime+"ms | Views: "+ viewTime+"ms) ");
        }
        
    }
    
    private boolean isPerformanceLogActived(Object handler) {
        return usePerformance && !(handler instanceof ResourceHttpRequestHandler);
    }            
    
    
            
}
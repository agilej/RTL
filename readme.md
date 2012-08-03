# 模版标签

## 使用

 修改模版位置至项目实际位置，在web.xml中配置（确保参数名为"tftTempatePage"）; 如果不配置，将默认使用 <code>WEB-INF/views/layout/template.jsp</code> 作为模版

    <context-param>
        <param-name>tftTempatePage</param-name>
        <param-value>/WEB-INF/views/layout/template.jsp</param-value>
    </context-param>

## 定义模版

    <!DOCTYPE html>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <r:yieldTitle prefix="Gloable Title | "></r:yieldTitle>

    <link rel="stylesheet" href="reset.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />

    <r:yieldStylesheets></r:yieldStylesheets>

    <script type="text/javascript" src="jquery-1.7.2.min.js" ></script>
    <script type="text/javascript" src="application.js"></script>

    <r:yieldJavascripts />

    </head>
    <body>
        <div id="body">
            <div id="sidebar">
                    //...
            </div>
            
            <div id="main">
                <div class="content" >
                    <r:yieldBody></r:yieldBody>
                </div>
            </div>
        </div>
    </body>
    </html>

## 使用模版

在单个需要使用模版的页面使用

    <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

    <%@ taglib prefix="r" tagdir="R-Tags"%>

    <r:stylesheet name="/resources/styles/input.css"></r:javascript>

    <r:javascript name="/resources/js/input.js"></r:javascript>

    <r:layout title="title for this page">
        <h3>page title</h3>
        <ul><li>...</li></ul>   
    </r:layout>

## 各标签详解

* yieldTitle       
    `用于模版定义中，使用此标签来为模版设置单独页面的标题`
* yieldStylesheets
    `用于模版定义中，使用此标签来为模版设置单独页面需要的样式文件`
* yieldJavascripts
    `用于模版定义中，使用此标签来为模版设置单独页面需要的脚本文件`
* yieldBody
    `用于模版定义中，使用此标签来输出各页面的内容`
* layout
    `用于需要使用模版的页面，使用此标签来应用模版`
* stylesheet
    `用于需要使用模版的页面，使用此标签来为单独页面设置个性化需要的样式文件`
* javascript
    `用于需要使用模版的页面，使用此标签来为单独页面设置个性化需要的脚本文件`


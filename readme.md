# 模版标签

## 使用

 修改模版位置至项目实际位置，在web.xml中配置（确保参数名为"tftTempatePage"）; 如果不配置，将默认使用 <code>WEB-INF/views/layout/template.jsp</code> 作为模版

```xml
<context-param>
    <param-name>tftTempatePage</param-name>
    <param-value>/WEB-INF/views/layout/template.jsp</param-value>
</context-param>
```

## 定义模版
```html
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
```

## 使用模版

在单个需要使用模版的页面使用
```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="r" tagdir="R-Tags"%>

<r:stylesheet name="/resources/styles/input.css"></r:javascript>

<r:javascript name="/resources/js/input.js"></r:javascript>

<r:layout title="title for this page">
    <h3>page title</h3>
    <ul><li>...</li></ul>   
</r:layout>
```

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


# Paginate(分页)标签库

## 安装及使用

### 在国际化文件中添加标签库需要的i18n资源,如

    default.paginate.label.previous = 上一页标签文字
    default.paginate.label.next = 下一页标签文字

### 在DAO中需要支持分页的方法中返回PaginateSupportArray代替常规ArrayList
```java
public List<User> listAllUsers(int page, int pageSize){
    List<User> users = // get record from database
    int total = //count from database
    PaginateSupportArray list = new PaginateSupportArray(users);
    list.setTotal(total);
    list.setPage(page);
    list.setPageSize(pageSize);
    return list;
}
```
### 在JSP中使用分页组件
```xml
     <r:paginate data="${results}" />
```

## 自定义样式

分页组件将生成如下内容的html代码，不设置任何样式，用户可以根据需要定义样式
```html
<div class="pagination">
    <a href="/xxx?page=2" title="Next Page" class="label pre">Previous Page</a>
    <a href="/xxx?page=1" class="number current">1</a>  
    <span>...</span>
    <a href="/xxx?page=2" class="number">20</a>
    <a href="/xxx?page=2" title="Next Page" class="label next">Next Page</a>
</div>
```

## paginate标签属性详解

| 属性名 | 是否必需 | 用途 | 说明 |
| data | Y | 获取分页信息的数据列表 | 传入列表必须是一个PaginateSupportArray的实例 |
| path | N | 自定义分页连接的路径 | 如果不设置将自动从用户的请求判断分页路径 |
| pageVar | N | 用户标识页码的变量名称 | 默认是"page" |
| preLabe l | N | 上一页标签显示的文字 | 如果不设置将从i18n从获取 |
| nextLabel | N | 下一页标签显示的文字 | 如果不设置将从i18n从获取 |

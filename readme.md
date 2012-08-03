There are two category tags in the package:

* Template Tags
* Paginate Tags

# Templating Tags

## How to use

* Add dependency in maven. currently you need to install the artifact manually
```xml
<dependency>
    <groupId>me.donnior</groupId>
    <artifactId>rtl</artifactId>
    <version>0.1</version>
</dependency>
```

* Set the template page in web.xml, make sure the param name is `tftTempatePage`; if not, RTL will use the default template page which is <code>WEB-INF/views/layout/template.jsp</code>
```xml
<context-param>
    <param-name>tftTempatePage</param-name>
    <param-value>/WEB-INF/views/layout/template.jsp</param-value>
</context-param>
```

* Define your template page
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

* Use the template in your every page needed to be templated. Like this:
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

## Tags Explain

* yieldTitle       
    `Used in template page, can set the single page's title`
* yieldStylesheets  
    `Used in template page, add the page specific style`
* yieldJavascripts  
    `Used in template page, add the page specific javascript`
* yieldBody  
    `Used in template page, output the your templated page`
* layout  
    `Used in templated page, declare current page needs templated`
* stylesheet  
    `Used in templated page, specify one stylesheet which needed by current page`
* javascript  
    `Used in templated page, specify one javascript which needed by current page`

# Paginate Tags  

## How to use

Set the i18n resouces needed by the paginate tag, this step is required.

    default.paginate.label.previous = Previous Page
    default.paginate.label.next = Next Page

Use the PaginateSupportArray to wrap your normal List which will be used on the paginating page.
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

Use the wrapped List in jsp
```xml
<r:paginate data="${results}" />
```

## Customize Style

The paginate tag will generate the following html code without any specific styles, you can set styles in your css file.
```html
<div class="pagination">
    <a href="/xxx?page=9" title="Next Page" class="label pre">Previous Page</a>
    <a href="/xxx?page=10" class="number current">10</a>  
    <span>...</span>
    <a href="/xxx?page=31" class="number">31</a>
    <a href="/xxx?page=11" title="Next Page" class="label next">Next Page</a>
</div>
```

## Paginate Tag's attributes explain

<table>
    <tr>
        <th>Attribute Name</th><th>Required</th><th>Usage</th><th>Note</th>
    </tr>
    <tr><td>data</td><td>Y</td><td>the data list which got pagination info from</td><td>the data object must be an instance of PaginateSupportArray</td></tr>
    <tr><td>path</td><td>N</td><td>customzied url for links in the pagination</td><td>RTL will get it automaticly if it's not given.</td></tr>
    <tr><td>pageVar</td><td>N</td><td>the variable name which identify the page info</td><td>default is "page"</td></tr>
    <tr><td>preLabel</td><td>N</td><td>the text will be displayed as the previous page link label</td><td>got from i18n if not setted</td></tr>
    <tr><td>nextLabel</td><td>N</td><td>the text will be displayed as the next page link label</td><td>got from i18n if not setted</td></tr>
</table>


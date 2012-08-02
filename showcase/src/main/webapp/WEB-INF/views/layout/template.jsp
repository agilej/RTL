<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="R-Tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<r:yieldTitle prefix="Showcase | "></r:yieldTitle>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" type="text/css" media="screen" />
<r:yieldStylesheets></r:yieldStylesheets>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.7.2.min.js'/>" ></script>
<r:yieldJavascripts />
</head>
<body>
    <div>
        <div id="sidebar">
			<ul>
				<li><a href="<c:url value='/users'/>">User List</a></li>
		     </ul>       
		</div>
        
        <div id="main">
            <r:yieldBody></r:yieldBody>
        </div>
    </div>
</body>
</html>
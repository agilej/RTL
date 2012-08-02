<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="style" items="${tftStylesheetsList}">
    <link rel="stylesheet" href="${style}" type="text/css" media="screen" />
</c:forEach>
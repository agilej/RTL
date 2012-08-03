<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="script" items="${RTLJavascriptList}">
    <script type="text/javascript" src="${script}"></script>
</c:forEach>
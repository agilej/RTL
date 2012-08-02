<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="name" required="true" type="java.lang.String" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty tftStylesheetsList}">
    <% request.setAttribute("tftStylesheetsList", new java.util.ArrayList()); %>
</c:if>
<c:set var="tftStylesheet" scope="request">
	<c:url value="${name}"/>
</c:set>
<% ((java.util.List)request.getAttribute("tftStylesheetsList")).add(request.getAttribute("tftStylesheet")); %>
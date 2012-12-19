<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="name" required="true" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty RTLJavascriptList}">
    <% request.setAttribute("RTLJavascriptList", new java.util.ArrayList()); %>
</c:if>
<c:set var="RTLJavascript" scope="request">
	<c:url value="${name}"/>
</c:set>
<% ((java.util.List)request.getAttribute("RTLJavascriptList")).add(request.getAttribute("RTLJavascript")); %>
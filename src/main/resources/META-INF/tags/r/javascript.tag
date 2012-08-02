<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="name" required="true" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty tftJavascriptList}">
    <% request.setAttribute("tftJavascriptList", new java.util.ArrayList()); %>
</c:if>
<c:set var="tftJavascript" scope="request">
	<c:url value="${name}"/>
</c:set>
<% ((java.util.List)request.getAttribute("tftJavascriptList")).add(request.getAttribute("tftJavascript")); %>
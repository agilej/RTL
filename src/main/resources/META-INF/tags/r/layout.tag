<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="title" required="false" type="java.lang.String" %>
<%@ attribute name="template" required="false" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="tftTitle" value="${title}" scope="request"></c:set>
<jsp:doBody var="tftMainBody" scope="request"></jsp:doBody>
<c:if test="${empty template}">
	<% 
	   String tftTemplate = application.getInitParameter("tftTempatePage"); 
	   if(tftTemplate == null){
	       tftTemplate = "/WEB-INF/views/layout/template.jsp";
	   }
	   request.setAttribute("tftTemplate", tftTemplate);
	%> 
    <jsp:include page ="${tftTemplate}" />
</c:if>
<c:if test="${not empty template}">
    <jsp:include page ="${template}" />
</c:if>


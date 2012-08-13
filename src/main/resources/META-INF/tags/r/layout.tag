<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="title" required="false" type="java.lang.String" %>
<%@ attribute name="titleKey" required="false" type="java.lang.String" %>

<%@ attribute name="template" required="false" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty titleKey}">
  	<fmt:message key="${titleKey}" var="RTLTitle" scope="request"></fmt:message>
</c:if>
<c:if test="${not empty title}">
	<c:set var="RTLTitle" value="${title}" scope="request"></c:set>
</c:if>
<jsp:doBody var="RTLMainBody" scope="request"></jsp:doBody>
<c:if test="${empty template}">
	<% 
	   String RTLTemplate = application.getInitParameter("RTLTempatePage"); 
	   if(RTLTemplate == null){
	       RTLTemplate = "/WEB-INF/views/layout/template.jsp";
	   }
	   request.setAttribute("RTLTemplate", RTLTemplate);
	%> 
    <jsp:include page ="${RTLTemplate}" />
</c:if>
<c:if test="${not empty template}">
    <jsp:include page ="${template}" />
</c:if>


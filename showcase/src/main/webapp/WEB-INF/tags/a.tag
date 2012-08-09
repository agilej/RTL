<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="href" required="true" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<a href='<c:url value="${href}"/>' ><jsp:doBody /></a>
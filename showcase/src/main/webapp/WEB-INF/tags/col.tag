<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="header" required="true" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:if test="${empty RTLTableHeaderList}">
    <% request.setAttribute("RTLTableHeaderList", new java.util.ArrayList()); %>
</c:if>
<% ((java.util.List)request.getAttribute("RTLTableHeaderList")).add(header); %>

<td><jsp:doBody /> </td>
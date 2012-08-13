<%@ tag import="me.donnior.rtl.html.HtmlAnchor"%>
<%@ tag import="java.util.Map"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag dynamic-attributes="dynamicAttributes"  %>
<%@ attribute name="href" required="true" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="${href}" var="RTLHref" scope="page"></c:url>
<jsp:doBody var="RTLAnchorContent" scope="page"/>

<%
  HtmlAnchor a = new HtmlAnchor();
  a.setDynamicAttributes((Map)jspContext.getAttribute("dynamicAttributes"));
  a.setHref((String)jspContext.getAttribute("RTLHref"));
  a.setContent((String)jspContext.getAttribute("RTLAnchorContent"));
  out.print(a.toHtml());
  jspContext.removeAttribute("RTLAnchorContent");
  jspContext.removeAttribute("RTLHref");
%>  
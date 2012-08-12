<%@tag import="me.donnior.rtl.html.HtmlTable"%>
<%@ tag language="java" pageEncoding="UTF-8" dynamic-attributes="htmlAttrs" %>
<%@ attribute name="header" required="false" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="headerKey" required="false" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="cssClass" required="false" type="java.lang.String" rtexprvalue="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:doBody var="RTLTableCellContent" scope="page"/>

<% if(headerKey != null){ %>
  <fmt:message key="${headerKey}" var="RTLTableHeadLable" scope="page"></fmt:message>
<% } %>

<%
  HtmlTable table = (HtmlTable)request.getAttribute("RTLTable");
  int row = (Integer)request.getAttribute("RTLTableCurrentRow");
  table.addBodyCellAtRow(row, (String)jspContext.getAttribute("RTLTableCellContent"));
  
  if(headerKey != null){
  	table.addHeadCell((String)jspContext.getAttribute("RTLTableHeadLable"));  
  } else if(header !=null){
  	table.addHeadCell(header); 
  }
  
  jspContext.removeAttribute("RTLTableHeadLable");
%>  
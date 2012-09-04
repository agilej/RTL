<%@ tag import="me.donnior.rtl.html.HtmlTable"%>
<%@ tag import="me.donnior.rtl.html.HtmlTableHeadCell"%>
<%@ tag import="java.util.Map"%>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="header" required="false" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="headerKey" required="false" type="java.lang.String" rtexprvalue="true" %>
<%@ tag dynamic-attributes="dynamicAttributes"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:doBody var="RTLTableCellContent" scope="page"/>

<%
  HtmlTable table = (HtmlTable)request.getAttribute("RTLTable");
  int row = (Integer)request.getAttribute("RTLTableCurrentRow");
  table.addBodyCellAtRow(row, (String)jspContext.getAttribute("RTLTableCellContent"));
%>

<%  
if(!table.isHeadCellFrozen()){
  if(headerKey != null){
%>
<fmt:message key="${headerKey}" var="RTLTableHeadLable" scope="page"></fmt:message>
<%
	HtmlTableHeadCell headCell = new HtmlTableHeadCell((String)jspContext.getAttribute("RTLTableHeadLable"));
	headCell.setDynamicAttributes((Map)jspContext.getAttribute("dynamicAttributes"));	
  	table.addHeadCell(headCell);  
  } else {
  	HtmlTableHeadCell headCell = new HtmlTableHeadCell(header);
  	headCell.setDynamicAttributes((Map)jspContext.getAttribute("dynamicAttributes"));
  	table.addHeadCell(headCell); 
  }
}  
  jspContext.removeAttribute("RTLTableHeadLable");
%>  
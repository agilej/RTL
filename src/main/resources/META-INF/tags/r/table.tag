<%@ tag import="me.donnior.rtl.html.HtmlTable"%>
<%@ tag import="me.donnior.rtl.html.LoopStatus"%>
<%@ tag import="java.util.Map"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag dynamic-attributes="dynamicAttributes"  %>
<%@ attribute name="data" required="true" type="java.util.List" rtexprvalue="true" %>
<%@ attribute name="var"  required="true" %>
<%@ attribute name="varStatus"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
if(var == null){
	var = "var";
}
if(varStatus == null){
	varStatus = "status";
}
HtmlTable table = new HtmlTable(data.size());
table.setDynamicAttributes((Map)jspContext.getAttribute("dynamicAttributes"));
request.setAttribute("RTLTable", table); 
/* jspContext.setAttribute("RTLTable", table); */
for(int i=0; i<data.size(); i++) {
	request.setAttribute(var, data.get(i));
	request.setAttribute(varStatus, new LoopStatus(i));
	request.setAttribute("RTLTableCurrentRow", i);
%>  
  <jsp:doBody></jsp:doBody>
<%  
    if(i == 0){
     table.freezeHeadCell(); 
    }
}
out.print(table.toHtml());
%>
<%@ tag import="me.donnior.rtl.html.HtmlTable"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="data" required="true" type="java.util.List" rtexprvalue="true" %>
<%@ attribute name="var"  %>
<%@ attribute name="varStatus"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
HtmlTable table = new HtmlTable(data.size());
request.setAttribute("RTLTable", table); 
/* jspContext.setAttribute("RTLTable", table); */
for(int i=0; i<data.size(); i++) {
	request.setAttribute(var, data.get(i));
	request.setAttribute(varStatus, i);
	request.setAttribute("RTLTableCurrentRow", i);
%>  
  <jsp:doBody></jsp:doBody>
<%  
    if(i == 0){
     table.freezonHeadCell(); 
    }
}
out.print(table.toHtml());
%>
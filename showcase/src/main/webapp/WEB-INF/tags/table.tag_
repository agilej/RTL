<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="data" required="true" type="java.util.List" rtexprvalue="true" %>
<%@ attribute name="var"  %>
<%@ attribute name="varStatus"  %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table>
	
	<%
	for(int i=0; i<data.size(); i++) {
		request.setAttribute(var, data.get(i));
		request.setAttribute(varStatus, i);
		if(i==0){ 
		%>
			<jsp:doBody var="header" scope="request"></jsp:doBody>
			<% out.print("<thead><tr>");%>

			<% 
			java.util.List headers = (java.util.List)request.getAttribute("RTLTableHeaderList");
			for(int j=0; j<headers.size(); j++){
				out.print("<th>" + headers.get(j) + "</th>");
			}
			
			%>
			<% out.print("</tr></thead>");%>
			<% out.print("<tbody><tr>");%>
			<% out.print(request.getAttribute("header"));%>	
			<% out.print("</tr>");%>
		<% 
		} else { 
		%>
			<tr><jsp:doBody /> </tr>
		<% 
		} 
		
	} 
	%>
	</tbody>

</table>

<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>

<%@ attribute name="pageVar" required="false" type="java.lang.String" %>
<%@ attribute name="path" required="false" type="java.lang.String" %>
<%@ attribute name="preLabel" required="false" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="nextLabel" required="false" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="data" required="true" type="java.lang.Object" rtexprvalue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- set path to default if user do not specify it --%>

<c:if test="${not empty path}" >
	<c:set var="RTLUri" value="${path}" ></c:set>
</c:if>
<c:if test="${empty path}" >
	<%
		me.donnior.rtl.paginate.PaginateUtil util = me.donnior.rtl.paginate.PaginateUtil.getInstance();
		request.setAttribute("RTLUri", util.getPaginatePath(request));
	%>
</c:if>

<%-- 
	check previous and next link label text, if user not spcify them, will use the default text from bundle resource. 
--%>

<c:if test="${empty preLabel}" >
	<fmt:message key="default.paginate.label.previous" var="preLabel"/>	
</c:if>
<c:if test="${empty nextLabel}" >
	<fmt:message key="default.paginate.label.next" var="nextLabel"/>
</c:if>

<%-- set the variable name for specify page number, default is 'page' --%>

<c:if test="${not empty pageVar}" >
	<c:set var="pageVarName" value="${pageVar}" ></c:set>
</c:if>
<c:if test="${empty pageVar}" >
	<c:set var="pageVarName" value="page" />
</c:if>

<%-- set variables that needed for calculating pagings --%>

<%
	me.donnior.rtl.paginate.PaginateSupport array = (me.donnior.rtl.paginate.PaginateSupport)data;
	int total = array.getTotal();
	request.setAttribute("total", total);

	request.setAttribute("pageSize", array.getPageSize());
	int pageSize = (Integer)request.getAttribute("pageSize"); 
	
	int pages = total%pageSize == 0 ? total/pageSize : (total/pageSize) + 1;
	request.setAttribute("pages", pages);
	
	request.setAttribute("currentPage", array.getPage());
%>

<div class="pagination">
	<c:if test="${total > 0 and pages != 1}">
		<c:url var="url" value="${RTLUri}" >
		    <c:param name="${pageVarName}" value="1" />
		</c:url>
		
		<c:if test="${currentPage > 1}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="${currentPage-1}" />
			</c:url>
			<a href="${url}" title="Previous Page" class="label pre">${preLabel}</a>
		</c:if>

		<c:if test="${currentPage != 1}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="1" />
			</c:url>
			<a href="${url}" class="number">1</a>
		</c:if>
		<c:if test="${currentPage - 2 > 2}">
			<span>…</span>
		</c:if>
		

		<c:if test="${currentPage - 2 > 1}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="${currentPage - 2}" />
			</c:url>
			<a href="${url}" class="number">${currentPage - 2}</a>
		</c:if>
		<c:if test="${currentPage - 1 > 1}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="${currentPage - 1}" />
			</c:url>
			<a href="${url}" class="number">${currentPage - 1}</a>
		</c:if>
		
		<c:url var="url" value="${RTLUri}" >
		    <c:param name="${pageVarName}" value="${currentPage}" />
		</c:url>
		<a href="${url}" class="number current">${currentPage}</a>		
		
		<c:if test="${currentPage + 1 < pages}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="${currentPage + 1}" />
			</c:url>
			<a href="${url}" class="number">${currentPage + 1}</a>
		</c:if>
		<c:if test="${currentPage + 2 < pages}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="${currentPage + 2}" />
			</c:url>
			<a href="${url}" class="number">${currentPage + 2}</a>
		</c:if>
		
		<c:if test="${currentPage + 2 < pages - 1}">
			<span>…</span>
		</c:if>
		
		<c:if test="${pages > 1 && currentPage != pages}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="${pages}" />
			</c:url>
			<a href="${url}" class="number">${pages}</a>		
		</c:if>

		<c:if test="${currentPage  != pages}">
			<c:url var="url" value="${RTLUri}" >
			    <c:param name="${pageVarName}" value="${currentPage + 1}" />
			</c:url>
			<a href="${url}" title="Next Page" class="label next">${nextLabel}</a>
		</c:if>
		<c:url var="url" value="${RTLUri}" >
		    <c:param name="${pageVarName}" value="${pages}" />
		</c:url>
	</c:if>
</div>



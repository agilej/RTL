<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="R-Tags"%>

<r:layout title="Usr list">

	<table>
		<thead>
			<tr>
				<th>Login</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<td><a href='<c:url value="/user/${user.id}"/>' > ${user.login} </a></td>
					<td>${user.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<r:paginate data="${users}"></r:paginate>

</r:layout>

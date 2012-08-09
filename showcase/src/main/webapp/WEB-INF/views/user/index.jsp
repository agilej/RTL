<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="r-tag"%>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags"%>

<r:layout title="Usr list">
	<h2>User List</h2>

	<d:table data="${users}" var="user" varStatus="status">
		<d:col header="序号">${status+1}</d:col>
		<d:col header="登录名">
			<d:a href="/user/${user.id}">${user.login}</d:a>
		</d:col> 
		<d:col header="邮箱">${user.email}</d:col>
	</d:table>
	
	<r:paginate data="${users}"></r:paginate>

</r:layout>

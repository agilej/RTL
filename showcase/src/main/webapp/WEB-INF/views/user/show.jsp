<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="R-Tags"%>

<r:layout title="User profile">


	<div>
		<p>
			<span>Login</span> <span>${user.login}</span>
		</p>
		<p>
			<span>email</span> <span>${user.email}</span>
		</p>
	</div>

</r:layout>

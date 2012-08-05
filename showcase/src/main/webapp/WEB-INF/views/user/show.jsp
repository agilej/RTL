<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="r-tag"%>

<r:layout title="User profile">
	
	<h2>User Profile</h2>

	<div id="profile">
		<p>
			<span class="label">Login</span> <span>${user.id}</span>
		</p>
		<p>
			<span class="label">Login</span> <span>${user.login}</span>
		</p>
		<p>
			<span class="label">email</span> <span>${user.email}</span>
		</p>
	</div>

</r:layout>

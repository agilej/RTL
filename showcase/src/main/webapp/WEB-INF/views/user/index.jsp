<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="r-tag"%>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags"%>

<r:layout title="Usr list">
  <h2>User List</h2>

  <d:table2 data="${users}" var="user" varStatus="status">
    <d:col2 header="序号" headerKey="HeaderKey">${status+1}</d:col2>
    <d:col2 headerKey="user.login.label" cssClass="name">
      <d:a href="/user/${user.id}">${user.login}</d:a>
    </d:col2>
    <d:col2 header="邮箱">${user.email}</d:col2>
    <d:col2 header="操作"></d:col2>
  </d:table2>

  <r:paginate data="${users}"></r:paginate>
</r:layout>
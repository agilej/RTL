<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="r-tag"%>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags"%>

<r:layout title="Usr list">
  <h2>User List</h2>

  <r:table data="${users}" var="user" varStatus="status" id="table1" class="cls_a">
    <r:col >${status+1}</r:col>
    <r:col headerKey="user.login.label" >
      <r:a class="linka" href="/user/${user.id}">${user.login}</r:a>
    </r:col>
    <r:col header="Mail">${user.email}</r:col>
    <r:col header="Operation"></r:col>
  </r:table>

  <r:paginate data="${users}"></r:paginate>
</r:layout>
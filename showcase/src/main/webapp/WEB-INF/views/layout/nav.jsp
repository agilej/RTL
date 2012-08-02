<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

     <!-- Sidebar with logo and menu -->
     <h1 id="sidebar-title">
         <a href="#">Boventech</a>
     </h1>
     <a href="#"><img class="logox" src="<c:url value='/resources/themes/default/images/logo1.png'/>"></a>
     <!-- Sidebar Profile links -->
     <div id="profile-links">
         <p class="white">${login}，歡迎您</p>
         <a href="<c:url value='/'/>" title="View the Site">返回首頁</a> | 
         <a href="<c:url value='/admin/session'/>" data-method="delete" title="Sign Out">安全退出</a>
     </div>
     <ul id="main-nav">
         <li><a href="#" class="nav-top-item" id="book-nav">词条管理 </a>
             <ul>
					<li><a href="<c:url value='/admin/entry/create'/>">新建词条</a></li>
					<li><a href="<c:url value='/admin/entry/index'/>">词条列表</a></li>
					<li><a href="#">词条审核</a></li>
             </ul>
         </li>
         
         
         <li><a href="#" class="nav-top-item" id="user-nav">用戶管理 </a>
             <ul>
                 <li><a href="<c:url value='/admin/user/create' />">新建用戶</a></li>
                 <li><a href="<c:url value='/admin/user' />">用戶列表</a></li>
             </ul>
         </li>
         
         <li><a href="#" class="nav-top-item" id="person-nav">個人設置 </a>
             <ul>
                 <li><a href="<c:url value='/admin/user/password'/>">修改密碼</a></li>
                 <li><a href="<c:url value='/admin/user/${userId}'/>">個人設置</a></li>
             </ul>
         </li>
     </ul>
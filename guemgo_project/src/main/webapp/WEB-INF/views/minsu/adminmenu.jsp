<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>관리자 페이지</h2>
<ul class="nav nav-pills nav-stacked">
	<li><a href="<c:url value='/UserList'/>">회원관리</a></li>
	<li><a href="<c:url value='/GosuList'/>">고수관리</a></li>
	<li><a href="<c:url value='/#'/>">통계관리</a></li>
</ul>

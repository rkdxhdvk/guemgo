<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-01-01	윤우현 파일 생성
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <div>
<h2>카테고리</h2>
<ul>
	<c:forEach var="item" items="${category }">
		<li>${item }</li>
	</c:forEach>
</ul>
</div> --%>
<h1>관리자페이지</h1>
<a href="UserList">회원관리</a><br>
<a href="GosuList">고수관리</a><br>
<a href="<c:url value='/'/>">홈으로</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-10-29	윤우현 파일 생성
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${code=='success' }">
		<h1>요청작업성공</h1>
	</c:when>
	<c:otherwise>
		<h1>요청작업실패</h1>
	</c:otherwise>
</c:choose>
<br>
<a href='<c:url value='/'/>'>홈으로</a>
</body>
</html>








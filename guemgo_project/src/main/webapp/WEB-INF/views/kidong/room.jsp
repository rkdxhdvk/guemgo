<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.room }</td>
		<td>${vo.email }</td>
		<td>${vo.other }</td>
		<td><a href="<c:url value='/chat?room=${vo.room }'/>">채팅</a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>
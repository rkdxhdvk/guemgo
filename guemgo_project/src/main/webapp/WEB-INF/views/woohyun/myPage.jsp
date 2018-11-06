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
<h1>마이페이지</h1>
<ul>
	<li><a href="<c:url value='/UserUpdate?email=${sessionScope.email }'/>">개인정보 수정</a></li>

</ul>
<a href="<c:url value='/'/>">홈으로</a>

</body>
</html>
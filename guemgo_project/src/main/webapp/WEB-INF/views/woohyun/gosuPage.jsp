<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-11-12	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>고수페이지</h1>
<ul>
	<li><a href="<c:url value='/UserUpdate?email=${sessionScope.email }'/>">개인정보 수정</a></li>
	<li><a href="<c:url value='/gosuProfile?email=${sessionScope.email }'/>">고수프로필 수정</a></li>
	<li><a href="<c:url value='/scheList?email=${sessionScope.email }'/>">스케줄리스트</a></li>

</ul>
<a href="<c:url value='/'/>">홈으로</a>

</body>
</html>
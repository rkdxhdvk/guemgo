<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-11-07	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>고수전체목록</h1>
<table border="1" width="1000">
	<tr>
		<th>회원번호</th>
		<th>고수번호</th>
		<th>아이디(이메일)</th>
		<th>회원이름</th>
		<th>고수등급</th>
		<th>고용횟수</th>
		<th>포인트</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.m_num }</td>
			<td>${vo.go_num }</td>
			<td>${vo.email }</td>
			<td>${vo.name }</td>
			<td>${vo.grade }</td>
			<td>${vo.employ }</td>
			<td>${vo.point }</td>
			<!-- 삭제후 result.jsp에서 결과출력하기 -->
			<td><a href='<c:url value='/GosuDelete?email=${vo.email }'/>'>삭제</a></td>
			<td><a href='<c:url value='/GosuUpdate?email=${vo.email }'/>'>수정</a></td>
		</tr>
	</c:forEach>
</table><br>
<a href="<c:url value='/'/>">홈으로</a>
</body>
</html>

















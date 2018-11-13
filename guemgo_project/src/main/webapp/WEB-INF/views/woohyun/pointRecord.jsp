<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
--------------------------------
	2018-11-12	윤우현 파일 생성
--------------------------------
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>포인트 사용내역</h1>
<table border="1" width="1000">
	<tr>
		<th>일자</th>
		<th>구분</th>
		<th>상세내역</th>
		<th>거래포인트</th>
		<th>잔여포인트</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.pointdate }</td>
			<td>${vo.division_name }</td>
			<td>${vo.detail }</td>
			<td>${vo.dpoint }</td>
			<td>${vo.lpoint }</td>
		</tr>
	</c:forEach>
</table><br>
<a href="<c:url value='/' />">홈으로</a>
</body>
</html>
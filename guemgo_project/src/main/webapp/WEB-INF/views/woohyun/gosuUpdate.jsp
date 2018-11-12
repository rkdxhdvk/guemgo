<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<h1>고수 정보 수정</h1>
<form method="post" action="GosuUpdate">
	<input type="hidden" value="${vo.email }" name="email">
	회원번호 ${vo.m_num }<br>
	고수번호 ${vo.go_num }<br>
	아이디(이메일) ${vo.email }<br>
	회원이름 ${vo.name }<br>
	고수등급 <input type="text" name="grade" value="${vo.grade }"><br>
	고용횟수 <input type="text" name="employ" value="${vo.employ }"><br>
	포인트 <input type="text" name="point" value="${vo.point }"><br>
	<input type="submit" value="저장">
</form>
</body>
</html>
















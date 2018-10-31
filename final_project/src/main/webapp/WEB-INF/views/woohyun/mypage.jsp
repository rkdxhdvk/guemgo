<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보</h1>
아이디 ${vo.id }<br>
비밀번호 ${vo.pwd }<br>
이메일 ${vo.email }<br>
전화번호 ${vo.phone }<br>
가입일 ${vo.regdate }<br><br>
<a href="update">수정하기</a>
</body>
</html>
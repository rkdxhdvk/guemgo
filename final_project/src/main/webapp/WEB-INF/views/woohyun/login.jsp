<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	2018-10-31	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원로그인</h1>
<form method="post" action="login">
	이메일(아이디) <input type="text" name="email"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<div style="color:red;font-size: 12px">${errMsg }</div>
	<input type="submit" value="로그인">
</form>
<a href="/">홈으로</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
---------------------------------------------
2018-10-24	윤우현 파일 생성

---------------------------------------------
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
<h1>회원가입</h1>
<form method="post" action="UserInsert">
	아이디(이메일)<input type="text" name="email" required="required"><br>
	비밀번호<input type="password" name="pwd" required="required"><br>
	<!-- 비밀번호 확인<input type="password" name="pwdOk" required="required"><br> -->
	이름<input type="text" name="name" required="required"><br>
	<input type="submit" value="가입">
</form>

</body>
</html>
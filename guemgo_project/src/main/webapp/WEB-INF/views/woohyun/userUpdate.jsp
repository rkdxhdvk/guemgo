<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보 수정</h1>
<form method="post" action="UserUpdate">
	<%-- <input type="hidden" value="${vo.mnum }" name="mnum"> --%> <!-- 회원번호를 vo에 넣기 위해 필요 -->
	<input type="hidden" value="${vo.email }" name="email">
	회원번호 ${vo.m_num }<br>
	권한 ${vo.flag }<br>
	아이디(이메일) ${vo.email }<br>
	회원이름 <input type="text" name="name" value="${vo.name }"><br>
	비밀번호 <input type="password" name="pwd" value="${vo.pwd }"><br>
	회원등급 <input type="text" name="grade" value="${vo.grade }"><br>
	회원이미지 <input type="text" name="image" value="${vo.image }"><br>
	포인트 <input type="text" name="point" value="${vo.point }"><br>
	<fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd" var="d"/>
	가입일  ${d }<br>
	<input type="submit" value="저장">
</form>
</body>
</html>
















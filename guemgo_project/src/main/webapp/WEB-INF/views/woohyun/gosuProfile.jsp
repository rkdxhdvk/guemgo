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
<h1>고수 프로필 관리</h1>
<form method="post" action="GosuProfileUpdate">
	<h2>미디어(사진 업로드 기능 추가 예정)</h2>
	사진 추가하기
	<h2>고수소개 및 서비스 설명</h2>
		<textarea rows="10" cols="50" name="intro" style="width:500px"></textarea><br>
	<h2>자격증 또는 사업자 등록증</h2>	
		<input type="text" name="license" style="width:500px"><br>
	<h2>경력 </h2>
		<textarea rows="10" cols="50" name="career" style="width:500px"></textarea><br>
	
	<input type="submit" value="수정완료">
	<button type="button"><a href="<c:url value='gosupage' />">이전</a></button>	<br><br>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h1>포인트 충전</h1>
<table border=3 align="center">
	${vo.email } 님의 포인트 : ${vo.point } 점
</table>
<table border=3 align="center">
	<tr>
		포인트를 얼마나 충전하시겠습니까?
	</tr>
	<tr>
		<ul>
			<li>100포인트	1,000원(0%)</li>
			<li>300포인트	2,700원(10%)</li>
			<li>500포인트	4,000원(20%)</li>
			<li>1000포인트	7,000원(30%)</li>
		</ul>
	</tr>
</table>
<table border=3 align="center">
<h2>결제정보를 입력해주세요</h2>
카드번호<input type="text"><br>
유효기간<input type="text"><br>
생년월일(6자리)<input type="text"><br>
카드비밀번호 앞 2자리<input type="text"><br>
<input type="submit" name="payment" value="결제">

<p><a href="<c:url value='/'/>">홈으로
</table>
</body>
</html>
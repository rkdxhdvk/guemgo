<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>포인트 충전</h1>
	<p>${vo.email } 님의 포인트 : ${vo.point } 점
	<p>포인트를 얼마나 충전하시겠습니까?
<form>
		<ul>
			<li><input type="radio" name="point" value="100" onclick="" checked />100포인트	1,000원(0%)</li>
			<li><input type="radio" name="point" value="300" onclick=""  />300포인트	2,700원(10%)</li>
			<li><input type="radio" name="point" value="500" onclick=""  />500포인트	4,000원(20%)</li>
			<li><input type="radio" name="point" value="1000" onclick=""  />1000포인트	7,000원(30%)</li>
		</ul>
<h2>결제정보를 입력해주세요</h2>
	카드번호<input type="text"><br>
	유효기간<input type="text"><br>
	생년월일(6자리)<input type="text"><br>
	카드비밀번호 앞 2자리<input type="text"><br>
<input type="submit" name="payment" value="결제">
</form>

<p><a href="<c:url value='/'/>">홈으로

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  
---------------------------------------------
2018-10-24	윤우현 파일 생성

---------------------------------------------
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<%-- <h2>카테고리</h2>
<ul>
	<c:forEach var="header" items="${header }">
		<li>${header }</li>
	</c:forEach>
</ul> --%>

<h1>금고 메인 페이지(임시)</h1>
<ul>
	<li><a href="MemberInsert">회원가입</a></li>
	<li><a href="MemberList">회원목록</a></li>
	
	<!-- 회원에 따라 다른 페이지 보여주기 -->
	<c:choose>
		<c:when test="${empty sessionScope.email }">
			<li><a href="login">로그인</a></li>
		</c:when>
		<c:otherwise>
			아이디(이메일) : ${ sessionScope.email }<br>
			권한세션 : ${ sessionScope.mdiv }  
			<li><a href="logout">로그아웃</a></li>
 			<c:choose>
				<c:when test="${sessionScope.mdiv eq '0' }">
					<li><a href="admin">관리자페이지</a></li>
				</c:when>
				<c:when test="${sessionScope.mdiv eq '1' }">
					<li><a href="mypage">마이페이지</a></li>
				</c:when>
				<c:when test="${sessionScope.mdiv eq '2' }">
					<li><a href="gosupage">고수페이지</a></li>
				</c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>

	
	<li><a href="calendar">달력 임시</a></li>
	<li><a href="survey">설문조사 임시</a></li>
</ul>
<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5bd67c1a476c2f239ff66196/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>
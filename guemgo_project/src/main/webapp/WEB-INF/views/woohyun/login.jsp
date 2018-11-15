<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<%
	String area=request.getParameter("area"); 
	%>
	<input type="hidden" id="area" value="${area }">
	이메일(아이디) <input type="text" name="email"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<div style="color:red;font-size: 12px">${errMsg }</div>
	<input type="submit" value="로그인">
</form>
<a href="<c:url value='/'/>">홈으로</a>
</body>
<script type="text/javascript">
	var area="${area }";
	var area1=document.getElementById('area').value;
	console.log(document.getElementById('area').value);
/* 	document.getElementById("area").value="area"; */
	function a(){
		var area=document.getElementById("area");
		document.area.value="aaa";
	}
</script>
</html>
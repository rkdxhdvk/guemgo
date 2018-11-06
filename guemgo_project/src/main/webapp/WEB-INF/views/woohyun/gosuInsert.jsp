<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>고수로 가입하기</h1>
<form method="post" action="GosuInsert">
	<h2>본인인증(미구현)</h2>
		<input type="submit" value="본인인증하기">
	<br>
<%-- 불필요기능으로 확인되어 미사용	
	<h2>전문가로 활동하시는 분야를 선택해 주세요</h2>
	<br>
		<p>대분야 : 
			<select name="experience" class="form-control">
				<option value="">선택하세요</option>
			<c:forEach var="item" items="${cate_l }">
				<option value="${item.l_num }" >${item.l_name }</option>
			</c:forEach>
			</select>
		</p>
		<p>중분야 : 
			<select name="experience" class="form-control">
				<option value="">선택하세요</option>
			<c:forEach var="item" items="${cate_m }">
				<option value="${item.m_num }" >${item.m_name }</option>
			</c:forEach>
			</select>
		</p>
 --%>		
	<br>
	<h2>고수소개</h2>
		<textarea rows="10" cols="50" name="intro" style="width:500px"></textarea><br>
	<h2>관련자격증</h2>	
		<input type="text" name="license" style="width:500px"><br>
	<h2>경력</h2>
		<textarea rows="10" cols="50" name="career" style="width:500px"></textarea><br>
	
	<input type="submit" value="고수 가입하기">
	<input type="reset" value="취소">	<br><br>
</form>

<a href="<c:url value='/' />">홈으로</a>
</body>
</html>
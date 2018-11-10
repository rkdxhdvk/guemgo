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
	${sessionScope.email }
	<h1>스케줄 리스트</h1>
	<ul>
		<c:forEach items="${list }" var="vo">
			<li>
				<a href="<c:url value='/sche_detailList?email=${sessionScope.email }&scheduleNum=${vo.scheduleNum }'/>">
				${vo.lecturename }</a>
			</li>
		</c:forEach>
	</ul>
	<a href="<c:url value='/'/>">홈으로</a>
</body>
</html>
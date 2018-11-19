<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>자유게시판</title>
</head>
<body>
<%-- 	<%int num=Integer.parseInt(request.getParameter("lecturenum")); %>
	<%int other=Integer.parseInt(request.getParameter("other")); %>
	<%int email=Integer.parseInt(request.getParameter("email")); %> --%>
	<h1>${lecturenum }</h1>
	<h1>${other }</h1>
	<h1>${email }</h1>
	<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/makeRoom?email=${email }&other=${other }&lecturenum=${lecturenum }'/>"'>채팅걸기</button>

</body>
</html>
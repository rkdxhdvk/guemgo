<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'
	integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns'
	crossorigin='anonymous'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">채팅</p>
	<button type="button" class="btn btn-primary" style="float: right;"
		onclick="location='<c:url value='/'/>'">나가기</button>
</div>

<c:forEach var="vo" items="${list }">
	<div class="container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">${vo.room }</div>
			<div class="panel-body">
				<a href="<c:url value='/chat?room=${vo.room }'/>" class="pull-right">입장</a>
			</div>
		</div>
	</div>
</c:forEach>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>글쓰기</title>
</head>
<body>
	<form id="articleForm" action="<c:url value='/reInsert'/>"
		method="post">
		<input type="hidden" name="email" value="${sessionScope.email }">
		<input type="hidden" name="flag" value="${sessionScope.flag }">
		
		<h3 style="margin-bottom: 25px;">후기 등록</h3>
		<!-- 별점 주기 임시-->
		<input type="hidden" name="star" value=5>
		<!-- 누구에 대해 쓸거니? 어디서 가져올까-->
		<input type="hidden" name="other" value="min">
		<div class="form-group">
			<input type="text" class="form-control" name="title"
				placeholder="title" required>
		</div>
		<div class="form-group">
			<textarea class="form-control" name="content" placeholder="content"
				maxlength="140" rows="7"></textarea>
		</div>
		<!-- 누구에 대해 쓸거니? -->
		<button type="submit" id="submit" name="submit"
			class="btn btn-primary pull-right">글등록</button>
	</form>


</body>
</html>
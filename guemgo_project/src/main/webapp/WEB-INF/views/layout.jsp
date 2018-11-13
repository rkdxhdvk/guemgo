<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/go/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/go/resources/css/custom.css">
<link rel="stylesheet" type="text/css" href="/go/resources/boot/vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/boot/vendor/fontawesome-free/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/boot/vendor/simple-line-icons/css/simple-line-icons.css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/boot/css/landing-page.css">
<body>
<div id="wrap">
	<div id="header">
	<!-- 타일즈 포함하기 -->
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>

<script src="/go/resources/js/jquery.min.js"></script>
	<script src="/go/resources/js/pooper.js"></script>
	<script src="/go/resources/js/bootstrap.js"></script>
	<script src="<c:url value='resources/boot/vendor/jquery/jquery.min.js' />"/>
    <script src="<c:url value='${pageContext.request.contextPath}/resources/boot/vendor/bootstrap/js/bootstrap.bundle.min.js' />"/>
  	
</body>
</html>
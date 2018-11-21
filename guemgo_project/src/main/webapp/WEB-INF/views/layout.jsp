<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/boot2/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
<!-- <script src='resources/fullcalender/lib/jquery.min.js'></script> -->
<script src="${pageContext.request.contextPath}/resources/boot2/js/bootstrap.min.js"></script>

<!-- <link rel="stylesheet" href="/go/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/go/resources/css/custom.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="/go/resources/boot/vendor/bootstrap/css/bootstrap.css"> -->

<link href="${pageContext.request.contextPath}/resources/boot2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
   <link href="${pageContext.request.contextPath}/resources/boot2/css/landing-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/boot2/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'
	integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns'
	crossorigin='anonymous'>    
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
<style type="text/css">
	#content {
		min-height: 1100px;
	}
</style>
</head>
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

<!-- <script src="/go/resources/js/jquery.min.js"></script> -->
<!-- <script src="/go/resources/js/pooper.js"></script>
<script src="/go/resources/js/bootstrap.js"></script> -->

</body>
</html>
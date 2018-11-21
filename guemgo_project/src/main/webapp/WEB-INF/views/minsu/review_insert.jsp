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
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>글쓰기</title>
<style>
.star>.input,
.star>.input>label:hover,
.star>.input>input:focus+label,
.star>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('resources/img/grade_img.png')no-repeat;}
.star{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star>.input.focus{outline:1px dotted #ddd;}
.star>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star>.input>label:hover,
.star>.input>input:focus+label,
.star>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star>.input>label:hover~label{background-image: none;}
.star>.input>label[for="p1"]{width:30px;z-index:5;}
.star>.input>label[for="p2"]{width:60px;z-index:4;}
.star>.input>label[for="p3"]{width:90px;z-index:3;}
.star>.input>label[for="p4"]{width:120px;z-index:2;}
.star>.input>label[for="p5"]{width:150px;z-index:1;}
.star>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
</head>
<body>
	<form id="articleForm" action="<c:url value='/reInsert'/>" enctype="multipart/form-data"
		method="post">
		<input type="hidden" name="email" value="${sessionScope.email }">
		<input type="hidden" name="flag" value="${sessionScope.flag }">
		
		<h3 style="margin-bottom: 25px;">후기 등록</h3>
		<div class="form-group">
	<span class="star">
		<span class="input">
	    	<input type="radio" name="star" value="1" id="p1">
	    	<label for="p1">1</label>
	    	<input type="radio" name="star" value="2" id="p2">
	    	<label for="p2">2</label>
	    	<input type="radio" name="star" value="3" id="p3">
	    	<label for="p3">3</label>
	    	<input type="radio" name="star" value="4" id="p4">
	    	<label for="p4">4</label>
	    	<input type="radio" name="star" value="5" id="p5">
	    	<label for="p5">5</label>
  		</span>					
	</span>
	</div>
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/star.js"></script>
		
		<!-- 누구에 대해 쓸거니? 어디서 가져올까-->
		<input type="hidden" name="other" value="<%=request.getParameter("other") %>">
		<!-- ////////////////////////////// -->
		
		<div class="form-group">
			<input type="text" class="form-control" name="title"
				placeholder="title" required>
		</div>
		<div class="form-group">
			<textarea class="form-control" name="content" placeholder="content"
				maxlength="140" rows="7"></textarea>
		</div>
		<div class="form-group">
			 <input type="file" name="img">
		</div>
		<button type="submit" id="submit" name="submit"
			class="btn btn-primary pull-right">글등록</button>
	</form>


</body>
</html>
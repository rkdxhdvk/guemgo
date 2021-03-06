<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="https://soomgo.s3.ap-northeast-2.amazonaws.com/static/img/soomgo.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'
	integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns'
	crossorigin='anonymous'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>마이페이지</title>
<style>
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

@media screen and (max-width: 767px) {
	.row.content {
		height: auto;
	}
}
#content {
	min-height: 1100px;
	}
#menu {
	min-height: 1100px;
}
#footer {
	padding-top: 15px;
	height: 140px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<nav class="navbar navbar-default visible-xs">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">마이페이지</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a
							href="<c:url value='/UserUpdate?email=${sessionScope.email }'/>">개인정보
								수정</a></li>
						<li><a
							href="<c:url value='/pointCharge?email=${sessionScope.email }'/>">포인트
								충전</a></li>
						<li><a
							href="<c:url value='/pointRecord?email=${sessionScope.email }'/>">포인트
								내역조회</a></li>
						<li><a
							href="<c:url value='/scheList?email=${sessionScope.email }'/>">스케줄리스트</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="row content">
				<div id="menu" class="col-sm-2 sidenav hidden-xs">
					<tiles:insertAttribute name="menu" />
				</div>
				<div id="content" class="col-sm-10">
					<tiles:insertAttribute name="content" />
				</div>
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>
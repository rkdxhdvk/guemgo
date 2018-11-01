<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  
---------------------------------------------
2018-10-24	윤우현 파일 생성

---------------------------------------------
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>index.jsp</title>
	<link rel="stylesheet" href="/go/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/go/resources/css/custom.css">
</head>
<body>
<%-- <h2>카테고리</h2>
<ul>
	<c:forEach var="header" items="${header }">
		<li>${header }</li>
	</c:forEach>
</ul> --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="views/woohyun/index.jsp">Guemgo</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>	
		<a class="navbar-brand" href="calendar">달력 임시</a>
		<a class="navbar-brand" href="survey">설문조사 임시</a>
		<div id="navbar" class="collapse navbar-collapse">
			
			<form class="form-inline my-2 my-lg-10">
				고수찾기
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp"></a>
				</li>
				<li class="nav-item dropdown">
				 	<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
				 		회원님${ sessionScope.email }
				 	</a>
				 	<div class="dropdown-menu" aria-labelledby="dropdown">
				 		<!-- 회원에 따라 다른 페이지 보여주기 -->
						<c:choose>
							<c:when test="${empty sessionScope.email }">
								<a class="dropdown-item" href="login">로그인</a>
							</c:when>
							<c:otherwise>
								아이디(이메일) : ${ sessionScope.email }<br>
								권한세션 : ${ sessionScope.mdiv }  
								<a class="dropdown-item" href="logout">로그아웃</a>
					 			<c:choose>
									<c:when test="${sessionScope.mdiv eq '0' }">
										<a class="dropdown-item" href="admin">관리자페이지</a>
									</c:when>
									<c:when test="${sessionScope.mdiv eq '1' }">
										<a class="dropdown-item" href="mypage">마이페이지</a>
									</c:when>
									<c:when test="${sessionScope.mdiv eq '2' }">
										<a class="dropdown-item" href="gosupage">고수페이지</a>
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
				 		<a class="dropdown-item" href="MemberInsert">회원가입</a>
				 		<a class="dropdown-item" href="MemberList">회원목록</a>
				 	</div>
				</li>
			</ul>
		</div>
	</nav>
	
	
	<section class="container"><!-- 본문같은 내용을 담을때 사용 -->
		<form method="get" action="./index.jsp" class="form-inline mt-3"><!-- 위쪽으로3만큼 -->
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="음악">음악</option>
				<option value="미술">미술</option>
				<option value="요리">요리</option>
				<option value="디자인">디자인</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을입력하세요">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<!-- <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">test</a> -->
			<button type="button" class="btn btn-primary mx-1 mt-2" data-toggle="modal" data-target="#registerModal">매칭신청</button>
		</form>
	
	</section>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">어떤 서비스를 찾고 있나요?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span><!-- 닫기 아이콘(&times;) 넣기 -->
					</button>
				</div>
				<div class="modal-body">
					<form action="./survey.jsp" method="post">
						<input type="submit" class="btn btn-primary mx-1 mt-2" value="그래픽">
						<input type="submit" class="btn btn-primary mx-1 mt-2" value="포토샵">
						<input type="submit" class="btn btn-primary mx-1 mt-2" value="인디자인">
						<input type="submit" class="btn btn-primary mx-1 mt-2" value="패션디자인">
						<input type="submit" class="btn btn-primary mx-1 mt-2" value="한식">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="중식">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="양식">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="회화">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="동양화">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="서양화">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="유화">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="랩">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="재즈">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="발라드">
						<input type="button" class="btn btn-primary mx-1 mt-2" value="힙합">
					
					</form>
				
				</div>
			</div>
		</div>
	
	</div>
	
	<script src="/go/resources/js/jquery.min.js"></script>
	<script src="/go/resources/js/pooper.js"></script>
	<script src="/go/resources/js/bootstrap.js"></script>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5bd67c1a476c2f239ff66196/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>
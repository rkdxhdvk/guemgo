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
		<a class="navbar-brand" href="<c:url value='/'/>">Guemgo</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>	
		<a class="navbar-brand" href="calendar">달력 임시</a>
		<a class="navbar-brand" href="survey_test">설문조사 임시</a>
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
	
	
	<section class="container">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">어떤 서비스를 찾고 있나요?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 받고 싶은 과목은?</label><br>
								<input type="checkbox" name="area" value="포토샵">포토샵
								<input type="checkbox" name="area" value="포토샵">일러스트
								<input type="checkbox" name="area" value="포토샵">인디자인
								<input type="checkbox" name="area" value="포토샵">드로잉
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 받는 목적이 무엇인가요?</label><br>
						<!-- 		<input type="text" name="professorName" class="form-control" maxlength="20"> -->
								<input type="radio" name="area" value="포토샵" class="navbar-brand">취미
								<input type="radio" name="area" value="포토샵" class="navbar-brand">입시
								<input type="radio" name="area" value="포토샵" class="navbar-brand">선물
								<input type="radio" name="area" value="포토샵" class="navbar-brand">기타
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>요일</label>
								<select name="lectureYear" class="form-control">
									<option value="월">월</option>
									<option value="화">화</option>
									<option value="수">수</option>
									<option value="목">목</option>
									<option value="금">금</option>
									<option value="토">토</option>
									<option value="일">일</option>
									<option value="상관없음" selected>상관없음</option>
									</select>
							</div>
							<div class="form-group col-sm-6">
								<label>시간</label>
								<select name="semesterDivide" class="form-control">
									<option value="오전" selected>오전</option>
									<option value="점심">점심</option>
									<option value="오후">오후</option>
									<option value="저녁">저녁</option>
								</select>
							</div>
							
						</div>
					</form>
				
				</div>
			</div>
		</div>
	
	</section>
	
	
	
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
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
</head>
<body>
<%-- <h2>카테고리</h2>
<ul>
	<c:forEach var="header" items="${header }">
		<li>${header }</li>
	</c:forEach>
</ul> --%>
<!-- //////////////////////////Header////////////////////////// -->

<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="<c:url value='/'/>">Guemgo</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>	
		<a class="navbar-brand" href="<c:url value='/lectureName?email=${sessionScope.email }'/>">스케쥬우울</a>
		<!-- <a class="navbar-brand" href="survey_test">설문조사 임시</a> -->
		<a class="navbar-brand" href="<c:url value='/nboard/list'/>">공지게시판</a>
		<a class="navbar-brand" href="<c:url value='/gboard/list'/>">게시판</a>
		<a class="navbar-brand" href="<c:url value='/qboard/list'/>">qna게시판</a>
		<a class="navbar-brand" href="<c:url value='/reList'/>">후기게시판</a>
		<a class="navbar-brand" href="<c:url value='/room?email=${sessionScope.email }'/>">채팅</a>
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
				 		<!-- 로그인 구분에 따라 나오는 문구 변경 -->
				 		<c:choose>
				 			<c:when test="${empty sessionScope.flag }">
				 				로그인을 해주세요
				 			</c:when>
				 			<c:when test="${sessionScope.flag eq '0'}">
				 				관리자 ${ sessionScope.email } 님
				 			</c:when>
				 			<c:when test="${sessionScope.flag eq '1'}">
				 				${ sessionScope.email } 회원님
				 			</c:when>
				 			<c:when test="${sessionScope.flag eq '2'}">
				 				${ sessionScope.email } 고수님
				 			</c:when>
				 		</c:choose>
				 	</a>
				 	<div class="dropdown-menu" aria-labelledby="dropdown">
				 	<c:choose>
				 	<c:when test="${sessionScope.flag eq '2'}">
				 	<a class="dropdown-item" href="classinsert?email=${sessionScope.email }">강의 등록</a>
				 	<a class="dropdown-item" href="mylecture?email=${sessionScope.email }">내 강의 목록</a>
				 	<a class="dropdown-item" href="classlist?email=${sessionScope.email }">받은 요청서</a>
				 	</c:when>
				 	</c:choose>
				 	<input type="hidden" id="email" value="${sessionScope.email }">
				 		<!-- 회원에 따라 다른 페이지 보여주기 -->
						<c:choose>
							<c:when test="${empty sessionScope.email }">
								<a class="dropdown-item" href="login">로그인</a>
						 		<a class="dropdown-item" href="UserInsert">회원가입</a>
							</c:when>
							<c:otherwise>
								아이디(이메일) : ${ sessionScope.email }<br>
								권한세션 : ${ sessionScope.flag }<br>
								고수등록여부: ${ sessionScope.gosuYN }
								<a class="dropdown-item" href="logout">로그아웃</a>
					 			<c:choose>
					 				<c:when test="${sessionScope.flag eq '0' }">
										<a class="dropdown-item" href="admin">관리자페이지</a>
									</c:when>
									<c:when test="${sessionScope.flag eq '1' }">
									<a class="dropdown-item" href="classlist?gonum=4">보낸 요청서</a>
										<c:choose>
											<c:when test="${empty sessionScope.gosuYN }">
												<a class="dropdown-item" href="mypage">마이페이지</a>
												<span style="margin-left:25px">--------------------</span>
												<a class="dropdown-item" href="GosuInsertForm">고수로 가입하기</a>
											</c:when>
											<c:otherwise>
													<a class="dropdown-item" href="mypage">마이페이지</a>
													<a class="dropdown-item" href="eventlist?email=${sessionScope.email }">출석 이벤트</a>
													<span style="margin-left:25px">--------------------</span>
													<a class="dropdown-item" href="changeGosu">고수로 전환하기</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${sessionScope.flag eq '2' }">	
										<a class="dropdown-item" href="gosupage">고수페이지</a>
										<span style="margin-left:25px">--------------------</span>
										<a class="dropdown-item" href="changeUser">요청자로 전환하기</a>
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
				 	</div>
				</li>
			</ul>
		</div>
	</nav>
<!-- /////////////////////////////////////////////////////////// -->


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


	function logincheck(){
		var email=$('#email').val ();
		 if (email == '' || null || undefined || 0) {
		      alert("로그인하세요.");
		      document.location.href="<c:url value='/'/>";
		  }
	}


</script>
<!--End of Tawk.to Script-->
</body>
</html>

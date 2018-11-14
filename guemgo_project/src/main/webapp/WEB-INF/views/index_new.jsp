<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>아아아아</title>

    <!-- Bootstrap core CSS -->
    <!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
	
    <!-- Custom fonts for this template -->
    <!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.css">
     <!--<link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <!-- <link href="css/landing-page.min.css" rel="stylesheet"> -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/landing-page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap.min.css"> --%>
  </head>

  <body>
    <!-- Navigation -->
    <%-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="<c:url value='/'/>">Guemgo</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>	
		<a class="navbar-brand" href="<c:url value='/lectureName?email=${sessionScope.email }'/>">스케쥬우울</a>
		<!-- <a class="navbar-brand" href="survey_test">설문조사 임시</a> -->
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
	</nav> --%>

    <!-- Masthead -->
    <header class="masthead text-white text-center">
      <div class="overlay"></div>
      	<!-- <div class="container"> -->
         <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">고수를 찾으세여</h1>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto" >
            <section class="container"><!-- 본문같은 내용을 담을때 사용 -->
		<form method="get" action="search" class="form-inline mt-3" style="margin-left:190px; position: absolute;"><!-- 위쪽으로3만큼 -->
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="관심있는 분야를 입력하세요" style="text-align:center; width:500px; height:40px; ">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<!-- <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">test</a> -->
			<button type="button" class="btn btn-primary mx-1 mt-2" data-toggle="modal" data-target="#registerModal">매칭신청</button>
		</form>
	
	</section>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal" style="color:black;">어떤 서비스를 찾고 있나요?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span><!-- 닫기 아이콘(&times;) 넣기 -->
					</button>
				</div>
				<div class="modal-body">
					<form action="survey" method="get">
					<c:forEach var="vo" items="${list }">
						<input type="submit" name="area" class="btn btn-primary mx-1 mt-2" value="${vo.sname }" onclick="logincheck()">
					</c:forEach>
					</form>
				
				</div>
			</div>
		</div>
	
	</div>
            </form>
          </div> 
        </div> 
      <!-- </div> -->
    </header>
    
<!-------------------------------메인페이지 여기서 부터 바꿔주기----------------------------------------->
    <!-- Icons Grid -->
    <section class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-screen-desktop m-auto text-primary"></i>
              </div>
              <h3>Fully Responsive</h3>
              <p class="lead mb-0">This theme will look great on any device, no matter the size!</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-layers m-auto text-primary"></i>
              </div>
              <h3>Bootstrap 4 Ready</h3>
              <p class="lead mb-0">Featuring the latest build of the new Bootstrap 4 framework!</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-check m-auto text-primary"></i>
              </div>
              <h3>Easy to Use</h3>
              <p class="lead mb-0">Ready to use with your own content, or customize the source files!</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Image Showcases -->
    <section class="showcase">
      <div class="container-fluid p-0">
        <div class="row no-gutters">

          <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('${pageContext.request.contextPath}/resources/boot/img/bg-showcase-1.jpg');"></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>Fully Responsive Design</h2>
            <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6 text-white showcase-img" style="background-image: url('${pageContext.request.contextPath}/resources/boot/img/bg-showcase-2.jpg');"></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>Updated For Bootstrap 4</h2>
            <p class="lead mb-0">Newly improved, and full of great utility classes, Bootstrap 4 is leading the way in mobile responsive web development! All of the themes on Start Bootstrap are now using Bootstrap 4!</p>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('${pageContext.request.contextPath}/resources/boot/img/bg-showcase-3.jpg');"></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>Easy to Use &amp; Customize</h2>
            <p class="lead mb-0">Landing Page is just HTML and CSS with a splash of SCSS for users who demand some deeper customization options. Out of the box, just add your content and images, and your new landing page will be ready to go!</p>
          </div>
        </div>
      </div>
    </section>
	
    <!-- Testimonials -->
    <section class="testimonials text-center bg-light">
      <div class="container">
        <h2 class="mb-5">What people are saying...</h2>
        <div class="row">
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="${pageContext.request.contextPath}/resoures/boot/img/testimonials-1.jpg" alt="">
              <h5>Margaret E.</h5>
              <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="${pageContext.request.contextPath}/resources/boot/img/testimonials-2.jpg" alt="">
              <h5>Fred S.</h5>
              <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="${pageContext.request.contextPath}/resources/boot/img/testimonials-3.jpg" alt="">
              <h5>Sarah	W.</h5>
              <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Call to Action -->
    <section class="call-to-action text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h2 class="mb-4">Ready to get started? Sign up now!</h2>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
            <form>
              <div class="form-row">
                <div class="col-12 col-md-9 mb-2 mb-md-0">
                  <input type="email" class="form-control form-control-lg" placeholder="Enter your email...">
                </div>
                <div class="col-12 col-md-3">
                  <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
<!-- ------------------------메인 바꾸기-------------------------------------- -->
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
    <!-- Bootstrap core JavaScript -->
    <!--  <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
    <%-- <script src="<c:url value='resources/vendor/jquery/jquery.min.js' />"/>
    <script src="<c:url value='${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' />"/>
  	<script src="${pageContext.request.contextPath}/resources/js/pooper.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script> --%>
  	
  </body>

</html>

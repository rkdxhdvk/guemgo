<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/slick-theme.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/slick.css'/>" />
<script type="text/javascript" src="<c:url value='resources/js/slick.min.js'/>"></script>

<script type="text/javascript">
/* $(document).ready(function() { // 로그아웃
	var area="${area }";
	if(area==null || area==""){
		
	}else{
		//s $("#surveybt").hide(); 
		$("#surveybt").trigger('click');
	}
}); */
	$(document).ready(function() {
		var area = "${area }";
		if (area == null || area == "") {

		} else {
			$('#registerModal').modal('show');
		}
	});

	
</script>
	<!-- Navigation -->
	<!-- Header -->
	<a name="about"></a>
	<div class="intro-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="intro-message" style="margin-bottom:100px;">
						<h1 style="font-size: 50px">금고가 딱! 맞는 예술가를 찾아드려요</h1><br>
						<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
							<section class="container">
								<!-- 본문같은 내용을 담을때 사용 -->
								<form method="get" action="search" class="form-inline mt-3"
									style="margin-left: auto; margin-right:auto; display:block; ">
									<!-- 위쪽으로3만큼 -->
									<input type="text" name="search" class="form-control mx-1 mt-2"
										placeholder="관심있는 분야를 입력하세요"
										style="text-align: center; width: 500px; height: 40px;">
									<button type="submit" class="btn btn-primary mx-1 mt-2" style="margin-bottom: 0px;margin-right: 0px;">검색</button>
									<!-- <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">test</a> -->
									<button type="button" class="btn btn-primary mx-1 mt-2"
										data-toggle="modal" data-target="#registerModal" style="margin-bottom: 0px;margin-right: 0px;">매칭신청</button>
								</form>
							</section>
							<div class="modal fade" id="registerModal" tabindex="-1"
								role="dialog" aria-labelledby="modal" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
												<!-- 닫기 아이콘(&times;) 넣기 -->
											</button>
											<h4 class="modal-title" id="modal" style="color: black;">어떤
												서비스를 찾고 있나요? </h4>
											
										</div>
										<div class="modal-body">
											<form action="survey" method="get">
												<c:forEach var="vo" items="${list }">
													<input type="submit" name="area"
														class="btn btn-primary mx-1 mt-2" value="${vo.sname }"
														onclick="logincheck()">
												</c:forEach>
											</form>

										</div>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="panel panel-default" style="background-color: #2f2f2f;opacity: 0.5;">
	  <div class="panel-body">
	  	<div class="row">
		  <div class="col-sm-4">누적 요청서<br>
		  							123,123개</div>
		  <div class="col-sm-4">등록된 고수<br>
		  							1,234명</div>
		  <div class="col-sm-4">평균 리뷰별점<br>
		  							4.3점</div>
		</div>
	  </div>
	</div>
		<!-- /.container -->
	</div>
	<!-- /.intro-header -->


	<!-- ///////////////////////////////////////메인 추가//////////////////////////////////////////////// -->
	<!-- Page Content -->
	
	<div class="panel panel-default" style="text-align: center;">
	  <div class="panel-body">
	  	<div class="row">
		  <div class="col-sm-3">음악</div>
		  <div class="col-sm-3">미술</div>
		  <div class="col-sm-3">요리</div>
		  <div class="col-sm-3">디자인</div>
		</div>
	  </div>
	</div>
<div class="container">
  <h2>추천 고수</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="resources/images/1.jpg" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
          <h3>Los Angeles</h3>
          <p>LA is always so much fun!</p>
        </div>
      </div>

      <div class="item">
        <img src="resources/images/2.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago!</p>
        </div>
      </div>
    
      <div class="item">
        <img src="resources/images/3.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p>We love the Big Apple!</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>	
	
	
	
	
<div class="container-fluid">
	<h2>추천 강의</h2>
	<div class="slick-items">

        <div style="margin: 10px;"><img alt="" src="resources/images/1.png">
        gggggg</div>
        
		 <div style="margin: 10px;"><img alt="" src="resources/images/2.png">
		 aaaaa</div>

		 <div style="margin: 10px;"><img alt="" src="resources/images/3.png">
		 ddddd</div>

		 <div style="margin: 10px;"><img alt="" src="resources/images/4.png">
		 ccccc</div>

		 <div style="margin: 10px;"><img alt="" src="resources/images/5.png">
		 dddd</div>
		
    </div>
</div>
    

	<a name="services"></a>
	<div class="content-section-a">

		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						Death to the Stock Photo:<br>Special Thanks
					</h2>
					<p class="lead">
						A special thanks to <a target="_blank"
							href="http://join.deathtothestockphoto.com/">Death to the
							Stock Photo</a> for providing the photographs that you see in this
						template. Visit their website to become a member.
					</p>
				</div>
				<div class="col-lg-5 col-lg-offset-2 col-sm-6">
					<img class="img-responsive"
						src="${pageContext.request.contextPath}/resources/boot2/img/ipad.png"
						alt="">
				</div>
			</div>

		</div>
		<!-- /.container -->

	</div>
	<!-- /.content-section-a -->

	<div class="content-section-b">

		<div class="container">

			<div class="row">
				<div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
					<hr class="section-heading-spacer">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						3D Device Mockups<br>by PSDCovers
					</h2>
					<p class="lead">
						Turn your 2D designs into high quality, 3D product shots in
						seconds using free Photoshop actions by <a target="_blank"
							href="http://www.psdcovers.com/">PSDCovers</a>! Visit their
						website to download some of their awesome, free photoshop actions!
					</p>
				</div>
				<div class="col-lg-5 col-sm-pull-6  col-sm-6">
					<img class="img-responsive"
						src="${pageContext.request.contextPath}/resources/boot2/img/dog.png"
						alt="">
				</div>
			</div>

		</div>
		<!-- /.container -->

	</div>
	<!-- /.content-section-b -->

	<div class="content-section-a">

		<div class="container">

			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						Google Web Fonts and<br>Font Awesome Icons
					</h2>
					<p class="lead">
						This template features the 'Lato' font, part of the <a
							target="_blank" href="http://www.google.com/fonts">Google Web
							Font library</a>, as well as <a target="_blank"
							href="http://fontawesome.io">icons from Font Awesome</a>.
					</p>
				</div>
				<div class="col-lg-5 col-lg-offset-2 col-sm-6">
					<img class="img-responsive"
						src="${pageContext.request.contextPath}/resources/boot2/img/phones.png"
						alt="">
				</div>
			</div>

		</div>
		<!-- /.container -->

	</div>
	<!-- /.content-section-a -->

	<a name="contact"></a>
	<div class="banner">

		<div class="container">

			<div class="row">
				<div class="col-lg-6">
					<h2>Connect to Start Bootstrap:</h2>
				</div>
				<div class="col-lg-6">
					<ul class="list-inline banner-social-buttons">
						<li><a href="https://twitter.com/SBootstrap"
							class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i>
								<span class="network-name">Twitter</span></a></li>
						<li><a
							href="https://github.com/IronSummitMedia/startbootstrap"
							class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i>
								<span class="network-name">Github</span></a></li>
						<li><a href="#" class="btn btn-default btn-lg"><i
								class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
						</li>
					</ul>
				</div>
			</div>

		</div>
		<!-- /.container -->

	</div>
	<!-- /.banner -->

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

<script type="text/javascript">



	$('.slick-items').slick({

		slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,

	});



</script>    



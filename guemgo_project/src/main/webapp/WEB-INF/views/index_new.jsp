<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Landing Page - Start Bootstrap Theme</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/boot2/css2/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/boot2/css2/custom.css"> --%>
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/boot2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/boot2/css/landing-page.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/boot2/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!-- <script type="text/javascript"
	src="http://code.jquery.com/jquery-1.4.4.min.js"></script> -->
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
<title>금고</title>
<body>
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
		<!-- /.container -->

	</div>
	<!-- /.intro-header -->


	<!-- ///////////////////////////////////////메인 추가//////////////////////////////////////////////// -->
	<!-- Page Content -->

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
</body>

</html>

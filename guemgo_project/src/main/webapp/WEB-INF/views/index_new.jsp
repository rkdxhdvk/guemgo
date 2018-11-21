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
	  <div class="panel-body" style="background-color: rgba( 0, 0, 0, 0.5 );font-size: x-large;">
	  	<div class="row" >
		  <div class="col-sm-4">누적 요청서<br>
		  							123,123개</div>
		  <div class="col-sm-4">등록된 고수<br>
		  							1,234명</div>
		  <div class="col-sm-4">평균 리뷰별점<br>
		  							4.3점</div>
		</div>
	  </div>
		<!-- /.container -->
	</div>
	<!-- /.intro-header -->


	<!-- ///////////////////////////////////////메인 추가//////////////////////////////////////////////// -->
	<!-- Page Content -->
	<div class="panel-group">
		<div class="panel panel-default" style="text-align: center;padding: 15px;">
		<div class="panel-title">
			
			<div class="row" style="padding-left: 12px;padding-right: 12px;">
			  <div class="col-sm-3"><a data-toggle="collapse" href="#collapse1"><i class="fas fa-music fa-2x"></i><br>음악</a></div>
			  <div class="col-sm-3"><a data-toggle="collapse" href="#collapse1"><i class="fas fa-palette fa-2x"></i><br>미술</a></div>
			  <div class="col-sm-3"><a data-toggle="collapse" href="#collapse1"><i class="fas fa-drumstick-bite fa-2x"></i><br>요리</a></div>
			  <div class="col-sm-3"><a data-toggle="collapse" href="#collapse1"><i class="fab fa-apple fa-2x"></i><br>디자인</a></div>
			</div>
		</div>
		   <div id="collapse1" class="panel-collapse collapse">
		      <ul class="list-group">
		        <li class="list-group-item">
		        <div class="row">
			  <div class="col-sm-3">보컬</div>
			  <div class="col-sm-3">회화</div>
			  <div class="col-sm-3">조리</div>
			  <div class="col-sm-3">그래픽디자인</div>
			</div>
			</li>
		        <li class="list-group-item">
		         <div class="row">
			  	<div class="col-sm-3">작곡</div>
				  <div class="col-sm-3">동양화</div>
				  <div class="col-sm-3">베이킹</div>
				  <div class="col-sm-3">패션디자인</div>
				</div>
		        </li>
		        <li class="list-group-item">
		         <div class="row">
			  <div class="col-sm-3">악기</div>
			  <div class="col-sm-3">애니메이션</div>
			  <div class="col-sm-3">식음료</div>
			  <div class="col-sm-3">제품디자인</div>
			</div>
		      </ul>
		    </div>
		  </div>
	</div>
	<!--  
<div class="container">
  <h2>추천 고수</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    Indicators
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    Wrapper for slides
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

    Left and right controls
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
	-->
	
	
	
<div class="container">
	<h2>추천 고수</h2>
	<div class="slick-items">
        <div style="margin: 11px;"><img alt="" src="resources/gosuImg/gosu01.png">
        </div>
        
		 <div style="margin: 10px;"><img alt="" src="resources/gosuImg/gosu02.png">
		 </div>

		 <div style="margin: 10px;"><img alt="" src="resources/gosuImg/gosu03.png">
		 </div>

		 <div style="margin: 10px;"><img alt="" src="resources/gosuImg/gosu04.png">
		 </div>

		 <div style="margin: 10px;"><img alt="" src="resources/gosuImg/gosu05.png">
		 </div>
		
    </div>
</div>
    
<div style="text-align: center;">
	<img alt="" src="resources/gosuImg/gosuMain.png">
</div>
<div style="text-align: center;">
	<img alt="" src="resources/gosuImg/gosuMain2.png">
</div>


	
	

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


	$('.slick-items').slick({

		slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,

	});



</script>    



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/slick-theme.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='resources/css/slick.css'/>" />
<script type="text/javascript" src="<c:url value='resources/js/slick.min.js'/>"></script>
<style>
div p {
  overflow: hidden; 
  text-overflow: ellipsis;
  height: 100px;
}
#gosuImg {
	margin: 15px;
}
</style>
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
	<div class="intro-header" style="padding-top: 145px;">
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
			  <div class="col-sm-3"><a href="/go/search?search=보컬">보컬</a></div>
			  <div class="col-sm-3"><a href="/go/search?search=회화">회화</a></div>
			  <div class="col-sm-3"><a href="/go/search?search=조리">조리</a></div>
			  <div class="col-sm-3"><a href="/go/search?search=그래픽디자인">그래픽디자인</a></div>
			</div>
			</li>
		        <li class="list-group-item">
		         <div class="row">
			  	<div class="col-sm-3"><a href="/go/search?search=작곡">작곡</a></div>
				  <div class="col-sm-3"><a href="/go/search?search=동양화">동양화</a></div>
				  <div class="col-sm-3"><a href="/go/search?search=베이킹">베이킹</a></div>
				  <div class="col-sm-3"><a href="/go/search?search=패션디자인">패션디자인</a></div>
				</div>
		        </li>
		        <li class="list-group-item">
		         <div class="row">
			  <div class="col-sm-3"><a href="/go/search?search=악기">악기</a></div>
			  <div class="col-sm-3"><a href="/go/search?search=애니메이션">애니메이션</a></div>
			  <div class="col-sm-3"><a href="/go/search?search=식음료">식음료</a></div>
			  <div class="col-sm-3"><a href="/go/search?search=제품디자인">제품디자인</a></div>
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
	<c:forEach var="gosuVo" items="${gosuList }" begin="1" end="5">
		<div class="gosuImg">
       		<div style="width: 378px;height: 321px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="col-sm-4">
				<c:choose>
					<c:when test="${gosuVo.g_image != ' ' }">
						<img src="resources/upload/gosuImg/${gosuVo.g_image }" width="85" height="85" style="border-radius: 50%"/>
					</c:when>
					<c:otherwise>
						<img src="resources/gosuImg/gosu2.png" width="85" height="85" style="border-radius: 50%"/>
					</c:otherwise>
				</c:choose>
				</div>	 <!-- users 테이블의 image 출력  -->
				<div class="col-sm-8">
				<span style="font-size: large;">
				${gosuVo.name }<br>
				<i class='far fa-star'></i> 평점 4.5&nbsp;&nbsp;
				</span>
				<br><br>
				<span>
				<i class='fas fa-map-marker-alt'></i> 태초마을&nbsp;&nbsp;
				</span>
			</div> 
			</div>
			<br>
			<span style="font-size: large;">포켓몬친구들</span>
			<br><br>
			<p>${gosuVo.intro } </p>
			<button type="button" style="float: right;" class="btn btn-primary" title="글쓰기"
					onclick="location.href ='<c:url value='/gosuProfileDetail?email=1'/>'">더보기</button>
		</div>
		</div>
	</c:forEach>
    </div>
</div>
	
<div style="text-align: center;">
	<img alt="" src="resources/gosuImg/gosuMain.png">
</div>
<div style="text-align: center;">
	<img alt="" src="resources/gosuImg/gosuMain2.png">
</div>
<div class="container">
<h1>금고를 통해 도움 받았어여!!</h1>
<div class="slick-items">
		<c:forEach items="${reviewList}" var="vo" varStatus="status">
		<div class="gosu">
		<div style="width: 350px;height: 700px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="img" 
			style="position: relative;
		    background-image: url(resources/upload/${userdetail[status.index].user});                                                               
		    height: 380px;
		    background-size: cover;"><!-- css따로 -->
       		 <div class="content" 
       		 style=" position: relative;
		     top:90%;
		     transform: translate(-50%, -50%);                                                                   
		     font-size:5rem;
		     color: white;
		     z-index: 2;
		     text-align: left;">
            		<h4>${vo.title }</h4>
            		<h4>${userdetail[status.index].gosuname} ${userdetail[status.index].lecture}고수님</h4>
        	</div>
        	
        	<div class="img-cover" 
        	style="position: absolute;
  			 height: 100%;
   			width: 100%;
   			background-color: rgba(0, 0, 0, 0.4);                                                                 
   			z-index:1;"></div>
    		</div>
			</div>
			<p>${vo.content }</p>
			<p>-------------------------------------------------------</p>
				<img src="resources/gosuImg/gosu3.png" width="75" height="75" style="float: left;"/>
				<span style="font-size: large;">${userdetail[status.index].username}<br>
				;<i class='far fa-star'></i>${vo.star }점&nbsp;&nbsp;
				</span>
		</div>
		</div>
		</c:forEach>
		<div class="gosu">
		<div style="width: 350px;height: 700px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="img" 
			style="position: relative;
		    background-image: url(resources/gosuImg/gosu3.png);                                                               
		    height: 380px;
		    background-size: cover;">
       		 <div class="content" 
       		 style=" position: absolute;
		     top:50%;
		     left:50%;
		     transform: translate(-50%, -50%);                                                                   
		     font-size:5rem;
		     color: white;
		     z-index: 2;
		     text-align: left;">
            		<h2>후기 제목</h2>
        	</div>
        	
        	<div class="img-cover" 
        	style="position: absolute;
  			 height: 100%;
   			width: 100%;
   			background-color: rgba(0, 0, 0, 0.4);                                                                 
   			z-index:1;"></div>
    		</div>
			</div>
			<p>게시글 내용</p>
			<p>-------------------------------------------------------</p>
				<img src="resources/gosuImg/gosu3.png" width="75" height="75" style="float: left;"/>
				<span style="font-size: large;">회원이름<br>
				<i class='far fa-star'></i> vo.star 점&nbsp;&nbsp;
				</span>
		</div>
		</div>
		<div class="gosu">
		<div style="width: 350px;height: 700px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="img" 
			style="position: relative;
		    background-image: url(resources/gosuImg/gosu3.png);                                                               
		    height: 380px;
		    background-size: cover;">
       		 <div class="content" 
       		 style=" position: absolute;
		     top:50%;
		     left:50%;
		     transform: translate(-50%, -50%);                                                                   
		     font-size:5rem;
		     color: white;
		     z-index: 2;
		     text-align: left;">
            		<h2>후기 제목</h2>
        	</div>
        	
        	<div class="img-cover" 
        	style="position: absolute;
  			 height: 100%;
   			width: 100%;
   			background-color: rgba(0, 0, 0, 0.4);                                                                 
   			z-index:1;"></div>
    		</div>
			</div>
			<p>게시글 내용</p>
			<p>-------------------------------------------------------</p>
				<img src="resources/gosuImg/gosu3.png" width="75" height="75" style="float: left;"/>
				<span style="font-size: large;">회원이름<br>
				<i class='far fa-star'></i> vo.star 점&nbsp;&nbsp;
				</span>
		</div>
		</div>
		<div class="gosu">
		<div style="width: 350px;height: 700px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="img" 
			style="position: relative;
		    background-image: url(resources/gosuImg/gosu3.png);                                                               
		    height: 380px;
		    background-size: cover;">
       		 <div class="content" 
       		 style=" position: absolute;
		     top:50%;
		     left:50%;
		     transform: translate(-50%, -50%);                                                                   
		     font-size:5rem;
		     color: white;
		     z-index: 2;
		     text-align: left;">
            		<h2>후기 제목</h2>
        	</div>
        	
        	<div class="img-cover" 
        	style="position: absolute;
  			 height: 100%;
   			width: 100%;
   			background-color: rgba(0, 0, 0, 0.4);                                                                 
   			z-index:1;"></div>
    		</div>
			</div>
			<p>게시글 내용</p>
			<p>-------------------------------------------------------</p>
				<img src="resources/gosuImg/gosu3.png" width="75" height="75" style="float: left;"/>
				<span style="font-size: large;">회원이름<br>
				<i class='far fa-star'></i> vo.star 점&nbsp;&nbsp;
				</span>
		</div>
		</div>
		<div class="gosu">
		<div style="width: 350px;height: 700px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="img" 
			style="position: relative;
		    background-image: url(resources/gosuImg/gosu3.png);                                                               
		    height: 380px;
		    background-size: cover;">
       		 <div class="content" 
       		 style=" position: absolute;
		     top:50%;
		     left:50%;
		     transform: translate(-50%, -50%);                                                                   
		     font-size:5rem;
		     color: white;
		     z-index: 2;
		     text-align: left;">
            		<h2>후기 제목</h2>
        	</div>
        	
        	<div class="img-cover" 
        	style="position: absolute;
  			 height: 100%;
   			width: 100%;
   			background-color: rgba(0, 0, 0, 0.4);                                                                 
   			z-index:1;"></div>
    		</div>
			</div>
			<p>게시글 내용</p>
			<p>-------------------------------------------------------</p>
				<img src="resources/gosuImg/gosu3.png" width="75" height="75" style="float: left;"/>
				<span style="font-size: large;">회원이름<br>
				<i class='far fa-star'></i> vo.star 점&nbsp;&nbsp;
				</span>
		</div>
		</div>
		<div class="gosu">
		<div style="width: 350px;height: 700px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="img" 
			style="position: relative;
		    background-image: url(resources/gosuImg/gosu3.png);                                                               
		    height: 380px;
		    background-size: cover;">
       		 <div class="content" 
       		 style=" position: absolute;
		     top:50%;
		     left:50%;
		     transform: translate(-50%, -50%);                                                                   
		     font-size:5rem;
		     color: white;
		     z-index: 2;
		     text-align: left;">
            		<h2>후기 제목</h2>
        	</div>
        	
        	<div class="img-cover" 
        	style="position: absolute;
  			 height: 100%;
   			width: 100%;
   			background-color: rgba(0, 0, 0, 0.4);                                                                 
   			z-index:1;"></div>
    		</div>
			</div>
			<p>게시글 내용</p>
			<p>-------------------------------------------------------</p>
				<img src="resources/gosuImg/gosu3.png" width="75" height="75" style="float: left;"/>
				<span style="font-size: large;">회원이름<br>
				<i class='far fa-star'></i> vo.star 점&nbsp;&nbsp;
				</span>
		</div>
		</div>
		<div class="gosu">
		<div style="width: 350px;height: 700px;border: solid 1px gray;padding: 15px;border-radius: 5px;border-color: #ddd;">
			<div class="row">
			<div class="img" 
			style="position: relative;
		    background-image: url(resources/gosuImg/gosu3.png);                                                               
		    height: 380px;
		    background-size: cover;">
       		 <div class="content" 
       		 style=" position: absolute;
		     top:50%;
		     left:50%;
		     transform: translate(-50%, -50%);                                                                   
		     font-size:5rem;
		     color: white;
		     z-index: 2;
		     text-align: left;">
            		<h2>후기 제목</h2>
        	</div>
        	
        	<div class="img-cover" 
        	style="position: absolute;
  			 height: 100%;
   			width: 100%;
   			background-color: rgba(0, 0, 0, 0.4);                                                                 
   			z-index:1;"></div>
    		</div>
			</div>
			<p>게시글 내용</p>
			<p>-------------------------------------------------------</p>
				<img src="resources/gosuImg/gosu3.png" width="75" height="75" style="float: left;"/>
				<span style="font-size: large;">회원이름<br>
				<i class='far fa-star'></i> vo.star 점&nbsp;&nbsp;
				</span>
		</div>
		</div>	
		</div>
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



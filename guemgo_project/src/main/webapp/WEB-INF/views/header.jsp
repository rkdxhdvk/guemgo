<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!--  
---------------------------------------------
2018-10-24	윤우현 파일 생성
---------------------------------------------
-->
<%-- <h2>카테고리</h2>
<ul>
	<c:forEach var="header" items="${header }">
		<li>${header }</li>
	</c:forEach>
</ul> --%>
<!-- //////////////////////////Header////////////////////////// -->
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="display: flex;padding-left: 80px;padding-right: 80px;">
<%-- 		<a class="navbar-brand" href="<c:url value='/'/>">Guemgo</a> --%>
		<!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button> -->
<%-- 		<a class="navbar-brand" href="<c:url value='/lectureName?email=${sessionScope.email }'/>">스케쥬우울</a> --%>
		<!-- <a class="navbar-brand" href="survey_test">설문조사 임시</a> -->
		<a class="navbar-brand" href="<c:url value='/nboard/list'/>" style="padding-top: 80px;">공지게시판</a>
		<a class="navbar-brand" href="<c:url value='/gboard/list'/>" style="padding-top: 80px;">게시판</a>
		<a class="navbar-brand" href="<c:url value='/qboard/list'/>" style="padding-top: 80px;">qna게시판</a>
		<a class="navbar-brand" href="<c:url value='/'/> " style="display:block; margin-right:auto;
    margin-left:auto; "><img alt="leaf" src="${pageContext.request.contextPath}/resources/boot2/css/logo.jpg" width="150px" height="80px"  ></a>
		<a class="navbar-brand" href="<c:url value='/reList'/>" style="padding-top: 80px;">후기게시판</a>
		<a class="navbar-brand" href="<c:url value='/room?email=${sessionScope.email }'/>" style="padding-top: 80px;">채팅</a>
		<a class="navbar-brand" href="<c:url value='/findgosu'/>" style="padding-top: 80px;">고수찾기</a>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto" style="padding-top: 60px;list-style: none;">
				
				<li class="nav-item dropdown">
				 	<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
				 		<!-- 로그인 구분에 따라 나오는 문구 변경 -->
				 		<c:choose>
				 			<c:when test="${empty sessionScope.flag }">
				 				로그인을 해주세요
				 			</c:when>
				 			<c:when test="${sessionScope.flag eq '0'}">
				 				<img alt="" src="${pageContext.request.contextPath}/resources/gosuImg/gosu2.png"> 관리자 ${ sessionScope.email } 님
				 			</c:when>
				 			<c:when test="${sessionScope.flag eq '1'}">
				 				<img alt="" src="${pageContext.request.contextPath}/resources/gosuImg/gosu2.png"> ${ sessionScope.email } 회원님
				 			</c:when>
				 			<c:when test="${sessionScope.flag eq '2'}">
				 				<img alt="" src="${pageContext.request.contextPath}/resources/gosuImg/gosu2.png"> ${ sessionScope.email } 고수님
				 			</c:when>
				 		</c:choose>
				 	</a>
				 	<div class="dropdown-menu" aria-labelledby="dropdown">
				 	<c:choose>
				 	<c:when test="${sessionScope.flag eq '2'}">
				 	<a class="dropdown-item" href="<c:url value='/classinsert?email=${sessionScope.email }'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-lecturer-24.png">&nbsp 강의 등록</a><br>
				 	<a class="dropdown-item" href="<c:url value='/mylecture?email=${sessionScope.email }'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-class-filled-24.png">&nbsp 내 강의 목록</a><br>
				 	<a class="dropdown-item" href="<c:url value='/receiveList?email=${sessionScope.email }'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-invite-24.png">&nbsp 받은 요청서</a><br>
				 	</c:when>
				 	</c:choose>
				 	<input type="hidden" id="email" value="${sessionScope.email }">
				 		<!-- 회원에 따라 다른 페이지 보여주기 -->
						<c:choose>
							<c:when test="${empty sessionScope.email }">
								<a class="dropdown-item" data-toggle="modal" data-target="#loginModal" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-login-24.png">&nbsp 로그인</a>	<br><!-- 로그인시 modal 사용 -->
						 		<a class="dropdown-item" data-toggle="modal" data-target="#userInsertModal" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-join-24.png">&nbsp 회원가입</a><br>
							</c:when>
							<c:otherwise>
								<%-- 
								아이디(이메일) : ${ sessionScope.email }<br>
								권한세션 : ${ sessionScope.flag }<br>
								고수등록여부: ${ sessionScope.gosuYN }
								 --%>
								
					 			<c:choose>
					 				<c:when test="${sessionScope.flag eq '0' }">
										<a class="dropdown-item" href="<c:url value='/admin'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-male-user-24.png">&nbsp 관리자페이지</a><br>
									</c:when>
									<c:when test="${sessionScope.flag eq '1' }">
									<a class="dropdown-item" href="<c:url value='/sendlist?email=${sessionScope.email }'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-request-service-24.png">&nbsp 보낸 요청서</a><br>
										<c:choose>
											<c:when test="${empty sessionScope.gosuYN }">
												<a class="dropdown-item" href="<c:url value='/mypage'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-male-user-filled-24.png">&nbsp 마이페이지</a><br>
												<a class="dropdown-item" href="<c:url value='/eventlist?email=${sessionScope.email }'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-calendar-24.png">&nbsp 출석 이벤트</a><br>
												<span>------------------------------</span><br>
												<a class="dropdown-item" href="<c:url value='/GosuInsertForm'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-guru-24.png">&nbsp 고수로 가입하기</a><br>
											</c:when>
											<c:otherwise>
													<a class="dropdown-item" href="<c:url value='/mypage'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-male-user-filled-24.png">&nbsp 마이페이지</a><br>
													<a class="dropdown-item" href="<c:url value='/eventlist?email=${sessionScope.email }'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-calendar-24.png">&nbsp 출석 이벤트</a><br>
													<span style="margin:5px">----------------------------</span><br>
													<a class="dropdown-item" href="<c:url value='/changeGosu'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-sync-24.png">&nbsp 고수로 전환하기</a><br>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${sessionScope.flag eq '2' }">	
										<a class="dropdown-item" href="<c:url value='/gosupage'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-meditation-24.png">&nbsp 고수페이지</a><br>

										<span style="margin:5px">----------------------------</span><br>
										<a class="dropdown-item" href="<c:url value='/changeUser'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-sync-24.png">&nbsp 요청자로 전환하기</a><br>
									</c:when>
								</c:choose>
								<a class="dropdown-item" href="<c:url value='/logout'/>" style="margin-left:10px"><img src="${pageContext.request.contextPath}/resources/img/static/icons8-sign-out-24.png">&nbsp 로그아웃</a><br>
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

<!--///////////// 로그인 모달 사용 //////////// -->
	<!-- 모달 팝업 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
<!-- 		<h4 class="modal-title" id="myModalLabel">회원 로그인</h4> -->
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	      </div>
			<form name="login_form" method="post" action="<c:url value='/login'/>" onSubmit="return checkLogin()">
			      <div class="modal-body">
<!-- 						<div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                     -->
           			<div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">회원 로그인</div>
                        <div style="float:right; font-size: 90%; position: relative; top:-10px">
                        	<a href="#">아이디 찾기</a>|
                        	<a href="#">비밀번호 찾기</a>
                        </div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                              
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="login-username" type="text" class="form-control" name="email"  placeholder="email">                                        
                            </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="pwd" placeholder="password">
                            </div>
							<div id="errMsg" style="color:red;font-size: 15px"></div>

                            <div style="margin-top:10px" class="form-group">
                                <!-- Button -->
                                <div class="col-sm-12 controls" style="text-align:center">
                                  <button type="submit" id="btn-login" class="btn btn-success">로그인  </button>
                                  <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-md-12 control" style="margin-top:10px">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            	계정이 없을 경우 회원가입 하세요~^^ 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            	회원가입
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                                
                            </div>
                        </div>                     
                    </div>  
                 </div>
			</form>
	    </div>
	  </div>
	</div>
	
<!-- 	회원가입 페이지 모달로 불러오기 -->
	<%@include file="/WEB-INF/views/woohyun/userInsert.jsp"%>

<script type="text/javascript">
function checkLogin() {
	var email = $("input[name='email']").val();
	var pwd = $("input[name='pwd']").val();
	
	if(!email){
		$('#errMsg').text('아이디를 입력해주세요');
		return false;
	}
	
	if(!pwd){
		$('#errMsg').text('비밀번호를 입력해주세요');
		return false;
	}
	
	$.ajax({
		url:'${pageContext.request.contextPath}/loginValid',
		data:{email:email, pwd:pwd},
		dataType:'json',
		type:'post',
		success:function(d){
			if(d.errMsg === 'no') {
				$('#errMsg').text('아이디 또는 비밀번호가 맞지 않아요.');
			} else {
				document.login_form.submit();
			}
				
		}
	});
	
	return false;
}
$(document).ready(function()
		{
			
		    // codes works on all bootstrap modal windows in application
		    $('#loginModal').on('hidden.bs.modal', function(e)
		    { 
		        $(this).find("input").val("");
		        $(this).find("#errMsg").html("");
		    }) ;
		});
		
</script>
<!--///////////// 로그인 모달 끝 //////////// -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>index.jsp</title>
<link rel="stylesheet" href="/go/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/go/resources/css/custom.css"> 
<%-- <script type="text/javascript">

<c:set var="area" value="${area}" />
	<c:set var="area2" value="<%=movieList%>" />
	<c:if test="${area eq area1}">
		$("input[name='네임명']").prop("checked", true);
	
	</c:if>
</script> --%>
</head>
<body>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="/go/resources/js/jquery.min.js"></script>
	<script src="/go/resources/js/pooper.js"></script>
	<script src="/go/resources/js/bootstrap.js"></script> 
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="display: flex;padding-left: 100px;padding-right: 100px;">
		<a class="navbar-brand" href="<c:url value='/nboard/list'/>" style="padding-top: 80px;">공지게시판</a>
		<a class="navbar-brand" href="<c:url value='/gboard/list'/>" style="padding-top: 80px;">게시판</a>
		<a class="navbar-brand" href="<c:url value='/qboard/list'/>" style="padding-top: 80px;">qna게시판</a>
		<a class="navbar-brand" href="<c:url value='/'/> " style="display:block; margin-right:auto;
    margin-left:auto; "><img alt="leaf" src="${pageContext.request.contextPath}/resources/boot2/css/logo.jpg" width="150px" height="80px"  ></a>
		<a class="navbar-brand" href="<c:url value='/reList'/>" style="padding-top: 80px;">후기게시판</a>
		<a class="navbar-brand" href="<c:url value='/room?email=${sessionScope.email }'/>" style="padding-top: 80px;">채팅</a>
		<a class="navbar-brand" href="<c:url value='/room?email=${sessionScope.email }'/>" style="padding-top: 80px;">고수찾기</a>
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
	
	<section class="container">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">고수를 소개받기 위해 몇가지 질문에 답해주세요!</h5>
				</div>
				<div class="modal-body">
					<form action="<c:url value='/survey'/>" method="post">
					<input type="hidden" name="email" value="${sessionScope.email }">
					<%-- <input type="hidden" name="sname" value="${area}"> --%>
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>▶ ${quelist[0].question }</label><br> 		
							<select name="selectarea" class="form-control">
								<c:forEach var="vo" items="${list }">									
									<c:set var="area">${area }</c:set>	
									<option value="${vo.sname }" <c:if test="${area == vo.sname}">  selected</c:if> >${vo.sname }</option> 
								</c:forEach>
							</select>
							</div>
						</div><br>
						${queslist[0].example }
					
						<%-- ${status.count} <!-- 이게 ex_num이랑 똑같음 --> --%>	
						<c:forEach var="qq" items="${quelist }" varStatus="ss">
						<c:if test="${qq.ques_num != 1 }">
						<div class="form-row">
						<div class="form-group col-sm-12">
							<label>▶ ${qq.question }</label> <br>

						<c:if test="${ss.index==1}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
									<c:if test="${vo1.ques_num == 2 }">
									<input type="radio" name="purpose" value="${vo1.example }" class="navbar-brand">${vo1.example }<pre></pre>
									</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==2}">
							<select name="experience"
									class="form-control">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
									<c:if test="${vo1.ques_num == 3}">
									<option value="${vo1.example }">${vo1.example }</option>
									</c:if>
								</c:forEach>
							</select>
							<br>
						</c:if>
						
						<c:if test="${ss.index==3}">
								<select name="age"
									class="form-control">
							<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 4}">
									<option value="${vo1.example }">${vo1.example }</option>
								</c:if>
							</c:forEach>
								</select>
								<br>
						</c:if>
						
						
						<c:if test="${ss.index==4}">
							<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 5}">
								<input type="checkbox" name="day" value="${vo1.example }" class="navbar-brand">${vo1.example }<pre></pre>
								</c:if>
								</c:forEach>
						</c:if>
					
						<c:if test="${ss.index==5}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 6}">
								<input type="radio" name="time" value="${vo1.example }" class="navbar-brand">${vo1.example }<pre></pre>
								</c:if>
								</c:forEach>
						</c:if>
							
							
						<c:if test="${ss.index==6}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 7}">
								<input type="radio" name="times" value="${vo1.example }" class="navbar-brand">${vo1.example }<pre></pre>
								</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==7}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 8}">
								<input type="radio" name="hour" value="${vo1.example }" class="navbar-brand">${vo1.example }<pre></pre>
								</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==8}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 9}">
								<input type="radio" name="start" value="${vo1.example }" class="navbar-brand">${vo1.example }<pre></pre>
								</c:if>
								</c:forEach>
						</c:if>
					
						<c:if test="${ss.index==9}">
						<div class="form-group col-sm-4 ">
						<span style="margin:auto">
									<button type="button" class="btn btn-primary mx-1 mt-2"
										onclick="addrSearch();" style="background-color: #4CAF50;" >
										<i class="fa fa-search"></i> 주소검색
									</button>
									</span>
								</div>
						
								<div class="form-group">
									<input class="form-control" style="top: 5px;"
										placeholder="도로명 주소" name="addr1" id="addr1" type="text"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="상세주소" name="addr2"
										id="addr2" type="text" />
								</div>
								
						</c:if>
						
						
						<c:if test="${ss.index==10}">
						<!-- <a>20자이내</a> -->
						<input type="text" class="navbar-brand" size="40" name="anything">
						
						</c:if>
						
							</div>
						</div>
						</c:if>	
					</c:forEach>
					
						<button type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12" style="background-color: #4CAF50;">신청하기</button>
					</form>
				</div>
			</div>
		</div>
	

	</section>





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

		function addrSearch() {
			new daum.Postcode({
				oncomplete: function(data) {

					$('[name=addr1]').val(data.address);
					$('[name=addr2]').val(data.buildingName);
				}
			}).open();
		}
		
		
	</script>

	
</body>
</html>
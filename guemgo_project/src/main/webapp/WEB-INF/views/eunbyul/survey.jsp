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
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script src="/go/resources/js/jquery.min.js"></script>
	<script src="/go/resources/js/pooper.js"></script>
	<script src="/go/resources/js/bootstrap.js"></script> 
	<%-- <h2>카테고리</h2>
<ul>
	<c:forEach var="header" items="${header }">
		<li>${header }</li>
	</c:forEach>
</ul> --%>

<%-- 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="<c:url value='/'/>">Guemgo</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="calendar">달력 임시</a> <a
			class="navbar-brand" href="survey_test">설문조사 임시</a>
		<div id="navbar" class="collapse navbar-collapse">

			<form class="form-inline my-2 my-lg-10">
				고수찾기 <input class="form-control mr-sm-2" type="search"
					placeholder="내용을 입력하세요" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> 회원님${ sessionScope.email } </a>
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
						<a class="dropdown-item" href="MemberInsert">회원가입</a> <a
							class="dropdown-item" href="MemberList">회원목록</a>
					</div></li>
			</ul>
		</div>
	</nav>
 --%>
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
	
	
	
	
	<section class="container">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">어떤 서비스를 찾고 있나요?</h5>
				</div>
				<div class="modal-body">
					<form action="<c:url value='/survey'/>" method="post">
					<input type="hidden" name="email" value="${sessionScope.email }">
					<%-- <input type="hidden" name="sname" value="${area}"> --%>
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>${quelist[0].question }</label><br> 		
							<select name="selectarea" class="form-control">
								<c:forEach var="vo" items="${list }">									
									<c:set var="area">${area }</c:set>	
									<option value="${vo.sname }" <c:if test="${area == vo.sname}">  selected</c:if> >${vo.sname }</option> 
								</c:forEach>
							</select>
							</div>
						</div>
						${queslist[0].example }
					
						<%-- ${status.count} <!-- 이게 ex_num이랑 똑같음 --> --%>	
						<c:forEach var="qq" items="${quelist }" varStatus="ss">
						<c:if test="${qq.ques_num != 1 }">
						<div class="form-row">
						<div class="form-group col-sm-12">
							<label>${qq.question }</label> <br>

						<c:if test="${ss.index==1}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
									<c:if test="${vo1.ques_num == 2 }">
									<input type="radio" name="purpose" value="${vo1.example }" class="navbar-brand">${vo1.example }
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
						</c:if>
						
						
						<c:if test="${ss.index==4}">
							<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 5}">
								<input type="checkbox" name="day" value="${vo1.example }" class="navbar-brand">${vo1.example }
								</c:if>
								</c:forEach>
						</c:if>
					
						<c:if test="${ss.index==5}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 6}">
								<input type="radio" name="time" value="${vo1.example }" class="navbar-brand">${vo1.example }
								</c:if>
								</c:forEach>
						</c:if>
							
							
						<c:if test="${ss.index==6}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 7}">
								<input type="radio" name="times" value="${vo1.example }" class="navbar-brand">${vo1.example }
								</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==7}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 8}">
								<input type="radio" name="hour" value="${vo1.example }" class="navbar-brand">${vo1.example }
								</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==8}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 9}">
								<input type="radio" name="start" value="${vo1.example }" class="navbar-brand">${vo1.example }
								</c:if>
								</c:forEach>
						</c:if>
					
						<c:if test="${ss.index==9}">
								<div class="form-group">
									<input class="form-control" style="top: 5px;"
										placeholder="도로명 주소" name="addr1" id="addr1" type="text"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="상세주소" name="addr2"
										id="addr2" type="text" />
								</div>
								<div class="form-group col-sm-4 ">
									<button type="button" class="btn btn-primary mx-1 mt-2"
										onclick="addrSearch();">
										<i class="fa fa-search"></i> 주소검색
									</button>
								</div>
						</c:if>
						
						
						<c:if test="${ss.index==10}">
						<input type="text" class="navbar-brand" size="40" name="anything">
						
						</c:if>
							</div>
						</div>
						</c:if>	
					</c:forEach>
						<button type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12">신청하기</button>
					</form>
				</div>
			</div>
		</div>
	

	</section>





	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/5bd67c1a476c2f239ff66196/default';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
		/* End of Tawk.to Script */
		
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
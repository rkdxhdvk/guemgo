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
	<%-- <h2>카테고리</h2>
<ul>
	<c:forEach var="header" items="${header }">
		<li>${header }</li>
	</c:forEach>
</ul> --%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
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


	<section class="container">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">어떤 서비스를 찾고 있나요?</h5>
				</div>
				<div class="modal-body">
					<form action="surveyOk" method="post">
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>레슨을 받고 싶은 과목은?</label><br> 		
								<c:set var="area" value="${area}" />
								<input type="checkbox" name="area" value="포토샵" ${area == "포토샵" ? "CHECKED" : true}>포토샵
								<input type="checkbox" name="area" value="일러스트" ${area == "일러스트" ? "CHECKED" : true}>일러스트 
								<input type="checkbox" name="area" value="인디자인" ${area == "인디자인" ? "CHECKED" : true}>인디자인 
								<input type="checkbox" name="area" value="드로잉" ${area == "드로잉" ? "CHECKED" : true}>드로잉
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 받는 목적이 무엇인가요?</label><br>
								<input type="radio" name="purpose" value="취미" class="navbar-brand">취미
								<input type="radio" name="purpose" value="입시" class="navbar-brand">입시
								<input type="radio" name="purpose" value="선물" class="navbar-brand">선물
								<input type="radio" name="purpose" value="기타" class="navbar-brand">기타
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>경력이 있나요?</label> <select name="experience"
									class="form-control">
									<option value="입문" selected>입문</option>
									<option value="1년이하">1년이하</option>
									<option value="3년이하">3년이하</option>
									<option value="직접입력">직접입력</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>학생은 몇 살 입니까?</label> <select name="age"
									class="form-control">
									<option value="9" selected>1-9</option>
									<option value="19">10-19</option>
									<option value="39">20-39</option>
									<option value="40">40+</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>희망 레슨 횟수는 어떻게 되시나요?</label><br> 
								<input type="radio" name="times" value="1회/1주" class="navbar-brand">1회/1주 
								<input type="radio" name="times" value="2회/1주" class="navbar-brand">2회/1주
								<input type="radio" name="times" value="1회/한달" class="navbar-brand">1회/한달 
								<input type="radio" name="times" value="직접입력" class="navbar-brand">직접입력
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>몇 시간 동안 레슨을 받기 원하시나요</label><br> 
								<input type="radio" name="time" value="1시간" class="navbar-brand">1시간
								<input type="radio" name="time" value="1시간 30분" class="navbar-brand">1시간 30분 
								<input type="radio" name="time" value="2시간" class="navbar-brand">2시간 
								<input type="radio" name="time" value="직접입력" class="navbar-brand">직접입력
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 시작하고 싶은 날이 있나요?</label><br> 
								<input type="radio" name="start" value="1시간" class="navbar-brand">1시간
								<input type="radio" name="start" value="1시간 30분" class="navbar-brand">1시간 30분 
								<input type="radio" name="start" value="2시간" class="navbar-brand">2시간 
								<input type="radio" name="start" value="직접입력" class="navbar-brand">직접입력
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 원하는 지역을 선택해주세요.</label><br>
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
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>고수가 알아야 할 다른 사항이 있나요?</label><br> <input type="text"
									name="textfield" class="navbar-brand" size="45">
							</div>
						</div>
						<button type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12">신청하기</button>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</body>
</html>
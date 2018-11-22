<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
<h1>고수프로필</h1>

	<div class="row">
		<div class="col-sm-3">
			<c:if test="${ not empty vo.u_image }">
				<img src="resources/upload/userImg/${vo.u_image }" width="150" height="150" style="border-radius:50%" />
			</c:if>
			<c:if test="${     empty vo.u_image }">
				<img src="https://img.icons8.com/ios/100/000000/user-male-circle-filled.png" width="150" height="150">
			</c:if>
			
			</div>	 <!-- users 테이블의 image 출력  -->
			<div class="col-sm-9">
			<span style="font-size: large;">
			<strong>쇼미더 머니</strong>
			<br>
			${vo.name }&nbsp;&nbsp;
			<i class='far fa-star'></i> 평점 4.5&nbsp;&nbsp;
			|&nbsp;&nbsp;
			리뷰	2
			</span>
			<br><br>
			<span>
			<i class='fas fa-map-marker-alt'></i> 서울 강남구&nbsp;&nbsp;
			고용횟수 ${vo.employ }번	
			</span>
		</div> 
	</div>
	<br>

<h2>서비스 카테고리</h2>
	<div style="display: inline-flex;">
	<c:forEach var="item" items="${ lectureList }">
	<br>
	<span class="label label-info" style="font-size: large;margin-right: 10px;">${item.area }</span>
	<!-- lecture(강의)테이블의 강의번호(lecturenum)을 이용해서 gosu_area테이블의 area를 모두 가져와서 출력해야함.-->
</c:forEach>
</div>
<br>
<h2>미디어</h2>
<br>
<c:if test="${ not empty vo.g_image }">
	<img src="resources/upload/gosuImg/${vo.g_image }" width="150" height="150"/>	<!-- gosu 테이블의 image 출력 -->
</c:if>
<c:if test="${     empty vo.g_image }">
	<img src="https://img.icons8.com/color/96/000000/picture.png" width="150" height="150">
</c:if>

<br>
<h2>고수소개</h2>
<br>	${vo.intro }	 <!-- gosu 테이블의 intro 출력 -->
<h2>경력사항</h2>
<br>	
${vo.career }	 <!-- users 테이블의 career 출력 -->
<br>
<h2>사업자등록증&자격증</h2>
<br>
<c:if test="${ not empty vo.license }">
	<img src="resources/upload/gosuCareerImg/${vo.license }" width="150" height="150"/>	<!-- gosu_career 테이블의 license image 출력 -->
</c:if>
<c:if test="${     empty vo.license }">
	<img src="https://img.icons8.com/color/96/000000/picture.png" width="150" height="150">
</c:if>
</div>



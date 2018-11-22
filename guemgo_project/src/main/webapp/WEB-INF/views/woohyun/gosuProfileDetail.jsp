<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-11-20	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gosuProfileDetail.jsp</title>
<script>
</script>
<body>
<h1>고수프로필</h1>

<h2><br>${vo.name } 님의 프로필 입니다.</h2>		 <!-- users 테이블의 name 출력 -->

<img src="resources/upload/userImg/${vo.u_image }" width="100" height="100"/>	 <!-- users 테이블의 image 출력  --> 
<br>고용횟수 ${vo.employ } 번	<!-- gosu 테이블의 employ 출력 -->
<br>서비스 카테고리
<c:forEach var="item" items="${ lectureList }">
<br>	${item.area }	<!-- lecture(강의)테이블의 강의번호(lecturenum)을 이용해서 gosu_area테이블의 area를 모두 가져와서 출력해야함.-->
</c:forEach>
<br>미디어
<%-- <br>	${vo.g_image }	<!-- gosu 테이블의 image 출력 --> --%>
 <br><img src="resources/upload/gosuImg/${vo.g_image }" width="200" height="200"/>
<br>고수소개
<br>	${vo.intro }	 <!-- gosu 테이블의 intro 출력 -->
<br>경력사항
<br>	${vo.career }	 <!-- users 테이블의 career 출력 -->
<br>사업자등록증&자격증
<br>
<img src="resources/upload/gosuCareerImg/${vo.license }" width="200" height="200"/>	<!-- gosu_career 테이블의 license image 출력 -->


</body>
</html>
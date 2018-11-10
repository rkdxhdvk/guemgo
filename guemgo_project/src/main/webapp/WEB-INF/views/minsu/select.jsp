<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
      $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
      
      
      if("${msg}"!=""){
    	  alert("${msg}");
      }
  });
  </script>
</head>
<body>
		<!-- 선택 안 했을 때 제약 -->
		<form action="<c:url value='/calaaa'/>" method="get">
		<label>강의명</label>
		<select name="lecture">
			<c:forEach items="${list }" var="vo">
				<option value="${vo.lectureNum }/${vo.lectureName}">${vo.lectureName }</option>
			</c:forEach>
			
		</select>
		<br>
		<label>강의횟수</label>
		<br> 
		<input type="text" name="count" style="width:20px;"> <!-- 바꾸기 -->
		<br>
		<label>강의시간</label> <br>
		<select name="time">
			<option value=12>12:00</option>
			<option value=14>14:00</option>
			<option value=16>16:00</option>
			<option value=18>18:00</option>
		</select>
		<br>
		<label>요일</label><br> 
		<input type="checkbox" name="day" value="1">일
		<input type="checkbox" name="day" value="2">월
		<input type="checkbox" name="day" value="3">화
		<input type="checkbox" name="day" value="4">수
		<input type="checkbox" name="day" value="5">목
		<input type="checkbox" name="day" value="6">금
		<input type="checkbox" name="day" value="7">토
		<br>
		<p>시작날짜: <input autocomplete="off" type="text" id="datepicker" name="startDate" size="30"></p>
		<input type="hidden" value=1 name="room">
		<input type="submit" value="스케줄" id="btn">
	</form>
	<a href="<c:url value='/'/>">홈으로</a>
</body>
</html>
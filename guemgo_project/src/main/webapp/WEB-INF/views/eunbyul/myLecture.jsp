<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>내 강의 목록</title>
<link rel="stylesheet" href="/go/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/go/resources/css/custom.css">
</head>
<body>
<table class="type07">
    <thead>
    <tr>
        <th scope="cols">강의번호</th>
        <th scope="cols">강의명</th>
        <th scope="cols">지역</th>
        <th scope="cols">요일</th>
        <th scope="cols">시간대</th>
        <th scope="cols">수정</th>
        <th scope="cols">삭제</th>
    </tr>
    </thead>
    
   
    <tbody>
    <c:forEach var="vo" items="${list }">
    <tr>
        <th scope="row" style="width: 10%">${vo.lectureNum }</th>
        <td style="width: 25%">${vo.lectureName }</td>
        <td style="width: 30%">${vo.region1 }${vo.region2 }</td>
        <td style="width: 10%">${vo.day }</td>
        <td style="width: 10%" >${vo.time }</td>
		<td style="width: 5%"><a href="<c:url value='/eunbyul/classUpdate?lectureNum=${vo.lectureNum }'/>">수정</a></td>
		<td style="width: 5%"><a href="<c:url value='/classdelete?lectureNum=${vo.lectureNum }'/>">삭제</a></td>
    </tr>
	</c:forEach>
    </tbody>
</table>


</body>
</html>
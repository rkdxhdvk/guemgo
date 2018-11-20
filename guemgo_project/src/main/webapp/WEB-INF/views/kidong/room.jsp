<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="container-fluid" style="margin-bottom: 15px;padding-top: 145px;">
	<p class="text-left" style="font-size: x-large;">채팅방</p>
	<button type="button" class="btn btn-primary" style="float: right;"
		onclick="location='<c:url value='/'/>'">나가기</button>
</div>
<c:forEach var="vo" items="${list }">
	<div class="container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">상대방 : ${vo.other }</div>
			<div class="panel-body">
				강의명 : ${vo.lecturename }
				<a href="<c:url value='/chat?room=${vo.room }&lecturenum=${vo.lecturenum }&lecuturename=${vo.lecturename }'/>" class="pull-right">입장</a>
			</div>
		</div>
	</div>
</c:forEach>

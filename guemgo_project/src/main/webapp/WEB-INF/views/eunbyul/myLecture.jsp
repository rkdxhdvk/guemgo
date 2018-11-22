
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<body>
	
		
	<div class="container-fluid" style="margin-bottom: 15px; padding-top: 180px;">
		<div class="table-responsive" style="width: 70%; height: 100%; margin: auto;">
	<c:if test="${sessionScope.email!=null }">
	<div class="container-fluid" style="margin-bottom: 15px;">
		<p class="text-left" style="font-size: x-large;">내 강의 목록</p>
	</div>
	</c:if>
	<div class="container-fluid">
		<div class="table-responsive">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th>강의번호</th>
						<th>강의명</th>
						<th>지역</th>
						<th>요일</th>
						<th>시간대</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>


				<tbody>
				<c:if test="${vo.lec_start==0 }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<th scope="row" style="width: 10%">${vo.lectureNum }</th>
							<td style="width: 20%">${vo.lectureName }</td>
							<td style="width: 30%">${vo.region1 }${vo.region2 }</td>
							<td style="width: 10%">${vo.day }</td>
							<td style="width: 10%">${vo.time }</td>
							<td style="width: 10%">
							<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/classUpdate?lectureNum=${vo.lectureNum }'/>"'>
						수정</button></td>
							<td style="width: 10%">
							<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/classdelete?lectureNum=${vo.lectureNum }'/>"'>
						삭제</button></td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>마이페이지</h2>
<ul class="nav nav-pills nav-stacked">
	<li><a
		href="<c:url value='/UserUpdate?email=${sessionScope.email }'/>">개인정보
			수정</a></li>
	<li><a
		href="<c:url value='/pointCharge?email=${sessionScope.email }'/>">포인트
			충전</a></li>
	<li><a
		href="<c:url value='/pointRecord?email=${sessionScope.email }'/>">포인트
			내역조회</a></li>
	<li><a
		href="<c:url value='/user/scheList?email=${sessionScope.email }'/>">스케줄리스트</a></li>
		<li><a
		href="<c:url value='/ongoingClass?email=${sessionScope.email }'/>">수강 강의</a></li>
<%-- 	<li><a
		href="<c:url value='/sendList?email=${sessionScope.email }'/>">보낸 요청서</a></li> --%>

	<li><a href="<c:url value='/selectGboard'/>">내가쓴글</a></li>
</ul>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>고수페이지</h2>
<ul class="nav nav-pills nav-stacked">
	<li><a
		href="<c:url value='/gosuPage?email=${sessionScope.email }'/>">고수 프로필 상세</a></li>
	<li><a
		href="<c:url value='/GosuProfileUpdate?email=${sessionScope.email }'/>">고수프로필
			수정</a></li>
	<li><a
		href="<c:url value='/gosu/scheList?email=${sessionScope.email }&flag=${sessionScope.flag }'/>">스케줄리스트</a></li>
	<li><a
		href="<c:url value='/classinsert?email=${sessionScope.email }'/>">강의 등록</a></li>
	<li><a
		href="<c:url value='mylecture?email=${sessionScope.email }'/>">내 강의 목록</a></li>
	<li><a
		href="<c:url value='/receiveList?email=${sessionScope.email }'/>">받은 요청서</a></li>
</ul>

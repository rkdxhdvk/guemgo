<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(
		function() {
			<c:forEach items="${list }" var="vo">
			$( "#progressbar" ).progressbar({
			      value: 37
			    });
			</c:forEach>
		}
);
</script>

	${sessionScope.email }
	<h1>스케줄 리스트</h1>
	<ul>
		<c:forEach items="${list }" var="vo">
			<li>
				<a href="<c:url value='/sche_detailList?email=${sessionScope.email }&scheduleNum=${vo.scheduleNum }'/>">
				${vo.lecturename }</a>
				<div id="progressbar"></div>
			</li>
		</c:forEach>
	</ul>
	<a href="<c:url value='/'/>">홈으로</a>

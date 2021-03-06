<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			var n = 10;
			<c:forEach items="${list }" var="vo">
			n = n + 10;
			$( "#progressbar" ).progressbar({
			      value: n
			    });
			</c:forEach>
		}
);
</script>
<body>
	${sessionScope.email }
	<h1>스케줄 리스트</h1>
	<ul>
		<c:forEach items="${list }" var="vo">
			<li>
				<c:if test="${sessionScope.flag==1 }">
				<a href="<c:url value='/user/sche_detailList?email=${sessionScope.email }&scheduleNum=${vo.scheduleNum }'/>">
				${vo.lecturename }</a>
				</c:if>
				<c:if test="${sessionScope.flag==2 }">
				<a href="<c:url value='/gosu/sche_detailList?email=${sessionScope.email }&scheduleNum=${vo.scheduleNum }'/>">
				${vo.lecturename }</a>
				</c:if>
				<div id="progressbar"></div>
			</li>
		</c:forEach>
	</ul>
	<a href="<c:url value='/'/>">홈으로</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(
		function() {
			<c:forEach items="${list }" var="vo">
			$.getJSON({
				url:"<c:url value='/progress'/>",
				data : {scheduleNum:${vo.scheduleNum }}, 
				success:function(data){		
						$( ".progressbar"+data.scheduleNum ).progressbar({
						      value: data.pro
						});
						
						/* var ss = "진행률 " + data.pro;
						$( ".progressbar"+data.scheduleNum ).html(ss); */
				}
			});
			</c:forEach>
		}
);
</script>

	${sessionScope.email }
	<h1>스케줄 리스트</h1>
	<ul>
		<c:forEach items="${list }" var="vo">
				<a href="<c:url value='/sche_detailList?email=${sessionScope.email }&scheduleNum=${vo.scheduleNum }'/>">
				${vo.lecturename }</a>
				
				<div class="progressbar${vo.scheduleNum }" style="width: 100px;"></div>
		</c:forEach>
	</ul>
	<a href="<c:url value='/'/>">홈으로</a>

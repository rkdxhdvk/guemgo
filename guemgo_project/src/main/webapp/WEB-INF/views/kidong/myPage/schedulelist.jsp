<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(
		function() {
			<c:forEach items="${schelist }" var="vo">
			$.getJSON({
				url:"<c:url value='/progress'/>",
				data : {scheduleNum:${vo.scheduleNum }}, 
				success:function(data){		
						$( ".progressbar"+data.scheduleNum ).progressbar({
						      value: data.pro
						});
						console.log(data.pro);
						
						var ss = "진행률 " + data.pro + "%";
						$( ".progress"+data.scheduleNum ).html(ss);
						if(data.pro>=100 && ${sessionScope.flag}==1){
							console.log("dddd");
							var sss = "<form action='/go/reInsert' method='get'> <input type='hidden' name='other' id='other' value='${vo.other }'> <input type='submit' value='후기 남기기'> </form>";
							$( ".pro"+data.scheduleNum ).html(sss);
						}
				}
			});
			</c:forEach>
			
		}
);
</script>
<body>
	<h1>스케줄 리스트</h1>
	<ul>
		<c:forEach items="${schelist }" var="vo">
				<c:if test="${sessionScope.flag==1 }">
					<c:set var="other" value="${vo.email }"/>
				</c:if>
				<c:if test="${sessionScope.flag==2 }">
					<a href="/go/scheList?email=${sessionScope.email }">전체리스트 보기</a><br>
					<c:set var="other" value="${vo.other }"/>
				</c:if>
				<a href="<c:url value='/sche_detailList?email=${sessionScope.email }&scheduleNum=${vo.scheduleNum }'/>">
				${other}님과의 ${vo.lecturename }</a>
				
				<div class="progressbar${vo.scheduleNum }" style="width: 200px;">
				<a class="progress${vo.scheduleNum }"></a>
				</div>
				<div class="pro${vo.scheduleNum }"></div>
				
		</c:forEach>
	</ul>
</body>
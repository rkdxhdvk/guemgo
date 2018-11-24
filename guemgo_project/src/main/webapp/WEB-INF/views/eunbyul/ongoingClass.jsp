<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						console.log(data.pro);
						
						var ss = "진행률 " + data.pro + "%";
						$( ".progress"+data.scheduleNum ).html(ss);
						if(data.pro>=100 && ${sessionScope.flag}==1){
							console.log("dddd");
						var sss = 
							"<form action='/go/reInsert' method='get'> <input type='hidden' name='other' id='other' value='${email }'> <input type='hidden' name='lectureNum' id='lectureNum' value='${lecturenum }'> <input type='submit' value='후기 남기기'> </form>";
							$( ".pro"+data.scheduleNum ).html(sss);
						}
				}
			});
			</c:forEach>
			
		}
);
</script>

<body>
	<c:if test="${sessionScope.email!=null }">
	<div class="container-fluid" style="margin-bottom: 15px; padding-top: 180px;">
		<p class="text-left" style="font-size: x-large; text-align:center;">수강한 강의</p>
<%-- 		<button type="button" class="btn btn-primary" style="float: right;"
			onclick="location='<c:url value='/reInsert'/>'">글쓰기</button> --%>
	</div>
	</c:if>

		<div class="table-responsive" style="width: 60%; height: 100%; margin: auto;">

			<table class="table table-bordered table-striped table-hover">
				<thead>
					
					<th>강의번호</th>
					<th>강의명</th>
					<th>고수이메일</th>
					<th>시작일</th>
					<th>진행 상태</th>
					<th>후기</th>

				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
					<tr>
						<td style="width: 10%">${vo.matchingnum }</td>
						<td style="width: 20%">${vo.lecturename }</td>    
						<td style="width: 20%">${vo.gosuemail }</td>
						<td style="width: 10%">${vo.startday } % </td>
						<c:if test="${vo.state ==1}">
						<td style="width: 10%">강의진행중<div class="pro${vo.scheduleNum }"></div></td>
						</c:if>
						<td><div class="progressbar${vo.scheduleNum }" style="width: 300px;">
				<a class="progress${vo.scheduleNum }"></a>
				</div><div class="pro${vo.scheduleNum }"></div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
		</div>

</body>
</html>
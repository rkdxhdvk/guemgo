<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='resources/fullcalender/demo-topbar.css' rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.min.css'
	rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />

<script src='resources/fullcalender/lib/moment.min.js'></script>
<!-- <script src='resources/fullcalender/lib/jquery.min.js'></script> -->
<script src='resources/fullcalender/fullcalendar.min.js'></script>
<script src='resources/fullcalender/demo-to-codepen.js'></script>

<script>
	$(document).ready(
			function() {
				var events = [];
				var currDate = ${date};
				<c:set var="loop_flag" value="true" />
				var flag = 0;
				<c:forEach items="${list}" var="vo">
					events.push({
						title : '출석',
						start : '${vo.att }',
						overlap : false
					})
					<c:if test="${loop_flag }">
						<c:if test="${date == vo.att}">
							flag = 1;
							<c:set var="loop_flag" value="false" />
						</c:if>
					</c:if>
				</c:forEach>
				console.log(flag);
				$("#btn").click(function() {
					console.log(flag);
					if(flag == 1){
					alert("이미 출석햇는");
					/* 	$.getJSON("<c:url value='/eventinsert'/>",{email:'${sessionScope.email}', att:'${date}'}, 
								function(data) {
							$('#calendar').fullCalendar('renderEvent',
									{	
										title : '출석',
										start : '${date }',
										overlap : false
									});
						})
						alert("출석체크!!!!!!!");
						location.href="eventlist?email=${sessionScope.email}"; */
					}else{
					$.getJSON("<c:url value='/eventinsert'/>",{email:'${sessionScope.email}', att:'${date}'}, 
							function(data) {
						$('#calendar').fullCalendar('renderEvent',
								{	
									title : '출석',
									start : '${date }',
									overlap : false
								});
					});
					alert("출석체크!!!!!!!");
					location.href="eventlist?email=${sessionScope.email}";
					}
				});
				$('#calendar').fullCalendar(
						{
							//selectable : true,
							//droppable: true,
							events: events,
							/* dayClick : function(date, calEvent) {
								var start = date.format();
								console.log(start);
								if(currDate==start){
								$.getJSON("<c:url value='/eventinsert'/>",{email:'${sessionScope.email}', pointdate:start}, 
										function(data) {
									$('#calendar').fullCalendar('renderEvent',
											{	
												title : '출석',
												start : start,
												overlap : false,
												color : '#ff9f89'
											}); 
										});
								}else{
									alert("오늘 날짜");
								}
								
							}, */
							eventClick : function(event, element) {
								alert(event.start.format() + " " + event.title + "완료!!");
								
							}/* ,
							eventRender: function(eventObj, $el) {
						        $el.popover({
						          title: eventObj.title,
						          content: eventObj.description,
						          trigger: 'hover',
						          placement: 'top',
						          container: 'body'
						        }); 
							} */
						});
				
				});
</script>
<style>
/* body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
} */
#calendar {
	max-width: 650px;
	margin-right: 40px;
}

#calendar a.fc-event {
	color: #fff;
}
</style>
</head>
<body>
	<div id="ddd" style="padding-top: 300px;">
	<div style="float: right;" id='calendar'></div>
	
	<div class="container">
			<div class="row">
				<div class="col-lg-5 col-sm-6">
					<hr class="section-heading-spacer">
					<div class="clearfix"></div>
					<h2 class="section-heading">
						매일매일 출석 이벤트!!!!!!!!!!!<br>
					</h2>
					
					<p class="lead">
						매일 출석만 해도 포인트가 모인다!!<br>
						매일 홈페이지에 접속하여 출석체크를 해보세요<br>
						<a target="_blank" href="/point">내 포인트 보러가기</a>
					</p>
					<button type="button" class="btn btn-primary" id="btn">출석체크</button><br>
					<br><br><br><br><br><br><br><br>
					
					<ul style="float: left;">
						<li>한번 출석시 5point 적립</li>
						<li>연속 일주일 출석시 10point 추가 적립</li>
					</ul>
				</div>
			</div>
	</div>
	</div>
</body>
</html>

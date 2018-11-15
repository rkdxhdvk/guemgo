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
<script src='resources/fullcalender/lib/jquery.min.js'></script>
<script src='resources/fullcalender/fullcalendar.min.js'></script>
<script src='resources/fullcalender/demo-to-codepen.js'></script>

<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
	rel='stylesheet' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>

<script>
	$(document).ready(
			function() {
				var events = [];
				var flag;
			 	//var currDate = ${date};
				<c:forEach items="${list}" var="vo">
					events.push({
						title : '출석',
						start : '${vo.att }',
						overlap : false
					})
					<c:if test="${date == vo.att}">
						<c:set var="flag" value="1"/>
					</c:if>
				</c:forEach>
				console.log(flag);
				$("#btn").click(function() {
					<c:if test="${flag != 1}">
						$.getJSON("<c:url value='/eventinsert'/>",{email:'${sessionScope.email}', att:'${date}'}, 
								function(data) {
							$('#calendar').fullCalendar('renderEvent',
									{	
										title : '출석',
										start : '${date }',
										overlap : false
									});
						})
						alert("출석체크!!!!!!!");
						location.href="eventlist?email=${sessionScope.email}";
					</c:if>
					<c:if test="${flag == 1}">
						alert("이미 출석햇는");
					</c:if>
				});
				$('#calendar').fullCalendar(
						{
							//selectable : true,
							//droppable: true,
							header : {
								left : 'prev,next today',
								center : 'title',
								right : 'month'
							},
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
								alert(event.id + event.start + " " + event.title);
								
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
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

#calendar a.fc-event {
	color: #fff;
}
</style>
</head>
<body>
	<input type="button" id="btn" value="출석체크">
	<div id='calendar'></div>
</body>
</html>

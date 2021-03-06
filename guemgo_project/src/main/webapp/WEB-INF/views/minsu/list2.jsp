<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<link href='${pageContext.request.contextPath}/resources/fullcalender/demo-topbar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalender/fullcalendar.min.css'
	rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalender/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />

<script src='${pageContext.request.contextPath}/resources/fullcalender/lib/moment.min.js'></script>
<!-- <script src='resources/fullcalender/lib/jquery.min.js'></script> -->
<script src='${pageContext.request.contextPath}/resources/fullcalender/fullcalendar.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalender/demo-to-codepen.js'></script>

<!-- <link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
	rel='stylesheet' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>-->
<script type="text/javascript">
	$(document).ready(
			function() {
						var events = [];
						<c:forEach items="${dlist }" var="svo">
							<c:forEach items="${svo}" var="vo">
							var color = '';
							if(${vo.attendance}==1){
								var color = 'orange';
							}
							events.push({
								id : ${vo.num},
								title : '${vo.lecturename}',
								start : '${vo.sDate }',
								end : '${vo.eDate}',
								description : '${vo.memo }',
								backgroundColor : color
							})
							</c:forEach>
						</c:forEach>
							$('#calendar').fullCalendar(
									{
										//selectable : true,
										//droppable: true,
										header : {
											left : 'prev,next today',
											center : 'title',
											right : 'month,agendaWeek,agendaDay,listMonth'
										},
										navLinks : true,
										businessHours : true,
										editable : true,
										events:events,
										
										/* dayClick : function(date, calEvent) {
											var date = date.format('YYYY-MM-DD');
							                  $('#calendar').fullCalendar('clientEvents', function(event) {
							                	  var start = moment(event.start).format("YYYY-MM-DD");
							                	  if(date==start){
							                		  alert(event.id);
														if(event.backgroundColor=='orange'){
								                	  		alert("이미 출석");
								                	  	}
							                		  else if (confirm("출석체크 하시겟습니까??") == true) {
							                	  		$.ajax({
															url:"<c:url value='/attupdate'/>",
															dataType:"json",
															data : {id:event.id}
														});
							                	  		event.backgroundColor = 'orange';
							                	  		$('#calendar').fullCalendar(
																'updateEvent', event);
							                		  }
							                	  }
							                  });
										}, */
										eventRender: function(eventObj, $el) {
									        $el.popover({
									          title: eventObj.title,
									          content: eventObj.description,
									          trigger: 'hover',
									          placement: 'top',
									          container: 'body'
									        });
										},
										eventRender: function (event, element, view) {
										    element.find('.fc-title').append('<div class="hr-line-solid-no-margin"></div><span style="font-size: 10px">'+ "메모 :" + event.description+'</span></div>');
										},
										})
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
	<div id='calendar'></div>
</body>


</html>

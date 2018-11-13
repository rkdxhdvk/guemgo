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
				$.getJSON("<c:url value='/eventlist'/>",{email:'${sessionScope.email}'}, 
						function(data) {
						console.log(data[0].pointdate);
						if(data != null){
						$(data).each(function(i,json){
							events.push({
	                            start: json.att,
	                            backgroundColor : 'orange'
	                        })
						})
						}
				
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
							//editable : true,
							events: events,
							
							eventRender: function(eventObj, $el) {
						        $el.popover({
						          title: eventObj.title,
						          content: eventObj.description,
						          trigger: 'hover',
						          placement: 'top',
						          container: 'body'
						        });
							}
						});
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
	<div id='calendar'></div>
</body>
</html>

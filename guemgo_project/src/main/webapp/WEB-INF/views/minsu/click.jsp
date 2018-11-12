<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />


<title></title>

<link href='resources/fullcalender/demo-topbar.css' rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.min.css'
	rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.print.css'
	rel='stylesheet' media='print' />

<script src='resources/fullcalender/lib/moment.min.js'></script>
<script src='resources/fullcalender/lib/jquery.min.js'></script>
<script src='resources/fullcalender/fullcalendar.min.js'></script>
<script src='resources/fullcalender/demo-to-codepen.js'></script>

<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 40px auto;
}
</style>


<script>
$(document).ready(function() {
		var events = [];
		var sche_detailNum = ${sche_detailNum};
		var scheduleNum = ${scheduleNum};
		<c:forEach items="${start}" var="vo" varStatus="status">
			sche_detailNum = sche_detailNum + 1;
			events.push({
				id : sche_detailNum,
				title : '${lecturename}',
				start : '${vo }',
				end : '${end[status.index]}',
				description : ' '
			})
		</c:forEach>
		$("#sche_confirm").click(function() {
			$('#calendar').fullCalendar('clientEvents', function(event) {
				console.log(event.id);
				$.getJSON("<c:url value='/cal'/>",
						{scheduleNum:scheduleNum, id:event.id, lecturename:event.title, start:event.start.format(), end:event.end.format(), memo:event.description}, 
						function(data) {
								alert("스케줄 확정");
				});
			})
		});
		$("#sche_cancel").click(function() {
				$.getJSON("<c:url value='/caldelete'/>", {scheduleNum:scheduleNum}, 
						function(data) {
								alert("스케줄 취소");
				});
				location.href="/go";
		});
		$('#calendar').fullCalendar(
				{
					droppable: true,
					selectable : true,
					navLinks : true,
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaDay'
					},
					editable : true,
					///
					dayClick : function(date, calEvent) {
								var date = date.format('YYYY-MM-DD');
				                  $('#calendar').fullCalendar('clientEvents', function(event) {
				                	  var start = moment(event.start).format("YYYY-MM-DD");
				                	  if(date==start){
				                		  if (confirm("정말 삭제하시겠습니까??") == true) {
												$('#calendar').fullCalendar('removeEvents',
														event.id);
											} else {
												if (confirm("메모 등록?") == true) {
													//var title = prompt('일정', event.title);
													var description = prompt('메모', event.description);
													event.description = description;
													$('#calendar').fullCalendar(
															'updateEvent', event);
												}
				                	  }
				                	  }
				                  });
					},
					eventClick : function(event, element) {
						alert(event.id + " " + event.description + " " + event.end.format()+ " " + event.title);
						
					},
					eventDrop: function(event, delta, revertFunc) {
					    if (!confirm("Are you sure about this change?")) {
					      revertFunc();
					    }else{
					    	console.log(event.start.format() + " " + event.end.format() + " " + event.id);
					    }
					  },
					  eventResize: function(event, delta, revertFunc) {
						    if (!confirm("is this okay?")) {
						      revertFunc();
						    }

						  },
					events : events
					
				});

	});
</script>

</head>
<body>
	<div id='calendar'></div>
	<input type="button" id="sche_confirm" value="스케줄 확정">
	<input type="button" id="sche_cancel" value="취소">
	<a href="<c:url value='/'/>">홈으로</a>
</body>

</html>

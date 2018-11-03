<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='resources/fullcalender/demo-topbar.css' rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.print.min.css' rel='stylesheet' media='print' />

<script src='resources/fullcalender/lib/moment.min.js'></script>
<script src='resources/fullcalender/lib/jquery.min.js'></script>
<script src='resources/fullcalender/fullcalendar.min.js'></script>
<script src='resources/fullcalender/demo-to-codepen.js'></script>

<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>

<script>
	$(document).ready(
			function() {
				//
				var email = "seo";
				var other = "kim";
				var lectureNum = 1;
				var matchNum = 1;
				var scheduleNum;
				$("#btn").click(function() {
					$.getJSON("<c:url value='/calInsert'/>",{email:email, other:other, lectureNum:lectureNum, matchNum:matchNum}, 
							function(data) {
									scheduleNum = data.scheduleNum;
									console.log(scheduleNum);
					
				$('#calendar').fullCalendar(
						{
							selectable : true,
							header : {
								left : 'prev,next today',
								center : 'title',
								right : 'month,agendaWeek,agendaDay,listMonth'
							},
							navLinks : true,
							businessHours : true,
							editable : true,
							/* dayClick : function(date, resourceObj) {
								// alert('clicked ' + date.format());
								alert(id + " " + title + " " + date.format());
									var title = prompt('일정', '일정 입력');
									var id = prompt('메모', '메모 입력');
									if(title!=null){
									$('#calendar').fullCalendar('renderEvent',
											{
												id : id,
												title : title,
												date : date.format(),
												overlap : false,
												color : '#ff9f89'
											});
									}
							}, */
							select : function(startDate, endDate) {
									var title = prompt('일정', '일정 입력');
									var memo = prompt('메모', '메모 입력');
									//var sTime = prompt('시작시간');
									//var eTime = prompt('끝시간');
									var start = startDate.format();
									var end = endDate.format();
									console.log(start + " " + end + " " + scheduleNum);
									
									$.getJSON("<c:url value='/cal'/>",{scheduleNum:scheduleNum, memo:memo, title:title, start:start, end:end}, 
											function(data) {
													console.log(data.sche_detailNum);
													$('#calendar').fullCalendar('renderEvent',
															{
																id : data.sche_detailNum,
																description : memo,
																title : title,
																start : start,
																end : end,
																overlap : false,
																color : '#ff9f89'
															}); 
									});
								
							},
							eventClick : function(event, element) {
								alert(event.id + " " + event.description + " " + event.title + " "
										+ event.start + " "
										+ event.end.format());
								if (confirm("정말 삭제하시겠습니까??") == true) {
									$('#calendar').fullCalendar('removeEvents',
											event.id);
								} else {
									if (confirm("수정하시겠습니까") == true) {
										var title = prompt('일정', event.title);
										var description = prompt('메모', event.description);
										event.description = description;
										event.title = title;
										$('#calendar').fullCalendar(
												'updateEvent', event)
									} else {
										return;
									}
								}
							}
						});
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
	<input type="button" id="btn" value="확인">
</body>
</html>

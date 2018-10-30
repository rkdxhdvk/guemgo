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
<script>
	//
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			selectable : true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listMonth'
			},
			defaultDate : '2018-10-12',
			navLinks : true, // can click day/week names to navigate views
			businessHours : true, // display business hours
			editable : true,
			/* dayClick: function(date1) {
			   // alert('clicked ' + date.format());
			   var memo = prompt('메모', '일정 입력'); 
			   if(memo!=null){
			   	var date = moment(date1.format());
			   	if (date.isValid()) {
			          $('#calendar').fullCalendar('renderEvent', {
			            title: memo,
			            start: date,
			            allDay: true
			          });
			        }
			      }
			  }, */
			select : function(startDate, endDate) {
				var memo = prompt('메모', '일정 입력');
				$('#calendar').fullCalendar('renderEvent', {
					title : memo,
					start : startDate.format(),
					end : endDate.format()
				});
				$.ajax({
					url:"<c:url value='/'/>",
					success:function(data){
						
					}
				});
			},
			eventClick : function(event, element) {
				if (confirm("정말 삭제하시겠습니까??") == true) {
					$('#calendar').fullCalendar('removeEvents', [ event ]);
				} else {
					if (confirm("수정하시겠습니까") == true) {
						var memo = prompt('메모', '일정 입력');
						event.title = memo;
						$('#calendar').fullCalendar('updateEvent', event)
					} else {
						return;
					}
				}
			}
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
</style>
</head>
<body>
	<mdiv id='calendar'></mdiv>

</body>
</html>

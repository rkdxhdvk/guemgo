<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'
	integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns'
	crossorigin='anonymous'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href='resources/fullcalender/demo-topbar.css' rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.min.css'
	rel='stylesheet' />
<link href='resources/fullcalender/fullcalendar.print.css'
	rel='stylesheet' media='print' />

<script src='resources/fullcalender/lib/moment.min.js'></script>
<script src='resources/fullcalender/fullcalendar.min.js'></script>
<script src='resources/fullcalender/demo-to-codepen.js'></script>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}
/* 
#calendar {
	max-width: 900px;
	margin: 40px auto;
} */
body {
	margin: 0 auto;
	padding: 0 20px;
}

.container1 {
	border: 2px solid #dedede;
	background-color: #f1f1f1;
	border-radius: 5px;
	padding: 10px;
	margin: 10px 0;
}

.darker {
	border-color: #ccc;
	background-color: #ddd;
	text-align: right;
}

.container1::after {
	content: "";
	clear: both;
	display: table;
}

.container1 img {
	float: left;
	max-width: 60px;
	width: 100%;
	margin-right: 20px;
	border-radius: 50%;
}

.container1 img.right {
	float: right;
	margin-left: 20px;
	margin-right: 0;
}

.time-right {
	float: right;
	color: #aaa;
}

.time-left {
	float: left;
	color: #999;
}

#data {
	overflow: auto;
	height: 715px;
	border: 2px solid #337ab7;
	border-radius: 5px;
	padding: 15px;
}

#name {
	width: 80px;
	margin-top: 10px;
}
</style>
<%-- <script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script> --%>
<script type="text/javascript"
	src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sendBtn").click(function() {
			if ($("#message").val() == "") {
				alert('공백');
				return;
			}
			sendMessage();
			$('#message').val('');
			$('#message').focus();
		});

		$('#data').scrollTop($('#data')[0].scrollHeight);
		
		var events = [];
		var sche_detailNum = parseInt(document.getElementById("sche_detailNum").value);
		var scheduleNum = parseInt(document.getElementById("scheduleNum").value);
		var lectureNum = parseInt(document.getElementById("lectureNum").value);
		var matchNum = parseInt(document.getElementById("matchNum").value);
		var lecturename = document.getElementById("lecturename").value;
		var email = document.getElementById("email").value;
		var other = document.getElementById("other").value;
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
			$.ajax({
				url:"<c:url value='/calInsert'/>",
				data : {scheduleNum:scheduleNum, email:email, other:other, lectureNum:lectureNum, matchNum:matchNum, lecturename:lecturename }, 
				success:function(data){
					console.log(data);
				}
			});
				$('#calendar').fullCalendar('clientEvents', function(event) {
					console.log(event.id);
					$.getJSON("<c:url value='/cal'/>",
							{scheduleNum:scheduleNum, id:event.id, lecturename:event.title, start:event.start.format(), end:event.end.format(), memo:event.description}, 
							function(data) {
									console.log("스케줄 확정1!!");
									alert("스케줄 확정");
					});
				})
			});
		$("#sche_cancel").click(function() {
				$.getJSON("<c:url value='/caldelete'/>", {scheduleNum:scheduleNum}, 
						function(data) {
								alert("스케줄 취소");
				});
				location.href=".main";
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
		                		  $( "<div title='편집'> <p><span class='ui-icon ui-icon-alert' style='float:left; margin:12px 12px 20px 0;'></span>ㅇㅇㅇ</p> <input type='text' id='memo'></div>" ).dialog({
		                		      resizable: false,
		                		      height: "auto",
		                		      width: 400,
		                		      modal: true,
		                		      buttons: {
		                		        "삭제": function() {
		                		        	$('#calendar').fullCalendar('removeEvents', event.id);
		                		        	 $( this ).dialog( "close" );
		                		        },
		                		        "수정": function() {
		                		        	 $( this ).dialog( "close" );
		                		        	  $( "<div id='dialog-update' title='메모'> <p><span class='ui-icon ui-icon-alert' style='float:left; margin:12px 12px 20px 0;''></span>메모?</p> <input type='text' id='memo'> </div>" )
		                		        	  .dialog({
		   		                		      resizable: false,
		   		                		      height: "auto",
		   		                		      width: 400,
		   		                		      modal: true,
		   		                		      buttons: {
		   		                		    	"수정": function() {
				  		                		 $( this ).dialog( "close" );
		   		                		    	 $( "#dialog-update" ).dialog({
		   		                		    		resizable: false,
				   		                		      height: "auto",
				   		                		      width: 400,
				   		                		      modal: true,
				   		                		      buttons: {
				   		                		    	  "수정" : function() {
				   		                		    		var memo = document.getElementById("memo").value;
				   		                		    		event.description = memo;
															$('#calendar').fullCalendar(
																	'updateEvent', event);
															 $( this ).dialog( "close" );
														},
														Cancel: function() {
					  		                		          $( this ).dialog( "close" );
					  		                		     }
				   		                		      }
		   		                		    	 })
		   		                		      },
		   		                		    	Cancel: function() {
		  		                		          $( this ).dialog( "close" );
		  		                		        }
		   		                		      }
		                		        	  })
		                		        },

		                		        Cancel: function() {
		                		          $( this ).dialog( "close" );
		                		        }
		                		      }
		                		  })
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
		$( "#datepicker" ).datepicker();
	      $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
	      
	      
	      if("${msg}"!=""){
	    	  alert("${msg}");
	      }
	});
	var sock;
	sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	function sendMessage() {
		message = {};
		message.msg = $("#message").val();
		message.sender = '${sessionScope.email }';
		message.room = ${room };
		sock.send(JSON.stringify(message));
	}

	function getTimeStamp() {
		var d = new Date();
		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);

		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}

	function onMessage(evt) {
		var data = evt.data;
		var obj = JSON.parse(data);
		var t = getTimeStamp();
		var user = $("#email").val();
		if (obj.sender === user) {
			var str = "<div class='container1 darker'><p>" + obj.msg
					+ "</p><span class=time-left>" + t + "</span>";
			$("#data").append(str);
		} else {
			$("#data").append(
					"<div class='container1'><p>" + obj.msg
							+ "</p><span class=time-right>" + t
							+ "</span></div>");
		}
		$('#data').scrollTop($('#data')[0].scrollHeight);
	}

	function onClose(evt) {
		$("#data").append("연결끊김");
	}
	////////// 스케줄 //////////////
</script>
</head>
<body>
	<input type="hidden" value="${sessionScope.email }" id="email">
	<div class="container-fluid" style="margin-bottom: 15px;">
		<p class="text-left" style="font-size: x-large;">채팅</p>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-5">
				<div id="data">
					<c:forEach var="vo" items="${list }">
						<fmt:formatDate value="${vo.time }" pattern="yyyy-MM-dd HH:mm:ss"
							var="time" />
						<c:choose>
							<c:when test="${vo.sender == sessionScope.email}">
								<div class='container1 darker'>
									<p>${vo.msg }</p>
									<span class='time-left'>${time }</span>
									<c:choose>
										<c:when test="${vo.read == 1 }">
											<span>읽음</span>
										</c:when>
										<c:otherwise>
											<span>읽지않음</span>
										</c:otherwise>
									</c:choose>
								</div>
							</c:when>
							<c:otherwise>
								<div class='container1'>
									<p>${vo.msg }</p>
									<span class='time-right'>${time }</span>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<br>
				<textarea class="form-control" rows="5" id="message"></textarea>
				<br>

				<button type="button" id="sendBtn"
					class="btn btn-primary btn-block" title="입력">
					<i class='fas fa-comment-dots'></i> 전송
				</button>
			</div>
			<!-- //////////////////////////////////추가 //////////////////////////////////// -->
			<div class="col-sm-7">
				<div style="height: 900px; ">
					<div class="container-fluid"
						style="border: solid 2px #337ab7; border-radius: 5px; height: 630px;">
						<input type="hidden" value="${sche_detailNum}" id="sche_detailNum">
						<input type="hidden" value="${scheduleNum}" id="scheduleNum">
						<input type="hidden" value="${lectureNum}" id="lectureNum">
						<input type="hidden" value="${matchNum}" id="matchNum">
						<input type="hidden" value="${lecturename}" id="lecturename">
						<input type="hidden" value="${email}" id="email">
						<input type="hidden" value="${other}" id="other">
						<c:choose>
							<c:when test="${scheselect=='ok' }">
								<div id='calendar'></div>
								<input type="button" id="sche_confirm" value="스케줄 확정">
								<!-- <input type="button" id="sche_cancel" value="취소"> -->
							</c:when>
							
							<c:otherwise>
								<h5>스케주우우우우울</h5>
					<form action="<c:url value='/calaaa'/>" method="get">
					<input type="hidden" name="email" value="${sessionScope.email }">
					<%-- <input type="hidden" name="sname" value="${area}"> --%>
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>강의명</label><br> 		
							<select name="lecture" class="form-control">
								<c:forEach items="${lecList }" var="vo">
									<option value="${vo.lectureNum }/${vo.lectureName}">${vo.lectureName }</option>
								</c:forEach>
							</select>
							</div>
						</div>
						<label>강의횟수</label><br> 
						<div class="form-row">
							<div class="form-group col-sm-12">
							<input type="text" name="count" style="width:20px;">
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>강의시간</label><br> 		
							<select name="time" class="form-control">
								<option value=12>12:00</option>
								<option value=14>14:00</option>
								<option value=16>16:00</option>
								<option value=18>18:00</option>
							</select>
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>요일</label><br> 		
								<input type="checkbox" name="day" value="1">일
								<input type="checkbox" name="day" value="2">월
								<input type="checkbox" name="day" value="3">화
								<input type="checkbox" name="day" value="4">수
								<input type="checkbox" name="day" value="5">목
								<input type="checkbox" name="day" value="6">금
								<input type="checkbox" name="day" value="7">토
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>시작날짜</label>
							<input autocomplete="off" type="text" id="datepicker" name="startDate" size="30">
							</div>
						</div>
						<input type="hidden" value=${room } name="room">
						<button type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12">스케줄</button>
					</form>
							</c:otherwise>
						</c:choose>


					</div>

					<div class="panel panel-primary" style="margin-top: 15px;">
						<div class="panel-heading">${vo.lectureName }</div>
						<div class="panel-body" style="height: 160px;">
							내용
						</div>
					</div>

					<div class="btn-group btn-group-justified">
						<a href="#" class="btn btn-primary">강의신청</a> <a href="#"
							class="btn btn-primary">프로필보기</a> <a href='<c:url value="/room?email=${sessionScope.email }"/>'
							class="btn btn-primary">나가기</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
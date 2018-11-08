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
<style>
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
    margin-right:0;
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
	height: 700px;
	border: 2px solid;
	border-radius: 5px;
	padding: 15px;
}

#name {
	width: 80px;
	margin-top: 10px;
}
</style>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
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
	});
	var sock;
	sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	function sendMessage() {
		message = {};
		message.msg = $("#message").val();
		message.sender = $("#name").val();
		message.receiver = 'bbb';
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
		var user = '${user }';
		if (obj.sender === user) {
			var str = "<div class='container1 darker'><p>" + obj.msg
					+ "</p><span class=time-left>" + t + "</span>";
			if (obj.read === 1) {
				str += "<span>읽음</span></div>";
			} else {
				str += "<span>읽지않음</span></div>";
			}
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
</script>
</head>
<body>
<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">채팅</p>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-4">
			<div id="data">
				<c:forEach var="vo" items="${list }">
					<fmt:formatDate value="${vo.time }"
						pattern="yyyy-MM-dd HH:mm:ss" var="time" />
					<c:choose>
						<c:when test="${vo.sender == user }">
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
			<input type="text" id="name" />
			<textarea class="form-control" rows="5" id="message"></textarea>
			<input type="button" id="sendBtn" value="전송" />
		</div>
		<div class="col-sm-8">
			<div style="border: solid 2px black; height: 900px; padding: 10px;">
				<div class="container-fluid"
					style="border: solid 2px black; height: 600px;"></div>

				<div class="panel panel-primary" style="margin-top: 10px;">
					<div class="panel-heading">강좌명</div>
					<div class="panel-body" style="height: 160px;">내용</div>
				</div>

				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-primary">Apple</a> <a href="#"
						class="btn btn-primary">Samsung</a> <a
						href='<c:url value="/"/>'
						class="btn btn-primary">나가기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
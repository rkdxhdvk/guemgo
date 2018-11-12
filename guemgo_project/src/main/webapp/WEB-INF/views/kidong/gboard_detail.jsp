<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>상세보기</title>
<style type="text/css">
.time-right {
	float: right;
	color: #999;
}
</style>
</head>
<body>
	<div class="container-fluid" style="margin-bottom: 15px;">
		<p class="text-left" style="font-size: x-large;">상세보기</p>

		<button type="submit" class="btn btn-primary" style="float: right;"
			onclick="location='<c:url value='/gboard/delete?num=${vo.num }'/>'">삭제</button>
		<button style="float: right; margin-right: 10px;" type="button"
			class="btn btn-primary" data-toggle="modal" data-target="#myModal">수정</button>

	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>

				<div class="modal-body">
					<form id="articleForm" action="<c:url value='/gboard/update'/>"
						method="post" enctype="multipart/form-data"
						onsubmit="return submitAction()">
						<input type="hidden" name="num" value="${vo.num }"> <input
							type="hidden" name="email" value="${sessionScope.email }">
						<h3 style="margin-bottom: 25px;">Article Form</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" value="${vo.title }" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7">${vo.content }</textarea>
						</div>
						<div class="form-group">
							<input type="text" name="orgfilename" class="form-control"
								value="${vo.orgfilename }">
						</div>
						<div class="form-group">
							<input type="file" name="file1" class="form-control">
						</div>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
						<button type="submit" id="submit" name="submit"
							class="btn btn-primary pull-right">Submit Form</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"
		var="time" />
	<div class="container-fluid"
		style="overflow: auto; height: 45%; border: solid 1px #337ab7; border-radius: 5px; margin-bottom: 15px;">
		<div class="panel-heading">${vo.email }
			<div class="pull-right">
				<span id="recomm">&ensp;${vo.recomm }</span> &ensp;<i
					class='fas fa-eye'></i> ${vo.hit }
			</div>

			<!-- 	<button type="button" class="btn btn-primary pull-right" onclick="recommDown()" id="btn1">추천취소</button> -->
			<!-- 	<button type="button" class="btn btn-primary pull-right" onclick="recommUp()" id="btn2">추천</button> -->
			<c:choose>
				<c:when test="${isRecomm == 'true' }">
					<button type="button" class="btn-xs btn-primary pull-right"
						id="btn3">
						<i class='fas fa-thumbs-down'></i>
					</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn-xs btn-primary pull-right"
						id="btn4">
						<i class='fas fa-thumbs-up'></i>
					</button>
				</c:otherwise>
			</c:choose>
			<hr style="border: solid 1px #337ab7;">


			<div>
				<strong>${vo.title }</strong> <span class="time-right">${time }</span>
				<hr style="border: solid 1px #337ab7;">

			</div>
		</div>

		<div class="panel-body">
			<a
				href="${pageContext.request.contextPath}/resources/upload/${vo.savefilename}"
				target="_blank"> <img class="img-thumbnail" alt=""
				src="${pageContext.request.contextPath}/resources/upload/${vo.savefilename}"
				width="304" height="236">
			</a> ${vo.content }
		</div>
		<div class="form-control" style="margin-bottom: 15px;">
			<a href="<c:url value='/fileDownload?num=${vo.num }'/>">${vo.orgfilename }</a>
			<span class="pull-right">${vo.filesize }</span>
		</div>
	</div>

	<div class="container-fluid" id="comments"
		style="overflow: auto; height: 40%; border: solid 1px #337ab7; border-radius: 5px;">
		<div class="panel-heading">
			Comment
			<hr style="border: solid 1px #337ab7;">
		</div>

		<div class="panel-body" id="commentList">
			<c:forEach var="vo" items="${list }">
				<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"
					var="time" />
				<div class="panel panel-primary">
					<div class="panel-heading">${vo.cnum }</div>
					<div class="panel-body">${vo.content }
						<span class="time-right">${time }</span>
						<hr>
						<button type="button" class="btn btn-primary pull-right"
							onclick="deleteComment(${vo.cnum})">삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<textarea class="form-control" rows="5" id="comment"></textarea>
		<div>
			<span id="count">0</span>/<span id="max-count">0</span>
		</div>
		<button type="button" class="btn btn-primary pull-right"
			onclick="addComment()">Send</button>
	</div>

	<script id="template-list-item" type="text/template">
	<div class="panel panel-primary">
		<div class="panel-heading">{cnum}</div>
		<div class="panel-body">{content}
		<span class="time-right">{regdate}</span>
	<hr>
		<button type="button" class="btn btn-primary pull-right"
						onclick="deleteComment({cnum1})">삭제</button>
	</div>
	</div>
</script>

	<script type="text/javascript">
// 	$(document).ready(function(){
// 		$("#btn1").hide();
// 		$("#btn2").hide();
// 	});
	

	var recomm = ${vo.recomm};
	$(document).on("click","#btn4",function(){
		$.ajax({
			url:"<c:url value='/recommUp?num=${vo.num}&email=${vo.email}'/>",
			dataType:'json',
			success:function(data){
				recomm = data.recomm;
				$("#btn4").attr("id","btn3");
				$("#btn3").html("<i class='fas fa-thumbs-down'></i>");
				$("#recomm").text(recomm);
			}
		});
	});
	
	$(document).on("click","#btn3",function(){
		$.ajax({
			url:"<c:url value='/recommDown?num=${vo.num}&email=${vo.email}'/>",
			dataType:'json',
			success:function(data){
				$("#btn3").attr("id","btn4");
				$("#btn4").html("<i class='fas fa-thumbs-up'></i>");
				$("#recomm").text(recomm - 1);
			}
		});
	});
	
// 	function recommUp(){
// 		$.ajax({
// 			url:"<c:url value='/recommUp?num=${vo.num}&email=${vo.email}'/>",
// 			dataType:'json',
// 			success:function(data){
// 				$("#btn1").show();
// 				$("#btn2").hide();
// 				$("#btn3").hide();
// 				$("#btn4").hide();
// 				$("#recomm").text("${vo.recomm}");
// 			}
// 		});
// 	}
// 	function recommDown(){
// 		$.ajax({
// 			url:"<c:url value='/recommDown?num=${vo.num}&email=${vo.email}'/>",
// 			dataType:'json',
// 			success:function(data){
// 				$("#btn2").show();
// 				$("#btn1").hide();
// 				$("#btn4").hide();
// 				$("#btn3").hide();
// 				$("#recomm").text("${vo.recomm -1}");
// 			}
// 		});
// 	}
	$(document).ready(function(){
	});

	function getList() {
		$.ajax({
			url:"<c:url value='/comment?num=${vo.num }'/>",
			dataType:'json',
			success:function(data){
				$("#commentList").empty();
				var html = document.querySelector("#template-list-item").innerHTML;
				var resultHTML = "";
				$(data).each(function(i, json){
					resultHTML += html.replace("{cnum}", json.cnum)
										.replace("{content}", json.content)
										.replace("{regdate}", json.regdate)
										.replace("{cnum1}", json.cnum);
					
// 					var div = document.createElement("div");
// 					var str = json.cnum + " " + json.content + "<br>";
// 					$(div).html(str);
// 					$("#commentList").append(div);
				});
				document.querySelector("#commentList").innerHTML = resultHTML;
				$('#comments').scrollTop($('#comments')[0].scrollHeight);
			}
		});
	}
	
	function addComment(){
		if($("#comment").val() == ""){
			alert('공백');
			return;
		}
		var num = ${vo.num };
		var comment = $("#comment").val();
		$.getJSON("<c:url value='/commentInsert'/>", {
			"num" : num,
			"comment" : comment
		}, function(data){
			if(data.code){
				$("#comment").val("");
				getList();
			}else
				console.log("fail");
		});
		$('#comment').focus();
	}
	
	function deleteComment(cnum){
		var num = ${vo.num};
		$.getJSON("<c:url value='/commentDelete'/>",{
			"num" : num,
			"cnum" : cnum
		}, function(data){
			if(data.code){
				getList();
			}else
				console.log("fail");
		
		});
	}
	
	
	document.getElementById('comment').addEventListener('keyup',checkByte);
	var countSpan = document.getElementById('count');
	var message = '';
	var MAX_MESSAGE_BYTE = 100;
	document.getElementById('max-count').innerHTML = MAX_MESSAGE_BYTE.toString();
	
	function count(message){
		var totalByte = 0;
		
		for(var index = 0, length = message.length; index < length; index++){
			var currentByte = message.charCodeAt(index);
			(currentByte > 128) ? totalByte += 2 : totalByte++;
		}
		return totalByte;
	}
	
	function checkByte(event){
		const totalByte = count(event.target.value);
		
		if(totalByte <= MAX_MESSAGE_BYTE){
			countSpan.innerText = totalByte.toString();
			message = event.target.value;
		}else{
			alert(MAX_MESSAGE_BYTE + "바이트까지 전송가능합니다.");
			countSpan.innerText = count(message).toString();
			event.target.value = message;
		}
	}
	
	function submitAction() {

		var ext = $('#file').val().split('.').pop().toLowerCase();

		if ($("#file").val() != "") {

			var ext = $('#file').val().split('.').pop().toLowerCase();

			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {

				alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');

				return false;
			}
		}
		return true;
	}
</script>

</body>
</html>
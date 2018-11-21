<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.time-right {
	float: right;
	color: #999;
}

#replyList {
	font-size: smaller;
}
</style>
<body>
<div class="container-fluid">
	<div class="container-fluid" style="margin-bottom: 15px;">
		<p class="text-left" style="font-size: x-large;">상세보기</p>

		<button type="button" class="btn btn-primary" style="float: right;"
			onclick="location.href ='<c:url value='/nboard/list'/>'" title="취소">
			<i class='fas fa-reply'></i>
		</button>

		<c:if test="${sessionScope.email == vo.email || sessionScope.flag == 0}">
			<button type="submit" class="btn btn-primary"
				style="float: right; margin-right: 10px;" title="삭제"
				onclick="deleteSubmit()">
				<i class="fas fa-trash-alt"></i>
			</button>
			<button style="float: right; margin-right: 10px;" type="button"
				title="수정" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">
				<i class="fas fa-wrench"></i>
			</button>
		</c:if>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">공지 게시판</h4>
				</div>

				<div class="modal-body">
					<form id="articleForm" action="<c:url value='/nboard/update'/>"
						method="post">
						<input type="hidden" name="num" value="${vo.num }"> <input
							type="hidden" name="email" value="${vo.email }">
						<h3 style="margin-bottom: 25px;">수정</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" value="${vo.title }" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7" required="required">${vo.content }</textarea>
						</div>
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							title="취소">
							<i class='fas fa-reply'></i>
						</button>
						<button type="submit" name="submit"
							class="btn btn-primary pull-right" title="입력">
							<i class='fas fa-edit'></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"
		var="time" />
	<div class="container-fluid"
		style="overflow: auto; height: 45%; border: solid 1px #337ab7; border-radius: 5px; margin-bottom: 15px;">
		<div class="panel-heading">
			<div class="dropdown">
				<span class="dropdown-toggle" data-toggle="dropdown"
					style="cursor: pointer;"> ${vo.email } </span>

				<ul class="dropdown-menu">
					<li><a href="#">HTML</a></li>
					<li><a href="#">CSS</a></li>
					<li><a href="#">JavaScript</a></li>
				</ul>
				<span class="time-right">${time }</span>
			</div>
			<hr>
			<div class="pull-right">
				<i class='fas fa-eye'></i> ${vo.hit }
			</div>

			<div>
			<c:choose>
				<c:when test="${vo.sort == 'all' }">
					<i class="fas fa-exclamation-circle"></i>
				</c:when>
				<c:when test="${vo.sort == 'gosu' }">
					<i class="fas fa-chalkboard-teacher"></i>
				</c:when>
				<c:otherwise>
					<i class="fas fa-book-reader"></i>
				</c:otherwise>
			</c:choose>
			
				<strong>${vo.title }</strong>
				<hr>

			</div>
		</div>
		<div class="panel-body">

			<div class="form-group">
				<textarea class="form-control" name="content" placeholder="content"
					maxlength="140" rows="7" readonly="readonly">${vo.content }</textarea>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid" style="padding-bottom: 15px;">
	<c:choose>
		<c:when test="${prev.num != null }">
			<div style="float: left;">
				<button type="submit" class="btn btn-primary" title="이전글"
					onclick="location='<c:url value='/nboard/detail?num=${prev.num }'/>'">
					<i class='fas fa-angle-double-left'></i>
				</button>
				<strong>${prev.title }</strong>
			</div>
		</c:when>
		<c:otherwise>
			<div style="float: right;">
				<strong>없음</strong>
				<button type="submit" class="btn btn-primary" disabled="disabled"
					title="이전글">
					<i class='fas fa-angle-double-left'></i>
				</button>
			</div>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${next.num != null }">
			<div style="float: right;">
				<strong>${next.title }</strong>
				<button type="submit" class="btn btn-primary" title="다음글"
					onclick="location='<c:url value='/nboard/detail?num=${next.num }'/>'">
					<i class='fas fa-angle-double-right'></i>
				</button>
			</div>
		</c:when>
		<c:otherwise>
			<div style="float: right;">
				<strong>없음</strong>
				<button type="submit" class="btn btn-primary" disabled="disabled"
					title="다음글">
					<i class='fas fa-angle-double-right'></i>
				</button>
			</div>
		</c:otherwise>
	</c:choose>
</div>
	
<div class="container-fluid">
	<div class="container-fluid" id="comments"
		style="overflow: auto; height: 40%; border: solid 1px #337ab7; border-radius: 5px;">
		<div class="panel-heading">
			Comment
			<hr>
		</div>

		<div class="panel-body" id="commentList">
			<c:forEach var="comm" items="${list }">
				<fmt:formatDate value="${comm.regdate }"
					pattern="yyyy-MM-dd HH:mm:ss" var="time" />
				<div class="panel panel-primary">
					<c:if test="${sessionScope.email == comm.email || sessionScope.flag == 0}">
						<button type="button" class="btn btn-primary pull-right"
							onclick="location.href ='<c:url value='/ncomment/delete?cnum=${comm.cnum }&num=${vo.num }'/>'"
							title="삭제" style="margin: 3px;">
							<i class='fas fa-trash-alt'></i>
						</button>
					</c:if>

					<div class="panel-heading">
						<div class="dropdown">
							<span class="dropdown-toggle" data-toggle="dropdown"
								style="cursor: pointer;"> ${comm.email } </span>
							<ul class="dropdown-menu">
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">JavaScript</a></li>
							</ul>
						</div>
					</div>
					<div class="panel-body">${comm.content }
						<span class="time-right">${time }</span>
						<hr>
						<div id="replyList">
							<c:forEach var="reply" items="${comm.comments }">
							<fmt:formatDate value="${reply.regdate }"
								pattern="yyyy-MM-dd HH:mm:ss" var="regdate" />
								<div class="panel panel-default">
									<div class="panel-body">
									<c:if test="${sessionScope.email == reply.email || sessionScope.flag == 0 }">
										<button type="submit" class="btn btn-primary"
											style="float: right;margin-left: 10px;" title="삭제"
											onclick="location.href ='<c:url value='/nreply/delete?rnum=${reply.num }&num=${vo.num }'/>'">
											<i class="fas fa-trash-alt fa-xs"></i>
										</button>
									</c:if>
										<span>${reply.email }</span> <span>${reply.content }</span> <span
											class="time-right" style="padding-top: 10px;">${regdate }</span>
									</div>
								</div>
							</c:forEach>
						</div>
						<c:if test="${sessionScope.email != null }">
							<form action="<c:url value='/nreply/insert'/>" method="post">
								<input type="hidden" name="cnum" value="${comm.cnum }">
								<input type="hidden" name="num" value="${vo.num }"> <input
									type="hidden" name="email" value="${sessionScope.email }">
								<div class="input-group">
									<input type="text" class="form-control" id="reply"
										name="content" required="required">
									<div class="input-group-btn">
										<button type="submit" class="btn btn-primary" title="답변">
											<i class='fas fa-comment-dots'></i>
										</button>
									</div>
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>


		<c:choose>
			<c:when test="${sessionScope.email != null }">
				<form action="<c:url value='/ncomment/insert'/>" method="post"
					onsubmit="return addComment()">
					<input type="hidden" value="${sessionScope.email }" name="email">
					<input type="hidden" value="${vo.num }" name="num">
					<textarea class="form-control" rows="5" name="content" id="comment"></textarea>
					<div>
						<span id="count">0</span>/<span id="max-count">0</span>
					</div>
					<button type="submit" id="submit" class="btn btn-primary btn-block"
						title="입력" style="margin-bottom: 15px;">
						<i class='fas fa-comment-dots'></i> 입력
					</button>
				</form>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary btn-block"
					onclick="needLogin()" title="입력" style="margin-bottom: 15px;">
					<i class='fas fa-comment-dots'></i> 입력
				</button>
			</c:otherwise>
		</c:choose>
	</div>
</div>

	<script id="template-list-item" type="text/template">
	<div class="panel panel-primary">
					<c:if test="${sessionScope.email == email}">
						<button type="button" class="btn btn-primary pull-right"
							onclick="deleteComment({cnum})" title="삭제"
							style="margin: 3px;">
							<i class='fas fa-trash-alt'></i>
						</button>
					</c:if>

					<div class="panel-heading">
						<div class="dropdown">
							<span class="dropdown-toggle" data-toggle="dropdown"
								style="cursor: pointer;"> {email} </span>
							<ul class="dropdown-menu">
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">JavaScript</a></li>
							</ul>
						</div>
					</div>
					<div class="panel-body">{content}
						<span class="time-right">{regdate}</span>
						<hr>
							<div>
						{Rregdate} {Rcontent}
					</div>
						<c:if test="${sessionScope.email != null }">
							<div class="input-group">
								<input type="text" class="form-control" id="reply">
								<div class="input-group-btn">
									<button type="button" class="btn btn-primary"
										onclick="addReply({num})" title="답변">
										<i class='fas fa-comment-dots'></i>
									</button>
								</div>
							</div>
						</c:if>
					</div>
				</div>
</script>

<script type="text/javascript">
// 	function getList() {
// 		$.ajax({
// 			url:"<c:url value='/ncomment/list?num=${vo.num }'/>",
// 			dataType:'json',
// 			success:function(data){
// 				var html = document.querySelector("#template-list-item").innerHTML;
// 				var resultHTML = "";
// 				console.log(data.reply);
// 				$(data).each(function(i, json){
// 					resultHTML += html.replace("{email}", json.email)
// 										.replace("{content}", json.content)
// 										.replace("{regdate}", json.regdate)
// 										.replace("{cnum}", json.cnum)
// 										.replace("{num}", json.cnum);
// 					$(data.reply).each(function(i, reply){
// 						resultHTML += html.replace("{Rregdate}", reply.regdate)		
// 									.replace("{Rcontent}", reply.content);
// 					});
// 				});
// 				document.querySelector("#commentList").innerHTML = resultHTML;
// 				$('#comments').scrollTop($('#comments')[0].scrollHeight);
// 			}
// 		});
// 	}
	
	function addComment(){
		if($("#comment").val() == ""){
			swal({
				title : "공백",
				text : "내용을 입력해 주세요.",
				icon : "warning",
				button : "확인",
			});
			return false;
		}
	}
	
// 		var num = ${vo.num };
// 		var comment = $("#comment").val();
// 		var email = $("#email").val();
// 		$.getJSON("<c:url value='/ncomment/insert'/>", {
// 			"num" : num,
// 			"content" : comment,
// 			"email" : email
// 		}, function(data){
// 			if(data.code){
// 				$("#comment").val("");
// 				getList();
// 			}else
// 				console.log("fail");
// 		});
// 		$('#comment').focus();
// 	}
	
// 	function deleteComment(cnum){
// 		$.getJSON("<c:url value='/ncomment/delete'/>",{
// 			"cnum" : cnum
// 		}, function(data){
// 			if(data.code){
// 				getList();
// 			}else
// 				console.log("fail");
		
// 		});
// 	}
	
// 	function addReply(cnum){
// 		if($("#reply").val() == ""){
// 			alert('공백');
// 			return;
// 		}
// 		var reply = $("#reply").val();
// 		var email = $("#email").val();
// 		$.getJSON("<c:url value='/nreply/insert'/>", {
// 			"cnum" : cnum,
// 			"content" : reply,
// 			"email" : email
// 		}, function(data){
// 			if(data.code){
// 				$("#reply").val("");
// 				getList();
// 			}else
// 				console.log("fail");
// 		});
// 		$('#reply').focus();
// 	}
	
	
	
	
	
	
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
	
	
	function needLogin(){
		swal({
			title : "로그인",
			text : "로그인 후에 이용",
			icon : "warning",
			button : "확인",
		});
	}
	
	function deleteSubmit(){
		swal({
			  title: "정말 삭제 함?",
			  text: "한번 삭제하면 복구할 수 없습니다!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    window.location.href='<c:url value="/nboard/delete?num=${vo.num }"/>';
			  } else {
			    swal("삭제취소!");
			  }
			});
	}
</script>

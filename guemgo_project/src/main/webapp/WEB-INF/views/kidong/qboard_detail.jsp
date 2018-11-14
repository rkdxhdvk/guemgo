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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
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
		<button type="button" class="btn btn-primary"  style="float: right;"
				onclick = "location.href ='<c:url value='/qboard/list'/>'" title="취소"><i class='fas fa-reply'></i></button>
		<c:if test="${sessionScope.email == vo.email }">
			<button type="submit" class="btn btn-primary" style="float: right;margin-right: 10px;" title="삭제"
				onclick="location='<c:url value='/qboard/delete?num=${vo.num }'/>'"><i class="fas fa-trash-alt"></i></button>
			<button style="float: right; margin-right: 10px;" type="button" title="수정"
				class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fas fa-wrench"></i></button>
		</c:if>

		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Modal Header</h4>
					</div>

					<div class="modal-body">
						<form id="articleForm" action="<c:url value='/qboard/update'/>"
							method="post">
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
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" title="취소"><i class='fas fa-reply'></i></button>
							<button type="submit" id="submit" name="submit"
								class="btn btn-primary pull-right" title="입력"><i class='fas fa-edit'></i></button>
						</form>
					</div>
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

			<hr style="border: solid 1px #337ab7;">
			<div class="pull-right">
				&ensp;<i class='fas fa-eye'></i> ${vo.hit }
			</div>
			<div>
				<strong>${vo.title }</strong>
				<hr style="border: solid 1px #337ab7;">

			</div>
		</div>
		<div class="panel-body">
			<div class="form-group">
				<textarea class="form-control" name="content" placeholder="content"
					maxlength="140" rows="7" readonly="readonly">${vo.content }</textarea>
			</div>
		</div>
	</div>
	<c:choose>
			<c:when test="${sessionScope.email != null }">
				<button type="button" class="btn btn-primary btn-block"
					data-toggle="modal" data-target="#reply" title="답글"><i class='fas fa-comment-dots'></i> 답글</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary btn-block"
					onclick="needLogin()" title="답글"><i class='fas fa-comment-dots'></i>
					로그인</button>
			</c:otherwise>
		</c:choose>
		


	<div class="modal fade" id="reply" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>

				<div class="modal-body">
					<form id="articleForm" action="<c:url value='/qboard/insert'/>"
						method="post">
						<input type="hidden" name="num" value="${vo.num }"> <input
							type="hidden" name="grp" value="${vo.grp }"> <input
							type="hidden" name="lev" value="${vo.lev }"> <input
							type="hidden" name="step" value="${vo.step }"> <input
							type="hidden" name="email" value="${sessionScope.email }">
						<input type="hidden" name="sort" value="${vo.sort }">
						<h3 style="margin-bottom: 25px;">Article Form</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7"></textarea>
						</div>

						<button type="button" class="btn btn-primary" data-dismiss="modal" title="취소"><i class='fas fa-reply'></i></button>
						<button type="submit" id="submit" name="submit"
							class="btn btn-primary pull-right" title="입력"><i class='fas fa-edit'></i></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function needLogin(){
	alert('로그인');
	window.location.href = '/go';
}

</script>
</html>
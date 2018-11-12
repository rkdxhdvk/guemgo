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

		<c:if test="${sessionScope.email == vo.email }">
			<button type="submit" class="btn btn-primary" style="float: right;"
				data-toggle="modal" data-target="#myModal">수정</button>
			<button type="submit" class="btn btn-primary"
				style="float: right; margin-right: 10px;"
				onclick="location='<c:url value='/qboard/delete?num=${vo.num }&grp=${vo.grp }&lev=${vo.lev }'/>'">삭제</button>
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
								data-dismiss="modal">Close</button>
							<button type="submit" id="submit" name="submit"
								class="btn btn-primary pull-right">Submit Form</button>
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
		<div class="panel-heading">${vo.email }
			<div class="pull-right">
				&ensp;<i class='fas fa-eye'></i> ${vo.hit }
			</div>

			<!-- 	<button type="button" class="btn btn-primary pull-right" onclick="recommDown()" id="btn1">추천취소</button> -->
			<!-- 	<button type="button" class="btn btn-primary pull-right" onclick="recommUp()" id="btn2">추천</button> -->

			<hr style="border: solid 1px #337ab7;">
			<div>
				<strong>${vo.title }</strong> <span class="time-right">${time }</span>
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


	<button type="button" class="btn btn-primary" style="float: right;"
		data-toggle="modal" data-target="#reply">답글</button>

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
						<h3 style="margin-bottom: 25px;">Article Form</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7"></textarea>
						</div>

						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
						<button type="submit" id="submit" name="submit"
							class="btn btn-primary pull-right">Submit Form</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
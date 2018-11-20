<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.time-right {
	float: right;
	color: #999;
}
</style>
	<div class="container-fluid" style="margin-bottom: 15px;padding-top: 145px;">
		<div class="container-fluid" style="margin-bottom: 15px;">
			<p class="text-left" style="font-size: x-large;">상세보기</p>
			<button type="button" class="btn btn-primary" style="float: right;"
				onclick="location.href ='<c:url value='/qboard/list'/>'" title="취소">
				<i class='fas fa-reply'></i>
			</button>
			<c:if test="${sessionScope.email == vo.email }">
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

			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">QnA 게시판</h4>
						</div>

						<div class="modal-body">
							<form id="articleForm" action="<c:url value='/qboard/update'/>"
								method="post">
								<input type="hidden" name="num" value="${vo.num }"> <input
									type="hidden" name="email" value="${sessionScope.email }">
								<h3 style="margin-bottom: 25px;">수정</h3>
								<div class="form-group">
									<input type="text" class="form-control" name="title"
										placeholder="title" value="${vo.title }" required>
								</div>
								<div class="form-group">
									<textarea class="form-control" name="content"
										placeholder="content" maxlength="140" rows="7">${vo.content }</textarea>
								</div>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal" title="취소">
									<i class='fas fa-reply'></i>
								</button>
								<button type="submit" id="submit" name="submit"
									class="btn btn-primary pull-right" title="입력">
									<i class='fas fa-edit'></i>
								</button>
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

				<hr>
				<div class="pull-right">
					&ensp;<i class='fas fa-eye'></i> ${vo.hit }
				</div>
				<div>
				<c:choose>
					<c:when test="${vo.sort == 'music' }">
						<i class="fas fa-music"></i>
					</c:when>
					<c:when test="${vo.sort == 'art' }">
						<i class="fas fa-palette"></i>
					</c:when>
					<c:when test="${vo.sort == 'cook' }">
						<i class="fas fa-drumstick-bite"></i>
					</c:when>
					<c:otherwise>
						<i class="fab fa-apple"></i>
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
		<c:choose>
			<c:when test="${sessionScope.email != null }">
				<button type="button" class="btn btn-primary btn-block"
					data-toggle="modal" data-target="#reply" title="답글">
					<i class='fas fa-comment-dots'></i> 답글
				</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary btn-block"
					onclick="needLogin()" title="답글">
					<i class='fas fa-comment-dots'></i> 로그인
				</button>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="modal fade" id="reply" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">QnA 게시판</h4>
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
						<h3 style="margin-bottom: 25px;">답변</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7"></textarea>
						</div>

						<button type="button" class="btn btn-primary" data-dismiss="modal"
							title="취소">
							<i class='fas fa-reply'></i>
						</button>
						<button type="submit" id="submit" name="submit"
							class="btn btn-primary pull-right" title="입력">
							<i class='fas fa-edit'></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<c:choose>
			<c:when test="${vo.lev eq '0' }">
				<div class="table-responsive">
					<table class="table table-bordered table-striped table-hover"
						id="tableList">
						<thead>
							<tr>
								<th style="width: 5%; text-align: center;">sort</th>
								<th style="width: 50%; text-align: center;">title</th>
								<th style="width: 15%; text-align: center;">email</th>
								<th style="width: 5%; text-align: center;">hit</th>
								<th style="width: 15%; text-align: center;">regdate</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo2" items="${list }" varStatus="status">
								<tr>
									<td style="text-align: center;"><c:choose>
											<c:when test="${vo2.sort == 'music' }">
												<i class="fas fa-music"></i>
											</c:when>
											<c:when test="${vo2.sort == 'art' }">
												<i class="fas fa-palette"></i>
											</c:when>
											<c:when test="${vo2.sort == 'cook' }">
												<i class="fas fa-drumstick-bite"></i>
											</c:when>
											<c:otherwise>
												<i class="fab fa-apple"></i>
											</c:otherwise>
										</c:choose></td>
									<td><c:if test="${vo2.lev>0 }">
											<c:forEach var="i" begin="1" end="${vo2.lev }">
										&nbsp;&nbsp;
									</c:forEach>
											<i class="	far fa-hand-point-right"></i>
										</c:if> <a
										href="<c:url value='/qboard/detail?num=${vo2.num }&grp=${vo2.grp }'/>">${vo2.title }</a>

									</td>
									<td><div class="dropdown">
											<span class="dropdown-toggle" data-toggle="dropdown"
												style="cursor: pointer;"> ${vo2.email } </span>
											<ul class="dropdown-menu">
												<li><a href="#">HTML</a></li>
												<li><a href="#">CSS</a></li>
												<li><a href="#">JavaScript</a></li>
											</ul>
										</div></td>
									<td style="text-align: center;">${vo2.hit }</td>
									<td style="text-align: right;">${vo2.regdate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>


			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary btn-block"
					onclick="location='<c:url value='/qboard/getQna?grp=${vo.grp }'/>'" title="답글">
					<i class='fas fa-comment-dots'></i> 질문글
				</button>
			</c:otherwise>
		</c:choose>
	</div>
<script type="text/javascript">
function needLogin(){
	alert('로그인');
	window.location.href = '/go';
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
		    window.location.href='<c:url value="/qboard/delete?num=${vo.num }&grp=${vo.grp }&lev=${vo.lev }"/>';
		  } else {
		    swal("삭제취소!");
		  }
		});
}
</script>

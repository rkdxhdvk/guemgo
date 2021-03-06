<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#content {
	padding-left: 85px;
    padding-right: 85px;
}
</style>

	<div class="container-fluid" style="margin-bottom: 15px;padding-top: 145px;">
		<p class="text-left" style="font-size: x-large;">QnA 게시판</p>
		<c:choose>
			<c:when test="${sessionScope.email != null }">
				<button type="button" class="btn btn-primary btn-block" title="글쓰기"
					data-toggle="modal" data-target="#myModal"><i class='fas fa-edit'></i>글쓰기</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary btn-block" title="글쓰기"
					onclick="needLogin()"><i class='fas fa-edit'></i>글쓰기</button>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
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
						<input type="hidden" name="email" value="${sessionScope.email }">
						<h3 style="margin-bottom: 25px;">글쓰기</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" required>
						</div>
						<div class="form-group">
							<select class="form-control" name="sort">
								<option value="music">음악</option>
								<option value="art">미술</option>
								<option value="cook">요리</option>
								<option value="design">디자인</option>
							</select>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7"></textarea>
						</div>

						<button type="button" class="btn btn-primary" data-dismiss="modal" title="취소"><i class='fas fa-undo'></i></button>
						<button type="submit" id="submit" name="submit" title="입력"
							class="btn btn-primary pull-right"><i class='fas fa-edit'></i></button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid" style="margin-bottom: 15px;">
		<div class="btn-group btn-group">
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/qboard/list?sort=music'/>"'>음악</button>
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/qboard/list?sort=art'/>"'>미술</button>
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/qboard/list?sort=cook'/>"'>요리</button>
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/qboard/list?sort=design'/>"'>디자인</button>
		</div>

		<form method="post" action="<c:url value='/qboard/list'/>"
			style="display: inline-flex; float: right;">
			<div class="input-group">
				<select class="form-control" name="field">
					<option value="title"
						<c:if test="${field == 'title' }">selected="selected"</c:if>>글제목</option>
					<option value="email"
						<c:if test="${field == 'email' }">selected="selected"</c:if>>작성자</option>
					<option value="content"
						<c:if test="${field == 'content' }">selected="selected"</c:if>>내용</option>
				</select>
			</div>
			<div class="input-group">
				<input type="text" class="form-control" name="keyword"
					value="${keyword }">
				<div class="input-group-btn">
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>

	<div class="container-fluid">
		<div class="table-responsive">
			<table class="table table-bordered table-striped table-hover"
				id="tableList">
				<thead>
					<tr>
						<th style="width: 5%;text-align: center;">sort</th>
						<th style="width: 50%;text-align: center;">title</th>
						<th style="width: 15%;text-align: center;">email</th>
						<th style="width: 5%;text-align: center;">hit</th>
						<th style="width: 15%;text-align: center;">regdate</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }" varStatus="status">
						<tr>
							<td style="text-align: center;"><c:choose>
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
								</c:choose></td>
							<td><c:if test="${vo.lev>0 }">
									<c:forEach var="i" begin="1" end="${vo.lev }">
										&nbsp;&nbsp;
									</c:forEach>
									<i class="	far fa-hand-point-right"></i>
								</c:if> <a href="<c:url value='/qboard/detail?num=${vo.num }&grp=${vo.grp }'/>">${vo.title }</a>

							</td>
							<td><div class="dropdown">
									<span class="dropdown-toggle" data-toggle="dropdown"
										style="cursor: pointer;"> ${vo.email } </span>
									<ul class="dropdown-menu">
										<li><a href="#">HTML</a></li>
										<li><a href="#">CSS</a></li>
										<li><a href="#">JavaScript</a></li>
									</ul>
								</div></td>
							<td style="text-align: center;">${vo.hit }</td>
							<td style="text-align: right;">${vo.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>



		<div class="text-center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pu.startPageNum > 5 }">
						<li><a
							href="<c:url value='/qboard/list?pageNum=${pu.startPageNum - 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
								<i class="fa fa-chevron-left"></i>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href=""> <i
								class="fa fa-chevron-left"></i></a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var="i" begin="${pu.startPageNum }"
					end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${pu.pageNum == i }">
							<li class="active"><a
								href="<c:url value='/qboard/list?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value='/qboard/list?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${pu.endPageNum < pu.totalPageCount }">
						<li><a
							href="<c:url value='/qboard/list?pageNum=${pu.endPageNum + 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
							<i class="fa fa-chevron-right"></i>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href=""> <i
								class="fa fa-chevron-right"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
<script type="text/javascript">
	function needLogin() {
		swal({
			title : "로그인",
			text : "로그인 후에 이용",
			icon : "warning",
			button : "확인",
		});
	}
	if(${code == 'success'}){
		swal({
			title : "성공!!",
			text : "요청하신 작업이 성공",
			icon : "success",
			button : "확인",
		});
	}else if(${code == 'fail'}){
		swal({
			title : "실패!!",
			text : "요청하신 작업이 실패",
			icon : "error",
			button : "확인",
		});
	}
</script>











<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<c:remove var="code" scope="session"/>
	<div class="container-fluid" style="margin-bottom: 15px;">
		<p class="text-left" style="font-size: x-large;">자유 게시판</p>

		<c:choose>
			<c:when test="${sessionScope.email != null }">
				<button style="float: right;" type="button"
					class="btn btn-primary btn-block" title="글쓰기" data-toggle="modal"
					data-target="#myModal">
					<i class='fas fa-edit'></i>글쓰기
				</button>
			</c:when>
			<c:otherwise>
				<button style="float: right;" type="button"
					class="btn btn-primary btn-block" title="글쓰기"
					onclick="needLogin()">
					<i class='fas fa-edit'></i>글쓰기
				</button>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">자유 게시판</h4>
				</div>

				<div class="modal-body">
					<form id="articleForm" action="<c:url value='/gboard/insert'/>"
						method="post" enctype="multipart/form-data"
						onsubmit="return submitAction()">
						<input type="hidden" name="email" value="${sessionScope.email }">
						<h3 style="margin-bottom: 25px;">글쓰기</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7" required="required"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="file1" id="file" class="form-control">
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

	<div class="container-fluid" style="margin-bottom: 15px;">
		<div class="btn-group btn-group">
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/gboard/list?sort=hit'/>"'>조회수</button>
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/gboard/list?sort=recomm'/>"'>추천수</button>
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/gboard/list?sort=comments'/>"'>코멘트수</button>
		</div>

		<form method="post" action="<c:url value='/gboard/list'/>"
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
			<table class="table table-striped table-hover">
				<tbody>
					<c:forEach var="vo" items="${list }">
						<c:choose>
							<c:when test="${vo.comments != 0 }">
								<tr style="border-left: 5px solid #337ab7">
							</c:when>
							<c:otherwise>
								<tr style="border-left: 5px solid #D3D3D3">
							</c:otherwise>
						</c:choose>
						<td style="width: 5%; text-align: center;">${vo.num }</td>
						<c:choose>
							<c:when test="${vo.orgfilename != null }">
								<td style="width: 5%; text-align: center;"><i
									class='fas fa-image'></i></td>
							</c:when>
							<c:otherwise>
								<td style="width: 5%; text-align: center;"><i
									class='fas fa-scroll'></i></td>
							</c:otherwise>
						</c:choose>
						<td style="width: 44%"><a
							href="<c:url value='/gboard/detail?num=${vo.num }'/>">${vo.title }</a></td>
						<td style="width: 7%"><i class='fas fa-comment'></i>
							${vo.comments }</td>
						<td style="width: 7%"><i class='fas fa-thumbs-up'></i>
							${vo.recomm }</td>
						<td style="width: 7%"><i class='fas fa-eye'></i> ${vo.hit }</td>
						<td style="width: 15%"><div class="dropdown">
								<span class="dropdown-toggle" data-toggle="dropdown"
									style="cursor: pointer;"> ${vo.email } </span>
								<ul class="dropdown-menu">
									<li><a href="#">HTML</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">JavaScript</a></li>
								</ul>
							</div></td>
						<td style="width: 10%; text-align: right;">${vo.regdate }</td>
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
							href="<c:url value='/gboard/list?pageNum=${pu.startPageNum - 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
								<i class="fa fa-chevron-left"></i>
						</a></li>
						<li><a
							href="<c:url value='/gboard/list?pageNum=1&field=${field }&keyword=${keyword }&sort=${sort }'/>">1</a></li>
						<li class="disabled"><a href="">...</a></li>
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
								href="<c:url value='/gboard/list?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value='/gboard/list?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${pu.endPageNum < pu.totalPageCount }">
						<li class="disabled"><a href="">...</a></li>
						<li><a
							href="<c:url value='/gboard/list?pageNum=${pu.totalPageCount }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${pu.totalPageCount }</a></li>
						<li><a
							href="<c:url value='/gboard/list?pageNum=${pu.endPageNum + 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
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

<script>
	function submitAction() {

		var ext = $('#file').val().split('.').pop().toLowerCase();

		if ($("#file").val() != "") {

			var ext = $('#file').val().split('.').pop().toLowerCase();

			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {

				swal({
					title : "업로드 실패",
					text : "gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.",
					icon : "warning",
					button : "확인",
				});

				return false;
			}

		}
		return true;

	}

	function needLogin() {
		swal({
			title : "로그인",
			text : "로그인 후에 이용",
			icon : "warning",
			button : "확인",
		});
	}
	
</script>

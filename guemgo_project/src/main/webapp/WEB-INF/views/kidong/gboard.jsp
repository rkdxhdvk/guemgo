<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>자유게시판</title>
</head>
<body>
	<div class="container-fluid" style="margin-bottom: 15px;">
		<p class="text-left" style="font-size: x-large;">게시판</p>
		<!-- 		<button type="button" class="btn btn-primary" style="float: right;" -->
		<%-- 			onclick="location='<c:url value='/gboard/insert'/>'">글쓰기</button> --%>
		<button style="float: right;" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#myModal">글쓰기</button>
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
					<form id="articleForm" action="<c:url value='/gboard/insert'/>"
						method="post" enctype="multipart/form-data" onsubmit="return submitAction()">
						<input type="hidden" name="email" value="${sessionScope.email }">
						<h3 style="margin-bottom: 25px;">Article Form</h3>
						<div class="form-group">
							<input type="text" class="form-control" name="title"
								placeholder="title" required>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content"
								placeholder="content" maxlength="140" rows="7"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="file1" id="file" class="form-control">
						</div>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
						<button type="submit" id="submit" name="submit"
							class="btn btn-primary pull-right">Submit Form</button>
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
					<button type="submit" class="btn">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<div class="container-fluid">

		<div class="table-responsive">
			<table class="table table-bordered table-striped table-hover">
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
						<td style="width: 5%">${vo.num }</td>
						<td style="width: 44%"><a
							href="<c:url value='/gboard/detail?num=${vo.num }'/>">${vo.title }</a></td>
						<td style="width: 7%"><i class='fas fa-comment'></i>
							${vo.comments }</td>
						<td style="width: 7%"><i class='fas fa-thumbs-up'></i>
							${vo.recomm }</td>
						<td style="width: 7%"><i class='fas fa-eye'></i> ${vo.hit }</td>
						<td style="width: 15%">${vo.email }</td>
						<td style="width: 15%">${vo.regdate }</td>
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

</body>
<script>
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
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="container-fluid" style="margin-bottom: 15px;padding-top: 145px;">
		<p class="text-left" style="font-size: x-large;">후기 게시판</p>
	<c:if test="${sessionScope.email!=null }">
		<button type="button" class="btn btn-primary" style="float: right;"
			onclick="location='<c:url value='/reInsert'/>'">글쓰기</button>
	</c:if>
	</div>
	<div class="container-fluid" style="margin-bottom: 15px;">
		<div class="btn-group btn-group">
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/reList?sort=hit'/>"'>조회수</button>
			<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/reList?sort=comments'/>"'>코멘트수</button>
		</div>

		<form method="post" action="<c:url value='/reList'/>"
			style="display: inline-flex; float: right;">
			<div class="input-group">
				<select class="form-control" name="field">
					<option value="title"
						<c:if test="${field == 'title' }">selected="selected"</c:if>>글제목</option>
					<option value="email"
						<c:if test="${field == 'email' }">selected="selected"</c:if>>작성자</option>
					<option value="content"
						<c:if test="${field == 'content' }">selected="selected"</c:if>>내용</option>
					<option value="content"
						<c:if test="${field == 'other' }">selected="selected"</c:if>>고수</option>
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
				<thead>
					
					<th>글번호</th>
					<th>후기대상</th>
					<th>평점</th>
					<th>글제목</th>
					<th>댓글</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성일</th>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<td style="width: 5%">${vo.reviewNum }</td>
						<td style="width: 5%">${vo.other } 고수님</td>
						<c:choose>
							<c:when test="${vo.star==5 }">
								<td style="width:5%">★★★★★</td>
							</c:when>
							<c:when test="${vo.star==4 }">
								<td style="width:5%">★★★★</td>
							</c:when>
							<c:when test="${vo.star==3 }">
								<td style="width:5%">★★</td>
							</c:when>
							<c:when test="${vo.star==2 }">
								<td style="width:5%">★</td>
							</c:when>
							<c:when test="${vo.star==1 }">
								<td style="width:5%">☆</td>
							</c:when>
						</c:choose>
						<td style="width: 44%"><a
							href="<c:url value='/reDetail?reviewNum=${vo.reviewNum }'/>">${vo.title }</a></td>
						<td style="width: 7%"><i class='fas fa-comment'></i>
							${vo.comments }</td>
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
							href="<c:url value='/reList?pageNum=${pu.startPageNum - 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
								<i class="fa fa-chevron-left"></i>
						</a></li>
						<li><a
							href="<c:url value='/reList?pageNum=1&field=${field }&keyword=${keyword }&sort=${sort }'/>">1</a></li>
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
								href="<c:url value='/reList?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value='/reList?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${pu.endPageNum < pu.totalPageCount }">
						<li class="disabled"><a href="">...</a></li>
						<li><a
							href="<c:url value='/reList?pageNum=${pu.totalPageCount }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${pu.totalPageCount }</a></li>
						<li><a
							href="<c:url value='/reList?pageNum=${pu.endPageNum + 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
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


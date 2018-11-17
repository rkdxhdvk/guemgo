<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">게시판</p>
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
					<td style="width: 46%"><a
						href="<c:url value='/gboard/detail?num=${vo.num }'/>">${vo.title }</a></td>
					<td style="width: 8%"><i class='fas fa-comment'></i>
						${vo.comments }</td>
					<td style="width: 8%"><i class='fas fa-thumbs-up'></i>
						${vo.recomm }</td>
					<td style="width: 8%"><i class='fas fa-eye'></i> ${vo.hit }</td>
					<td style="width: 15%;">${vo.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="text-center">
	<ul class="pagination">
		<c:choose>
			<c:when test="${pu.startPageNum > 5 }">
				<li><a
					href="<c:url value='/selectGboard?pageNum=${pu.startPageNum - 1 }'/>">
						<i class="fa fa-chevron-left"></i>
				</a></li>
				<li><a
					href="<c:url value='/selectGboard?pageNum=1'/>">1</a></li>
				<li class="disabled"><a href="">...</a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href=""> <i
						class="fa fa-chevron-left"></i></a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum == i }">
					<li class="active"><a
						href="<c:url value='/selectGboard?pageNum=${i }'/>">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="<c:url value='/selectGboard?pageNum=${i }'/>">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pu.endPageNum < pu.totalPageCount }">
				<li class="disabled"><a href="">...</a></li>
				<li><a
					href="<c:url value='/selectGboard?pageNum=${pu.totalPageCount }'/>">${pu.totalPageCount }</a></li>
				<li><a
					href="<c:url value='/selectGboard?pageNum=${pu.endPageNum + 1 }'/>">
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

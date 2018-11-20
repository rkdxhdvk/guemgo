<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>진행중인 강의</title>
</head>
<body>
	<c:if test="${sessionScope.email!=null }">
	<div class="container-fluid" style="margin-bottom: 15px;">
		<p class="text-left" style="font-size: x-large;">진행중인 강의</p>
<%-- 		<button type="button" class="btn btn-primary" style="float: right;"
			onclick="location='<c:url value='/reInsert'/>'">글쓰기</button> --%>
	</div>
	</c:if>

	<div class="container-fluid">
		<div class="table-responsive">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					
					<th>번호</th>
					<th>강의명</th>
					<th>강의번호</th>
					<th>고수이메일</th>
					<th>진행 상태</th>

				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }" varStatus="ss">
					<tr>
						<td style="width: 10%">${vo.num }</td>
						<td style="width: 20%">&nbsp;
							<c:forEach var="vo2" items="${list2 }" varStatus="rr">
								<c:if test="${ss.index == rr.index }">
									${vo2.lectureName }
								</c:if>
							
							</c:forEach>
						</td>    
						<td style="width: 20%">${vo.lecturenum }</td>

						<td style="width: 10%"><a
							href="<c:url value='/receivedetail?num=${vo.req_num }&email=${sessionScope.email }&lecturenum=${vo.lecturenum }'/>">${vo.req_num }</a></td>
						<td style="width: 10%">${vo.req_date }</td>
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

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<body>
	
		
	<div class="container-fluid" style="margin-bottom: 15px; padding-top: 180px;">
		<div class="table-responsive" style="width: 60%; height: 100%; margin: auto;">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					
					<th>번호</th>
					<th>강의명</th>
					<th>강의번호</th>
					<th>요청서번호</th>
					<th>받은 날짜</th>

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
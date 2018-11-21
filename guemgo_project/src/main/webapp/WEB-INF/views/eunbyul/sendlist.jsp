
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
<title>받은 요청 내역</title>
</head>
<body>
	
	
	
	<div class="container-fluid">
		<div class="table-responsive">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					
					<th>요청서번호</th>
					<th>분야</th>
					<th>요청 날짜</th>
					<th>요청 상태</th>
					<th>자세히 보기</th>
					<th>요청서 삭제</th>
					

				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
					<c:if test="${vo.lec_start!=3 }">
						<td style="width: 10%">${vo.req_num }</td>
						<%-- <td style="width: 10%"><a
							href="<c:url value='/receivedetail?num=${vo.req_num } & email =${email } & lecturename = ${vo.lecturename }'/>">${vo.req_num }</a></td> --%>
						<td style="width: 20%">	
						<c:if test="${vo.mnum==0 }">그래픽디자인</c:if>
						<c:if test="${vo.mnum==1 }">그래픽디자인</c:if>
						<c:if test="${vo.mnum==2 }">패션디자인</c:if>
						<c:if test="${vo.mnum==3 }">제품디자인</c:if>
						<c:if test="${vo.mnum==4 }">회화</c:if>
						<c:if test="${vo.mnum==5 }">동양화</c:if>
						<c:if test="${vo.mnum==6 }">애니메이션</c:if>
						<c:if test="${vo.mnum==7 }">보컬</c:if>
						<c:if test="${vo.mnum==8 }">작곡</c:if>
						<c:if test="${vo.mnum==9 }">악기</c:if>
						<c:if test="${vo.mnum==10 }">조리</c:if>
						<c:if test="${vo.mnum==11 }">베이킹</c:if>
						<c:if test="${vo.mnum==12 }">식음료</c:if>
						
						
						</td>
						<td style="width: 10%">${vo.req_date }</td>
						<td style="width: 10%">
						<c:if test="${vo.lec_start==0 }">요청중</c:if>
						<c:if test="${vo.lec_start!=0 }">요청완료</c:if>
						</td>
						<td style="width: 20%"><a
							href="<c:url value='/senddetail?num=${vo.req_num }'/>">자세히 보기</a></td>
						<td style="width: 20%"><a
							href="<c:url value='/senddelete?num=${vo.req_num }&email=${email }'/>">삭제</a></td>
						</tr>
						</c:if>
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


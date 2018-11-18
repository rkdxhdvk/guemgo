<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-10-29	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원전체목록</h1>
<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th style="width: 10%; text-align: center;">회원번호</th>
					<th style="width: 25%; text-align: center;">이메일</th>
					<th style="width: 20%; text-align: center;">이름</th>
					<th style="width: 15%; text-align: center;">포인트</th>
					<th style="width: 15%; text-align: center;">가입일</th>
					<th style="width: 5%; text-align: center;">삭제</th>
					<th style="width: 5%; text-align: center;">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td style="width: 15%">${vo.m_num }</td>
						<td style="width: 20%">${vo.email }</td>
						<td style="width: 20%">${vo.name }</td>
						<td style="width: 15%">${vo.point }</td>
						<td style="width: 15%">${vo.regdate}</td>
						<td style="width: 5%"><a href='<c:url value='/UserDelete?email=${vo.email }'/>'>삭제</a></td>
						<td style="width: 5%"><a href='<c:url value='/UserUpdate?email=${vo.email }'/>'>수정</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<form method="post" action="<c:url value='/UserList'/>"
			style="display: inline-flex; float: right;">
			<div class="input-group">
				<select class="form-control" name="field">
					<option value="email" <c:if test="${field == 'email' }">selected="selected"</c:if>>이메일</option>
					<option value="name" <c:if test="${field == 'name' }">selected="selected"</c:if>>이름</option>
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
<div class="text-center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pu.startPageNum > 5 }">
						<li><a
							href="<c:url value='/UserList?pageNum=${pu.startPageNum - 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
								<i class="fa fa-chevron-left"></i>
						</a></li>
						<li><a
							href="<c:url value='/UserList?pageNum=1&field=${field }&keyword=${keyword }&sort=${sort }'/>">1</a></li>
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
								href="<c:url value='/UserList?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value='/UserList?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${pu.endPageNum < pu.totalPageCount }">
						<li class="disabled"><a href="">...</a></li>
						<li><a
							href="<c:url value='/UserList?pageNum=${pu.totalPageCount }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${pu.totalPageCount }</a></li>
						<li><a
							href="<c:url value='/UserList?pageNum=${pu.endPageNum + 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
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
</body>
</html>

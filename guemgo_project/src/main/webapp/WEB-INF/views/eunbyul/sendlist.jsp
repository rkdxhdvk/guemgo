
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<body>
	
		
	<div class="container-fluid" style="margin-bottom: 15px; padding-top: 180px;">
		<div class="table-responsive" style="width: 60%; height: 100%; margin: auto;">
		<h1>보낸 요청 내역</h1><br>

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
						<td style="width: 20%">${vo.req_date }</td>
						<td style="width: 20%">
						<c:if test="${vo.lec_start==0 }">요청중</c:if>
						<c:if test="${vo.lec_start!=0 }">요청완료</c:if>
						</td>
						<td style="width: 20%">
						<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/senddetail?num=${vo.req_num }'/>"'>
						자세히 보기</button></td>
						<td style="width: 10%">
						<button type="button" class="btn btn-primary"onclick='location.href="<c:url value='/senddelete?num=${vo.req_num }&email=${email }'/>"'>
						삭제</button></td>
						</tr>
						</c:if>
						</c:forEach>
						
				</tbody>
				
			</table>
			</div>
		</div>
	</div>

	

</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	
<div class="container-fluid" style="margin-bottom: 15px;">
			<h1 style="text-align:center;">판매현황</h1>
 			<div style="margin-right:auto; margin-left:auto;">
			<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/Statistics?sort=1'/>"'>
						이용자수</button>
			<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/Statistics?sort=2'/>"'>
						매출현황</button>
			<button type="button" class="btn btn-primary" onclick='location.href="<c:url value='/Statistics?sort=3'/>"'>
						매칭률</button>
			</div>
			
		<table class="table table-bordered table-striped table-hover">
				<thead>
	<!-- 				
					<th>번호</th> -->
					<th>구매자</th>
					<th>결제방법</th>
					<th>판매일시</th>
					<th>판매금액</th>

				</thead>
				<tbody>
 					<c:forEach var="vo" items="${list }" varStatus="ss"> 
					<tr>
 						<td style="width: 30%">${vo.email }</td>
 						<td style="width: 20%">${vo.payoption }</td>
 						<td style="width: 30%">${vo.paydate }</td>
 						<td style="width: 20%">${vo.paymoney }</td>

 						</tr>
					</c:forEach> 
				</tbody>
			</table>
			<div style="text-align:right;">총 판매금액: ${total }</div>
</div>
</body>
</html>
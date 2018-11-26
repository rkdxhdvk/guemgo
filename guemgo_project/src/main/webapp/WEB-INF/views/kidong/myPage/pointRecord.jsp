<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	코드 0일때 사용, 0이 아니면 충전으로 표시되도록 변경(윤우현) 
 -->
<h1>포인트 사용내역</h1>

<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th style="width: 15%; text-align: center;">일자</th>
					<th style="width: 10%; text-align: center;">구분</th>
					<th style="width: 45%; text-align: center;">상세내역</th>
					<th style="width: 15%; text-align: center;">거래포인트</th>
					<th style="width: 15%; text-align: center;">잔여포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td style="width: 15%">${vo.pointdate }</td>
						<td style="width: 10%">
							${ vo.division == 0 ? '사용 ' : '충전' } <!-- 삼항 -->
						</td>
						<td style="width: 45%">${vo.detail }</td>
						<td style="width: 15%">${vo.dpoint }</td>
						<td style="width: 15%">${vo.lpoint }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
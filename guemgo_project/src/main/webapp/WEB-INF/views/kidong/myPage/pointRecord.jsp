<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<td style="width: 10%">${vo.division_name }</td>
						<td style="width: 45%">${vo.detail }</td>
						<td style="width: 15%">${vo.dpoint }</td>
						<td style="width: 15%">${vo.lpoint }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
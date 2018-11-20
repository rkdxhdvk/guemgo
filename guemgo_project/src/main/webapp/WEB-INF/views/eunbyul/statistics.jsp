
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
	
	<div id="content">
		<div class="inner">
			<h2>판매 전체 리스트</h2>
			<ul class="admin_menu">
				<li><a href="/semi_project/mh/sale.do?cmd=salelist">매출현황</a></li>
				<li><a href="/semi_project/mh/sale.do?cmd=userlist">이용자수</a></li>
				<li><a href="/semi_project/mh/sale.do?cmd=daylist">매칭률</a></li>
			</ul>
			<table class="board_list">
				<colgroup>
					<col style="width:width:15%">
					<col>
					<col style="width:width:10%">
					<col style="width:width:15%;">

				</colgroup>
				<tr>
					<th>주문번호</th>
					<th>회원이메일</th>
					<th>구매가격</th>
					<th>구매상태</th>
					<th>구매날짜</th>
				</tr>

				<tr>
					<td><a href="/semi_project/mh/sale.do?cmd=orderlist&&orderNum=${vo.orderNum }">${vo.orderNum }</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>
		</div>
	</div>
</body>
</html>
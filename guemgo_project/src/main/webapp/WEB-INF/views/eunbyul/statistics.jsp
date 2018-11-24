
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://d3js.org/d3.v4.min.js"></script>
    <link rel="stylesheet" href="/css/billboard.css">
    <script src = "js/billboard.js"></script>
    <script>
var chart = bb.generate({
    bindto: "#chart",
    data: {
        type: "bar",
        columns: [
            ["data1", 30, 200, 100, 170, 150, 250],
            ["data2", 130, 100, 140, 35, 110, 50]
        ]
    }
});
</script>
<body>
	
		
	<div class="container-fluid" style="margin-bottom: 15px; padding-top: 180px;">
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
	    <div id="chart"></div>
</body>

</html>
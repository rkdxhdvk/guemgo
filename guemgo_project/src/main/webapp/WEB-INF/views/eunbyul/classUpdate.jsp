<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
input[type="checkbox"] {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}
input[type="radio"] {
    display:none;
}

input[type="radio"] + label {
    color:#f2f2f2;
    font-family:Arial, sans-serif;
}

input[type="radio"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -38px top no-repeat;
    cursor:pointer;
}
input[type="radio"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -57px top no-repeat;
}
</style>
<title>내 강의 목록</title>

</head>
<body>
	<div class="container-fluid"
		style="margin-bottom: 15px; padding-top: 180px;">
		<div style="width: 500px; height: 830px; margin: auto; border-radius: 10px; box-shadow: 5px 5px 20px #636363;">
			<div style="width: 500px; height: 830px; margin: auto;">
			<br>
				<h1 style="text-align: center;">강의정보 수정하기</h1>
				<br>

				<div class="modal-body">
					<form action="classinsertOk" method="post">
						<input type="hidden" name="gonum" value=${vo.go_num }>
						<%-- console.log(${gonum }); --%>
						<div class="form-row">

							<div class="form-group col-sm-6">
								<label>대분류</label> <select name="area1" class="form-control"
									onchange="selectArea1(this.value,'area2')">
									<c:forEach var="vo1" items="${list }">
										<option value="${vo1.mname }">${vo1.mname }</option>
									</c:forEach>
								</select>

							</div>

							<div class="form-group col-sm-6">
								<label>소분류</label> <select name="area2" class="form-control"
									id="area2">
									<option value="default">- 선택하세요 -</option>
								</select>
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>강의명은 무엇인가요?</label><br> <input type="text"
									name="classname" class="navbar-brand" size="40">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>강의 설명을 간략히 남겨주세요</label> <input type="text"
									class="navbar-brand" size="40" name="explanation">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>가능한 요일은 언제인가요?</label><br> 
								<input type="checkbox" name="days" value="월" class="cb1" >월 &nbsp; &nbsp;
								<input	type="checkbox" name="days" value="화" class="cb1" >화&nbsp; &nbsp;
								<input type="checkbox" name="days" value="수"
									class="cb1">수&nbsp; &nbsp; <input type="checkbox"
									name="days" value="목" class="cb1">목&nbsp; &nbsp; <input
									type="checkbox" name="days" value="금" class="cb1">금&nbsp; &nbsp;
								<input type="checkbox" name="days" value="토"
									class="cb1">토&nbsp; &nbsp; <input type="checkbox"
									name="days" value="일" class="cb1">일&nbsp; &nbsp;<input
									type="checkbox" name="days" value="매일" class="cb1">상관없음
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>언제 레슨을 하기를 원하시나요</label><br> <input type="radio"
									name="time" value="오전(8시~12시)" class="navbar-brand">오전(8시~12시)
								<input type="radio" name="time" value="점심(12시~3시)"
									class="navbar-brand">점심(12시~3시) <input type="radio"
									name="time" value="오후(3시~6시)" class="navbar-brand">오후(3시~6시)
								<input type="radio" name="time" value="저녁(6시~11시)"
									class="navbar-brand">저녁(6시~11시)
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 원하는 지역을 선택해주세요.</label><br>
								<div class="form-group col-sm-4 ">
									<button style="float: right;" type="button"
										class="btn btn-primary mx-1 mt-2" onclick="addrSearch();">
										<i class="fa fa-search"></i> 주소검색
									</button>

								</div>
								<div class="form-group">
									<input class="form-control" style="top: 5px;"
										placeholder="도로명 주소" name="addr1" id="addr1" type="text"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="상세주소" name="addr2"
										id="addr2" type="text" />
								</div>

							</div>
						</div>
						<button type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12">강의
							개설하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>




</body>
</html>
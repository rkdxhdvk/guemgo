<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<style>
h1 {
	font-family: 'Jeju Gothic';
	font-size:28px;
}

input[type="checkbox"] {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}


.radio {overflow:hidden;display:inline-block;position:relative;height:26px;box-sizing:border-box;cursor:pointer;}
.radio input {overflow:hidden;display:none;width:0px;height:0px;border:0 none;font-size:0;line-height:0;clip:rect(0 0 0 0);opacity:0;}
.radio .ico {position:absolute;left:3px;top:3px;width:20px;height:20px;background:url("images/ico_radiocomm.jpg") no-repeat 0 0;}/* 이미지는 디자인에 맞게 변경 */
.radio .txt {display:inline-block;padding-left:30px;font-size:16px;color:#333;}/* 텍스트는 디자인에 맞게 변경 */
.radio input:checked + .ico {background-position:0 -40px;}/* 체크됐을때, 이미지변경 */
</style>
<title>내 강의 목록</title>

</head>
<body>
	<div class="container-fluid"
		style="margin-bottom: 15px; padding-top: 180px;">
		<div style="width: 500px; height: 800px; margin: auto; border-radius: 10px; border: 0.5px solid #a7a8a9;">
			<div class="modal-header">
						<h5 class="modal-title" id="modal">강의를 수정하시겠습니까?</h5>
					</div>
				<div class="modal-body">
					<form action="classupdateOk" method="post">
						<input type="hidden" name="gonum" value=${vo.go_num }>
						<input type="hidden" name="lectureNum" value=${vo.lectureNum }>
						<%-- console.log(${gonum }); --%>
						<div class="form-row">


							<div class="form-group col-sm-12">
								<label>분야</label>
								<select name="selectarea" class="form-control">
								<c:forEach var="vo3" items="${list }">									
									<c:set var="area">${vo2.area }</c:set>	
									<option value="${vo3.sname }" <c:if test="${area == vo3.sname}">  selected</c:if> >${vo3.sname }</option> 
								</c:forEach>
							</select>
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>강의명은 무엇인가요?</label><br> <input type="text"
									name="classname" class="navbar-brand" size="40" value=${vo.lectureName } style="font-size:15px">
									
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>강의 설명을 간략히 남겨주세요</label> <input type="text"
									class="navbar-brand" size="40" name="explanation" value=${vo.explanation } style="font-size:15px">
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
						<br>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>언제 레슨을 하기를 원하시나요</label>
								<br> <input type="radio"
									name="time" value="오전(8시~12시)" id="ex_rd2">오전(8시~12시)
								<input type="radio" name="time" value="점심(12시~3시)"
									id="ex_rd2">점심(12시~3시) <input type="radio"
									name="time" value="오후(3시~6시)" id="ex_rd2">오후(3시~6시)
								<input type="radio" name="time" value="저녁(6시~11시)"
									id="ex_rd2">저녁(6시~11시)
							</div>
						</div>
						<br>
						
						<br>
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
						<br>
						<button type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12">
							수정하기</button>
					</form>
				</div>
			</div>
		</div>





</body>
<script type="text/javascript">
function addrSearch() {
	new daum.Postcode({
		oncomplete: function(data) {

			$('[name=addr1]').val(data.address);
			$('[name=addr2]').val(data.buildingName);
		}
	}).open();
}
</script>
</html>
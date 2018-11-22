<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		style="margin-bottom: 15px; padding-top: 180px; ">
		<div style="width: 500px; height: 750px; margin: auto; border-radius: 10px; border: 0.5px solid #a7a8a9;">
			<div style="width: 500px; height: 800px; margin: auto;">
			<div class="modal-header">
						<h5 class="modal-title" id="modal">어떤 레슨을 진행하시나요?</h5>
					</div>
				<div class="modal-body">
					<form action="classinsertOk" method="post">
					<input type="hidden" name="gonum" value=${vo.go_num }>
					<%-- console.log(${gonum }); --%>
						<div class="form-row">
						
							<div class="form-group col-sm-6">
								<label>중분류</label> 
								
								<select name="area1" class="form-control" onchange="selectArea1(this.value,'area2')">
									<c:forEach var="vo1" items="${list }">
									<option value="${vo1.mname }">${vo1.mname }</option>
									</c:forEach>
								</select>
								
							</div>
						
							<div class="form-group col-sm-6">
							<label>소분류</label> 
								<select name="area2" class="form-control" id="area2">
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
						<%-- <div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 진행할 과목은 무엇인가요?</label><br>
								<c:set var="area" value="${area}" />
								<input type="checkbox" name="area" value="포토샵"
									${area == "포토샵" ? "CHECKED" : true}>포토샵 <input
									type="checkbox" name="area" value="일러스트"
									${area == "일러스트" ? "CHECKED" : true}>일러스트 <input
									type="checkbox" name="area" value="인디자인"
									${area == "인디자인" ? "CHECKED" : true}>인디자인 <input
									type="checkbox" name="area" value="드로잉"
									${area == "드로잉" ? "CHECKED" : true}>드로잉
							</div>
						</div> --%>

						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>강의 설명을 간략히 남겨주세요</label> 
								<input type="text" class="navbar-brand" size="40" name="explanation">
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
						<br>
						<br>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>레슨을 원하는 지역을 선택해주세요.</label><br>
								<div class="form-group">
									<input class="form-control" style="top: 5px;"
										placeholder="도로명 주소" name="addr1" id="addr1" type="text"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="상세주소" name="addr2"
										id="addr2" type="text" />
								</div>
								<div class="form-group col-sm-4 ">
									<button type="button" class="btn btn-primary mx-1 mt-2"
										onclick="addrSearch();">
										<i class="fa fa-search"></i> 주소검색
									</button>

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




	<script src="/go/resources/js/jquery.min.js"></script>
	<script src="/go/resources/js/pooper.js"></script>
	<script src="/go/resources/js/bootstrap.js"></script>

	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/5bd67c1a476c2f239ff66196/default';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
		/* End of Tawk.to Script */
		
		function addrSearch() {
			new daum.Postcode({
				oncomplete: function(data) {

					$('[name=addr1]').val(data.address);
					$('[name=addr2]').val(data.buildingName);
				}
			
			}).open();
		}
		
/* 		function selectedArea1(val, area2){
			var area2=document.getElementById(area2);
			removeAll(area2);
			
			if(val == '패션디자인'){
				addOption('드로잉', area2);
				addOption('재봉', area2);
				addOption('도식화', area2);
			}
		} */
		

/* 		$(document).ready(function(){ */
				function selectArea1(val,area2){
					//alert(val);
					var area2=document.getElementById(area2);
					removeAll(area2);
					$.ajax({
						url:"<c:url value='/select/xml?val="+val+"'/>",
						dataType:"xml",
						success:function(result){
							$(result).find("area").each(function(){
								var area=$(this).find("sname").text();
								addOption(area, area2);
							});
						}
							
					});
				}
				
				function addOption(value, e){
					var o = new Option(value);
					try{
						e.add(o);
					}catch(ee){
						e.add(o,null);
					}
					}
				function removeAll(e){
				    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
				        e.remove(1);
				    }
				}
/* 		}); */
	</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</body>
</html>
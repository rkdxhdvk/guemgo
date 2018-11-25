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

/* 
.radio {overflow:hidden;display:inline-block;position:relative;height:26px;box-sizing:border-box;cursor:pointer;}
.radio input {overflow:hidden;display:none;width:0px;height:0px;border:0 none;font-size:0;line-height:0;clip:rect(0 0 0 0);opacity:0;}
.radio .ico {position:absolute;left:3px;top:3px;width:20px;height:20px;background:url("images/ico_radiocomm.jpg") no-repeat 0 0;}/* 이미지는 디자인에 맞게 변경 */
.radio .txt {display:inline-block;padding-left:30px;font-size:16px;color:#333;}/* 텍스트는 디자인에 맞게 변경 */
.radio input:checked + .ico {background-position:0 -40px;}/* 체크됐을때, 이미지변경 */ */
</style>
<title>내 강의 목록</title>
<!-- <script type="text/javascript">
function err_bt() {
	var purpose=document.getElementsByName('purpose').value.[0];
	 console.log(purpose);
	var experience=document.getElementsByName('experience').value;
	var age=document.getElementsByName('age').value;
	var day=document.getElementsByName('day').value;
	var time=document.getElementsByName('time').value;
	var times=document.getElementsByName('times').value;
	var hour=document.getElementsByName('hour').value;
	var start=document.getElementsByName('start').value;
	var addr1=document.getElementsByName('addr1').value;
	var addr2=document.getElementsByName('addr2').value;
	var err=document.getElementById("err");
	if(purpose==null || experience==null || age==null || day==null || time==null || times==null || hour==null || start==null || addr1==null || addr2==null ){
	function a(){
 
		err.innerText = '모든 항목에 체크해주세요.';
		return false;
	}
	}else{
		document.getElementById('surveyform').submit();
		/* document.forms['surveyform'].submit(); */
		return true;
	}
	}
</script> -->
</head>
<body>
	<div class="container-fluid"
		style="margin-bottom: 15px; padding-top: 180px;">
		<div style="width: 500px; height: 1400px; margin: auto; border-radius: 10px; border: 0.5px solid #a7a8a9;">
			<div class="modal-header">
					<h5 class="modal-title" id="modal">고수를 소개받기 위해 몇가지 질문에 답해주세요!</h5>
				</div>
				<div class="modal-body">
					<form onsubmit="return err_bt();" action="<c:url value='/survey'/>" method="post" id="surveyform">
					<input type="hidden" name="email" value="${sessionScope.email }">
					<%-- <input type="hidden" name="sname" value="${area}"> --%>
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>▶ ${quelist[0].question }</label><br> 		
							<select name="selectarea" class="form-control">
								<c:forEach var="vo" items="${list }">									
									<c:set var="area">${area }</c:set>	
									<option value="${vo.sname }" <c:if test="${area == vo.sname}">  selected</c:if> >${vo.sname }</option> 
								</c:forEach>
							</select>
							</div>
						</div><br>
						${queslist[0].example }
					
						<%-- ${status.count} <!-- 이게 ex_num이랑 똑같음 --> --%>	
						<c:forEach var="qq" items="${quelist }" varStatus="ss">
						<c:if test="${qq.ques_num != 1 }">
						<div class="form-row">
						<div class="form-group col-sm-12">
							<br><label>▶ ${qq.question }</label> <br>

						<c:if test="${ss.index==1}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
									<c:if test="${vo1.ques_num == 2 }">
									<input type="radio" name="purpose" id="ex_rd2" value="${vo1.example }">${vo1.example }&nbsp;&nbsp;
									</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==2}">
							<select name="experience"
									>
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
									<c:if test="${vo1.ques_num == 3}">
									<option value="${vo1.example }">${vo1.example }</option>
									</c:if>
								</c:forEach>
							</select>
							<br>
						</c:if>
						
						<c:if test="${ss.index==3}">
								<select name="age"
									>
							<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 4}">
									<option value="${vo1.example }">${vo1.example }</option>&nbsp;&nbsp;
								</c:if>
							</c:forEach>
								</select>
								<br>
						</c:if>
						
						
						<c:if test="${ss.index==4}">
							<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 5}">
								<input type="checkbox" name="day" class="cb1" value="${vo1.example }" >&nbsp;&nbsp;${vo1.example }<br>
								</c:if>
								</c:forEach>
						</c:if>
					
						<c:if test="${ss.index==5}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 6}">
								<input type="radio" name="time" id="ex_rd2" value="${vo1.example }" >${vo1.example }&nbsp;&nbsp;
								</c:if>
								</c:forEach>
						</c:if>
							
							
						<c:if test="${ss.index==6}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 7}">
								<input type="radio" name="times" id="ex_rd2" value="${vo1.example }" >${vo1.example }&nbsp;&nbsp;
								</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==7}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 8}">
								<input type="radio" name="hour" id="ex_rd2" value="${vo1.example }" >${vo1.example }&nbsp;&nbsp;
								</c:if>
								</c:forEach>
						</c:if>
						
						
						<c:if test="${ss.index==8}">
								<c:forEach var="vo1" items="${exlist }" varStatus="status">
								<c:if test="${vo1.ques_num == 9}">
								<input type="radio" name="start" id="ex_rd2" value="${vo1.example }">${vo1.example }&nbsp;&nbsp;
								</c:if>
								</c:forEach>
						</c:if>
					
						<c:if test="${ss.index==9}">
						<div class="form-group col-sm-4 ">
						<span style="margin:auto">
									<button type="button" class="btn btn-primary mx-1 mt-2"
										onclick="addrSearch();" style="background-color: #4CAF50;" >
										<i class="fa fa-search"></i> 주소검색
									</button>
									</span>
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
								
						</c:if>
						
						
						<c:if test="${ss.index==10}">
						<!-- <a>20자이내</a> -->
						<input type="text" class="navbar-brand" size="40" name="anything">
						
						</c:if>
						
							</div>
						</div>
						</c:if>	
					</c:forEach>
					<div style="color:red;font-size: 12px" id="err"></div>
						<input type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12" style="background-color: #4CAF50;" value="신청하기">
					</form>
				</div>
			</div>
		</div>
	





	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5bd67c1a476c2f239ff66196/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();


	function logincheck(){
		var email=$('#email').val ();
		 if (email == '' || null || undefined || 0) {
		      alert("로그인하세요.");
		      document.location.href="<c:url value='/'/>";
		  }
	}


</script>
<!--End of Tawk.to Script-->

<!--///////////// 로그인 모달 사용 //////////// -->
	<!-- 모달 팝업 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
<!-- 		<h4 class="modal-title" id="myModalLabel">회원 로그인</h4> -->
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	      </div>
			<form name="login_form" method="post" action="<c:url value='/login'/>" onSubmit="return checkLogin()">
			      <div class="modal-body">
<!-- 						<div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                     -->
           			<div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">회원 로그인</div>
                        <div style="float:right; font-size: 90%; position: relative; top:-10px">
                        	<a href="#">아이디 찾기</a>|
                        	<a href="#">비밀번호 찾기</a>
                        </div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                              
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="login-username" type="text" class="form-control" name="email"  placeholder="email">                                        
                            </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="pwd" placeholder="password">
                            </div>
							<div id="errMsg" style="color:red;font-size: 15px"></div>

                            <div style="margin-top:10px" class="form-group">
                                <!-- Button -->
                                <div class="col-sm-12 controls" style="text-align:center">
                                  <button type="submit" id="btn-login" class="btn btn-success">로그인  </button>
                                  <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-md-12 control" style="margin-top:10px">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            	계정이 없을 경우 회원가입 하세요~^^ 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            	회원가입
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                                
                            </div>
                        </div>                     
                    </div>  
                 </div>
			</form>
	    </div>
	  </div>
	</div>
	
<!-- 	회원가입 페이지 모달로 불러오기 -->
	<%@include file="/WEB-INF/views/woohyun/userInsert.jsp"%>
<script type="text/javascript">

function err_bt() {
	 var size1 = document.getElementsByName("purpose").length;
	    for(var i = 0; i < size1; i++){
	        if(document.getElementsByName("purpose")[i].checked == true){
	        	var purpose=document.getElementsByName('purpose')[i].value;
	       	 console.log(purpose);
	        }
	    }
	 var size2 = document.getElementsByName("day").length;
	    for(var i = 0; i < size2; i++){
	        if(document.getElementsByName("day")[i].checked == true){
	        	var day=document.getElementsByName('day')[i].value;
	        	 console.log(day);
	        }
	    }
	 var size3 = document.getElementsByName("time").length;
	    for(var i = 0; i < size3; i++){
	        if(document.getElementsByName("time")[i].checked == true){
	        	var time=document.getElementsByName('time')[i].value;
	        }
	    }
	 var size4 = document.getElementsByName("times").length;
	    for(var i = 0; i < size4; i++){
	        if(document.getElementsByName("times")[i].checked == true){
	        	var times=document.getElementsByName('times')[i].value;
	        }
	    }
	 var size5 = document.getElementsByName("hour").length;
	    for(var i = 0; i < size5; i++){
	        if(document.getElementsByName("hour")[i].checked == true){
	        	var hour=document.getElementsByName('hour')[i].value;
	        }
	    }
	 var size6 = document.getElementsByName("start").length;
	    for(var i = 0; i < size6; i++){
	        if(document.getElementsByName("start")[i].checked == true){
	        	var start=document.getElementsByName('start')[i].value;
	        }
	    }
	    
	var addr1=document.getElementById('addr1').value;
	var err=document.getElementById("err");
	if(purpose==null || day==null || time==null || times==null || hour==null || start==null || addr1==null || addr2==null ){
		err.innerText = '모든 항목에 체크해주세요.';
		return false;
	}else{
		console.log("submit");
		/* document.getElementById('surveyform').submit(); */
		/* document.forms['surveyform'].submit(); */
		return true;
	}
	}


	

function checkLogin() {
	var email = $("input[name='email']").val();
	var pwd = $("input[name='pwd']").val();
	
	if(!email){
		$('#errMsg').text('아이디를 입력해주세요');
		return false;
	}
	
	if(!pwd){
		$('#errMsg').text('비밀번호를 입력해주세요');
		return false;
	}
	
	$.ajax({
		url:'${pageContext.request.contextPath}/loginValid',
		data:{email:email, pwd:pwd},
		dataType:'json',
		type:'post',
		success:function(d){
			if(d.errMsg === 'no') {
				$('#errMsg').text('아이디 또는 비밀번호가 맞지 않아요.');
			} else {
				document.login_form.submit();
			}
				
		}
	});
	
	return false;
}

$(document).ready(function()
		{
			
		    // codes works on all bootstrap modal windows in application
		    $('#loginModal').on('hidden.bs.modal', function(e)
		    { 
		        $(this).find("input").val("");
		        $(this).find("#errMsg").html("");
		    }) ;

		});

		function addrSearch() {
			new daum.Postcode({
				oncomplete: function(data) {

					$('[name=addr1]').val(data.address);
					$('[name=addr2]').val(data.buildingName);
				}
			}).open();
		}
		
		
	</script>

	
</body>
</html>
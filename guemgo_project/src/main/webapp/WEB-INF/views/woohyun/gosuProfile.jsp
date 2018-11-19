<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-11-12	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gosuProfile.jsp</title>
<script>
// 파일 추가시 필요한 jquery START
$(document).ready(function (){
	
	$(function()
			{
			    $(document).on('click', '.btn-add', function(e)
			    {
			        e.preventDefault();

			        var controlForm = $('.controls form:first'),
			            currentEntry = $(this).parents('.entry:first'),
			            newEntry = $(currentEntry.clone()).appendTo(controlForm);

			        newEntry.find('input').val('');
			        controlForm.find('.entry:not(:last) .btn-add')
			            .removeClass('btn-add').addClass('btn-remove')
			            .removeClass('btn-success').addClass('btn-danger')
			            .html('<span class="glyphicon glyphicon-minus"></span>');
			    }).on('click', '.btn-remove', function(e)
			    {
					$(this).parents('.entry:first').remove();

					e.preventDefault();
					return false;
				});
			});

	bs_input_file();
	
});

function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
//파일 추가시 필요한 jquery END
</script>
</head>
<body>
	



<!-- //////////	타이틀 START ////////// -->
	<div class="jumbotron jumbotron-sm" style="padding-top: 5px;  padding-bottom: 10px;">
	    <div class="container">
	        <div class="row">
	            <div class="col-sm-12 col-lg-12" style="text-align:center">
	                <h2 class="h3">
	                    	 ${ sessionScope.email } 고수의 프로필<small></small></h2>
	            </div>
	        </div>
	    </div>
	</div>
<!-- //////////	타이틀 END ////////// -->	
	
<!-- //////////	고수가입 양식 START ////////// -->
	<div class="container" style=" margin-top:0px">    
            
    <div id="signupbox" style=" margin-top:5px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">프로필 수정</div>
                <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="/accounts/login/">홈으로</a></div>
            </div>  
            <div class="panel-body" >
                <form method="post" action=".">
                    <input type='hidden' name='csrfmiddlewaretoken' value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' />
                            

<!--                     <form  class="form-horizontal" method="post" > -->
                        <input type='hidden' name='csrfmiddlewaretoken' value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' />

					<div class="row" style="margin-bottom:15px;">
                        <div id="div_id_company" class="form-group required" style="margin-left:15px; margin-bottom:5px;">
                            <label for="id_company" class="control-label col-md-10  requiredField"> 미디어 </label>
                            <button type="button" class="btn btn-xs">수정</button>
                            <div class="controls col-md-12">
 								<img src="resources/img/gosuImg/1.jpg" class="img-thumbnail" alt="Cinque Terre" style="max-width:150px; height:auto;">
 								<img src="resources/img/gosuImg/2.jpg" class="img-thumbnail" alt="Cinque Terre" style="max-width:100px; height:auto;">
 								<img src="resources/img/gosuImg/3.jpg" class="img-thumbnail" alt="Cinque Terre" style="max-width:100px; height:auto;">
							</div>
							<br>
                        </div> 
                    </div>
                    <div class="row" style="margin-bottom:15px;">
                        <div id="div_id_company" class="form-group required" style="margin-left:15px; margin-bottom:5px;">
                            <label for="id_company" class="control-label col-md-12  requiredField"> 고수 소개 <span class="asteriskField">*</span> </label>
                            <div class="controls col-md-12">
 								 <textarea class="form-control" id="exampleFormControlTextarea5" rows="5" style="width:95%;"></textarea>
							</div>
							<br>
                        </div> 
                    </div>
                        
<!-- ////////// 자격증 사진 추가 START. +하면 파일 추가 안되는 버그 수정필요 ////////// -->
<div class="container" style="margin-left:15px; ">
	<div class="row">
        <div class="control-group" id="fields">
            <label class="control-label" for="field1">자격증 사진 추가</label>
            <div class="controls"> 
<!--                 <form role="form" autocomplete="off"> -->
                    <div class="entry input-group col-xs-3">
                    
                    
                    
                    	<div class="form-group">
								<div class="input-group input-file" name="Fichier1">
									<span class="input-group-btn">
						        		<button class="btn btn-default btn-choose" type="button">파일찾기</button>
						    		</span>
						    		<input type="text" class="form-control" placeholder='Choose a file...'  style="width:200px"/>
						    		<span class="input-group-btn">
						       			 <button class="btn btn-warning btn-reset" type="button">Reset</button>
						    		</span>
						    		<span class="input-group-btn">
			                            <button class="btn btn-success btn-add" type="button">
			                                <span class="glyphicon glyphicon-plus"></span>
			                            </button>
                        </span>
								</div>
							</div>
				                    
                    
                    
<!--                         <input class="form-control" name="fields[]" type="file" style="width:300px;"/> -->
<!--                     	<span class="input-group-btn"> -->
<!--                             <button class="btn btn-success btn-add" type="button"> -->
<!--                                 <span class="glyphicon glyphicon-plus"></span> -->
<!--                             </button> -->
<!--                         </span> -->
                    </div>
<!--                 </form> -->
            <small><span class="glyphicon glyphicon-plus gs" style="margin-bottom:20px"></span> 플러스를 누르면 추가등록 할 수 있습니다 :)</small>
            </div>
        </div>
	</div>
</div>
<!-- ////////// 자격증 사진 추가 END ////////// -->		


                        <div id="div_id_company1" class="form-group required"> 
                            <label for="id_company" class="control-label col-md-12  requiredField"> 경력 사항 수정 <span class="asteriskField">*</span> </label>
                            <div class="form-group green-border-focus controls col-md-12">
 								 <textarea class="form-control" id="exampleFormControlTextarea5" rows="5" style="width:95%;"></textarea>
							</div>
                        </div> 
                        
<!--                         <div id="div_id_catagory" class="form-group required"> -->
<!--                             <label for="id_catagory" class="control-label col-md-4  requiredField"> catagory<span class="asteriskField">*</span> </label> -->
<!--                             <div class="controls col-md-8 ">  -->
<!--                                  <input class="input-md textinput textInput form-control" id="id_catagory" name="catagory" placeholder="skills catagory" style="margin-bottom: 10px" type="text" /> -->
<!--                             </div> -->
<!--                         </div>  -->
<!--                         <div id="div_id_number" class="form-group required"> -->
<!--                              <label for="id_number" class="control-label col-md-4  requiredField"> contact number<span class="asteriskField">*</span> </label> -->
<!--                              <div class="controls col-md-8 "> -->
<!--                                  <input class="input-md textinput textInput form-control" id="id_number" name="number" placeholder="provide your number" style="margin-bottom: 10px" type="text" /> -->
<!--                             </div>  -->
<!--                         </div>  -->
<!--                         <div id="div_id_location" class="form-group required"> -->
<!--                             <label for="id_location" class="control-label col-md-4  requiredField"> Your Location<span class="asteriskField">*</span> </label> -->
<!--                             <div class="controls col-md-8 "> -->
<!--                                 <input class="input-md textinput textInput form-control" id="id_location" name="location" placeholder="Your Pincode and City" style="margin-bottom: 10px" type="text" /> -->
<!--                             </div>  -->
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <div class="controls col-md-offset-4 col-md-12 "> -->
<!--                                 <div id="div_id_terms" class="checkbox required"> -->
<!--                                     <label for="id_terms" class=" requiredField"> -->
<!--                                          <input class="input-ms checkboxinput" id="id_terms" name="terms" style="margin-bottom: 10px" type="checkbox" /> -->
<!--                                          	금고 이용 약관에 동의합니다. -->
<!--                                     </label> -->
<!--                                 </div>  -->
                                    
<!--                             </div> -->
<!--                         </div>  -->
                        <div class="form-group"> 
                            <div class="aab controls col-md-4 "></div>
                            <div class="controls col-md-12 " style="text-align:center">
                                <input type="submit" name="Signup" value="수정" class="btn btn-primary btn btn-info" id="submit-id-signup" />
                            </div>
                        </div> 
                            
<!--                     </form> -->

                </form>
            </div>
        </div>
    </div> 

</div>
<!-- //////////	고수가입 양식 END ////////// -->









<!-- <h1>고수 프로필 관리</h1> -->
<!-- <form method="post" action="GosuProfileUpdate"> -->
<%-- 	<input type="hidden" value="${vo.email }" name="email"> --%>
<%-- 	<input type="hidden" value="${vo.go_num }" name="go_num"> --%>
<!-- 	<h2>미디어(사진 업로드 기능 추가 예정)</h2> -->
<!-- 	사진 추가하기 -->
<!-- 	<h2>고수소개 및 서비스 설명</h2> -->
<%-- 		<textarea rows="10" cols="50" name="intro" style="width:500px" value=${vo.intro }></textarea><br> --%>
<!-- 	<h2>자격증 또는 사업자 등록증</h2>	 -->
<%-- 		<input type="text" name="license" style="width:500px" value=${vo.license }><br> --%>
<!-- 	<h2>경력 </h2> -->
<%-- 		<textarea rows="10" cols="50" name="career" style="width:500px" value=${vo.career }></textarea><br> --%>
	
<!-- 	<input type="submit" value="수정완료"> -->
<%-- 	<button type="button"><a href="<c:url value='gosupage' />">이전</a></button>	<br><br> --%>
<!-- </form> -->

</body>
</html>
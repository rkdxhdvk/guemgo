<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body><!-- 여기서부터 바디 -->

<!-- 타이틀 -->
<!-- 	<div class="container-fluid" style="margin-bottom: 15px;"> -->
<!-- 		<p class="text-left" style="font-size: x-large;">고수로 가입하기</p> -->
<!-- 		<button type="button" class="btn btn-primary" style="float: right;" -->
<!-- 			onclick="location='/go/reInsert'">글쓰기</button> -->
<!-- 	</div> -->
	
<!-- 파일추가 하는 기능 예제 -->
<!-- 	<div class="form-group"> -->
<!-- 		<div class="input-group input-file" name="Fichier1"> -->
<!-- 			<span class="input-group-btn"> -->
<!--         		<button class="btn btn-default btn-choose" type="button">파일찾기</button> -->
<!--     		</span> -->
<!--     		<input type="text" class="form-control" placeholder='Choose a file...' /> -->
<!--     		<span class="input-group-btn"> -->
<!--        			 <button class="btn btn-warning btn-reset" type="button">Reset</button> -->
<!--     		</span> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 회원가입 예제 (미사용) -->
<!-- <div class="container"> -->
<!--     <div class="row"> -->
<!--         <div class="col-md-8"> -->
<!--             <div class="well well-sm"> -->
<!--                 <form> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-md-6"> -->
<!--                         <div class="form-group"> -->
<!--                             <label for="name"> -->
<!--                                 Name</label> -->
<!--                             <input type="text" class="form-control" id="name" placeholder="Enter name" required="required" /> -->
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <label for="email"> -->
<!--                                 Email Address</label> -->
<!--                             <div class="input-group"> -->
<!--                                 <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span> -->
<!--                                 </span> -->
<!--                                 <input type="email" class="form-control" id="email" placeholder="Enter email" required="required" /></div> -->
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <label for="subject"> -->
<!--                                 Subject</label> -->
<!--                             <select id="subject" name="subject" class="form-control" required="required"> -->
<!--                                 <option value="na" selected="">Choose One:</option> -->
<!--                                 <option value="service">General Customer Service</option> -->
<!--                                 <option value="suggestions">Suggestions</option> -->
<!--                                 <option value="product">Product Support</option> -->
<!--                             </select> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-6"> -->
<!--                         <div class="form-group"> -->
<!--                             <label for="name"> -->
<!--                                 Message</label> -->
<!--                             <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required" -->
<!--                                 placeholder="Message"></textarea> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-12"> -->
<!--                         <button type="submit" class="btn btn-primary pull-right" id="btnContactUs"> -->
<!--                             Send Message</button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 </form> -->
<!--             </div> -->
<!--         </div> -->
        
<!--         <div class="col-md-4"> -->
<!--             <form> -->
<!--             <legend><span class="glyphicon glyphicon-globe"></span> Our office</legend> -->
<!--             <address> -->
<!--                 <strong>Twitter, Inc.</strong><br> -->
<!--                 795 Folsom Ave, Suite 600<br> -->
<!--                 San Francisco, CA 94107<br> -->
<!--                 <abbr title="Phone"> -->
<!--                     P:</abbr> -->
<!--                 (123) 456-7890 -->
<!--             </address> -->
<!--             <address> -->
<!--                 <strong>Full Name</strong><br> -->
<!--                 <a href="mailto:#">first.last@example.com</a> -->
<!--             </address> -->
<!--             </form> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->
<br><br><br><br><br><br><br>
<!-- //////////	타이틀 START ////////// -->
	<div class="jumbotron jumbotron-sm" style="padding-top: 0px;  padding-bottom: 10px;">
	    <div class="container">
	        <div class="row">
	            <div class="col-sm-12 col-lg-12">
	                <h2 class="h2">
	                    	지금 고수로 가입하세요 <small>고수님과 딱! 맞는 고객을 알려드립니다.</small></h2>
	            </div>
	        </div>
	    </div>
	</div>
<!-- //////////	타이틀 END ////////// -->	
	
<!-- //////////	고수가입 양식 START ////////// -->
	<div class="container" style=" margin-top:0px">    
            
    <div id="signupbox" style=" margin-top:-20px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">고수가입하기</div>
                <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="/accounts/login/">홈으로</a></div>
            </div>  
            <div class="panel-body" >
                
                <form method="post" action="GosuInsert"  enctype="multipart/form-data">
					
						<!-- 본인인증 기능 미구현
                  		<div id="div_id_name" class="form-group required"> 
                            <label for="id_name" class="control-label col-md-4  requiredField"> 본인 인증하기 <span class="asteriskField">*</span> </label> 
                            <input type="submit" value="인증메일발송" style="font-size:10px">
                            <div class="controls col-md-12 "> 
                                <input class="input-md textinput textInput form-control" id="id_name" name="name" placeholder="인증번호를 입력하세요" style="margin-bottom: 10px" type="text" />
                            </div>
                        </div>
                         -->
                         
<!--  미디어 파일 업로드 양식 START-->
<!-- 						<div class="container" style="margin-left: 15px;"> -->
							<div class="row col-md-12" style="margin-top: 15px">
								<div class="control-group " id="fields" >
									<label class="control-label col-md-12" for="field1">미디어 사진 추가 </label>  
									<div class="controls col-md-12">
										<div class="entry input-group "> 
											<div class="input-group ">
												<span class="input-group-addon ">이미지</span> 
												<input id="msg"
													type="file" class="form-control" name="g_img"
													placeholder="Additional primary" >
											</div>
										</div>
									</div>
								</div>
							</div>
<!--  미디어 파일 업로드 양식 END-->
                        
					<div class="row" >
                        <div id="div_id_company" class="form-group required" style="margin-left:15px;">
                            <label for="id_company" class="control-label col-md-12  requiredField" style="margin-top: 20px;"> 고수 소개 <span class="asteriskField">*</span> </label>
                            <div class="controls col-md-12">
 								 <textarea class="form-control" id="exampleFormControlTextarea5" rows="5" style="width:95%;" name="intro"></textarea>
							</div>
							<br>
                        </div> 
                    </div>

<!--  자격증 파일 업로드 양식 START-->
						<div class="container" style="margin-left: 15px;">
							<div class="row">
								<div class="control-group" id="fields" style="margin-top: 15px">
									<label class="control-label" for="field1" style="margin-top: 20px;" >자격증 사진 추가</label>
									<div class="controls">
										<div class="entry input-group col-xs-3">
											<div class="input-group  col-md-12">
												<span class="input-group-addon">이미지</span> 
												<input id="msg"
													type="file" class="form-control" name="l_img"
													placeholder="Additional primary">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
<!--  자격증  파일 업로드 양식 END-->


                        <div id="div_id_company1" class="form-group required"> 
                            <label for="id_company" class="control-label col-md-12  requiredField" style="margin-top: 20px;"> 경력 <span class="asteriskField">*</span> </label>
                            <div class="form-group green-border-focus controls col-md-12">
 								 <textarea class="form-control" id="exampleFormControlTextarea5" rows="5" style="width:95%;" name="career"></textarea>
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
                        <div class="form-group">
                            <div class="controls col-md-offset-2  " >
                                <div id="div_id_terms" class="checkbox required" >
                                    <label for="id_terms" class=" requiredField" style="text-align:center">
                                         <input class="input-ms checkboxinput" id="id_terms" name="terms" style="margin-bottom: 10px" type="checkbox" />
                                         	금고 이용 약관에 동의합니다.
                                    </label>
                                </div> 
                                    
                            </div>
                        </div> 
                        <div class="form-group"> 
                            <div class="aab controls col-md-4 "></div>
                            <div class="controls col-md-12 " style="text-align:center">
                                <input type="submit" name="Signup" value="고수 등록" class="btn btn-primary btn btn-info" id="submit-id-signup" />
                            </div>
                        </div> 

                </form>
            </div>
        </div>
    </div> 

</div>
<!-- //////////	고수가입 양식 END ////////// -->




<%-- 
<h1>고수로 가입하기</h1>
<form method="post" action="GosuInsert">
	<h2>본인인증(미구현)</h2>
		<input type="submit" value="본인인증하기">
	<br>
<%-- 불필요기능으로 확인되어 미사용	
	<h2>전문가로 활동하시는 분야를 선택해 주세요</h2>
	<br>
		<p>대분야 : 
			<select name="experience" class="form-control">
				<option value="">선택하세요</option>
			<c:forEach var="item" items="${cate_l }">
				<option value="${item.l_num }" >${item.l_name }</option>
			</c:forEach>
			</select>
		</p>
		<p>중분야 : 
			<select name="experience" class="form-control">
				<option value="">선택하세요</option>
			<c:forEach var="item" items="${cate_m }">
				<option value="${item.m_num }" >${item.m_name }</option>
			</c:forEach>
			</select>
		</p>
		
	<br>
	<h2>고수소개</h2>
		<textarea rows="10" cols="50" name="intro" style="width:500px"></textarea><br>
	<h2>관련자격증</h2>	
		<input type="text" name="license" style="width:500px"><br>
	<h2>경력</h2>
		<textarea rows="10" cols="50" name="career" style="width:500px"></textarea><br>
	
	<input type="submit" value="고수 가입하기">
	<input type="reset" value="취소">	<br><br>
</form>

<a href="<c:url value='/' />">홈으로</a>
 --%>
</body>
</html>
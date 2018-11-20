<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-11-20	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gosuProfileDetail.jsp</title>
<script>
</script>
<body>
<h1>고수프로필</h1>

<h2><br>${vo.name } 님의 프로필 입니다.</h2>		 <!-- users 테이블의 name 출력 -->

<img src="resources/upload/userImg/${vo.u_image }" width="100" height="100"/>	 <!-- users 테이블의 image 출력  --> 
<br>고용횟수 ${vo.employ } 번	<!-- gosu 테이블의 employ 출력 -->
<br>서비스 카테고리
<c:forEach var="item" items="${ lectureList }">
<br>	${item.area }	<!-- lecture(강의)테이블의 강의번호(lecturenum)을 이용해서 gosu_area테이블의 area를 모두 가져와서 출력해야함.-->
</c:forEach>
<br>사진
<br>	${vo.g_image }	<!-- gosu 테이블의 image 출력 -->
<br>고수소개
<br>	${vo.intro }	 <!-- gosu 테이블의 intro 출력 -->
<br>사업자등록증&자격증
<br>
<img src="resources/upload/gosuCareerImg/${vo.license }" width="100" height="100"/>	<!-- gosu_career 테이블의 license image 출력 -->

<!-- <!-- //////////	타이틀 START ////////// --> -->
<!-- 	<div class="jumbotron jumbotron-sm" style="padding-top: 5px;  padding-bottom: 10px;"> -->
<!-- 	    <div class="container"> -->
<!-- 	        <div class="row"> -->
<!-- 	            <div class="col-sm-12 col-lg-12" style="text-align:center"> -->
<!-- 	                <h2 class="h3"> -->
<%-- 	                    	 ${ sessionScope.name } 고수의 프로필<small></small></h2> --%>
<!-- 	            </div> -->
<!-- 	        </div> -->
<!-- 	    </div> -->
<!-- 	</div> -->
	
	
<!-- <!-- //////////	타이틀 END ////////// -->	 
	
<!-- <!-- //////////	고수가입 양식 START ////////// --> 
<!-- 	<div class="container" style=" margin-top:0px">     -->
            
<!--     <div id="signupbox" style=" margin-top:5px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2"> -->
<!--         <div class="panel panel-info"> -->
<!--             <div class="panel-heading"> -->
<!--                 <div class="panel-title">프로필 수정</div> -->
<!--                 <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="/accounts/login/">홈으로</a></div> -->
<!--             </div>   -->
<!--             <div class="panel-body" > -->
<!--                 <form method="post" action="."> -->
<!--                     <input type='hidden' name='csrfmiddlewaretoken' value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' /> -->
                            

<!-- <!--                     <form  class="form-horizontal" method="post" > --> 
<!--                         <input type='hidden' name='csrfmiddlewaretoken' value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' /> -->

<!-- 					<div class="row" style="margin-bottom:15px;"> -->
<!--                         <div id="div_id_company" class="form-group required" style="margin-left:15px; margin-bottom:5px;"> -->
<!--                             <label for="id_company" class="control-label col-md-10  requiredField"> 미디어 </label> -->
<!--                             <button type="button" class="btn btn-xs">수정</button> -->
<!--                             <div class="controls col-md-12"> -->
<!--  								<img src="resources/img/gosuImg/1.jpg" class="img-thumbnail" alt="Cinque Terre" style="max-width:150px; height:auto;"> -->
<!--  								<img src="resources/img/gosuImg/2.jpg" class="img-thumbnail" alt="Cinque Terre" style="max-width:100px; height:auto;"> -->
<!--  								<img src="resources/img/gosuImg/3.jpg" class="img-thumbnail" alt="Cinque Terre" style="max-width:100px; height:auto;"> -->
<!-- 							</div> -->
<!-- 							<br> -->
<!--                         </div>  -->
<!--                     </div> -->
<!--                     <div class="row" style="margin-bottom:15px;"> -->
<!--                         <div id="div_id_company" class="form-group required" style="margin-left:15px; margin-bottom:5px;"> -->
<!--                             <label for="id_company" class="control-label col-md-12  requiredField"> 고수 소개 <span class="asteriskField">*</span> </label> -->
<!--                             <div class="controls col-md-12"> -->
<!--  								 <textarea class="form-control" id="exampleFormControlTextarea5" rows="5" style="width:95%;"></textarea> -->
<!-- 							</div> -->
<!-- 							<br> -->
<!--                         </div>  -->
<!--                     </div> -->
                        
<!-- <!-- ////////// 자격증 사진 추가 START. +하면 파일 추가 안되는 버그 수정필요 ////////// --> 
<!-- <div class="container" style="margin-left:15px; "> -->
<!-- 	<div class="row"> -->
<!--         <div class="control-group" id="fields"> -->
<!--             <label class="control-label" for="field1">자격증 사진 추가</label> -->
<!--             <div class="controls">  -->
<!-- <!--                 <form role="form" autocomplete="off"> -->
<!--                     <div class="entry input-group col-xs-3"> -->
                    
                    
                    
<!--                     	<div class="form-group"> -->
<!-- 								<div class="input-group input-file" name="Fichier1"> -->
<!-- 									<span class="input-group-btn"> -->
<!-- 						        		<button class="btn btn-default btn-choose" type="button">파일찾기</button> -->
<!-- 						    		</span> -->
<!-- 						    		<input type="text" class="form-control" placeholder='Choose a file...'  style="width:200px"/> -->
<!-- 						    		<span class="input-group-btn"> -->
<!-- 						       			 <button class="btn btn-warning btn-reset" type="button">Reset</button> -->
<!-- 						    		</span> -->
<!-- 						    		<span class="input-group-btn"> -->
<!-- 			                            <button class="btn btn-success btn-add" type="button"> -->
<!-- 			                                <span class="glyphicon glyphicon-plus"></span> -->
<!-- 			                            </button> -->
<!--                         </span> -->
<!-- 								</div> -->
<!-- 							</div> -->
				                    
<!--                     </div> -->
<!--             <small><span class="glyphicon glyphicon-plus gs" style="margin-bottom:20px"></span> 플러스를 누르면 추가등록 할 수 있습니다 :)</small> -->
<!--             </div> -->
<!--         </div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <!-- ////////// 자격증 사진 추가 END ////////// -->		 


<!--                         <div id="div_id_company1" class="form-group required">  -->
<!--                             <label for="id_company" class="control-label col-md-12  requiredField"> 경력 사항 수정 <span class="asteriskField">*</span> </label> -->
<!--                             <div class="form-group green-border-focus controls col-md-12"> -->
<!--  								 <textarea class="form-control" id="exampleFormControlTextarea5" rows="5" style="width:95%;"></textarea> -->
<!-- 							</div> -->
<!--                         </div>  -->
                        
<!--                         <div class="form-group">  -->
<!--                             <div class="aab controls col-md-4 "></div> -->
<!--                             <div class="controls col-md-12 " style="text-align:center"> -->
<!--                                 <input type="submit" name="Signup" value="수정" class="btn btn-primary btn btn-info" id="submit-id-signup" /> -->
<!--                             </div> -->
<!--                         </div>  -->
                            

<!--                 </form> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div>  -->

<!-- </div> -->
<!-- <!-- //////////	고수가입 양식 END ////////// --> 



</body>
</html>
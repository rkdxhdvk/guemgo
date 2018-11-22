<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<div class="modal fade" id="userInsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
<!-- 		<h4 class="modal-title" id="myModalLabel">회원 로그인</h4> -->
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	      </div>
			      <div class="modal-body">
<!-- 						<div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                     -->
        <!-- 	회원가입 modal 시작 -->
<!--         <div id="signupbox" > -->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">회원 가입</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px">
                            	<a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">로그인</a>
                            </div>
                        </div>  
                        
				<form name="sign_form" method="post" action="UserInsert" >
                        <div class="panel-body" style="padding-top:30px">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                <div style="margin-top: 10px" class="input-group">
<!--                                <label for="email" class="col-md-3 control-label">Email</label> -->
<!--                                <div style="margin-left:15px !important"> -->
										<span class="input-group-addon">이메일(아이디)</span>
                                        <input type="text" class="form-control" name="email" placeholder="Email Address" required="required">
<!--                                </div> -->
                                </div>
                                    
<!--                                 <div class="form-group"> -->
<!--                                     <label for="firstname" class="col-md-3 control-label">First Name</label> -->
<!--                                     <div class="col-md-9"> -->
<!--                                         <input type="text" class="form-control" name="firstname" placeholder="First Name"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="form-group"> -->
<!--                                     <label for="lastname" class="col-md-3 control-label">Last Name</label> -->
<!--                                     <div class="col-md-9"> -->
<!--                                         <input type="text" class="form-control" name="lastname" placeholder="Last Name"> -->
<!--                                     </div> -->
<!--                                 </div> -->
                                <div style="margin-top: 10px" class="input-group">
                               			<span class="input-group-addon">비밀번호 <span style="margin-left:35px"></span></span>
                                        <input type="password" class="form-control" name="pwd" placeholder="Password" required="required">
                                </div>
                                    
                                <div style="margin-top: 10px" class="input-group">
                               			<span class="input-group-addon">이름 <span style="margin-left:65px"></span></span>
                                        <input type="text" class="form-control" name="name" placeholder="name" required="required">
                                </div>
                                
                               <%--  기능 재확인 필요
                                <div style="margin-top: 10px" class="input-group">
                               			<span class="input-group-addon">관심사<span style="margin-left:65px"></span></span>
	                                    <c:forEach var="vo" items="${list }" varStatus="vs">
												<input type="checkbox" style="margin-left:10px" name="sname" value="${ vo.sname }"/>${ vo.sname } &nbsp&nbsp
												<c:if test="${ vs.count % 3 == 0 }"><br/></c:if>
										</c:forEach>
                                </div> 
                                --%>
                                    

                                <div class="form-group" style="margin-top: 20px;" >
                                    <!-- Button -->                                        
                                    <div style="text-align:center;">
                                        <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i>가입</button>
                                        <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
                                    </div>
                                </div>
                                
<!--                                 <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group"> -->
                                    
<!--                                     <div class="col-md-offset-3 col-md-9"> -->
<!--                                         <button id="btn-fbsignup" type="button" class="btn btn-primary"><i class="icon-facebook"></i>   Sign Up with Facebook</button> -->
<!--                                     </div>                                            -->
                                        
<!--                                 </div> -->
                                
                                
                                
                         </div>
					</form>
                         
                         
                         
                    </div>

         </div> 
           			
                 </div>
	    </div>
	  </div>
<!-- 	</div> -->

	
	
	
    

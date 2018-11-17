<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>회원 정보 수정</h1>
<form method="post" action="UserUpdate">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="email" type="text" class="form-control" name="email" placeholder="Email" value="${vo.email }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">회원이름</span>
      <input id="name" type="text" class="form-control" name="name" placeholder="Name" value="${vo.name }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control" name="password" placeholder="Password" value="${vo.pwd }">
    </div>
    <br> <div class="input-group">
      <span class="input-group-addon">원본 이미지</span>
      <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="${vo.image }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">새 이미지</span>
      <input id="msg" type="file" class="form-control" name="msg" placeholder="Additional Info" value="${vo.image }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">포인트</span>
      <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="${vo.point }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">가입일</span>
      <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="${vo.regdate }">
    </div>
    <br>
    <input type="reset" class="btn btn-info" value="Reset">
 	<input type="submit" class="btn btn-info" value="Submit" style="float: right;">
  </form>
















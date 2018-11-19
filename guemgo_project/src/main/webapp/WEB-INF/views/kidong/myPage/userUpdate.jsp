<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>회원 정보 수정</h1>
<form method="post" action="UserUpdate">
    <div class="input-group">
      <span class="input-group-addon">이메일</span>
      <input id="email" type="text" class="form-control" name="email" placeholder="Email" value="${vo.email }" readonly="readonly">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">회원이름</span>
      <input id="name" type="text" class="form-control" name="name" placeholder="Name" value="${vo.name }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">새 비밀번호</span>
      <input id="password" type="password" class="form-control" name="password" placeholder="Password">
    </div>
    <br> <div class="input-group">
      <span class="input-group-addon">원본 이미지</span>
      <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="${vo.image }" readonly="readonly">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">새 이미지</span>
      <input id="msg" type="file" class="form-control" name="msg" placeholder="Additional Info" value="${vo.image }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">포인트</span>
      <input id="msg" type="text" class="form-control" name="msg" readonly="readonly" value="${vo.point }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">가입일</span>
      <input id="msg" type="text" class="form-control" name="msg" readonly="readonly" value="${vo.regdate }">
    </div>
    <br>
    <input type="reset" class="btn btn-info" value="취소">
 	<input type="submit" class="btn btn-info" value="수정" style="float: right;">
  </form>
















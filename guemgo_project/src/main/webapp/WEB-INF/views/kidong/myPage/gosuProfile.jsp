<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>고수 프로필 관리</h1>
<form method="post" action="GosuProfileUpdate">
	<input type="hidden" value="${vo.email }" name="email">
	<input type="hidden" value="${vo.go_num }" name="go_num">
    <div class="input-group">
      <span class="input-group-addon">고수 사진</span>
      <input id="image" type="file" class="form-control" name="image" placeholder="Email" value="${vo.email }">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">고수소개 및 서비스 설명</span>
      <textarea rows="10" maxlength="140" name="intro" class="form-control">${vo.license }</textarea><br>
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">자격증 또는 사업자 등록증</span>
      <textarea maxlength="140" rows="10" name="intro" class="form-control">${vo.intro }</textarea><br>
    </div>
    <br> <div class="input-group">
      <span class="input-group-addon">경력</span>
       <textarea rows="10" maxlength="140" name="intro" class="form-control">${vo.career }</textarea><br>
    </div>
    <br>
    <input type="reset" class="btn btn-primary" value="취소">
 	<input type="submit" class="btn btn-primary" value="수정" style="float: right;">
  </form>

 
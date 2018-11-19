<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>고수 정보</h1>
<form method="post" action="GosuUpdate">
    <div class="input-group">
      <span class="input-group-addon">이메일</span>
      <input id="email" type="text" class="form-control" name="email" placeholder="Email" value="${vo.email }" readonly="readonly">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">회원이름</span>
      <input id="name" type="text" class="form-control" name="name" placeholder="Name" value="${vo.name }">
    </div>
    <br> <div class="input-group">
      <span class="input-group-addon">고수등급</span>
      <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="${vo.grade }" readonly="readonly">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">고용횟수</span>
      <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="${vo.employ }" readonly="readonly">
    </div>
    <br>
    <input type="reset" class="btn btn-info" value="취소">
 	<input type="submit" class="btn btn-info" value="수정" style="float: right;">
  </form>














<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>포인트 충전</h1>
  	<div class="input-group">
      <span class="input-group-addon">포인트</span>
      <input id="point" type="text" class="form-control" name="point" value="${vo.point }" readonly="readonly">
  	</div>
 <form>
 	<div class="radio">
	  <label><input type="radio" name="point" value="100" checked>100포인트	1,000원(0%)</label>
	</div>
 	<div class="radio">
	  <label><input type="radio" name="point" value="300">300포인트	2,700원(10%)</label>
	</div>
	<div class="radio">
	  <label><input type="radio" name="point" value="500">500포인트	4,000원(20%)</label>
	</div>
	<div class="radio">
	  <label><input type="radio" name="point" value="1000">1000포인트	7,000원(30%)</label>
	</div>
 
 <h2>결제정보를 입력해주세요</h2>
    <div class="input-group">
      <span class="input-group-addon">카드번호</span>
      <input id="email" type="text" class="form-control" name="email">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">유효기간</span>
      <input id="password" type="text" class="form-control" name="password">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">생년월일(6자리)</span>
      <input id="msg" type="text" class="form-control" name="msg">
    </div>
    <br>
    <div class="input-group">
      <span class="input-group-addon">카드비밀번호 앞 2자리</span>
      <input id="msg" type="password" class="form-control" name="msg">
    </div>
    <br>
    <input type="reset" class="btn btn-primary" value="취소">
 	<input type="submit" class="btn btn-primary" value="충전" style="float: right;">
  </form>

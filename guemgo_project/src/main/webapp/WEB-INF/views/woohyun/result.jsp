<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	2018-10-29	윤우현 파일 생성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    if ('${code}' == 'join_success') {
		alert('회원가입이 완료되었습니다.');
    } else if ('${code}' == 'join_fail') {
    	alert('회원가입에 실패하였습니다.');
    } else if ('${code}' == 'success') {
    	alert('처리되었습니다.');
    } else if ('${code}' == 'fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } else if ('${code}' == 'gosuInsert_success') {
    	alert('고수 가입을 축하드립니다.');
    } else if ('${code}' == 'gosuInsert_fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } else if ('${code}' == 'gosuProfileUpdate_success') {
    	alert('프로필이 업데이트 되었습니다.');
    } else if ('${code}' == 'gosuProfileUpdate_fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } else if ('${code}' == 'gosuUpdate_success') {
    	alert('프로필이 업데이트 되었습니다.');
    } else if ('${code}' == 'gosuUpdate_fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } else if ('${code}' == 'pointChange_success') {
    	alert('포인트가 충전 되었습니다.');
    } else if ('${code}' == 'pointChange_fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } else if ('${code}' == 'userDelete_success') {
    	alert('회원 삭제되었습니다.');
    } else if ('${code}' == 'userDelete_fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } else if ('${code}' == 'userUpdate_success') {
    	alert('회원 정보가 업데이트 되었습니다.');
    } else if ('${code}' == 'userUpdate_fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } else if ('${code}' == 'gosuDelete_success') {
    	alert('고수회원이 삭제되었습니다.');
    } else if ('${code}' == 'gosuDelete_fail') {
    	alert('처리 중 오류가 발생하였습니다.');
    } 
    
//     history.back();	// 이전 페이지로 이동
    location.href = '<c:url value='${goUrl}'/>';	// 컨트롤러의 goUrl 위치로 이동
</script>
</head>
</html>








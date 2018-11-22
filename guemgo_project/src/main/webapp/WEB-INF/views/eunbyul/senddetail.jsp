
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>받은 요청 내역</title>
</head>
<body>
	<div class="container-fluid"
		style="margin-bottom: 15px; padding-top: 180px;">
	<section class="container">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3>요청서 상세</h3>
				</div>
				<div class="modal-body">
					<input type="hidden" name="email" value="${sessionScope.email }">
					<%-- ${status.count} <!-- 이게 ex_num이랑 똑같음 --> --%>
					<c:forEach var="qq" items="${quelist }" varStatus="ss">
						<div class="form-row">

							<c:if test="${qq.ques_num != 1 }">

								<label>▶ ${qq.question }</label><br>
								<c:forEach var="vo1" items="${list }" varStatus="rr">
									<c:if test="${ss.index-1 eq rr.index }">
										<%-- <input type="text" name="purpose" value="${vo1[ss.index].answer }" class="navbar-brand"> --%>
										${vo1.answer  }<br>
									</c:if>

								</c:forEach>
								<br>
							</c:if>
						</div>
					</c:forEach>
				<button type="button" class="btn btn-primary" onclick='location.href="javascript:history.back();"'>
						뒤로가기</button>
				</div>
			</div>
		</div>


	</section>
</div>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>보낸 요청 내역</title>
</head>
<body>
<section class="container">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3>받은 요청서 상세</h3>
				</div>
				<div class="modal-body">
					<input type="hidden" name="email" value="${sessionScope.email }">
					<%-- ${status.count} <!-- 이게 ex_num이랑 똑같음 --> --%>
					<c:forEach var="qq" items="${quelist }" varStatus="ss">
						<div class="form-row">

							<c:if test="${qq.ques_num != 1 }">

								<label><h2>▶ ${qq.question }</h2></label><br>
								<c:forEach var="vo1" items="${list }" varStatus="rr">
									<c:if test="${ss.index-1 eq rr.index }">
										<%-- <input type="text" name="purpose" value="${vo1[ss.index].answer }" class="navbar-brand"> --%>
										${vo1.answer  }
									</c:if>

								</c:forEach>
								<br>
							</c:if>
						</div>
					</c:forEach>
					<br>
					<button type="button" class="btn btn-primary"
				onclick='location.href="<c:url value='/makeRoom?email=${email }&other=${other }&lecturenum=${lecturenum }'/>"'>채팅걸기</button>
					
				</div>
			</div>
		</div>

		
	</section>

</body>
</html>




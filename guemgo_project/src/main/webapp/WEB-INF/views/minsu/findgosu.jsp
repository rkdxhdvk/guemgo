<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>index.jsp</title>
<link rel="stylesheet" href="/go/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/go/resources/css/custom.css"> 

</head>
<body>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script src="/go/resources/js/jquery.min.js"></script>
	<script src="/go/resources/js/pooper.js"></script>
	<script src="/go/resources/js/bootstrap.js"></script> 

					<form action="<c:url value='/'/>" method="get">
					<input type="hidden" name="email" value="${sessionScope.email }">
					<ul style="float: left">
						<li><div class="form-row">
							<div class="form-group col-sm-12">
							<label>대분류</label><br> 		
							<select name="large" id="large" class="form-control">
								<c:forEach items="${catelList }" var="vo">
									<option value=${vo.lnum }>${vo.lname }</option>
								</c:forEach>
							</select>
							</div>
						</div>
						</li>
						<li>
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>중분류</label><br> 		
							<select name="medium" id="medium" class="form-control" style="size: 30px;">
								
							</select>
							</div>
						</div>
						</li>
						<li>
						<div class="form-row">
							<div class="form-group col-sm-12">
							<label>소분류</label><br> 		
							<select name="small" id="small" class="form-control">
								
							</select>
							</div>
						</div>
						</li>
						<li>
						<div class="form-group col-sm-4 ">
								<div class="form-group">
									<input class="form-control" style="top: 5px;"
										placeholder="도로명 주소" name="addr1" id="addr1" type="text"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="상세주소" name="addr2"
										id="addr2" type="text" />
								</div>
								<button type="button" class="btn btn-primary mx-1 mt-2"
										onclick="addrSearch();" style="background-color: #4CAF50;" >
										<i class="fa fa-search"></i> 주소검색
									</button>
						</div>
						</li>
						<button type="submit" class="btn btn-primary mx-1 mt-2 col-sm-12" style="background-color: #4CAF50;">검색</button>
						</ul>
					</form>
					


<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/5bd67c1a476c2f239ff66196/default';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
		/* End of Tawk.to Script */
		
		
		$("#large").change(function(){
			var lnum = document.getElementById("large").value;
			$.getJSON({
				url:"<c:url value='/large'/>",
				data : {lnum:lnum}, 
				success:function(data){
					var med = {};
					$(data).each(function(i,json){
						med += '<option value="' + json.mnum + '">' + json.mname + '</option>';
					});
					$('#medium').html(med);
					$('#small').html("");
				}
			});
		});
		
		
		$("#medium").change(function(){
			var mnum = document.getElementById("medium").value;
			$.getJSON({
				url:"<c:url value='/medium'/>",
				data : {mnum:mnum}, 
				success:function(data){
					var sml = {};
					$(data).each(function(i,json){
						sml += '<option value="' + json.snum + '">' + json.sname + '</option>';
					});
					$('#small').html(sml);
				}
			});
		});
	</script>

	
</body>
</html>
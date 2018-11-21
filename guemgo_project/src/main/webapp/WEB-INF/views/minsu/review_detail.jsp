<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="container-fluid" style="margin-bottom: 15px;padding-top: 145px;">
		<p class="text-left" style="font-size: x-large;">상세보기</p>
		<button type="submit" class="btn btn-primary" style="float: right;  margin-right: 10px;"
				onclick="location='<c:url value='/reList'/>'">목록</button>
		<c:if test="${sessionScope.email==vo.email }">
			<button type="submit" class="btn btn-primary" style="float: right; margin-right: 10px;"
				onclick="location='<c:url value='/reDelete?reviewNum=${vo.reviewNum }'/>'">삭제</button>
			<form action="<c:url value='/reUpdate'/>" method="post">
				<input type="hidden" name="reviewNum" value="${vo.reviewNum }"> <input
					type="hidden" name="title" value="${vo.title }"> <input
					type="hidden" name="email" value="${vo.email }"> <input
					type="hidden" name="content" value="${vo.content }">
				<button type="submit" class="btn btn-primary"
					style="float: right; margin-right: 10px;"
					onclick="location='<c:url value='/reUpdate'/>'">수정</button>
			</form>
		</c:if>
	</div>
	<div class="container-fluid"
		style="overflow: auto; height: 45%; border: solid 1px #337ab7; border-radius: 5px; margin-bottom: 15px;">
		<div class="panel-heading">
			<c:choose>
				<c:when test="${vo.star==5 }">
					평점: ★★★★★
				</c:when>
				<c:when test="${vo.star==4 }">
					평점: ★★★★
				</c:when>
				<c:when test="${vo.star==3 }">
					평점: ★★★
				</c:when>
				<c:when test="${vo.star==2 }">
					평점: ★★
				</c:when>
				<c:when test="${vo.star==1 }">
					평점: ★
				</c:when>
				
			</c:choose>
			<div class="pull-right">
				작성자:${vo.email } 조회수:${vo.hit } 작성일:${vo.regdate }

			</div>
		<hr style="border: solid 1px #337ab7;">
			<div>
				<strong>${vo.title }</strong>
				<hr style="border: solid 1px #337ab7;">

			</div>
		</div>
		<div class="panel-body">${vo.content }</div>
		<c:if test="${vo.img != 'non'}">
			<div class="panel-body"><img src="resources/upload/${vo.img}"></div>
		</c:if>
	</div>

	<div class="container-fluid" id="comments"
		style="overflow: auto; height: 40%; border: solid 1px #337ab7; border-radius: 5px;">
		<div class="panel-heading">
			Comment
			<hr style="border: solid 1px #337ab7;">
		</div>

		<div class="panel-body" id="commentList">
			<c:forEach var="vo" items="${list }">
				<div class="panel panel-primary">
					<div class="panel-heading">글쓴이    ${vo.writer}</div>
					<div class="panel-body">${vo.content }
						<c:if test="${sessionScope.email==vo.writer }">
							<button type="button" class="btn btn-primary pull-right"
								onclick="deleteComment(${vo.commentNum})">삭제</button>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
		<textarea class="form-control" rows="5" id="comment"></textarea>
		<div>
			<span id="count">0</span>/<span id="max-count">0</span>
		</div>
		<button type="button" class="btn btn-primary pull-right"
			onclick="addComment()">댓글</button>
	</div>

	<script id="template-list-item" type="text/template">
	<div class="panel panel-primary">
		<div class="panel-heading">글쓴이 {writer}</div>
		<div class="panel-body">{content}
			<c:if test="${sessionScope.email== writer }">
				<button type="button" class="btn btn-primary pull-right"
						onclick="deleteComment({commentNum})">삭제</button>
			</c:if>
		</div>
	</div>
	</script>

<script type="text/javascript">

	function getList() {
		$.ajax({
			url:"<c:url value='/commList?reviewNum=${vo.reviewNum }'/>",
			dataType:'json',
			success:function(data){
				$("#commentList").empty();
				///ajax????????????????????????????//////////
				var html = document.querySelector("#template-list-item").innerHTML;
				var resultHTML = "";
				$(data).each(function(i, json){
					resultHTML += html
										.replace("{writer}", json.writer)
										.replace("{content}", json.content)
										.replace("{commentNum}", json.commentNum);
				});
				document.querySelector("#commentList").innerHTML = resultHTML;
				$('#comments').scrollTop($('#comments')[0].scrollHeight);
			}
		});
	}
	
	function addComment(){
		if($("#comment").val() == ""){
			alert('댓글 입력');
			return;
		}
		var reviewNum = ${vo.reviewNum };
		var comment = $("#comment").val();
		$.getJSON("<c:url value='/commInsert'/>", {
			"reviewNum" : reviewNum,
			"comment" : comment,
			"writer" : '${sessionScope.email}'
		}, function(data){
				$("#comment").val("");
				getList();
		});
		$('#comment').focus();
	}
	
	function deleteComment(commentNum){
		var reviewNum = ${vo.reviewNum};
		$.getJSON("<c:url value='/commDelete'/>",{
			"reviewNum" : reviewNum,
			"commentNum" : commentNum
		}, function(data){
			getList();
		   }
	    )
	}
	
</script>


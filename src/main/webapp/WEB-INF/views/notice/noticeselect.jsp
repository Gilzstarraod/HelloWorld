<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Custom fonts for this template-->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./css/sb-admin-2.min.css" rel="stylesheet">
<style>
	.cheader .replyId {
		display: inline-block;
		width: 500px;
	}
	.cheader .replyer {
		display: inline-block;
		
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 확인</h1>
		</div>
		<div>
			<table border="1">
				<tr>
					<th width="100">작성자</th>
					<td align="center">${n.noticeWriter}</td>
					<th width="100">작성일자</th>
					<td align="center">${n.noticeDate}</td>
					<th width="100">조회수</th>
					<td align="center">${n.noticeHit}</td>
				</tr>

				<tr>
					<th width="100">제목</th>
					<td colspan="5">${n.noticeTitle}</td>
				</tr>
				<tr>
					<th width="100">내용</th>
					<td colspan="5"><textarea rows="4" cols="80"
							readonly="readonly">${n.noticeSubject}</textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="5">${n.noticeAttech}</td>
				</tr>
			</table>
		</div>
		<br>
		<div>
			<c:if test="${name eq n.noticeWriter}">
				<button type="button" onclick="noticeUpdate('E')">수정</button>&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="noticeUpdate('D')">삭제</button>&nbsp;&nbsp;&nbsp;
		</c:if>
			<button type="button" onclick="location.href='noticelist.do'">목록</button>
		</div>
		<div>
			<form id="frm" method="post">
				<input type="hidden" id="noticeId" name="noticeId"
					value="${n.noticeId}">
			</form>
		</div>
	</div>

	<div class="container-fluid">
		<div class="reply">
			<h3>댓글목록</h3>
			<div class="col-lg-10">
				<div class="card mb-4" style="display:none;">
					<div class="cheader">
						<div class="replyId"> 1 </div>
						<div class="replyer"> user1 </div>
					</div>
					<div class="cbody">
						댓글내용부분
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function noticeUpdate(str) {
			if (str == 'E') {
				document.getElementById("frm").action = "noticeeditform.do"
			} else {
				document.getElementById("frm").action = "noticedelete.do"
			}
			document.getElementById("frm").submit();
		}
	</script>
	<script src="./js/reply.js"></script>
	<script type="text/javascript">
		var noticeId = '<c:out value="${n.noticeId}" />';
		console.log('notice: ', noticeId);
		
		var reply = new Reply();
		
		reply.replyList(noticeId, function(data){
			console.log(data)
			
			for(let i = 0; i < data.length; i++){
				let temp = $('div.card.mb-4').eq(0).clone();
				temp.css('display', 'block')
				
				temp.find('div.replyId').text(data[i].replyId);
				temp.find('div.replyer').text(data[i].replyer);
				temp.find('div.card-body').text(data[i].reply);
				$('div.col-lg-10').append(temp);
			}
		})
	</script>
</body>
</html>
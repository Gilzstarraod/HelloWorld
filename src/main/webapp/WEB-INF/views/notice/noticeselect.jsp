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
<link href="./css/bootstrap.min.css" rel="stylesheet">
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
<script	src="./js/bootstrap.min.js"></script>
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
		<br>
		<div>
			<form id="frm" method="post">
				<input type="hidden" id="noticeId" name="noticeId"
					value="${n.noticeId}">
			</form>
		</div>
	</div>

	<!-- 댓글부분. -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>Reply
					<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
				</div>
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix" data-rno="12" style="display:none;">
							<div>
								<div class="header">
									<strong class="primary-font">user00</strong>
									<small class="pull-right text-muted">2023-03-05 13:13</small>
								</div>
								<p>Good job!</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="panel-footer">
	
				</div>
			</div>
		</div>
	</div>
	<!-- end -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
				</div>
				<div class="modal-body">
					<div class='form-group'>
						<label>Reply</label>
						<input class='form-control' name='reply' value='New Reply!!!!'>
					</div>
					<div class='form-group'>
						<label>Replyer</label>
						<input class='form-control' name='replyer' value='replyer'>
					</div>
					<div class='form-group'>
						<label>Reply Date</label>
						<input class='form-control' name='replyDate' value='replyDate'>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning" data-dismiss="modal">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-default">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


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
						
		var mils = Date.parse('');
		var today = new Date(mils);
		console.log(today.getFullYear());
		
				
		var reply = new Reply();
		
		reply.replyList(noticeId, function(data){
			console.log(data)
			
			for(let i = 0; i < data.length; i++){
				let temp = $('.chat > li').eq(0).clone();
				temp.css('display', 'block')
				
				temp.attr('data-rno', data[i].replyId);
				temp.find('strong').text(data[i].replyer);
				temp.find('small').text(reply.displayDateTime(data[i].replyDate));
				temp.find('p').text(data[i].reply);
				
				$('.chat').append(temp);
			}
		})
		
		// 댓글등록화면
		$('#addReplyBtn').on('click', function(){
			// 수정, 삭제 버튼 숨김
			$('#modalModBtn').hide();
			$('#modalRemoveBtn').hide();
			$('#modalRegisterBtn').show();
			$('.modal').modal('show');
		})
		
		// 댓글등록처리
		$('#modalRegisterBtn').on('click', function () {
			var content = $('input[name=reply]').val();
			var replyer = $('input[name=replyer]').val();
			var param = {
				noticeId,
				reply: content,
				replyer
			}
			
			reply.replyAdd(param, function(data){
				console.log(data)
			let temp = $('.chat > li').eq(0).clone();
			temp.css('display', 'block')
			
			temp.attr('data-rno', data.data.replyId);
			temp.find('strong').text(data.data.replyer);
			temp.find('small').text(reply.displayDateTime(data.data.replyDate));
			temp.find('p').text(data.data.reply);
			
			$('.chat').append(temp);
			$('.modal').modal('hide');
			});
		})
		
		// 댓글수정삭제 화면
		$('.chat').on('click', 'li', function(){
			$('#modalModBtn').show();
			$('#modalRemoveBtn').show();
			$('#modalRegisterBtn').hide();
			$('.modal').modal('show');
			
			var rno = $(this).attr('data-rno');
			rno = $(this).data('rno')
			
			// data-rno = 1
			reply.replySearch(rno, function(data){
				console.log(data);
			$('input[name=reply]').val(data.reply);
			$('input[name=replyer]').val(data.replyer);
			$('input[name=replyDate]').val(reply.displayDateTime(data.replyDate));
			})
			
		})
		$('#modalModBtn').on('click', function(){
			var content = $('input[name=reply]').val();
			var replyer = $('input[name=replyer]').val();
			var param = {
				reply: content,
				replyer
			}
			reply.replyModify(param, function(data){
				console.log(data)
			
			})
		})
	</script>
</body>
</html>
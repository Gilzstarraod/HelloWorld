<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here2</title>
	<!-- Custom fonts for this template-->
	<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
		type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/sb-admin-2.min.css" rel="stylesheet">
	
	<link href=https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
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
	
	<div class="addReply">
		<label>댓글내용<input type="text" id="content"></label> &nbsp;
		<label>작성자<input type="text" id="writer"></label>
		<button id="addBtn">등록</button>
	</div>

	<!-- 댓글부분. -->
	<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>댓글번호</th>
                <th>댓글내용</th>
                <th>작성자</th>
                <th>작성일자</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>댓글번호</th>
                <th>댓글내용</th>
                <th>작성자</th>
                <th>작성일자</th>
            </tr>
        </tfoot>
    </table>
	<!-- end -->
	

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
		
		//datatable 목록 출력
		const table = new DataTable('#example', {
		    ajax: './jquery/AjaxDataTable.do',
		    columns: [
		        { data: 'replyId' },
		        { data: 'reply' },
		        { data: 'replyer' },
		        { data: 'replyDate' }
		    ]
		});
		
		// 댓글등록
		$('#addBtn').on('click', function(){
			var content = $('#content').val(); // 댓글내용에 담기(입력되)는 값
			var writer = $('#writer').val();   // 작성자에 담기(입력되)는 값
			const reply = new Reply();         // 
			const param = { // reply.js의 replyAdd() 클래스에 보내기 위해 parameter만듦
					noticeId,
					reply: content,
					replyer:writer
			}
			reply.replyAdd(param, function (data) { // reply.js의 replyAdd()에 param를 보내고, replyAdd() 안에 있는 AjaxReplyAdd.java를 거쳐 받아옴
				console.log(data);
				addNewRow(data.data); // 아래 addNewRow function 이용해 값 넣음
			})
		});
		
		function addNewRow(row){ // replyId, reply, replyer, replyDate는 datatable 목록 출력에서 설정한 이름에 추가함 
			table.row
		        .add({
		            replyId: row.replyId, // 댓글번호
		            reply: row.reply, // 댓글내용
		            replyer: row.replyer, // 작성자
		            replyDate: row.replyDate // 작성일자
		        })
		        .draw(false);
		}
	</script>
</body>
</html>
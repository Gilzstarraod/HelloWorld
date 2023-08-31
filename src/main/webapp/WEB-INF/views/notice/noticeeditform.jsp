<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 수정</h1>
		</div>
		<div>
		<form id="frm" action="noticeedit.do" method="post" enctype="multipart/form-data">
		<div>
			<table border="1">
				<tr>
					<th width="100">작성자</th>
					<td>
						<input type="text" name="noticeWriter" id="noticeWriter" value="${n.noticeWriter}" readonly="readonly">
					</td>
					<th width="100">작성일자</th>
					<td>
						<input type="date" name="noticeDate" id="noticeDate" value="${n.noticeDate}">
					</td>
				</tr>

				<tr>
					<th width="100">제목</th>
					<td colspan="3">
					<input type="text" size="78" name="noticeTitle" id="noticeTitle" value="${n.noticeTitle}">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="20" cols="80" name="noticeSubject" id="noticeSubject">${n.noticeSubject}</textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>${n.noticeAttech}</td>
					<td colspan="2">
					<input type="file" name="file" id="file">
					</td>
				</tr>
			</table>
		</div><br>
		<div>
			<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;
			<input type="button" onclick="location.href='noticelist.do'" value="취소">
		</div>
			<input type="hidden" id="noticeId" name="noticeId" value="${n.noticeId}">
		</form>
	</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 확인</h1>
		</div>
		<div>
			<table border="1">
				<tr>
					<th width="100">글번호</th>
					<td>${n.noticeId}</td>
				</tr>
				<tr>
					<th width="100">작성자</th>
					<td>${n.noticeWriter}</td>
				</tr>
				<tr>
					<th width="100">제목</th>
					<td>${n.noticeTitle}</td>
				</tr>
				<tr>
					<th width="100">내용</th>
					<td>${n.noticeSubject}</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시판 목록 보기</h1>
		</div>
		<div>
			<form id=frm method="post">
				<select id="key" name="key">
					<option value="title">제목</option>
					<option value="subject">내용</option>
					<option value="writer">작성자</option>
				</select> <input type="text" id="val" name="val"> <input
					type="button" value="검색" onclick="search">
			</form>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th width="100">순번</th>
						<th width="300">제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일자</th>
						<th width="150">첨부파일명</th>
						<th width="100">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty notices}">
						<c:forEach items="${notices}" var="n">
							<tr onmouseover='this.style.background="#fcecae"'
								onmouseout='this.style.background="#FFFFFF"'
								onclick="selectNotice('${n.noticeId}')"
							>
								<td align="center">${n.noticeId}</td>
								<td align="center">${n.noticeTitle}</td>
								<td align="center">${n.noticeWriter}</td>
								<td align="center">${n.noticeDate}</td>
								<td align="center">${n.noticeAttech}</td>
								<td align="center">${n.noticeHit}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty notices}">
						<tr>
							<td colspan="6" align="center">데이터가 존재하지 않습니다</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<br>
		<c:if test="${not empty id}">
			<button type="button" onclick="location.href='noticeform.do'">글쓰기</button>
		</c:if>
	</div>
	<div>
		<form id="noticefrm" method="post">
			<input type="hidden" id="noticeId" name="noticeId">
		</form>
	</div>
	<script type="text/javascript">
		function selectNotice(n) {
			document.getElementById("noticeId").value = n;
			document.getElementById("noticefrm").action = "noticeselect.do";
			document.getElementById("noticefrm").submit();
		}
	</script>
</body>
</html>
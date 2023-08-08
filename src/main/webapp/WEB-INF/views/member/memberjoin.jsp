<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div><h1>회 원 가 입</h1></div>
		<div>
			<form id="frm" action="memberjoin.do" onsubmit="return formCheck()" method = "post" enctype="multipart/form-data"> 
				<div>
					<table border="1">
						<tr>
							<th width="150">아이디 *</th>
							<td width="300">
								<input type="text" id="memberId" name="memberId" required="required"> &nbsp;&nbsp;
								<button type="button" id="btn" value="NoCheck" onclick="idCheck()">중복체크</button>
							</td>
						</tr>
						<tr>
							<th>패스워드 *</th>
							<td>
								<input type="password" id="memberPassword" name="memberPassword" required="required">
							</td>
						</tr>
						<tr>
							<th>패스워드확인*</th>
							<td>
								<input type="password" id="passwordCheck" required="required">
							</td>
						</tr>
						<tr>
							<th>이 름*</th>
							<td>
								<input type="text" id="memberName" name="memberName" required="required">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="tel" id="memberTel" name="memberTel">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" id="memberAddress" name="memberAddress">
							</td>
						</tr>
						<tr>
							<th>사진</th>
							<td>
								<input type="file" id="file" name="file">
							</td>
						</tr>
					</table>
				</div><br>
				<div>
					<input type="submit" value="회원가입"> &nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function idCheck() { // ajax를 통신을 이용해 아이디 중복체크
			let id = document.getElementById("memberId").value;
		// get방식 ajax호출
			let url = "ajaxMemberIdCheck.do?memberId=" + id;	
			fetch(url)
				.then(response => response.text())
				.then(text => checkId(text));
		}
		// state code 200, 300 = 성공
				   // 400 = 경로 문제 
				   // 500 = 서블릿 문제
		function checkId(text){
			if(text == 'yes'){
				alert("사용 가능한 아이디입니다");
				document.getElementById("btn").disabled = true;
				document.getElementById("btn").value = "Yes";
				document.getElementById("memberPassword").focus();
			} else{
				alert("이미 사용 중인 아이디입니다");
				document.getElementById("memberId").value = "";
				document.getElementById("memberId").focus();
			}
		}
		
	 	function formCheck() {
	 		let password = document.getElementById("memberPassword").value;
	 		let passcheck = document.getElementById("passwordCheck").value;
	 		let id = document.getElementById("btn").value;
	 		
	 		if(id == 'NoCheck'){
	 			alert("아이디 중복체크 하세요")
				return false;
	 		}
	 		
			if(password != passcheck){
				alert("패스워드가 일치하지 않습니다")
				return false;
			}
		}
		
	</script>
</body>
</html>
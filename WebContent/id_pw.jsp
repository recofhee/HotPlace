<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>ID / PW 찾기</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 이메일 인증 관련 ajax */
/* var code_check;
$(function(){
	$("#sendAuth").click(function() {
		$.ajax("send.do", { 
			data : "receiver=" + $("#receiver").val(),
			dataType : "json",
			beforeSend : function() {
				$("#sendAuth").hide().prev().html("인증번호 발송중");
			},
			success : function(data) {
				if(data.code == 1) {
					$("#receiver").attr("readeonly", true);
					$("#sendAuth").prev().html("인증번호 발송 완료");
					code_check = data.code_check;
				}
				else if(data.code == 2) {	
					$("#sendAuth").show().prev().html("");
					alert("유효하지 않는 이메일 주소입니다");
				}
			}
		})
	});
}); */
</script>
<style>
h2 {
	font-size: 35px;
	margin-top: 160px;
}

h3 {
	font-size: 18px;
	border: 1px solid gray;
	width: 120px;
	height: 30px;
	text-align: center;
	margin: 0 auto;
	margin-right: 465px;
}


#container {
	width: 90%;
	margin: 0 auto;
}

#header {
	padding: 5px;
	font-size: 20px;
	text-align: center;
}

.content {
	height: 270px;
	width: 780px;
	margin: 0 auto;
	border: 2px solid gray;
	margin-top: 5px;
	margin-bottom: 20px;
	text-align: center;
}

.content2 {
	margin: 0 auto;
	width: 780px;
	height: 300px;
	margin-bottom: 20px;
	border: 2px solid #666666;
	text-align: center;
	margin-top: 5px;
}

input[type='text'] {
	width: 200px;
	height: 30px;
	border: 1px solid gray;
	font-size: 15px;
	margin-left: 20px;
}

.p1 {
	margin-right: 60px;
}

.p2 {
	margin-right: 60px;
}

.signUpButton {
	position: relative;
	width: 26%;
	height: 40px;
	margin-top: 20px;
	margin-left: 2%;
	font-size: 17px;
	color: white;
	text-align: center;
	background: #31708f;
	border: 0;
	cursor: pointer;
}

.signUpButton:active {
	top: 1px;
	outline: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
</style>


</head>
<body>
	<section>
		<div id="container">
			<h2 align="center">SEARCH</h2>


			<form action="id_pw" method="post" name="frm" id="frm">

				<div>
					<h3>계정 찾기</h3>
				</div>

				<section class="content">
					<div>

						<div style="margin: 20px; padding-bottom: 20px;">
							<h4>계정을 검색하려면 이메일을 적어주세요.</h4>
						</div>

						<div class="p1">


							<p>
								<label>이메일</label>
								<input type="text" name="email" id="receiver" size="20"  />
							</p>
						</div>

						<div>
							<input type="submit" name="sendAuth" id="sendAuth" value="입력완료" class="signUpButton" onclick="return loginCheck()" >
						</div>


					</div>

					<%-- <span>${message}</span> --%>
				</section>
			</form>


		</div>
		<div style="padding-top: 10px;" align="center">
			<span> ※ SNS 계정으로 가입한 회원의 비밀번호는 저장하고 있지 않으며 해당 SNS 서비스 제공사에
				문의하시길 바랍니다.</span><br> 
		</div>
	</section>
</body>
</html>
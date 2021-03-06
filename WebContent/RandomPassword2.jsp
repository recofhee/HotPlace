<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>비밀번호찾기</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
h2 {
	font-size: 35px;
	margin-top: 160px;
}

h3 {
	font-size: 18px;
	border: 1px solid gray;
	width: 165px;
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
#container form {
    text-align: center;
    max-width: 500px;
    margin: 0 auto;
    box-shadow: 0px 0px 5px rgba(0,0,0,.1);
    border: 1px solid #eee;
    border-radius: 4px;
    padding: 50px;
    background: #fff;
}
.content {
    margin: 0 auto;
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
	width: 100%;
	border: 1px solid #bbb;
    font-size: 16px;
    padding: 15px 20px;
    text-align: center;
    border-radius: 4px;
}

.p1 {
	margin-right: 60px;
}

.p2 {
	margin-right: 60px;
}

.signUpButton {
	font-size: 16px;
    color: #eee;
    width: 100%;
    padding: 15px 20px;
    border-radius: 4px;
    text-align: center;
    background: #3c4990;
    border: 0;
    cursor: pointer;
}

.signUpButton:active {
	top: 1px;
	outline: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
.logo {
	max-width: 50px;
	margin: 0 0 20px 0;
}
</style>

</head>
<body>
	<section>
		<div id="container">
			<h2 align="center">비밀번호 찾기</h2>


			<form action="login.jsp" method="post" name="frm" id="frm">
				<a href="main" title="메인으로 돌아가기"><img alt="Hot Place Logo" src="images/icon/HotPlace.png" class="logo"></a>

				<section class="content">
					<div>
						<p>"${email}"로 임시 비밀번호를 발송했습니다.</p>

						<div>
							<input type="submit" value="로그인 페이지 이동" class="signUpButton" >
							<!--  <p>
								<a href="login.jsp">로그인페이지로 이동</a>
							</p> -->
						</div>
					</div>
				</section>
			</form>


		</div>
		<!-- <div style="padding-top: 10px;" align="center">
			<span> ※ SNS 계정으로 가입한 회원의 비밀번호는 저장하고 있지 않으며 해당 SNS 서비스 제공사에
				문의하시길 바랍니다.</span><br>
		</div> -->
	</section>
</body>
</html>
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
	height: 315px;
	width: 785px;
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


.p2 {
	margin-right: 60px;
}

.signUpButton {
	position: relative;
	width: 20%;
	height: 40px;
	margin-left: 73%;
	margin-top:90px;
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

.mvm{
	margin-left: 
}
</style>

<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous">
 </script>
 
<script>
/* 이메일 인증 관련 ajax */
var code_check;
$(function(){
	$.ajax("send.do", { 
		data : "receiver=" + $("#receiver").text(),
		dataType : "json",
		success : function(data) {
			if(data.code == 1) {
				code_check = data.code_check;
			}
		}
	})
});
</script>

<script type="text/javascript">
/* 이메일 인증 코드 관련 부분 */
	function checkCode(){
		var v1 = code_check;
		var v2 = frm.code.value;
		
		if(v1 != v2) {
			document.getElementById('checkCode').style.color="red";
			document.getElementById('checkCode').innerHTML="잘못된인증번호";
		} else {
			document.getElementById('checkCode').style.color="blue";
			document.getElementById('checkCode').innerHTML="인증되었습니다.";
		}
	}
	
 
</script>

</head>
<body>
	<section>
		<div id="container">
			<h2 align="center">SEARCH</h2>

			<form action="id_pw2" method="post" name="frm" id="frm">
				<div>
					<h3>계정 찾기</h3>
				</div>

				<section class="content">

					<div style="margin: 20px;">
						<h4 style="font-size: 20px; border-bottom: 1px solid gray; padding-bottom: 20px;">비밀번호 재설정</h4>
					</div>
					
					<div style="width:600px; float:left;">
					
						<strong>이메일로 전송된 코드를 입력해주세요.</strong>
						<i class="_8o _8r lfloat _ohe img sp_11oBBn1TWmd sx_c373a6"></i>
						
						<div style="margin-top: 10px;">
								<strong>이메일 : </strong><span id="receiver">${email}</span>
						</div>
						<table style="margin-left: 185px; margin-top: 11px; position: absolute;">
								<tr>
							<%-- ${param.email } --%>
									<th>인증번호를 입력해주세요</th>
								</tr>
								<tr>
									<td><input type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."/>
										<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>"/>	
										<div id="checkCode"></div>
										<input id="code_check" type="hidden" value="인증하기" /> 
									</td>
								<%-- ${message } --%>
								</tr>
							</table>

						<%-- <div align="center"><span>인증번호</span></div>
							<div><input type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."/>
								<div id="checkCode"></div>
								<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code") %>"/>	
								<input id="hi" type="hidden" value="인증하기"/>
							</div>  --%>
		
<%-- code : ${code } , code_check : ${code_check }
<%=request.getAttribute("code") %>
<%=request.getAttribute("code_check") %>
${sendAuth} --%>

						<div style=" margin-left: 100px;"> 
							<input id="hi" type="hidden" value="인증" class="signUpButton"/>
						</div>
									<input type="submit" value="계속하기" class="signUpButton"/> 
					</div>

					<div style="float: right; width: 159px; height:150px; margin-right: 25px; margin-top:20px; border-left: 1px solid gray;word-break:break-all;">
						<img class="_s0 _rw img"
							src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.0-1/c15.0.50.50/p50x50/10645251_10150004552801937_4553731092814901385_n.jpg?_nc_cat=1&amp;oh=6134ae4a847ee901b7c61d8b56735d5b&amp;oe=5C495C10"
							alt="">
						<div>${param.email}</div>
						<div>~~ 사용자</div>
					</div>
				</section>
			</form>


		</div>
		<%-- <div style="padding-top: 10px;" align="center">
			<span> ※ SNS 계정으로 가입한 회원의 비밀번호는 저장하고 있지 않으며 해당 SNS 서비스 제공사에
				문의하시길 바랍니다.</span><br> <span>${message }</span>
		</div> --%>
	</section>
</body>
</html>
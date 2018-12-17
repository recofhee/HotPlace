<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID / PW 찾기</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 이메일 인증 관련 ajax */
var code_check;
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
			makeNull();
		} else {
			document.getElementById('checkCode').style.color="blue";
			document.getElementById('checkCode').innerHTML="인증되었습니다.";
			makeReal();
		}
		
	}
 
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


.p2 {
	margin-right: 60px;
}

.signUpButton {
	position: relative;
	width: 20%;
	height: 40px;
	margin-top: 10px;
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

.mvm{
	margin-left: 
}


</style>

</head>
<body>
<form action="" method="post" name="frm">
				<div>
					<h3>계정 찾기</h3>
				</div>

				<section class="content">

					<div style="margin: 20px;">
						<h4 style="font-size: 20px; border-bottom: 1px solid gray; padding-bottom: 20px;">비밀번호 재설정</h4>
					</div>
					
					<div style="width:600px; float:left;">
					
						<table>
								<tr>
							파람 : ${param.email }
									<th>인증번호를 입력해주세요</th>
								</tr>
								<tr>
									<td><input type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."/>
										<div id="checkCode"></div>
										<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code") %>"/>	
										<input id="hi" type="hidden" value="인증하기" />
									</td>
								${message }
								</tr>
							</table>
						<div style="padding-top: 35px; margin-left: 100px;"> 
							<input type="submit" value="계속하기" class="signUpButton">
						</div>
					</div>
				
				</section>
			</form>




<form  action="Join2" method="post" name="frm" id="frm" onsubmit="return joinCheck()">
	<table>
	
	
		<tr>
	파람 : ${param.email }
			<th>인증번호를 입력해주세요</th>
		</tr>
		<tr>
			<td><input type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."/>
				<div id="checkCode"></div>
				<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code") %>"/>	
				<input id="hi" type="hidden" value="인증하기" />
			</td>
		${message }
		</tr>
	</table>
</form>

</body>
</html>
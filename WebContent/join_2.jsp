<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
h2 {
	font-size: 30px;
	padding: 15px;
}

.container {
	width: 90%;
	margin: 0 auto;
}

.person {
	height: 500px;
	width: 930px;
	margin: 0 auto;
	border: 2px solid gray;
}
.person tr td:nth-child(1) {
	padding-left:20px;
	
} 
.person tr td:nth-child(1).must {
	
	background: url('images/337.png') no-repeat 3px 16px;
	background-size: 20px;
}

table td {
	/* text-align: left; */
	font-size: 15px;
	padding: 6px;
}
.under {
	display:inline-block;
	min-width:70px;
	border-bottom: 3px solid #e4e2e2;
	padding:0 10px 5px 0;
}

.button {
	display: inline-block;
	vertical-align: top;
	height: 35px;
	width: 120px;
	line-height: 34px;
	padding: 0 25px;
	font-size: 12px;
	color: #bbb;
	text-align: center;
	text-decoration: none;
	background-color: #303030;
	border-radius: 10px;
	margin-left: 10px;
	background-image: linear-gradient(to bottom, #3d3d3d, #272727);
}

.button:active, .button.active {
	line-height: 34px;
	color: #ccc;
}

input[type='text'] {
	width: 200px;
	height: 30px;
	border: 1px solid gray;
	float: left;
	font-size: 15px;
	margin-left: 20px;
}

input[type='password'] {
	width: 200px;
	height: 30px;
	border: 1px solid gray;
	float: left;
	font-size: 15px;
	margin-left: 20px;
}

.subCats {
	display: none;
	margin-left: 20px;
}

.signUpButton {
	position: relative;
	vertical-align: top;
	width: 10%;
	height: 50px;
	padding: 0;
	margin-left: 5%;
	font-size: 17px;
	color: white;
	text-align: center;
	background: #d43b79eb;
	border: 0;
	cursor: pointer;
}

.signUpButton2 {
	position: relative;
	vertical-align: top;
	width: 10%;
	height: 50px;
	padding: 0;
	font-size: 17px;
	color: white;
	text-align: center;
	background: #e60d0d6b;
	border: 0;
	cursor: pointer;
	
}
.box{
	width: 930px;
	height: 140px;
	border: 2px solid gray;
	margin: 0 auto;
	margin-bottom: 20px;
	

}
.checklist {
	list-style: none;
}
.checklist > li {
	position:relative;
	display: inline-block;
	width: 120px;
	text-align: center;
	border:1px solid gray;
	border-right:none;
	padding:10px 0;
	margin:0;
}
.checklist > li:nth-child(1) {
	 border-radius : 15px 0 0 15px;
}
.checklist > li:nth-child(4) {
	border-radius : 0 15px 15px 0;
	border-right:1px solid gray;
}
.checklist > li input[type='radio'] {
	display:none;
}
.checklist~ol {
}
.checklist~ol > li {
	width:160px;
	display: block;
	padding:10px 10px 10px 30px;
	border-radius:10px;
	background: #dab8b86b;
	margin-bottom: 10px;
	float: left;
	margin-right: 10px;
}

.checklist~ol > li input[type='checkbox'] {
	display:none;
}
ol.current {display: block}


</style>
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>

<script>
/* 이메일 인증 관련 ajax */
	var code_check;
	$(function(){
		$("#sendAuth").click(function() {
			if (!$("#receiver").val().match(/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,20}$/)) {
				alert("유효한 이메일을 입력해주세요.")
				return;
			}

					$.ajax("send.do", {
						data : "receiver=" + $("#receiver").val(),
						dataType : "json",
						beforeSend : function() {
							$("#sendAuth").hide().prev().html("인증번호 발송중");
						},
						success : function(data) {
							if (data.code == 1) {
								$("#receiver").attr("readeonly", true);
								$("#sendAuth").prev().html("인증번호 발송 완료");
								code_check = data.code_check;
							} else if (data.code == 2) {
								$("#sendAuth").show().prev().html("");
								alert("유효하지 않는 이메일 주소입니다");
							}
						}
					})
				});

		$(".checklist > li").click(function(e) {

			$(this).each(function(i, it) {
				var $child = $("#" + $(this).data("tab"));
				console.log(e);

				if (e.detail == 1) {
					if ($child.is(':visible') == false) {
						$(".ols").css('display', 'none')
						$child.stop().slideDown(200);
					} else {
						$child.stop().slideUp(200);
					}

					var $radio = $(it).find("input:radio");
					$radio.prop("checked", true);

					$(".checklist > li").css({
						color : "black",
						background : "white"
					});
					$(it).css({
						color : "white",
						background : "rgb(109, 139, 193)"
					});
				}
			})

		});

		$(".checklist")
				.parent()
				.find("ol li")
				.click(
						function() {
							var $chk = $(this).find("input:checkbox")
							if ($chk.prop("checked")) {
								$chk.prop("checked", false);
								$(this).css("background", "#dab8b86b")
							} else {
								$chk.prop("checked", true);
								$(this)
										.css("background",
												"#ec6464a3 url('images/337.png') no-repeat 5px center")
										.css("background-size", "20px");
							}
							/* $(this).each(function(i, it) {
								var $radio = $(it).find("input:radio");
								$radio.prop("checked", true);
								
								$(".checklist > li").css({color:"black", background:"white"});
								$(it).css({color:"white", background:"#333"});
								
							}) */

						});
	});
</script>

<script type="text/javascript">
/* 이메일 인증 코드 관련 부분 */
	function checkCode(){
		var v1 = code_check;
		var v2 = frm.code.value;
		
		console.log("v1 : " + v1);
		console.log("v2 : " + v2);
		
		
		if(v1 != v2) {
			document.getElementById('checkCode').style.color="red";
			document.getElementById('checkCode').innerHTML="잘못된인증번호";
		} else {
			document.getElementById('checkCode').style.color="blue";
			document.getElementById('checkCode').innerHTML="인증되었습니다.";
		}
	}
</script>

<script>
	$(function() {
		$(document.frm.nick_name).on("keyup", function() {
			//var nick_name = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
			var nick_name = this;
			/* if (!idReg.test($("input[name=nick_name]").val())) {
				$(this).next().html("닉네임은 영문자와 한글,숫자만을 입력하세요"); */
				if(nick_name.value.length < 2) {
					$(this).next().html("닉네임은 2글자 이상으로 해주세요");	
			} else {
				$.ajax( {
					url : "idCheckAjax.do",
					success : function(data) {
						if (data == 1) {
							/* 	$(email).next().html("이미 존재하는 이메일 입니다."); */
							$(nick_name).next().html("이미 존재하는 닉네임 입니다.");
							$(document.frm.renick).val("");
						} else {
							$(nick_name).next().html("사용 가능")
							$(document.frm.renick).val($(nick_name).val());
						}
					/* console.log(data); */
					/* console.log(status);
					alert(xhr); */
					},
					error : function(xhr) {
						console.log(xhr);
					/* console.log(status);
					console.log(throws); */
					},
					
					data : "nick_name=" + nick_name.value
				});

				$(this).next().html("");
			}
		})
		
		$(document.frm.email).on("keyup", function() {
			var email = this;
			//$(this).next().html("이메일은 영문자와 한글,숫자만을 입력하세요");
			$.ajax( {
				url : "emailCheckAjax.do",
				data : "email=" + email.value,
				success : function(data) {
					if (data == 1) {
						$(email).next().html("이미 존재하는 이메일입니다.");
						$(document.frm.renick).val("");
						$("#sendAuth").hide();
					} else {
						$(email).next().html("사용 가능");
						$("#sendAuth").show();
						$(document.frm.renick).val($(email).val());
					}
				},
				error : function(xhr) {
					console.log(xhr);
				}
				
			});

		})
		
	});

	function joinCheck() {
		if(document.frm.email.value.length == 0) {
			alert("이메일을 입력해주세요");
			frm.email.focus();
			return false;
		}	
		 if(document.frm.nick_name.value.length == 0) {
			alert("닉네임을 써주세요");
			frm.nick_name.focus();
			return false;
		} 
		if(document.frm.pw.value.length < 4) {
			alert("비번은 4글자 이상으로!");
			frm.pw.focus();
			return false;
		}
		if(document.frm.pw.value.length == 0) {
			alert("비번을 써주세요");
			frm.pw.focus();
			return false;
		}
		 if(document.frm.pw.value != document.frm.pw_check.value) {
			alert("비번이 일치하지 않습니다.");
			frm.pw.focus();
			return false;
		}
		 if(document.frm.phone.value.length == 0) {
			alert("휴대전화 입력해주세요");
			frm.phone.focus();
			return false;
		}
		 if(document.frm.game_genre.value.length == 0) {
			alert("체크리스트를 입력해주세요");
			return false;
		}
		 if(code_check != document.frm.code.value) {
			alert("입력하신 코드가 일치하지 않습니다.");
			frm.code.focus();
			return false;
		} 
		return true;
	}	
</script>

<script>
/*
function toggleShow(radio) {
		$("input:radio").parent('ul').next('.inbox1').hide();
		$("input:radio").parent('ul').next('.inbox1').show();
}
*/

</script>



</head>
<body>

	<div class="container">
		<h2 align="center">JOIN</h2>
		
		<div class="box" style="background: url(images/join2.jpg);">
				
		</div>

		<form action="Join2" method="post" name="frm" id="frm" onsubmit="return joinCheck()">
			<table class="person">
					
				<tr>
					 <td colspan="2" style="text-align: left; padding-left: 5px; padding-bottom: 10px; height: 20px;font-size: 15px; border: 0;"><strong>개인정보입력</strong></td>
				</tr>
				
				<tr>
					<td height="20px;" class="must"><span class="under">이메일</span></td>
					<td><input style="margin-left: 20px; height: 30px; width: 197px; font-size: 15px;" type="email" name="email" id="receiver" placeholder="이메일을 입력하세요." size="20"/>
					<span></span>
					<input type="button" id="sendAuth" value="인증번호 발송" />
					<!-- <button id="chkemail">중복확인</button> -->
					</td>
				</tr>
				<tr>
					<td height="20px;" ><span class="under">인증번호</span></td>
					<td><input type="text" name="code" id="code" onkeyup="checkCode()" onmouseup="checkCode()" placeholder="인증번호를 입력하세요."/>
						<div id="checkCode"></div>
						<!-- <input type="hidden" readonly="readonly" name="code_check" id="code_check" value=""/> -->	
						<!-- <input id="hi" type="hidden" value="인증하기"/> -->
					</td>
				</tr>

				<tr>
					<td height="20px" class="must" ><span class="under"> &nbsp;  닉네임</span></td>
					<td><input type="text" name="nick_name" size="20">
					<span></span>
					<input type="hidden" name="renick" size="20"></td>
				</tr>
				
				<tr>
					<td height="20px" class="must"><span class="under">암호</span></td>
					<td><input type="password" name="pw" size="20"> &nbsp;  공백없는
						영문,숫자 4글자이상</td>
				</tr>
				<tr>
					<td height="20px" class="must"><span class="under">암호확인</span></td>
					<td><input type="password" name="pw_check" size="20"> &nbsp; 비밀번호를
						한번더 입력해주세요.</td>
				</tr>

				<tr>
					<td height="20px" ><span class="under">휴대전화</span></td>
					<td><input type="text" name="phone" size="20" maxlength="11">  &nbsp; ex) 01011112222 입력해 주세요.</td>
				</tr>


				<tr>
					<td height="160px" width="200px" ><span class="under">체크리스트</span></td>
					<td style="vertical-align: top;">
					
					
					<ul class="checklist">
						<li id="tab_1" data-tab="tab-1">
							<label><input type="radio" name="game_genre" value="RPG" checked="checked">RPG</label>
						</li>
						<li id="tab_2" data-tab="tab-2">
							<label><input type="radio" name="game_genre" value=레이싱/스포츠 >레이싱스포츠</label>
						</li>
						<li id="tab_3" data-tab="tab-3">
							<label><input type="radio" name="game_genre" value="FPS" >FPS</label>
						</li>
						<li id="tab_4" data-tab="tab-4">
						<label><input type="radio" name="game_genre" value="RTS" >RTS</label>
						</li>
					</ul>
					
					<ol class="ols" id="tab-1">
						<li><label><input type="checkbox" name="game_name" value="메이플스토리">메이플스토리</label></li>
						<li><label><input type="checkbox" name="game_name" value="던전앤파이터">던전앤파이터</label></li>
						<li><label><input type="checkbox" name="game_name" value="리니지">리니지</label></li>
						<li><label><input type="checkbox" name="game_name" value="블레이드&소울">블레이드&amp;소울</label></li>
						<li><label><input type="checkbox" name="game_name" value="사이퍼즈">사이퍼즈</label></li>
						<li><label><input type="checkbox" name="game_name" value="월드 오브 워크래프트">월드 오브 워크래프트</label></li>
					</ol>
					
					<ol class="ols" id="tab-2">
						<li><label><input type="checkbox" name="game_name" value="FIFA ONLINE4">FIFA ONLINE 4</label></li>
						<li><label><input type="checkbox" name="game_name" value="카트라이더">카트라이더</label></li>
						<li><label><input type="checkbox" name="game_name" value="WWE2K18">WWE2K18</label></li>
						<li><label><input type="checkbox" name="game_name" value="NBA2K18">NBA2K18</label></li>
					</ol>
					
					<ol class="ols" id="tab-3">
						<li><label><input type="checkbox" name="game_name" value="배틀그라운드">배틀그라운드</label></li>
						<li><label><input type="checkbox" name="game_name" value="오버워치">오버워치</label></li>
						<li><label><input type="checkbox" name="game_name" value="서든어택">서든어택</label></li>
					</ol>
					
					<ol class="ols" id="tab-4">
						<li><label><input type="checkbox" name="game_name" value="리그 오브 레전드">리그 오브 레전드</label></li>
						<li><label><input type="checkbox" name="game_name" value="카트라이더">카트라이더</label></li>
						<li><label><input type="checkbox" name="game_name" value="스타크래프트">스타크래프트 </label></li>
						<li><label><input type="checkbox" name="game_name" value="히어로즈 오브 더 스톰">히어로즈 오브 더 스톰</label></li>
						<li><label><input type="checkbox" name="game_name" value="워크래프트3">워크래프트3</label></li>
					</ol>
					<!-- <strong><input type="radio" name="game_genre" onclick="toggleShow(this)" value="RPG">RPG</strong> <br>
						<div id="subCats1" class="subCats">
							<input type="checkbox" name="game_name" value="메이플스토리">메이플스토리
							<input type="checkbox" name="game_name" value="던전앤파이터">던전앤파이터
							<input type="checkbox" name="game_name" value="리니지">리니지
							<input type="checkbox" name="game_name" value="블레이드&소울">블레이드&소울
							<input type="checkbox" name="game_name" value="사이퍼즈">사이퍼즈
							<input type="checkbox" name="game_name" value="월드 오브 워크래프트">월드 오브 워크래프트
						</div> 

						<strong><input type="radio" name="game_genre" onclick="toggleShow(this)" value="레이싱/스포츠">레이싱/스포츠</strong> <br>
						<div id="subCats2" class="subCats">
							<input type="checkbox" name="game_name" value="FIFA ONLINE4">FIFA ONLINE 4
							<input type="checkbox" name="game_name" value="카트라이더">카트라이더 
							<input type="checkbox" name="game_name" value="WWE2K18">WWE2K18 
							<input type="checkbox" name="game_name" value="NBA2K18">NBA2K18
						</div> 
						<strong><input type="radio" name="game_genre" onclick="toggleShow(this)" value="FPS">FPS</strong> <br>
						<div id="subCats3" class="subCats">
							<input type="checkbox" name="game_name" value="배틀그라운드">배틀그라운드
							<input type="checkbox" name="game_name" value="오버워치">오버워치 
							<input type="checkbox" name="game_name" value="서든어택">서든어택
						</div> 
						<strong><input type="radio" name="game_genre" onclick="toggleShow(this)" value="RTS">RTS</strong> <br>
						<div id="subCats4" class="subCats">
							<input type="checkbox" name="game_name" value="리그 오브 레전드">리그 오브 레전드
							<input type="checkbox" name="game_name" value="카트라이더">카트라이더
							<input type="checkbox" name="game_name" value="스타크래프트">스타크래프트 
							<input type="checkbox" name="game_name" value="히어로즈 오브 더 스톰">히어로즈 오브 더 스톰
							<input type="checkbox" name="game_name" value="워크래프트3">워크래프트3
						</div> -->
					</td>
				</tr>

			</table>
			<div style="text-align: center; padding-top: 20px; margin-right: 55px;">
				<input type="submit" value="확인" class="signUpButton">
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
					onclick="location.href='main'" value="취소" class="signUpButton2">
			</div>
			<%-- <table>
				<tr>
					<td colspan="2">${message}</td>
				</tr>
			</table> --%>
		</form>
	</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".ols").css("display","none");
});



/* $(".checklist > li").on('click', function() {
	
	//alert($(this).attr("data-tab"));
	
	if($("#"+$(this).attr("data-tab")).is(':visible') == false) {
		
		$("#"+$(this).attr("data-tab")).stop().slideDown(200);
	} else{
		$("#"+$(this).attr("data-tab")).stop().slideUp(200);
	}
}); */

</script>
</body>
</html>
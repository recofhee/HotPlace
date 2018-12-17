<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>로그인</title>
<link href="https://fonts.googleapis.com/css?family=Lato|Nanum+Gothic+Coding|Open+Sans|Roboto" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	$(function() {
		getid();
		$("#idSaveCheck").click(function() {
			saveid();
		}); //#idSaveCheck.click

	}); //function(){

	function saveid() {
		var expdate = new Date();
		// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
		if ($("#idSaveCheck").prop("checked")) {
			expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
		} else {
			expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
		}
		setCookie("saveid", $("#email").val(), expdate);
	} //saveid()

	function setCookie(name, value, expires) {
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expires.toGMTString();
	} //setCookie(name,value,expires)

	function deleteCookie(name) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = name + "= " + "; expires=" + expireDate.toGMTString();
	}

	$("#email").click(function() {
		// $(this).val() will work here
		//$("#idSaveCheck").prop("checked", false);
		alert("change!!!!!!!!!!!!")
	});

	function getCookie(Name) {
		var search = Name + "=";
		if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
			offset = document.cookie.indexOf(search);
			if (offset != -1) { // 쿠키가 존재하면
				offset += search.length;
				// set index of beginning of value
				end = document.cookie.indexOf(";", offset);
				// 쿠키 값의 마지막 위치 인덱스 번호 설정
				if (end == -1)
					end = document.cookie.length;
				return unescape(document.cookie.substring(offset, end));
			}
		}
		return "";
	} //getCookie(Name)

	function getid() {
		var saveId = getCookie("saveid");
		if (saveId != "") {
			$("#email").val(saveId);
			$("#idSaveCheck").prop("checked", true);
		}
	} //getid()
</script>

<style type="text/css">
* {
	box-sizing : border-box;
}

body {
	/* font-family: "나눔고딕코딩"; */
	font-family: 'Roboto', 'Nanum Gothic Coding', sans-serif;
	color: #333;
	background: #fbfbfb;
}

.warp {
	margin: 0 auto;
	padding: 0;
	margin-top: 100px;
    text-align: center;
}
.login-form {
    text-align: center;
    max-width: 450px;
    margin: 0 auto;
    box-shadow: 0px 0px 5px rgba(0,0,0,.1);
    border: 1px solid #eee;
    border-radius: 4px;
    padding: 50px;
    background: #fff;
}

#login-form input[type='text'], #login-form input[type='password'] {
    display: block;
    width: 100%;
    font-size: 18px;
    text-align: center;
    margin: 15px auto;
    padding: 15px 20px;
    color: #444;
}

p {
	float: left;
	display: inline;
	font-size: 12px;
	margin: 0 auto;
}

.idcheck {
	float: right;
	display: inline;
	font-size: 14px;
    margin-bottom: 10px;
}

.log {
	text-align: center;
	font-size: 50px;
	padding-top: 70px;
}

.btn {
	width: 100%;
	background: #3c4990;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	padding: 15px 20px;
	clear: both;
	color: #eee;
}

.btn-row {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}
.sig {
    margin-right: 10px;
}

.sig, .sig2 {
	flex: 1;
	color: #3c4990;
    padding: 15px 20px;
    font-size: 16px;
    background: none;
    border: 1px solid #3c4990;
    border-radius: 4px;
}
.btn:hover, .sig:hover, .sig2:hover {
	cursor: pointer;
}

input[type='text'],
input[type='password'] {
	border: 1px solid #aaa;
    border-radius: 4px;
}

#kakao-login-btn {
	margin: 15px 0;
}
/* #login-form{height: 70px;
   		    width: 242px;
   	 	    margin-top: -10px;} */
table { margin-top: -30px;}	 	 
.logo {
	max-width: 50px;
	margin: 0 0 20px 0;
}   
</style>
<script>
	function changeId(){
		$("#idSaveCheck").prop("checked", false);
	}
</script>
</head>
<body>
	<div class="warp">

	<div class="login-form">
		<a href="main" title="메인으로 돌아가기"><img alt="Hot Place Logo" src="images/icon/HotPlace.png" class="logo"></a>
		<form id="login-form" method="post" action="Login" name="frm">
			<input type="text" id="email" name="email" value="${userid}" onchange="changeId()" placeholder="이메일">
			<input type="password" name="pw" id="${pw}" placeholder="비밀번호">
	
			<p>${message}</p>
	
			<div class=" idcheck">
				<input id="idSaveCheck" name="chek" type="checkbox" value="" onClick="javascript:saveid(document.new_user_session);">이메일 저장
			</div>
			<input class="btn" type="submit" value="로그인" onclick="return loginCheck()">
				
			<!-- <div id="kakao-login-btn"></div> <script type='text/javascript'>
							Kakao.init('645189b6e3b4fffa603cf981d6189fc4');
							Kakao.Auth.createLoginButton({
								container : '#kakao-login-btn',
								success : function(authObj) {
									Kakao.API.request({
										url : '/v2/user/me',
										success : function(res) {
											alert(JSON.stringify(res));
											var str = res.id + ","+res.properties['nickname'];
											location.href = "main?str="+str;
											alert(str);
											console.log("성별  " + res.kakao_account.gender);
											console.log("생일  " + res.kakao_account.birthday);
											console.log("연령대  " + res.kakao_account.age_range);
											console.log("아이디  " + res.id);
											console.log("닉네임  " + res.properties['nickname']);
											console.log("이메일  " + res.kakao_account.email);
											
										},
						
										/*  $.ajax({
										      type: 'POST',
										      url: 'interface/grade_process.aspx',
										      data: "worktype=1&" + param,
										      success: function(data) {
										           if(data != null) {
										                // Do somothing when data is not null
										           }
										      }
										 }); */
						
										fail : function(error) {
											alert(JSON.stringify(error));
										}
									});
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								}
							});
						</script> -->
			<!-- <table>
				<tr>
					<td>
						<a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
						</a> <a href="http://developers.kakao.com/logout"></a>
					<a id="kakao-login-btn"></a> <script type='text/javascript'>
							Kakao.init('645189b6e3b4fffa603cf981d6189fc4');
							Kakao.Auth.createLoginButton({
								container : '#kakao-login-btn',
								success : function(authObj) {
									Kakao.API.request({
										url : '/v2/user/me',
										success : function(res) {
											alert(JSON.stringify(res));
											var str = res.id + ","+res.properties['nickname'];
											location.href = "main?str="+str;
											alert(str);
											console.log("성별  " + res.kakao_account.gender);
											console.log("생일  " + res.kakao_account.birthday);
											console.log("연령대  " + res.kakao_account.age_range);
											console.log("아이디  " + res.id);
											console.log("닉네임  " + res.properties['nickname']);
											console.log("이메일  " + res.kakao_account.email);
											
										},
						
										/*  $.ajax({
										      type: 'POST',
										      url: 'interface/grade_process.aspx',
										      data: "worktype=1&" + param,
										      success: function(data) {
										           if(data != null) {
										                // Do somothing when data is not null
										           }
										      }
										 }); */
						
										fail : function(error) {
											alert(JSON.stringify(error));
										}
									});
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								}
							});
						</script> 	<script type='text/javascript'>
						    Kakao.init('645189b6e3b4fffa603cf981d6189fc4');
						    function loginWithKakao() {
						      Kakao.Auth.login({
						        success: function(authObj) {
						          alert(JSON.stringify(authObj));
						          //location.href="main?authObj = "+ s;
						        },
						        fail: function(err) {
						          alert(JSON.stringify(err));
						        }
						      });
						    };
				</script> <script type='text/javascript'>
							// 사용할 앱의 JavaScript 키를 설정해 주세요.
							Kakao.init('645189b6e3b4fffa603cf981d6189fc4');
							// 카카오 로그인 버튼을 생성합니다.
							Kakao.Auth.createLoginButton({
								container : '#kakao-login-btn',
								success : function(authObj) {
									alert(JSON.stringify(authObj));
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								}
							});
						</script>
					</td>
				</tr>
				<tr>
					<td>
						네이버아이디로로그인 버튼 노출 영역 <div id="naver_id_login" style="width: 300px"></div>
						  <script type="text/javascript">
							var naver_id_login = new naver_id_login("1op0lllS3zEF_7wQvHMV", "http://localhost:8080/hp/login.jsp");
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("green", 3, 45);
							naver_id_login.setDomain("YOUR_SERVICE_URL");
							naver_id_login.setState(state);
							naver_id_login.setPopup();
							naver_id_login.init_naver_id_login();
						</script> <script type="text/javascript">
							var naver_id_login = new naver_id_login("1op0lllS3zEF_7wQvHMV", "http://localhost:8080/hp/login.jsp");
							// 접근 토큰 값 출력
							alert(naver_id_login.oauthParams.access_token);
							// 네이버 사용자 프로필 조회
							naver_id_login.get_naver_userprofile("naverSignInCallback()");
							// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
							function naverSignInCallback() {
								alert(naver_id_login.getProfileData('email'));
								alert(naver_id_login.getProfileData('nickname'));
								alert(naver_id_login.getProfileData('age'));
							}
						</script> 
					</td>
				</tr>
			</table> -->
			<div class="btn-row">
				<input class="sig" type="button" value="회원 가입" onclick="location.href='Join1'"> 
				<input class="sig2" type="button" value="비밀번호 찾기" onclick="location.href='RandomPassword'">
			</div>

		</form>
	</div>
	</div>
</body>
</html>
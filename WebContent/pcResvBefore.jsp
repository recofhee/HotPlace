<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>본인 인증</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/seat.css">
<link rel="stylesheet" type="text/css" href="css/datePicker.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
}
section { padding-top: 130px;
		  background: #000000a3;
		  background-image: url(images/starback.jpg);
   		  background-repeat: no-repeat;
   		  background-size: cover;}
.wrap {
    width: 960px;
    margin: 50px auto 0;
    padding: 100px 200px;
    border: 0px solid black;
    position: relative;
    text-align: center;
    background: rgba(255,255,255,.2);
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}
.wrap h4 {
	color: #eee;
	margin-bottom: 30px;
}
.control-group {
    display: flex;
    vertical-align: top;
    /* background: #fff; */
    border: none;
    text-align: left;
    /* padding: 30px 0; */
    width: 100%;
    /* height: 210px; */
    margin: 0 auto;
}
.col-third {
	flex: 1;
    margin-right: 10px;
    height: 48px;
}
.col-third:last-child {
	margin-right: 0;
}
input[type="text"] {
    padding: 10px 15px;
}
select {
	display: inline-block;
    width: 100%;
    cursor: pointer;
    padding: 10px 15px;
    /* outline: 0; */
    border: 0;
    border-radius: 0;
    background: #fff;
    color: #777;
}
.select {
    position: relative;
    display: inline-block;
    width: 100px;
    float: left;
    margin-right: 10px;
}
.select select:hover,
.select select:focus {
	background: #fff;
}
.btn-row {
    clear: both;
    text-align: center;
    margin-top: 40px;
}
.btn-row button {
    background: none;
    border: 1px solid #fff;
    color: #fff;
    padding: 10px 20px;
    cursor: pointer;
}
.btn-row button:last-child {
    background: rgba(255, 255, 255, .4);
}
.confirm {
	margin: 70px 0 0;
	text-align: left;
	color: #eee;
}
.confirm input {
    width: 100%;
    margin-bottom: 20px;
}
input[type="radio"]:checked,
input[type="radio"]:not(:checked) {
    position: absolute;
    opacity: 0;
}
.gender label {
	margin-right: 10px;
}
/* radio custom */
input[type="radio"]:checked + span,
input[type="radio"]:not(:checked) + span {
    position: relative;
    padding-right: 28px;
    cursor: pointer;
    line-height: 18px;
    color: #ddd;
}
input[type="radio"]:checked + span:before,
input[type="radio"]:not(:checked) + span:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 23px;
    height: 23px;
    border: 1px solid #ddd;
    border-radius: 100%;
}
input[type="radio"]:checked + span:after,
input[type="radio"]:not(:checked) + span:after {
    content: '';
    width: 15px;
    height: 15px;
    background: #f8b753;
    position: absolute;
    top: 4px;
    left: 4px;
    border-radius: 100%;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
}
input[type="radio"]:not(:checked) + span:after {
    opacity: 0;
    -webkit-transform: scale(0);
    transform: scale(0);
}
input[type="radio"]:hover + span:before,
input[type="radio"]:focus + span:before {
    border: 1px solid #f8b753;
}
input[type="radio"]:checked + span:after {
    opacity: 1;
    -webkit-transform: scale(1);
    transform: scale(1);
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div class="wrap">
			<h4>본인 인증을 위해 간단한 정보를 받고 있습니다.</h4>
			<form action="pcResvBefore" method="post" class="confirm">
				<label for="email"><b>닉네임</b><span style="margin-left: 10px; font-size:12px;">(입력 안 해도 되는 항목입니다.)</span></label>
 				<input type="hidden" id="email" name="email" value="${loginUser.email}" readonly="readonly"/>
				<input id ="pc_num" name = "pc_num" type="hidden" value="${pc.pc_num}"/>
				
				<input type="text" id="nick_name" name="nick_name" value="${loginUser.nick_name}" readonly="readonly"/> <!-- 닉네임 세션으로 fix -->
				<label for="birthY"><b>생년월일</b></label>
				<div class="control-group">
					<input id="birthY" type="text" name="birthY" class="col-third" placeholder="연도 (ex. 2018)" maxlength="4"/>
					<select id="birthM" name="birthM" class="col-third">
						<option>월</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<select id="birthD" name="birthD" class="col-third">
						<option>일</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select>
				</div>
				
				<label><b>성별</b></label>
				<div class="gender">
					<label for="notsay"><input type="radio" name="gender" value="응답 안 함" id="notsay"/><span></span>응답 안 함</label>
					<label for="male"><input type="radio" name="gender" value="남자" id="male"/><span></span>남자</label>
					<label for="female"><input type="radio" name="gender" value="여자" id="female"/><span></span>여자</label>
				</div>
				
				<div class="btn-row">
					<button type="button">이전</button>
					<button type="submit" class="resv-btn">다음</button>
				</div>
			</form>
		</div>
			
	</section>
	<%@ include file="footer.jsp" %> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function() {
	$('.resv-btn').click(function(){
		regNumber = /^[0-9]*$/; // 숫자만 입력됐는지 체크하는 정규식
		
		if($('#birthY').val().trim().length == 0 || $('#birthY').val().trim().length != 4 || !regNumber.test($('#birthY').val().trim())) {
			alert('태어난 연도를 정확히 입력해 주세요.');
			$('#birthY').focus();
			return false;
		}
		if($('#birthM').val() == '월') {
			alert('태어난 달을 선택해 주세요.');
			return false;
		}
		if($('#birthD').val() == '일') {
			alert('태어난 날을 선택해 주세요.');
			return false;
		}
		
		/* function getQueryVariable (variable) {
			var query = window.location.search.substring(1);
			var vars = query.split("&");
			for (var i = 0; i < vars.length; i++) {
				var pair = vars[i].split("=");
				if(pair[0] == variable) {
					return pair[1];
				}
			}
			return false;
		}
		var lat = 'lat';
		var lng = 'lng';
		var latV = getQueryVariable(lat);
		var lngV = getQueryVariable(lng); */
		
		//location.href = 'pcResvBefore?lat='+getQueryVariable(lat)+'&lng='+getQueryVariable(lng);
		/* $.ajax({
			url: 'pcResvBefore?lat='+latV+'&lng='+lngV,
			type: 'POST',
			data: {
				lat: latV,
				lng: lngV
			},
			success: function(){}
		}); */
		
		//$.post('pcResvBefore?lat='+latV+'&lng='+lngV);

	});
});
</script>
</body>
</html>
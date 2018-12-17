<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<title>제휴 문의</title>

<script>
function contactCheck() {
	 if(document.frm.name.value.length == 0) {
		alert("이름을 작성해주세요");
		frm.name.focus();
		return false;
	} 
	if(document.frm.tel.value.length == 0) {
		alert("연락처를 입력해주세요.");
		frm.tel.focus();
		return false;
	}
	if(document.frm.email.value.length == 0) {
		alert("이메일을 입력해주세요");
		frm.email.focus();
		return false;
	}	
	 if(document.frm.content.value.length == 0) {
		alert("문의 내용을 작성해주세요.");
		frm.content.focus();
		return false;
 	}
	 
	return true;
}	
</script>
<script>

	var send;
	$(function() {
		$("#frm").submit(function() {
			if (contactCheck()) {
				$.ajax('contact', {
					data : $("#frm").serialize(),
					method : "post",
					beforeSend : function() {
						$("#modal_div").addClass("modal_div");
					},
					success : function(data) {
						alert("접수가 완료되었습니다.");
						$("#modal_div").removeClass("modal_div");
						$("#frm").get(0).reset();
					}, 
					error : function() {
						alert("접수가 실패했습니다.");
						$("#modal_div").removeClass("modal_div");
						
					}
				});
			} 
			return false;
		})
	});
</script>

<style>
body{background-image: url(images/dia3back.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;}

section{
   padding: 20px;
   padding-top: 130px;
   background: #000000a3;
}
.wrap{width: 960px;
     margin: auto;
     border: 0px solid black;}
article{
    margin: 5px;
    width: 99%;
    height: 350px;
    border: 0px dotted gray;
    padding: 5px;
}
.left_section{
width:300px;
background: #c6d3e8c2;
}
.right_section{
/* float: right; */

background: #c6d3e8c2;

}
.bottom-bar{
	width: 90%;
   border-bottom: 1px solid #d3d3d32e;
}
aside {border: 0px solid black;}


.box {
    width: 48%;
    /* display: inline-block; */
    float: left;
    border: 0px solid black;
    font-size: 12px;
    margin: 7px;
    box-sizing: border-box;
    padding: 5px;
    text-align: center;
    color: cornflowerblue;
    border-right: 1px solid #ffffff21;
    height: 482px;
   }

.box1 {
	position : relative;
 	width: 48%;
    display: inline-block;
    border: 0px solid black;
    height: 483px;
    font-size: 12px;
    padding: 5px;
    margin: 7px;
    box-sizing: border-box;
    text-align: center;
    color: cornflowerblue;
   }
.tabl td { text-align: left;
		   height: 25px;}

.none{
	border:none;
	border-bottom: 1px solid #d3d3d363;
	background: none;
	color: white;
	margin: 5px;
	size: 61;
	
}
.bt {
	position: relative;
	width: 80px;
	height: 25px;
	font-size: 12px;
	color: black;
	background: white;
	cursor: pointer;
	margin: 5px;
	left: 20px;
}

.bt:hover {
	border: 1px solid;
	color: white;
	font-weight: bolder;
    background: #1e90ff3b;
}
.textarea{resize: none; 
		  background:rgba(255,255,255,0.1);
		  color: white;
		  border: 1px solid #d3d3d338;
		  margin: 5px;}
.textarea:hover{background:#00000070;

}
.modal_div {
	background:rgba(0,0,0,.3) no-repeat url('images/loader-png-powered-by-velaro-live-chat-512.gif') center center;
	background-size: 128px;
	position: absolute;
	top:0; left:0;
	width:100%;
	height:100%;
}	
		   
</style>
</head>
<body>
 <%@ include file="header.jsp" %>
	<section>
	<div class="wrap">
	<article>
	<div id="map" style="width:100%;height:343px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645189b6e3b4fffa603cf981d6189fc4"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.5412538, 126.83815890000005), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var iwContent = '<div style="padding:5px;">더조은 아카데미</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(37.5412538, 126.83815890000005), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성하고 지도에 표시합니다
var infowindow = new daum.maps.InfoWindow({
    map: map, // 인포윈도우가 표시될 지도
    position : iwPosition, 
    content : iwContent,
    removable : iwRemoveable
});
      
// 아래 코드는 인포윈도우를 지도에서 제거합니다
// infowindow.close();        
</script>
	</article>
			<div class="box">
			
				<fieldset>
					<legend class="bottom-bar">핫플레이스</legend>
					<p>핫플레이스는 모두에게 열려있습니다. 게임을 사랑하는분들과 관련 사업에 종사하시는 분들의 많은 연락을 기다리고 있습니다.</p>
				</fieldset>
				<fieldset>
					<legend class="bottom-bar">INFORMATION</legend>
					<p>주소 : 서울특별시 강서구 화곡로 149, 3층~5층 <br>(화곡동, 심당빌딩)</p>
					<p>연락처 :  02-1234-5678 </p>
					<p>팩스 : 02-1234-5678</p>
					<p>이메일 : a519486@naver.com</p>
					<p>은행계좌 : 9999-2222-333333(카카오뱅크, 김성환)</p>
					<p>업무시간 : 24시간 연중무휴</p>
				</fieldset>
				<fieldset>
					<legend class="bottom-bar">교통편</legend>
					<p>지하철 : 5호선 화곡역 7호선에서 도보로 2분.</p>
				</fieldset>
			</div>	<!-- class="left_section"끝 -->
			

			<div class="box1">
				<div id="modal_div">
				
				</div>
				<form action="contact" method="post" id="frm" name="frm" >
					<table class="tabl">
						<tr>
							<th>회사명</th>
							<td>
							<input type="text" class="none" name="company" id="company" size="61" placeholder="필수 입력사항이 아닙니다.">
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td><input type="text" class="none" name="name" id="name" size="61"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" class="none" name="tel" id="tel" size="61"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" class="none" name="email" id="email"size="61"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="19" cols="62" name="content" id="content" class="textarea"></textarea></td>
						</tr>
					</table>
					<div class="button">
						<input type="submit" value="등록" name="send" id="send" class="bt">
						<input type="reset" value="다시작성" class="bt">
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %> 
</body>
</html>
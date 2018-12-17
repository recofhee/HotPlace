<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>예약</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/seat.css">
<link rel="stylesheet" type="text/css" href="css/datePicker.css">
<style type="text/css">
* {
   box-sizing: border-box !important;
}

body {  background-image: url(images/starback.jpg);
  	    background-repeat: no-repeat;
   	    background-size: cover;}
section {
   padding-top: 130px;
   background: #000000a3;
 
}

button:focus, input:focus, textarea:focus {
   outline: none;
}

.wrap {
   width: 960px;
   margin: 0 auto;
   padding: 0 0 100px;
   border: 0px solid black;
   position: relative;
   text-align: center;
}

.resv-row {
   display: flex;
   width: 892px;
   margin: 0 auto;
   border-bottom: 1px solid #fff;
}

.resv-row .datepick {
   flex: 1;
}

#resvDate {
   cursor: pointer;
}

.control-group {
   display: inline-block;
   vertical-align: top;
   /* background: #fff; */
   border: none;
   text-align: left;
   padding: 30px 0;
   width: 300px;
   /* height: 210px; */
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

select:disabled {
   color: #f8b753;
   font-weight: 600;
   cursor: default;
}
.disabled {
    color: #f8b753;
    font-weight: 600;
    /* cursor: default; */
    background: #fff;
    border: none;
}

.select {
   position: relative;
   display: inline-block;
   width: 100px;
   float: left;
   margin-right: 10px;
}

.select select:hover, .select select:focus {
   background: #fff;
}

.reSel {
   background: none;
   border: 1px solid #eee;
   color: #eee;
   padding: 8px 10px;
   width: 43px;
   height: 43px;
   cursor: pointer;
}

.datepick {
   display: flex;
   padding: 30px 0;
   text-align: right;
}

.datepick input {
   padding: 5px 40px;
   height: 100%;
   width: 100%;
   text-align: center;
   margin-right: 10px;
}

.datepick select {
   width: 200px;
}

.only-timepicker .datepicker--nav, .only-timepicker .datepicker--content
   {
   display: none;
}

.only-timepicker .datepicker--time {
   border-top: none;
}

.datepicker--nav {
   position: relative;
}

.confirm-resv {
   padding: 50px !important;
}

.confirm-resv h5 {
   margin-bottom: 54px;
   font-size: 30px;
   text-align: center;
}

.btn-row {
   clear: both;
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

.seatSel {
   padding: 4px 6px;
   color: #fff;
   background: #f8b753;
   margin-right: 10px;
}

.confirm-resv .row, .form-row {
   display: flex;
}

.confirm-resv input[type="text"] {
   width: 70px;
   height: 43px;
   border: none;
   padding: 5px 10px;
   /* margin-bottom: 10px; */
}

.confirm-resv select {
   width: 85px;
   height: 43px;
   margin-right: 10px;
}

.confirm-resv select:last-child {
   margin-right: 0 !important;
}

.confirm-resv input[type="text"]:focus, .confirm-resv input[type="text"]:active
   {
   border: 1px solid #f8b753;
}

ul.tabs {
   position: relative;
   width: 100%;
   height: 50px;
   margin: 0 auto;
   padding: 0;
   text-align: center;
   list-style: none;
}

ul.tabs li {
   display: inline-block;
   position: relative;
   width: 33.33%;
   height: 100%;
   float: left;
   background: none;
   color: #222;
   padding: 10px 15px;
   cursor: pointer;
}

ul.tabs li.active {
   background: #ededed;
   color: #222;
}

.tab-content {
   display: none;
   background: #ededed;
   padding: 15px;
}

.tab-content.active {
   display: inherit;
}

.tab-content label {
   display: block;
   margin-top: 20px;
   cursor: pointer;
}

.flexSB {
   justify-content: space-between;
}

.deposit {
   margin-bottom: 20px;
}

.deposit input[type="text"] {
   padding: 10px 15px !important;
   width: 100% !important;
}

.deposit select {
   padding: 10px 15px !important;
   width: 100% !important;
}

.flex1 {
   flex: 1;
}

.w100 {
   width: 100%;
}

.row div.w100 {
   margin: auto 0;
}

.vertical-hr {
   width: 1px;
   border-left: 1px solid #999;
   margin: 0 20px;
}
.payOnSite label {
   margin-right: 10px;
}


/* radio custom */
input[type="radio"]:checked, input[type="radio"]:not(:checked) {
   position: absolute;
   opacity: 0;
}
input[type="radio"]:checked + span, input[type="radio"]:not(:checked) + span {
   position: relative;
   padding-right: 28px;
   cursor: pointer;
   line-height: 18px;
   color: #ddd;
}
input[type="radio"]:checked + span:before, input[type="radio"]:not(:checked) + span:before {
   content: '';
   position: absolute;
   left: 0;
   top: 0;
   width: 18px;
   height: 18px;
   border: 1px solid #ddd;
   border-radius: 100%;
}
input[type="radio"]:checked + span:before {
   border: 1px solid #f8b753;
}

input[type="radio"]:checked + span:after, input[type="radio"]:not(:checked) + span:after {
   content: '';
   width: 10px;
   height: 10px;
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
   opacity: 0;
   -webkit-transform: scale(0);
   transform: scale(0);
}

input[type="radio"]:hover + span:after, input[type="radio"]:focus + span:after {
   border: 1px solid #f8b753;
}

input[type="radio"]:checked + span:after {
   opacity: 1;
   -webkit-transform: scale(1);
   transform: scale(1);
}

.hidden {
   display: none;
}
ul, li, a {
	list-style: none;
	text-decoration: none;
}

.seatsLayer {
    display: flex;
    flex-direction: column;
    justify-content: center;
    z-index: 9;
    background: #000;
    opacity: .8;
    width: 100%;
    height: 100%;
    position: absolute;
}
.seatsLayer h4 {
    position: absolute;
    left: 50%;
    opacity: 1 !important;
    color: #eee;
    transform: translateX(-50%);
}
.datepicker {
    z-index: 999 !important;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div class="wrap">
			<div class="resv-row">
				<div class="control-group"></div>
				<div class="datepick">
					<!-- <input type="text" id="startDate"/>
					<input type="text" id="endDate"/> -->
					<input type="text" id="resvDate" name="resvDate" placeholder="이용 시작 일시를 선택해 주세요." data-position='bottom right' readonly="readonly"/>
					<select name="hours">
						<option>이용 시간</option>
						<option value="1">1시간</option>
						<option value="2">2시간</option>
						<option value="3">3시간</option>
						<option value="4">4시간</option>
						<option value="5">5시간</option>
						<option value="6">6시간</option>
						<option value="7">7시간</option>
						<option value="8">8시간</option>
						<option value="9">9시간</option>
						<option value="10">10시간</option>
						<option value="11">11시간</option>
						<option value="12">12시간</option>
						<option value="13">13시간</option>
						<option value="14">14시간</option>
						<option value="15">15시간</option>
						<option value="16">16시간</option>
						<option value="17">17시간</option>
						<option value="18">18시간</option>
						<option value="19">19시간</option>
						<option value="20">20시간</option>
						<option value="21">21시간</option>
						<option value="22">22시간</option>
						<option value="23">23시간</option>
						<option value="24">1일 (24시간)</option>
					</select>
					<!-- <input type="text" id="teanDate" placeholder="예약할 날짜를 선택해 주세요."/> -->
				</div>
			</div>
			<div class="seat-wrap">
				<div class="seat-position">
					<div class="seatsLayer">
						<h4>이용 일시와 이용 시간을 선택해 주세요.</h4>
					</div>
					<div class="seat-list">
						<c:forEach items="${seatList}" var="seats" varStatus="status">
							<button type="button" class="seat-normal" id="${seats.seatType}${status.count}">${status.count}</button>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<div id="confirm-resv" class="confirm-resv" title="예약 내역 확인">
				<h5><i class="far fa-check-circle" style="margin-right: 10px;"></i>예약하시겠습니까 ?</h5>
				<div class="row">
					<div class="resv-info flex1 w100"></div>
					<div class="vertical-hr"></div>
					<div class="tab-wrap flex1 w100">
						<form action="pcResvAfter" method="post">
							<div class="pcResv"></div>
							
							<ul class="tabs">
								<li class="link active" data-tab="tab-1" value="카드">카드 결제</li>
								<li class="link" data-tab="tab-2" value="무통장">무통장 입금</li>
								<li class="link" data-tab="tab-3" value="현장">현장 결제</li>
							</ul>
							
							<div id="tab-1" class="tab-content active">
								<label for="cardNum">카드 번호</label>
								<div class="form-row flexSB">
									<input type="text" id="cardNum" name="cardNum1" class="inputs" maxlength="4"/>
									<input type="text" name="cardNum2" class="inputs" maxlength="4"/>
									<input type="text" name="cardNum3" class="inputs" maxlength="4"/>
									<input type="text" name="cardNum4" class="inputs" maxlength="4"/>
								</div>
								<div class="form-row flexSB">
									<div>
										<label for="cardValid">카드 유효 기간</label>
										<div class="form-row">
											<select id="cardValid" name="validMM"><option>월</option>
												<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option>
												<option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option>
												<option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
											</select>
											<select name="validYY"><option>연도</option>
												<option value="18">18</option><option value="19">19</option><option value="20">20</option>
												<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option>
												<option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
											</select>
										</div>
									</div>
									<div><label for="cardCvc">CVC</label><input type="text" id="cardCvc" name="cardCvc" maxlength="3"/></div>
								</div>
							</div>
							
							<div id="tab-2" class="tab-content deposit">
								<label for="depositor">입금자명</label>
								<input type="text" name="depositor" id="depositor"/>
								<label for="depositBank">입금 은행</label>
								<select name="bank"><option>은행 선택</option>
									<option value="기업">기업 은행 01041816083 (예금주 : 김성환)</option><option value="신한">신한 은행 110388021447 (예금주 : 김희수)</option>
								</select>
							</div>
							
							<div id="tab-3" class="tab-content payOnSite">
								<label for="payOnSite"><input type="radio" id="payOnSite" value="현장" checked="checked"/><span></span>현장에서 직접 결제</label>
						    </div>
						    
						    <div class="payHow"></div>
						</form>
					</div>
				</div>
			</div>
			 
			<div class="btn-row">
				<button type="button" onclick="location.href='main'">취소</button>
				<button type="button" class="resv-btn">예약</button>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="js/datePicker.min.js"></script>
<script type="text/javascript" src="js/datePicker.en.js"></script>
<script type="text/javascript" src="js/datePicker.ko.js"></script>
<script type="text/javascript">
var adult = 0;
var teen = 0;
var hours = 0;

var seats = new Array();
var seats1 = new Array();
var seatSelLen = 0;
var maxLen = 0;
var startDt = '';
var endDt = '';
var price = 0;
var generation = '';
//var seat;
$(function() {
	
		var birth = '${birth}'; // 이전 페이지에서 인증 받은 생년월일
		var adultAge = 20; // 성인 기준 나이

		var date = new Date();
		var y = date.getFullYear();
		var m = (date.getMonth() + 1);
		var d = date.getDate();

		// 날짜 포맷 맞추기
		if (m < 10) {
			m = '0' + m;
		}
		if (d < 10) {
			d = '0' + d;
		}

		var birthY = parseInt(birth.substr(0, 4));
		var birthM = birth.substr(4, 2);
		var birthD = birth.substr(6, 2);
		var birthday_md = birth.substr(4, 4);
		
		var age = y - birthY + 1;
		/* console.log(age);
		console.log(parseInt(('1' + birthday_md)));
		console.log(parseInt(('1' + m + d))); */
		console.log(birthM);

		if (age < adultAge || (age == adultAge && (parseInt(('1' + birthday_md)) > parseInt(('1' + m + d)) || parseInt(('1' + birthday_md)) == parseInt(('1' + m + d))))) { // 20살이면 생일 지났는지 확인하기 위해
			var result = '';
			result += '<div class="select"><select name="teen"><option id="generation">청소년</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select></div>';
			result += '<button type="button" class="reSel" title="인원 수 다시 선택"><i class="fas fa-sync-alt"></i</button>';
			$('.control-group').append(result);
			$('.reSel').hide();
		} else {
			var result = '';
			result += '<div class="select"><select name="adult"><option id="generation">성인</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select></div>';
			result += '<button type="button" class="reSel" title="인원 수 다시 선택"><i class="fas fa-sync-alt"></i></button>';
			$('.control-group').append(result);
			$('.reSel').hide();
		}

	// 시작 날짜 생성
	var start = new Date(), prevDay;
	var startHours = start.getHours();

	if(start.getMinutes() < 30) {
		start.setHours(start.getHours());
		start.setMinutes(30);
	} else {
		start.setHours(start.getHours() + 1);
		start.setMinutes(0);
	}
	
	// 시작 일시 default 현재로 설정
	//$('#resvDate').attr('value', new Date().getFullYear() + '/' + (new Date().getMonth() + 1) + '/' + (new Date().getDate() + 1)
	//		+ ' ' + ((start.getHours() < 10 ? '0' : '') + start.getHours()) + ':' + ((start.getMinutes() < 10 ? '0' : '') + start.getMinutes()));
	
	
	$('#resvDate').click(function(){
		
		if($('#resvDate').val().trim() != '') {
			var seats = new Array();
			var seatDefault = '';
			
			<c:forEach items="${seatList}" var="seats" varStatus="status">
				seats.push('${seats.seatType}${seats.seatNum}');
			</c:forEach>
			

			for(var i in seats) {
				seatDefault += '<button type="button" class="seat-normal" id="'+seats[i]+'">' + ++i + '</button>';
			}
			
			if(confirm('현재 선택된 이용 시작 일시, 이용 시간, 좌석이 모두 초기화됩니다.\n이용 시작 일시를 변경하시겠습니까 ?')) {
				seats = new Array();
				
				$('#resvDate').removeClass('disabled');
				$('#resvDate').val('');
				$('select[name="hours"] option:eq(0)').prop("selected", true);
				
				$('.seatsLayer').show();
				$('.seat-list').html(seatDefault);
			}
		}
	});
	
	
	$('#resvDate').datepicker({
        timepicker: true,
        language: 'ko',
        todayButton: new Date(),
        dateFormat: 'yyyy/mm/dd',
        timeFormat: "hh:ii",
        startDate: start,
        minDate: start,
        //minHours: startHours,
        startHours: start,
        minHours: 00,
        maxHours: 23,
        minMinutes: 0,
        maxMinutes: 30,
        minutesStep: 30,
        //classes: 'only-timepicker',
        onSelect: function(fd, d, picker) {
            // Do nothing if selection was cleared
            if (!d) return;
            var day = d.getDay();
            // Trigger only if date is changed
            if (prevDay != undefined && prevDay == day) return;
            prevDay = day;

    		//changeSeatList();
    		
   			$('#resvDate').addClass('disabled');
   			
        }
    });
	

	function changeSeatList() {
		startDt = $('#resvDate').val();
		var endYear = parseInt(startDt.substr(0, 4));
		var endMonth = parseInt(startDt.substr(5, 2)) - 1; // month는 0부터 1월
		var endDate = parseInt(startDt.substr(8, 2));
		var endHours = parseInt(startDt.substr(11, 2));
		var endMin = parseInt(startDt.substr(14, 2));
		var date = new Date(endYear, endMonth, endDate, endHours, endMin);
		
//		if($('select[name="hours"] option:selected').val() == '이용 시간') {
		if($('#resvDate').val().trim() != '' && $('select[name="hours"] option:selected').val() != '이용 시간') {
			
			//console.log('이용 시간 입력 됨 : ' + $('select[name="hours"] option:selected').val());
			hours = $('select[name="hours"] option:selected').val();	
			
			date.setHours(date.getHours() + parseInt(hours));
			endDt = date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate() + ' ' + ((date.getHours() < 10 ? '0' : '') + date.getHours()) + ':' + ((date.getMinutes() < 10 ? '0' : '') + date.getMinutes());
			
			// 이용 시작 일시와 이용 시간 둘 다 입력 되면 그에 해당하는 좌석 목록 보여 주기
			$('.seatsLayer').hide();
			$.ajax({
				url: 'pcSeatList',
				type: 'POST',
				data: {
					pc_num: '${pc.pc_num}',
					start_date: startDt,
					end_date: endDt
				},
				dataType: 'json',
				success: function(data){
					var seatList = '';
					$.each(data, function(index, item){
						
						if(item.isChoosen == 0) {
							seatList += '<button type="button" class="seat-normal" id="'+item.seatType+item.seatNum+'">'+item.seatNum+'</button>';
						} else {
							seatList += '<button type="button" class="seat-done" id="'+item.seatType+item.seatNum+'">'+item.seatNum+'</button>';
						}
					});
					
					$('.seat-list').html(seatList);
					
					$('.seat-normal').each(function(){
						
						$(this).click(function() {

							$('.reSel').show();
							
							seatSelLen = $('.seat-selected').length;
							
							if($('select[name="adult"]').val() == '성인' || $('select[name="adult"]').val() === undefined) {
								adult = 0;				
							} else {
								$('select[name="adult"]').attr('disabled', true);
								adult = $('select[name="adult"]').val();				
							}
							
							if($('select[name="teen"]').val() == '청소년' || $('select[name="teen"]').val() === undefined) {
								teen = 0;				
							} else {
								$('select[name="teen"]').attr('disabled', true);
								teen = $('select[name="teen"]').val();
							}

							maxLen = (parseInt(adult) + parseInt(teen));
							if(maxLen == 0) {
								alert('인원을 선택해 주세요.');
								$('select[name="adult"]').focus();
								$('.reSel').hide();
								//return false;
							}
							
							if(seatSelLen < maxLen) {
								if($(this).hasClass('seat-selected') || ($(this).hasClass('seat-selected') && seatSelLen == maxLen)) {
									seats.splice(seats.indexOf($(this).text()), 1);
									$(this).removeClass('seat-selected');
								} else {
									$(this).addClass('seat-selected');
									seats.push($(this).text());
								}
							} else {
								//console.log('초과');
								if($(this).hasClass('seat-selected')) {
									seats.splice(seats.indexOf($(this).text()), 1);
									$(this).removeClass('seat-selected');
								}
								return false;
							}
							
						}); 
						
						
						//console.log('$(".generation").val() : ' + $('.generation').val());
						
					});
				}
			});
		} else {
			$('.seatsLayer').show();
			hours = 0;
		}
	}
	
	$('select[name="hours"]').change(changeSeatList);
	$('select[name="hours"]').click(function(){
		if($('#resvDate').val().trim() == '') {
			alert('이용 시작 일시를 선택해 주세요.');
		}
	});
		
	
	$('.reSel').click(function(){
	      var flag = confirm('현재 선택된 좌석을 모두 취소하고 인원 수를 다시 선택하시겠습니까 ?');
	      if(flag) {
	         $('.reSel').hide();
	         $('.seat-position button').each(function(){
	            $('select[name="adult"]').attr('disabled', false);
	            $('select[name="teen"]').attr('disabled', false);
	            $('.seat-position button').removeClass('seat-selected');
	         });
	         seats = new Array();
	      } else {
	         return false;
	      }
	});

	
	$('.resv-btn').click(function(){
		/* 유효성 검사 */
		/* if((parseInt(adult) != 0 || parseInt(teen) != 0)) {
			alert('인원을 선택해 주세요.');
			return false;
		} */
		if($('.seat-selected').length == 0) {
			alert('좌석을 선택해 주세요.');
			return false;
		}
		if($('.seat-selected').length != maxLen) {
			alert('인원 수와 좌석 수가 일치하지 않습니다.\n좌석을 확인해 주세요.');
			return false;
		}
		if($('#resvDate').val().trim() == '') {
			alert('이용 시작 일시를 선택해 주세요.');
			$('input[name="resvDate"]').focus();
			return false;
		}
		if(parseInt(hours) == 0) {
			alert('이용 시간을 선택해 주세요.');
			$('select[name="hours"]').focus();
			return false;
		}
		
		
		startDt = $('#resvDate').val();
		var endYear = parseInt(startDt.substr(0, 4));
		var endMonth = parseInt(startDt.substr(5, 2)) - 1; // month는 0부터 1월
		var endDate = parseInt(startDt.substr(8, 2));
		var endHours = parseInt(startDt.substr(11, 2));
		var endMin = parseInt(startDt.substr(14, 2));
		var date = new Date(endYear, endMonth, endDate, endHours, endMin);

		date.setHours(date.getHours() + parseInt(hours));
		endDt = date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate() + ' ' + ((date.getHours() < 10 ? '0' : '') + date.getHours()) + ':' + ((date.getMinutes() < 10 ? '0' : '') + date.getMinutes());
		
		/* alert("처음시간::"+endHours);
		alert("마지막시간::"+date.getHours());
		alert("처음날짜::"+endDate);
		alert("마지막날짜::"+date.getDate());
		alert("날짜 같은지::"+endDate != date.getDate()); */
		if($('#generation').text() == '청소년'){
			if(endHours >= 22 || endHours < 9 || endDate != date.getDate() || date.getHours() >= 22){
				alert("청소년 예약 가능 시간은 오전 9시부터 오후 10시 사이입니다.")
				return false;
			}
		} 
		var result = '<h5><i class="far fa-check-circle" style="margin-right: 10px;"></i>예약하시겠습니까 ?</h5><div class="row">';
		result += '<div class="flex1 w100"><p>PC방 이름 : '+ "${pc.pc_name}"+'</p>';
		var result = '';
		result += '<p>PC방 이름 : '+ "${pc.pc_name}"+'</p>';
		result += '<p>PC방 위치 : '+ "${pc.pc_addr}"+'</p>';
		result += '<p>이용 시간 : ' + hours + '시간</p>';
		result += '<p>이용 일시 : ' + startDt + ' ~ ' + endDt + '</p>';
		result += '<p>선택 좌석 : ';
		
		seats.sort(function(a, b) {
		    return a - b; // 오름차순
		});
		price =  ${pc.price} * maxLen * hours;
		generation = $('#generation').text();
		
		seats1 = seats.filter(function(item, pos, self) {
		    return self.indexOf(item) == pos;
		});
		for(var i = 0; i < maxLen; i++) {
			result += '<span class="seatSel">' + seats1[i] + '</span>';
		}
		result +=  '(' + generation+'  '+ maxLen+'명)   '+'</p>';	
		//result += '<p>총 가격 : '+${pc.price}*maxLen*hours+'원 </p></div>';
		//var str = encodeURI('${loginUser.email}' +',' + ${pc.pc_num} + ',' +hours +','+startDt+','+endDt+','+generation+','+price+','+maxLen+','+seats1);
		//var str = '${loginUser.email}' + ',' + ${pc.pc_num} + ',' + hours + ',' + startDt + ',' + endDt + ',' + generation + ',' + price + ',' + maxLen + ',' + seats1;
		//console.log(str);
		
		result += '<p>총 가격 : '+price+'원 </p>';
		
		$('.resv-info').html(result);
		
		var pcInfo = '';
		
		pcInfo += '<input type="hidden" name="email" value="' + '${loginUser.email}' + '">';
		pcInfo += '<input type="hidden" name="pc_num" value="' + '${pc.pc_num}' + '">';
		pcInfo += '<input type="hidden" name="hours" value="' + hours + '">';
		pcInfo += '<input type="hidden" name="startDt" value="' + startDt + '">';
		pcInfo += '<input type="hidden" name="endDt" value="' + endDt + '">';
		pcInfo += '<input type="hidden" name="generation" value="' + generation + '">';
		pcInfo += '<input type="hidden" name="price" value="' + price + '">';
		pcInfo += '<input type="hidden" name="maxLen" value="' + maxLen + '">';
		for(var i = 0; i < maxLen; i++) {
			pcInfo += '<input type="hidden" name="seats" value="' + seats1[i] + '">';
		}
		$('.pcResv').html(pcInfo);
		//$('.pcResv').html('<input type="hidden" id="pc_resv" name="pc_resv" value = "' + str + '">');

		
		dialog.dialog('open');
		
		$('ul.tabs li').click(tabSwitching); 
		
	});
	
	function tabSwitching(){
		
		var tab_id = $(this).data('tab');
		console.log(tab_id);
	
		$('ul.tabs li').removeClass('active');
		$('.tab-content').removeClass('active');
	
		$(this).addClass('active');
		$("#" + tab_id).addClass('active');
		
		// 다른 탭 클릭 시로 조건 추가 요
		if(confirm('결제 방법을 변경하시겠습니까 ?')) {
			// 수정 요
			$('.payHow').html('<input type="hidden" name="payHow" value="'+$('.tabs .active').text()+'"/>');
			
			$('.tab-content.active').find('input').each(function(){
	            this.value = '';
	        });
			
			$('.tab-content.active').find('select').find('option:first').prop("selected", true);
		} else return false;
		
	}
	
	// 카드 번호 자동 포커스 이동
	$(".inputs").keyup(function() {
	    var charLimit = $(this).attr("maxlength");
	    if($(this).val().trim().length >= charLimit) {
	        $(this).next('.inputs').focus();
	        return false;
	    }
	});
	
	var dialog;
	dialog = $('#confirm-resv').dialog({
		modal: true,
		autoOpen: false,
		resizable:false,
		buttons: {
			'확인': function(e){
				//var jbAry = new Array('${loginUser.email}','${pc.pc_num}',hours,startDt,endDt,generation,price,maxLen,seats);
				//console.log("뭐지 :::"+ jbAry);
				//var str = '${loginUser.email}'+', ' + ${pc.pc_num} + ',' +hours +','+startDt+','+endDt+','+generation+','+price+','+maxLen+','+seats;
				//console.log(str);
				//location.href = 'pcResvAfter?pc_resv='+str; 
				//예약정보 (startDt endDt) hours seat (generation maxLen)
				//결제정보 cardNum
				//document.getElementById("myForm").submit();
				
				// 유효성 검사
				if($('#tab-1').hasClass('active')) {
					
					// 카드 번호
					if($('input[name="cardNum1"]').val().trim().length == 0) {
						alert('카드 번호를 입력해 주세요.');
						$('input[name="cardNum1"]').focus();
						return false;
					} else if($('input[name="cardNum2"]').val().trim().length == 0) {
						alert('카드 번호를 입력해 주세요.');
						$('input[name="cardNum2"]').focus();
						return false;
					} else if($('input[name="cardNum3"]').val().trim().length == 0) {
						alert('카드 번호를 입력해 주세요.');
						$('input[name="cardNum3"]').focus();
						return false;
					} else if($('input[name="cardNum4"]').val().trim().length == 0) {
						alert('카드 번호를 입력해 주세요.');
						$('input[name="cardNum4"]').focus();
						return false;
					}
					
					// 카드 유효 기간
					// ((new Date().getMonth() < 10 ? '0' : '') + new Date().getMonth())
					var MM = new Date().getMonth() + 1;
					//var nowValidMMYY = parseInt((new Date().getFullYear().toString()).substr(2, 2) + (MM < 10 ? '0' : '') + MM);
					var nowValidMMYY = parseInt((new Date().getFullYear().toString()).substr(2, 2) + ((new Date().getMonth() + 1) < 10 ? '0' : '') + (new Date().getMonth() + 1));
					var selValidMMYY = parseInt($('select[name="validYY"]').val() + $('select[name="validMM"]').val());
					if($('select[name="validMM"]').val() == '월') {
						alert('카드 유효 월을 선택해 주세요.');
						$('select[name="validMM"]').focus();
						return false;
					} else if($('select[name="validYY"]').val() == '연도') {
						alert('카드 유효 연도를 선택해 주세요.');
						$('select[name="validYY"]').focus();
						return false;
					} else if(nowValidMMYY > selValidMMYY) {
						alert('정확한 카드 유효 기간을 선택해 주세요.');
						$('select[name="validMM"]').focus();
						return false;
					}
					
					// CVC
					if($('input[name="cardCvc"]').val().trim().length == 0) {
						alert('CVC를 입력해 주세요.');
						$('input[name="cardCvc"]').focus();
						return false;
					}
					
				} else if($('#tab-2').hasClass('active')) {

					// 입금자
					if($('input[name="depositor"]').val().trim().length == 0) {
						alert('입금자를 입력해 주세요.');
						$('input[name="depositor"]').focus();
						return false;
					}
					
					// 입금 은행
					if($('select[name="bank"]').val() == '은행 선택') {
						alert('입금하실 은행을 선택해 주세요.');
						$('select[name="bank"]').focus();
						return false;
					}
					
				}

			    /* var serialized = $('.pcResv')
				 				 .find('input[name="email"], '
				 				 + 'input[name="pc_num"], input[name="hours"], input[name="startDt"], input[name="endDt"], '
				 				 + 'input[name="generation"], input[name="price"], input[name="maxLen"], input[name="seats"]')
				 				 .serialize()
			    				 + '&' 
			    				 + $('.tab-content.active')
			    				 .find('input[name="payHow"], '
			    				 + 'input[name="cardNum1"], input[name="cardNum2"], input[name="cardNum3"], input[name="cardNum4"], '
			    				 + 'select[name="validMM"], select[name="validYY"], input[name="cardCvc"], '
			    				 + 'input[name="depositor"], select[name="bank"]')
			    				 .serialize(); */
   				var serialized = $('.tab-wrap').find('form').serialize();
			    console.log(serialized);
			    
			 	

				$.ajax({
					url: 'pcResv',
					type: 'POST',
					data: serialized,
					success: function(resvNum){
						location.href = 'pcResvAfter?resv_num=' + resvNum;
					}
				});
				dialog.dialog("close");
			},
			'취소': function() {
				dialog.dialog('close');
			}
		},
		width: '900',
		height: '650'
    });
	
});
</script>
</body>
</html>
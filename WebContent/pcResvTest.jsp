<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/seat.css">
<link rel="stylesheet" type="text/css" href="css/datePicker.css">
<style type="text/css">
* {
	box-sizing: border-box !important;
}
section {
	padding-top: 130px;
}
button:focus,
input:focus,
textarea:focus,
select:focus {
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
.control-group {
	display: inline-block;
	vertical-align: top;
	/* background: #fff; */
	border: none;
	text-align: left;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
	padding: 30px 0;
	width: 300px;
	/* height: 210px; */
}
select {
	display: inline-block;
	width: 100%;
	cursor: pointer;
	padding: 10px 15px;
	outline: 0;
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
.only-timepicker .datepicker--nav, .only-timepicker .datepicker--content {
	display: none;
}
.only-timepicker .datepicker--time {
	border-top: none;
}
.confirm-resv {
	padding: 50px !important;
}
.confirm-resv h5 {
	margin-bottom: 54px;
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
.confirm-resv .row,
.form-row {
	display: flex;
}
.form-row {
	margin-bottom: 10px;
}
.confirm-resv input[type="text"] {
    width: 70px;
    height: 43px;
    border: none;
    padding: 5px 10px;
    margin-bottom: 10px;
}
.confirm-resv select {
	width: 85px;
	margin-right: 10px;
}
.confirm-resv select:last-child {
	margin-right: 0 !important;
}
.confirm-resv input[type="text"]:focus,
.confirm-resv input[type="text"]:active {
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
    padding: 10px 15px;
    width: 100%;
}
.deposit select {
    padding: 10px 15px;
    width: 100%;
    height: 48px;
}
.flex1 {
    flex: 1;
}
.w100 {
	width: 100%;
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
					<input type="text" id="resvDate" name="resvDate" placeholder="이용 시작 일시를 선택해 주세요." data-position='bottom right'/>
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
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 0px;">1</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 0px;">2</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 0px;">3</button>
					<button type="button" class="seat-done" title="예약 불가" id="" style="left: 150px; top: 0px;">4</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 0px;">5</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 0px;">6</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 0px;">7</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 0px;">8</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 400px; top: 0px;">9</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 450px; top: 0px;">10</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 0px;">11</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 0px;">12</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 0px;">13</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 0px;">14</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 0px;">15</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 0px;">16</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 0px;">17</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 0px;">18</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 100px;">19</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 100px;">20</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 100px;">21</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 100px;">22</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 100px;">23</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 100px;">24</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 100px;">25</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 100px;">26</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 100px;">27</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 100px;">28</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 100px;">29</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 100px;">30</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 100px;">31</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 100px;">32</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 100px;">33</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 100px;">34</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 150px;">35</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 150px;">36</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 150px;">37</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 150px;">38</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 150px;">39</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 150px;">40</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 150px;">41</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 150px;">42</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 150px;">43</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 150px;">44</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 150px;">45</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 150px;">46</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 150px;">47</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 150px;">48</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 150px;">49</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 150px;">50</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 300px;">51</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 300px;">52</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 300px;">53</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 300px;">54</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 300px;">55</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 300px;">56</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 300px;">57</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 300px;">58</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 300px;">59</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 300px;">60</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 300px;">61</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 300px;">62</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 300px;">63</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 300px;">64</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 300px;">65</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 300px;">66</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 350px;">67</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 350px;">68</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 350px;">69</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 350px;">70</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 350px;">71</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 350px;">72</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 350px;">73</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 350px;">74</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 350px;">75</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 350px;">76</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 350px;">77</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 350px;">78</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 350px;">79</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 350px;">80</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 350px;">81</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 350px;">82</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 450px;">83</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 450px;">84</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 450px;">85</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 450px;">86</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 450px;">87</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 450px;">88</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 450px;">89</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 450px;">90</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 450px; top: 450px;">91</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 400px; top: 450px;">92</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 450px;">93</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 450px;">94</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 450px;">95</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 450px;">96</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 450px;">97</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 450px;">98</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 450px;">99</button>
					<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 450px;">100</button>
				</div>
			</div>
			
			<div id="confirm-resv" class="confirm-resv" title="예약 내역 확인">
				<h5><i class="far fa-check-circle" style="margin-right: 10px;"></i>예약하시겠습니까 ?</h5>
				<div class="row">
					<div class="flex1 w100">
						<h2>LEFT</h2>
					</div>
					<div class="tab-wrap flex1 w100">
						<ul class="tabs">
							<li class="link active" data-tab="tab-1">카드 결제</li>
							<li class="link" data-tab="tab-2">무통장 입금</li>
							<li class="link" data-tab="tab-3">현장 결제</li>
						</ul>
						<div id="tab-1" class="tab-content active">
							<form action="" method="post">
								<label for="cardNum">카드 번호</label>
								<div class="form-row flexSB">
									<input type="text" id="cardNum" maxlength="4"/>
									<input type="text" maxlength="4"/>
									<input type="text" maxlength="4"/>
									<input type="text" maxlength="4"/>
								</div>
								
								<div class="form-row flexSB">
									<div>
										<label for="cardValid">카드 유효 기간</label>
										<div class="form-row">
											<select id="cardValid">
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
											<select>
												<option>연도</option>
												<option value="2018">18</option>
												<option value="2019">19</option>
												<option value="2020">20</option>
												<option value="2021">21</option>
												<option value="2022">22</option>
												<option value="2023">23</option>
												<option value="2024">24</option>
												<option value="2025">25</option>
												<option value="2026">26</option>
												<option value="2027">27</option>
												<option value="2028">28</option>
											</select>
										</div>
									</div>
									
									<div>
										<label for="cardCvc">CVC</label>
										<input type="text" id="cardCvc" maxlength="3"/>
									</div>
								</div>
							</form>
						</div>
						<div id="tab-2" class="tab-content">
							<form action="" method="post" class="deposit">
								<label for="depositPerson">입금자명</label>
								<input type="text" id="depositPerson"/>
								
								<label for="depositBank">입금 은행</label>
								<select>
									<option id="depositBank">은행 선택</option>
									<option value="ibkBank">기업 은행 01041816083 (예금주 : 김성환)</option>
									<option value="shinhanBank">신한 은행 110388021447 (예금주 : 김희수)</option>
								</select>
							</form>
						</div>
						<div id="tab-3" class="tab-content">
							<form action="" method="post">
								<label for="payInPlace"><input type="radio" id="payInPlace" value="현장에서 직접 결제"/> 현장에서 직접 결제</label>
								
							</form>
						</div>
					</div>
				</div>			
			</div>
			 
			<div class="btn-row">
				<button type="button">취소</button>
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
$(function() {
	//function birthChk() {
		var birth = '${birth}'; // 이전 페이지에서 인증 받은 생년월일
		var adultAge = 19; // 성인 기준 나이

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
		console.log(age);
		console.log(parseInt(('1' + birthday_md)));
		console.log(parseInt(('1' + m + d)));

		if (age < adultAge || (age == adultAge && parseInt(('1' + birthday_md)) > parseInt(('1' + m + d)))) { // 19살이면 생일 지났는지 확인하기 위해
			var result = '';
			result += '<div class="select"><select name="teen"><option id="generation">청소년</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select></div>';
			result += '<button type="button" class="reSel" title="인원 수 다시 선택"><i class="fas fa-sync-alt"></i</button>';
			$('.control-group').append(result);
		} else {
			var result = '';
			result += '<div class="select"><select name="adult"><option id="generation">성인</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select></div>';
			result += '<button type="button" class="reSel" title="인원 수 다시 선택"><i class="fas fa-sync-alt"></i></button>';
			$('.control-group').append(result);
		}

		console.log($(''));
		//return true;
	//}


		/* $("#datepicker").datepicker({
			showOn : "button",
			buttonImage : "images/calendar.gif",
			buttonImageOnly : true,
			buttonText : "Select date"
		}); */
		/* $('#datepicker').datepicker({
			showOtherMonths: true,
			selectOtherMonths: true
		}); */

	// 시작 날짜 생성
	var start = new Date(), prevDay;
	var startHours = start.getHours();

	console.log(start);
	console.log(startHours);
	if(start.getMinutes() < 30) {
		start.setHours(start.getHours());
		start.setMinutes(30);
	} else {
		start.setHours(start.getHours() + 1);
		start.setMinutes(0);
	}
	console.log(start);
	console.log(startHours);
	
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
        onSelect: function (fd, d, picker) {
            // Do nothing if selection was cleared
            if (!d) return;

            var day = d.getDay();
            
            // Trigger only if date is changed
            if (prevDay != undefined && prevDay == day) return;
            prevDay = day;

            //alert($('#resvDate').val());
            /* 
            // If chosen day is Saturday or Sunday when set
            // hour value for weekends, else restore defaults
            if (day == 6 || day == 0) {
                picker.update({
                    minHours: 10,
                    maxHours: 16
                });
            } else {
                picker.update({
                    minHours: 9,
                    maxHours: 18
                });
            }
             */
        }
    });

	//$('select').change(function() {
		/* var str = '';
		$('select option:selected').each(function() {
			if($('select[name="teen"] option:selected').val() == '청소년') {
				console.log('청소년 입력 안 됨');
			}
			str += $(this).val() + ' ';
		}); */
		
	var adult = 0;
	var teen = 0;
	var hours = 0;
	
		$('select[name="hours"]').click(function() {
			if($('select[name="hours"] option:selected').val() == '이용 시간') {
				console.log('이용 시간 입력 안 됨');
				hours = 0;
			} else {
				console.log('이용 시간 입력 됨 : ' + $('select[name="hours"] option:selected').val());
				hours = $('select[name="hours"] option:selected').val();	
			}
		});
		//console.log(str);
	//}).trigger('change');

	var seats = new Array();
	var seatSelLen;
	var maxLen;
	$('.seat-normal').click(function(){
		seatSelLen = $('.seat-selected').length + 1;
		
		if($('select[name="adult"]').val() == '성인' || $('select[name="adult"]').val() === undefined) {
			console.log('성인 입력 안 됨');
			//adult = 0;
		} else {
			console.log('성인 입력 됨 : ' + $('select[name="adult"]').val());
			$('select[name="adult"]').attr('disabled', true);
			adult = $('select[name="adult"]').val();				
			
		}
		if($('select[name="teen"]').val() == '청소년' || $('select[name="teen"]').val() === undefined) {
			console.log('청소년 입력 안 됨');
			//teen = 0;
		} else {
			console.log('청소년 입력 됨 : ' + $('select[name="teen"]').val());
			teen = $('select[name="teen"]').val();
		}
		
		
		maxLen = (parseInt(adult) + parseInt(teen));
		if(maxLen == 0) {
			alert('인원을 선택해 주세요.');
		}
		console.log("seatSelLen : " + seatSelLen);	
		console.log('maxLen : ' + maxLen);
		if(seatSelLen < maxLen || seatSelLen == maxLen) {
			if($(this).hasClass('seat-selected')) {
				$(this).removeClass('seat-selected');
			} else {
				$(this).addClass('seat-selected');
			}
		} else if (seatSelLen > maxLen) {
			console.log('초과');
			if($(this).hasClass('seat-selected')) {
				$(this).removeClass('seat-selected');
			}
			return false;
		}
		console.log("seatSelLen : " + seatSelLen);	
		console.log('maxLen : ' + maxLen);
		console.log('$("#resvDate").val() : ' + $('#resvDate').val());
		console.log("seatSel : " + $(this).text());
		seats.push($(this).text());
		//console.log('$(".generation").val() : ' + $('.generation').val());
		
	});
	$('.reSel').click(function(){
		var flag = confirm('현재 선택된 좌석을 모두 취소하고 인원 수를 다시 선택하시겠습니까 ?');
		if(flag) {
			$('.seat-position button').each(function(){
				$('select[name="adult"]').attr('disabled', false);
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
		/* if($('.seat-selected').length == 0) {
			alert('좌석을 선택해 주세요.');
			return false;
		}
		if($('.seat-selected').length != maxLen) {
			alert('인원 수와 좌석 수가 일치하지 않습니다.\n좌석을 확인해 주세요.');
			return false;
		}
		if($('#resvDate').val().trim() == '') {
			alert('이용 시작 일시를 선택해 주세요.');
			return false;
		}
		if(parseInt(hours) == 0) {
			alert('이용 시간을 선택해 주세요.');
			return false;
		} */
		
		var startDt = $('#resvDate').val();
		var endYear = parseInt(startDt.substr(0, 4));
		var endMonth = parseInt(startDt.substr(5, 2)) - 1; // month는 0부터 1월
		var endDate = parseInt(startDt.substr(8, 2));
		var endHours = parseInt(startDt.substr(11, 2));
		var endMin = parseInt(startDt.substr(14, 2));
		var date = new Date(endYear, endMonth, endDate, endHours, endMin);
		date.setHours(date.getHours() + parseInt(hours));

		var endDt = date.getFullYear() + '/' + (date.getMonth() + 1) + '/' + date.getDate() + ' ' + ((date.getHours() < 10 ? '0' : '') + date.getHours()) + ':' + ((date.getMinutes() < 10 ? '0' : '') + date.getMinutes());
		var result = '<h5><i class="far fa-check-circle" style="margin-right: 10px;"></i>예약하시겠습니까 ?</h5>';
		result += '<p>PC방 이름 : '+ "${pc.pc_name}"+'</p>';
		result += '<p>PC방 위치 : '+ "${pc.pc_addr}"+'</p>';
		result += '<p>이용 시간 : ' + hours + '시간</p>';
		result += '<p>이용 일시 : ' + startDt + ' ~ ' + endDt + '</p>';
		result += '<p>선택 좌석 : ';
		//$('select[name="adult"]').text()
		seats.sort(function(a, b) {
		    return a - b; // 오름차순
		});
		
		for(var i = 0; i < seats.length; i++) {
			result += '<span class="seatSel">' + seats[i] + '</span>';
		}
		result +=  '(' + $('#generation').text()+'  '+ maxLen+'명)   '+'</p>';
		//result += '<p>총 가격 : '+${pc.price}*maxLen*hours+'원 </p>';
		
		//$('.confirm-resv').html(result);
		dialog.dialog('open');
	});
	
	var dialog;
	dialog = $('#confirm-resv').dialog({
		modal: true,
		autoOpen: false,
		resizable:false,
		buttons: {
			'확인': function(){
				if((adult != 0 || teen != 0) && hours != 0 && $('#resvDate').val().trim() != '') {
					//location.href = 'pcResvAfter?pc_num='+${pc.pc_num};
					
					dialog.dialog("close");
				}
			},
			'취소': function() {
				dialog.dialog('close');
			}
		},
		width: '900',
		height: '700'
    });
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('active');
		$('.tab-content').removeClass('active');

		$(this).addClass('active');
		$("#" + tab_id).addClass('active');
	});
	
	$('.card').on('click', function() {
		$('.card').removeClass('active');
		$(this).addClass('active');
		$('.form').stop().slideUp();
		$('.form').delay(300).slideDown();
	});
});
</script>
</body>
</html>
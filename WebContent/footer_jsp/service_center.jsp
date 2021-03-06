<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="css/foot_service_center.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".content").hide();
		//content 클래스를 가진 div를 표시/숨김(토글)
		$(".heading").click(function() {
			$(this).next(".content").slideToggle(500);
		});
	});
</script>

</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<div class="wrap">

			<div class="wrapper">
				<ul class="tabs clearfix" data-tabgroup="first-tab-group">
					<li><a href="#tab1" class="active">자주하는 질문</a></li>
					<li><a href="#tab2">서비스 이용 질문</a></li>
					<li><a href="#tab3">수수료 관련 질문</a></li>
					<li><a href="#tab4">개발자</a></li>
				</ul>
				<div id="first-tab-group" class="tabgroup">
					<div id="tab1">
						<div class="service">
							<p class="heading">Q.속도가 느립니다.</p>
							<div class="content">
								<p>지도와 크롤링, 그리고 각종 부하가 걸리는 요소가 많습니다.</p>
								<p>조금만 여유롭게 기다려 주세요.</p>
							</div>

							<p class="heading">Q. 컨텐츠가 적습니다.</p>
							<div class="content">
								<p>현재 주 컨텐츠는 pc방의 위치, 지도, 그리고 예약이 있습니다.</p>
								<p>부가적인 컨텐츠로 현제 인기 있는 동영상, 라이브방송, 각종 게시판이 있습니다.</p>
								<p>자세한 문의는 아래 개발자에게 문의 해주시기 바랍니다.</p>
							</div>

							<p class="heading">Q. 사용중에 문제가 있습니다.</p>
							<div class="content">
								<p>개발 중이라 문제가 발생 할 수 있습니다.</p>
								<p>자세한 문의는 개발자에게 문의 해주시기 바랍니다.</p>
							</div>
						</div>

					</div>
					<div id="tab2">
						<div class="service">
							<p class="heading">Q.로그인 중 일시적인 오류가 발생했습니다.</p>
							<div class="content">
								<p>로그인 / 회원가입 진행이 원활하지 않은 경우</p>
								<p>주소창에서 정확한 사이트 주소를 확인해 주세요.</p>
								<p>HP은 크롬(Chrome)에 최적화되어있기 때문에 원활한 이용을 위해 Chrome을 통한 접속을
									부탁드립니다.</p>
								<p>WIFI 또는 유선 네트워크 접속 방식 변경을 권장 드립니다.</p>
							</div>

							<p class="heading">Q. 계정 해킹이 의심됩니다.</p>
							<div class="content">

								<p>계정 해킹이 의심될 경우</p>

								<p>계정 보호(동결)를 요청할 수 있습니다.</p>
								<p>계정 동결 시 입출금 / 거래 / 등급상향 기능 등이 제한됩니다.</p>
								<p>이후 동결 해제 요청 시 본인 인증절차를 추가로 진행해야 합니다.</p>
								<p>계정 동결 요청 방법</p>
								<p>1. 마이페이지 > 계정정지 기능</p>
								<p>2. 1:1문의 > 해킹/보이스피싱 신고 접수</p>
								<p>3. e-mail 접수 : 당사 등록한 이메일로 아래의 내용 작성 후 help@okcoinkr.com
									으로 발송</p>
								<p>1) 제목 : 계정 동결요청</p>
								<p>2) 본문내용</p>
								<p>- 내용 : 계정 동결요청</p>
								<p>- 사유 : 해킹의심 / 보이스피싱 등</p>
								<p>- ID :</p>
								<p>- 연락처 : (계정에 등록된 휴대폰 및 통화 가능한 연락처)</p>
								<p>- 휴대폰 분실 등의 사유로 계정에 등록된 전화번호로 통화가 어려운 경우, 비대면인증 서류를 첨부</p>
								<p>- 비대면 인증서류 : 주민번호 뒷자리를 가린 신분증+메모, 신분증 및 메모를 들고 촬영한 본인 사진</p>
								<p>* 메모 필수 기재 내용 : ID, 이름, 생년월일, 신청일, 신청내용 (OKCOIN 계정동결 요청)
								</p>

								<p>해킹이나 보이스피싱을 예방하기 위해 아래의 내용을 권장 드립니다.</p>
								<p>1) 로그인비밀번호, 결제비밀번호를 주기적으로 변경 (3개월)</p>
								<p>2) 타 거래소, 타 서비스와 다른 비밀번호 사용</p>
								<p>3) OTP 사용</p>
								<p>해킹/보이스피싱의심 관련 요청 사항은 1:1문의 기능을 이용하시면 편리합니다.</p>

							</div>

							<p class="heading">Q. 모바일 APP도 지원하나요?</p>
							<div class="content">
								<p>모바일 APP은 현재 서비스 준비 중이며, 향후 홈페이지 공지 사항을 통해 안내해드릴 예정입니다.</p>
								<p>그리고 자세한 문의는 개발자에게 문의 해주시기 바랍니다.</p>
							</div>

						</div>
					</div>
					<div id="tab3">
						<div class="service">
							<p class="heading">Q.가맹점 수수료를 변경하였습니다. 언제부터 변경된 수수료가 적용되나요?</p>
							<div class="content">
								<p>수수료 변경된 날짜의 접수 매출건부터 변경된 수수료가 적용됩니다.</p>
							</div>

							<p class="heading">Q. 현재 적용중인 수수료율에 대해서 조정이 가능한지 궁금합니다. 인하와
								인상 등의 조정은 어떤 기준으로 또는 어떤 기간으로 적용이 되는지 궁금합니다.</p>
							<div class="content">

								<p>가맹점 수수료율은 개정 여신전문금융업법에 의거, 합리적이고 공정하게 산출되었습니다.</p>

								<p>가맹점수수료율 재산출은 향후 정기적으로 이루어질 예정이며, 산출기준에 대한 문의사항은 콜센터를 이용하여
									주시기 바랍니다.</p>
							</div>

							<p class="heading">Q. 가맹점 수수료는 어떻게 공제가 이루어지나요?</p>
							<div class="content">
								<p>매출 건당 가맹점별 산출된 수수료율이 적용되고, 수수료가 제외된 나머지 금액이 입금됩니다. (원 미만
									금액은 절사)</p>
								<p>그리고 자세한 문의는 개발자에게 문의 해주시기 바랍니다.</p>
							</div>

						</div>
					</div>
					<div id="tab4">
						<h2>개발자</h2>
						<div class="service">
							<p class="heading">프로젝트 관련</p>
							<div class="content">
								<p>조장 : 김성환</p>
								<p>부조장 : 김희수</p>
								<p>조원 : 박은천</p>
								<p>조원 : 류지태</p>
								<p>조원 : 최광훈</p>
								<p>조원 : 이도근</p>
							</div>

							<p class="heading">회원 관련</p>
							<div class="content">
								<p>기능 : 류지태</p>
								<p>화면 : 류지태, 박은천</p>
							</div>

							<p class="heading">PC방 예약 관련</p>
							<div class="content">
								<p>기능 : 김성환, 김희수</p>
								<p>화면 : 박은천</p>
							</div>

							<p class="heading">게임 영상 관련</p>
							<div class="content">
								<p>기능 : 이도근</p>
								<p>화면 : 박은천, 이도근</p>
							</div>

							<p class="heading">갤러리/차트 관련</p>
							<div class="content">
								<p>기능 : 김희수</p>
								<p>화면 : 박은천, 김희수</p>
							</div>

							<p class="heading">게시판 관련</p>
							<div class="content">
								<p>기능 : 최광훈</p>
								<p>화면 : 박은천, 최광훈</p>
							</div>

						</div>
					</div>
				</div>
			</div>

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
			<script type="text/javascript">
				$('.tabgroup > div').hide();
				$('.tabgroup > div:first-of-type').show();
				$('.tabs a')
						.click(
								function(e) {
									e.preventDefault();
									var $this = $(this), tabgroup = '#'
											+ $this.parents('.tabs').data(
													'tabgroup'), others = $this
											.closest('li').siblings().children(
													'a'), target = $this
											.attr('href');
									others.removeClass('active');
									$this.addClass('active');
									$(tabgroup).children('div').hide();
									$(target).show();
								})
			</script>

		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>
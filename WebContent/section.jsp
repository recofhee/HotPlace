<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head profile="http://rdp.hees.xyz:8060/svn/PC/teamPrj">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="robots" content="noindex">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width,user-scalable=no">
<title>Hot Place</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="js/modernizr.custom.86080.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645189b6e3b4fffa603cf981d6189fc4&libraries=services,clusterer"></script>
<link href="css/section.css?ver=3" rel="stylesheet">
<script>
	var temp;
	$(function() {
		$(".tab_content").hide();
		$(".tab_content:first").show();
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#4f94bc");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "white");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
		var input = $('#url').val();
		temp = input;
	});
	$('#frm').submit();
	$(function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨 
	    }; 

	var geocoder = new daum.maps.services.Geocoder();
	var count =0;
	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="font-size: 9pt">현위치</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}

	var clusterer = new daum.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	    minLevel: 10, // 클러스터 할 최소 지도 레벨
	    disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	});

	var positions = [];
	$.ajax("pcListJson", {
		dataType : 'json',
		async : true,
		success : function(data) {
			var idxArr = [];
			positions = data;
			var markers = $(positions).map(function(i, position) {
				var marker = new daum.maps.Marker({
					position : new daum.maps.LatLng(position.y, position.x),
					clickable : true
				});
				var iwContent = '<div style="font-size: 9pt">' + positions[i].name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

				var infowindow = new daum.maps.InfoWindow({
					content : iwContent,
					removable : iwRemoveable
				});	
					daum.maps.event.addListener(marker, 'click', function() {
						var str =encodeURIComponent(position.pc_num);
						location.href = 'detail?pc_num=' + str;
					});
				
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		            	infowindow.open(map, marker);
		            });

		            daum.maps.event.addListener(marker, 'mouseout', function() {
		            	infowindow.close();
		            });
				return marker;
	        });
			console.log(markers);
			clusterer.addMarkers(markers);
			daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

		        // 현재 지도 레벨에서 1레벨 확대한 레벨
		        var level = map.getLevel()-1;

		        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
		        map.setLevel(level, {anchor: cluster.getCenter()});
		    }); 
		}
	});
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({  
	        map: map,
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}
		
		
		$(".btn1").click(function() {
			if ($(".inbox").is(':visible') == false) {
				$("div.inbox1").stop().slideUp(200);
				$("div.inbox2").stop().slideUp(200);
				$(".inbox").stop().slideDown(200);
			} else {
				$(".inbox").stop().slideUp(200);
			}
		}); 
		$(".btn2").click(function() {
			if($("div.inbox1").is(':visible') == false) {
				$(".inbox").stop().slideUp(200);
				$("div.inbox2").stop().slideUp(200);
				
				$.ajax("PcResvJson",{
					dataType : 'json',
					async : false,
					success : function(data) {
						var resv = [];
						resv = data;
						var htmlstr ="";
						for (i = 0; i < data.length; i++) {
							htmlstr +=	'<div class="row-wrap">'
							htmlstr +=		'<div class="row-left">'
							htmlstr +=		'<h2><a href="resvView?resv='+resv[i].resv_num+'">'+resv[i].name+'</a></h2>' 
							htmlstr +=		'</div>'
							htmlstr += 	'<div class="row-right">'
							htmlstr +=		'<p>이용 날짜 : '+resv[i].resv_start +" ~ "+ resv[i].resv_end+'</p>'
							htmlstr +=		'<p>이용 시간 : '+resv[i].resv_hours+'시간</p>'
							htmlstr +=		'<p>선택 좌석 : '+resv[i].seat_nums+'</p>'
							htmlstr +=		'<p>가격 : '+resv[i].resv_price+'원</p>'
							htmlstr += 	'</div>'
							htmlstr += 	'</div>'
						}
						console.log("ddd::"+htmlstr);
						$("#id").html(htmlstr);
					}
				})  
				$("div.inbox1").stop().slideDown(200);
				
			} else{
				$("div.inbox1").stop().slideUp(200);
			}
		});
		$(".btn3").click(function() {
			if($("div.inbox2").is(':visible') == false) {
				$("div.inbox1").stop().slideUp(200);
				$("div.inbox").stop().slideUp(200);
				$("div.inbox2").stop().slideDown(200);
			} else{
				$("div.inbox2").stop().slideUp(200);
			}
		}); 
		/* 예약 목록 */
	});
</script>
<style type="text/css">
.inbox1,
.inbox2 {
    overflow-y: scroll;
    padding: 0 10px;
}
.row-wrap {
	display: flex;
   	background: #eee;
    height: 150px;
    margin-bottom: 30px;
}
.row-wrap-bm {
    display: flex;
    padding: 20px 20px;
    color: #eee;
    border: 1px solid #bbb;
    background: #c5181f57;
    margin: 20px 50px;
    text-align: center;
    font-size: 18px;
}
.row-wrap-bm span {
	list-style: none;
    flex: 1;
    border-right: 2px solid #bbb;
}
.row-wrap-bm span a:active {color: red;}
.row-wrap-bm span:hover a{color: #29cc82; text-decoration: none;}
.row-wrap-bm span a{color: #cddc39;}
.row-wrap-bm span:last-child {
    border-right: 0 !important;
}
.row-wrap .row-left {
	display: flex;
    flex: 1;
    justify-content: center;
    align-items: center;
    flex-grow: 1;
    padding: 20px 50px;
    background: #f8b753;
    color: #eee;
    max-width: 353px;
    min-width: 353px;
    text-overflow: ellipsis;
}
.row-wrap .row-left h2 {
    text-align: center;
    max-width: 253px;
    min-width: 253px;
}
.row-wrap .row-right {
    background: #eee;
    flex: 1;
    flex-grow: 2;
    padding: 5px 40px;
    line-height: 40px;
    height: 135px;
}
.row-right p {
	vertical-align: middle;
    line-height: 25px;
}

.inbox1::-webkit-scrollbar,
.inbox2::-webkit-scrollbar {
    width: 4px;
}
.inbox1::-webkit-scrollbar-track,
.inbox2::-webkit-scrollbar-track {
    background: #efefef; 
}
.inbox1::-webkit-scrollbar-thumb,
.inbox2::-webkit-scrollbar-thumb {
    background: #777; 
}
.inbox1::-webkit-scrollbar-thumb:hover
.inbox2::-webkit-scrollbar-thumb:hover {
    background: #555; 
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<div id="artcle">
			<ul class="cb-slideshow">
				<li><span>Image 01</span>
				<div>
						<h3></h3>
					</div></li>
				<li><span>Image 02</span>
				<div>
						<h3></h3>
					</div></li>
				<li><span>Image 03</span>
				<div>
						<h3></h3>
					</div></li>
				<li><span>Image 04</span>
				<div>
						<h3></h3>
					</div></li>
				<li><span>Image 05</span>
				<div>
						<h3></h3>
					</div></li>
				<li><span>Image 06</span>
				<div>
						<h3></h3>
					</div></li>
			</ul>
		</div>
		<div id="artcle1">
			<div class="main_form">
				<form action="pclist" id ="frm" autocomplete="off"> <!-- 검색목록표시 -->
					<fieldset class="url">
						<input id="url" type="text" name="url" required> 
						<label for="url"><i class="fa fa-search" aria-hidden="true"></i>Search</label>
						<div class="after"></div>
					</fieldset>
					<fieldset class="enter">
						<button></button>
					</fieldset>
				</form>
			</div>
		</div>
		<div id="artcle2">
			<ul class="box">
				<li><a class="btn1"><i class="fa fa-map-marker fa-9x"></i></a></li>
			</ul>
			<ul class="box1">
				<li><a class="btn2"><i class="fa fa-calendar fa-9x"></i></a></li>
			</ul>
			<ul class="box2">
				<li><a class="btn3"><i class="fa fa-star fa-9x"></i></a></li>
			</ul>
		</div>
		<article id="article4">
			<!-- PC방 지도 -->
			<div class="inbox" id=map style="width: 100%; height: 300px;"></div>
			
		<c:if test="${!empty loginUser}">
			<!-- PC방 예약 내역 -->
			<div class="inbox1" id=id style="display:none; width: 100%; height: 300px;">
				
			</div>
			<!-- PC방 북마크 -->
			<div class="inbox2" style="display:none; width: 100%; height: 300px;">
			<c:forEach var ="bookmark" items="${markVo}">
				<div class="row-wrap-bm">
					<span><a href="detail?pc_num=${bookmark.pc_num}">${bookmark.name}</a></span>
					<span>${bookmark.address}</span>
					<span>${bookmark.price} 원</span>
				</div>
			</c:forEach>
			</div>
			<!-- PC방 북마크 끝 -->
		</c:if>
		</article>
		<article id="artcle3">
			<ul class="tabs">
				<li class="active" rel="tab1">게임 영상</li>
				<li rel="tab2">실시간 영상</li>
			</ul>
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<c:forEach var="List" items="${List}">
						<ul>
							<li>
								<a href="utubeview?link=${List.video_url}">
									<img style="width: 100px; height: 45px;" src="${List.video_img}">
									${List.video_title}
								</a>
							</li>
						</ul>
					</c:forEach>	
				</div>
				<!-- #tab1 -->
				<div id="tab2" class="tab_content">
					<c:forEach var="Live" items="${Live}">
						<ul>
							<li>
								<a href="liveview?link=${Live.video_url}">
									<img style="width: 100px; height: 45px;" src="${Live.video_img}">
									${Live.video_title}
								</a>
							</li>
						</ul>
					</c:forEach>
				</div>
				<!-- #tab2 -->
			</div>
			
			<aside>
				<fieldset>
				<legend>인기 게시글</legend>
					<table class="asidetable">
						<c:forEach var="board" items="${boardList}">
							<tr> 
								<td>${board.num}</td>
								<td colspan="3"><a
									href="boardView.g?category_num=${board.category_num }&num=${board.num}"><c:out value="${board.title }" escapeXml="true"/></a></td>
								<td>${board.readcount}</td>
							</tr>
						</c:forEach>
					</table>
				</fieldset>
			</aside>
		</article>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>

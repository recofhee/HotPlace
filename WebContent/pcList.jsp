<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>PC방 위치 찾기</title>
<style type="text/css">
body{background-image: url(images/starback.jpg);
    background-repeat: no-repeat;
    background-size: cover;}
section {padding-top: 130px;
		 }
.wrap {
	width: 960px;
	margin: 20px auto;
	padding: 0;
	height: 600px;
	border: 0px solid black;
	position: relative;
	}
aside{width: 400px;
    border: 0px solid black;
    padding: 5px;
    display: block;
    height: 588px;
  /*   margin-top: -500px; */
    z-index: 5;
    position: absolute;
    background: #ffffff1c;
    }
.asidebox1 {
	width: 100%;
    display: inline-block;
    border: 0px solid black;
    font-size: 13px;
    line-height: 24px;
    height: 575px;
    box-sizing: border-box;
    text-align: left;
	}
table{border-collapse: collapse; }
td {height: 100px; width: 52%; border-bottom: 1px solid rgba(255,255,255, 0.1); line-height: 40px;}
table tr td p {font-size: 1.2em; text-shadow: 0 0 5px; }
table tr td p:active {color: red;}
tr:hover{background: rgba(189, 207, 208, 0.2);}	
#id {
	overflow: scroll;
	width: 100%;
	color:white;
    height: 560px;
    -ms-overflow-style: none;
}
::-webkit-scrollbar {display:none;} 
#ip{font-size: 15px; line-height: 21px;}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %> 
<section>
<c:forEach var="pc" items="${pcList}">
	${pc.pc_num}
</c:forEach>

<div class="wrap">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645189b6e3b4fffa603cf981d6189fc4&libraries=services,clusterer"></script>
	<div id="map" style="width: 560px; height: 588px; float: right;"></div>
	<aside>
	<div class="asidebox1">
	<script>
		var markers;
		var marker;
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.5238506, 126.98047020000001), // 지도의 중심좌표
				level : 14 // 지도의 확대 레벨
			};
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});
		var map = new daum.maps.Map(mapContainer, mapOption);
		var geocoder = new daum.maps.services.Geocoder();
		var clusterer = new daum.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			minLevel : 7, // 클러스터 할 최소 지도 레벨
			disableClickZoom : true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		});
		var positions = [];
		var s = '${param.url}';
		
		var ajax = $.ajax("pcListJson",{
			dataType : 'json',
			async : false,
			//data : "url=" + s,
			success : function(data) {
				var idxArr = [];
				positions = data;
				marker = $(positions).map(function(i, position) {
					var marker = new daum.maps.Marker({
						position : new daum.maps.LatLng(position.y, position.x),
						clickable : true
					});
						var iwContent = '<div style="padding:5px;">' + positions[i].name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
			}
		})

		 var ajax1 = $.ajax("pcListJson",{
				dataType : 'json',
				async : false,
				data : {'url': s},
				success : function(data) {
					var idxArr = [];
					positions = data;
					markers = $(positions).map(function(i, position) {
						var marker = new daum.maps.Marker({
							position : new daum.maps.LatLng(position.y, position.x),
							clickable : true
						});
							var iwContent = '<div style="padding:5px;">' + positions[i].name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
				}
			})  
		
			
			$(function() {
			ajax.then(function(data) {
				var htmlStr = "";
				var htmlSer = "";
				positions = data;
					htmlSer += "검색 <input id = 'ip' name='url' value = '"+s+"'>";
				$("#ser").html(htmlSer);
				htmlStr += "<table id='tbl'>";
					 for (i = 1; i < data.length; i++) {
						if(positions[i].name.indexOf(s) != -1){
							/* htmlStr += "<tr>";
							htmlStr += "<img src=upload/"+positions[i].pictureurl+">"
							htmlStr += "</tr>" */
							htmlStr += "<tr>"
							htmlStr += "<td rowspan ='2' style='background:url(\"upload/" +positions[i].pictureurl+" \"); background-size: 100% 100%;float: left;margin: 5px; width: 170px;'></td>";
							htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' ><p>" + positions[i].name + "</p>"+positions[i].addr +  "</td>";
							/* htmlStr += "<td>" + positions[i].addr + "</td>" */
							htmlStr += "</tr>"
							htmlStr += "<tr>"
							htmlStr += "</tr>"
						}
						
						
						else if(positions[i].addr.indexOf(s) != -1){
							/* htmlStr += "<tr>";
							htmlStr += "<img src=upload/"+positions[i].pictureurl+">"
							htmlStr += "</tr>" */
								htmlStr += "<tr>"
								htmlStr += "<td rowspan ='2' style='background:url(\"upload/" +positions[i].pictureurl+" \"); background-size: 100% 100%;float: left;margin: 5px; width: 170px;'></td>";
								htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' ><p>" + positions[i].name + "</p>"+ positions[i].addr + "</td>";
								/* htmlStr += "<td>" + positions[i].addr + "</td>" */
								htmlStr += "</tr>"
								htmlStr += "<tr>"
								htmlStr += "</tr>"
						}
					  } 
				htmlStr += "</table>";
						$('#ip').keyup(function(key) {
							var search = $(this).val();
							var cnt = 0;
							var htmlStr = "";
							for (i = 1; i < data.length; i++) {
								if (positions[i].name.indexOf(search) != -1 ) {
								/* 	htmlStr += "<tr>";
									htmlStr += "<img src=upload/"+positions[i].pictureurl+">"
									htmlStr += "</tr>" */
										htmlStr += "<tr>"
										htmlStr += "<td rowspan ='2' style='background:url(\"upload/" +positions[i].pictureurl+" \"); background-size: 100% 100%;float: left;margin: 5px; width: 170px;'></td>";
										htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' ><p>" + positions[i].name + "</p>" + positions[i].addr + "</td>";
										/* htmlStr += "<td>" + positions[i].addr + "</td>" */
										htmlStr += "</tr>"
										htmlStr += "<tr>"
										htmlStr += "</tr>"
								}
								else if (positions[i].addr.indexOf(search) != -1 ) {
									/* htmlStr += "<tr>";
									htmlStr += "<img src=upload/"+positions[i].pictureurl+">"
									htmlStr += "</tr>" */
										htmlStr += "<tr>"
										htmlStr += "<td rowspan ='2' style='background:url(\"upload/" +positions[i].pictureurl+" \"); background-size: 100% 100%;float: left;margin: 5px; width: 170px;'></td>";
										htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' ><p>" + positions[i].name + "</p>" + positions[i].addr + "</td>";
										/* htmlStr += "<td>" + positions[i].addr + "</td>" */
										htmlStr += "</tr>"
										htmlStr += "<tr>"
										htmlStr += "</tr>"
								}
							}
							
							$("#tbl").html(htmlStr);
							$(".cls").each(function() {
								$(this).click(function() {
									map.setLevel(5);
									map.setCenter(new daum.maps.LatLng($(this).data("lat"), $(this).data("lng")));
								});
							})
							
							s = search;
							clusterer.removeMarkers(markers);
							clusterer.addMarkers(marker);
						});
				$("#id").html(htmlStr);
				$(".cls").each(function() {
					$(this).click(function() {
						map.setLevel(5);
						map.setCenter(new daum.maps.LatLng($(this).data("lat"), $(this).data("lng"))); 
					});
				}) 
				clusterer.addMarkers(markers);
				daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
					var level = map.getLevel() - 1;
					map.setLevel(level, {
						anchor : cluster.getCenter()
					});
				});
			});
		})
	</script>
		<div id="de"></div>
		<div id="ser" style="color: white; text-align: center; margin: 10px;"></div>
		<div id="id"></div> 
		</div>
		</aside>
		</div>
		</section>
		<%@ include file="footer.jsp" %> 
	</body>
</html> 


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<style type="text/css">
section {
	padding-top: 130px;
}

.wrap {
	width: 960px;
	margin: 0 auto;
	padding: 0;
	height: 500px;
	border: 0px solid black;
	position: relative;
}

aside {
	width: 360px;
	border: 0px solid black;
	padding: 5px;
	display: block;
	height: 488px;
	/*   margin-top: -500px; */
	z-index: 5;
	position: absolute;
	background: rgba(255, 255, 255, 0.1);
}

.asidebox1 {
	width: 100%;
	display: inline-block;
	border: 0px solid black;
	font-size: 13px;
	line-height: 24px;
	height: 489px;
	box-sizing: border-box;
	text-align: left;
}

table {
	border-collapse: collapse;
}

td {
	height: 45px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

tr:hover {
	background: rgba(189, 207, 208, 0.2);
}

tr:hover td {
	color: red;
}

#id {
	overflow: scroll;
	width: 347px;
	color: white;
	height: 460px;
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
}

#ip {
	font-size: 15px;
	line-height: 21px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<c:forEach var="pc" items="${pcList}">
	${pc.pc_num}
</c:forEach>
		<div class="wrap">
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645189b6e3b4fffa603cf981d6189fc4&libraries=services,clusterer"></script>
			<div id="map" style="width: 600px; height: 488px; float: right;"></div>
			<aside>
				<div class="asidebox1">
					<script>
						var markerFlag = false;
						var markers;
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new daum.maps.LatLng(37.5238506, 126.98047020000001), // 지도의 중심좌표
								level : 14 // 지도의 확대 레벨
							};
						var infowindow = new daum.maps.InfoWindow({
							zIndex : 1
						});
						var map = new daum.maps.Map(mapContainer, mapOption);
						var geocoder = new daum.maps.services.Geocoder();
						var clusterer = new daum.maps.MarkerClusterer({
							map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
							averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
							minLevel : 7, // 클러스터 할 최소 지도 레벨
							disableClickZoom : true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
						});
						var positions = [];
						var s = '${param.url}';
					
						var ajax = function(){
							return $.ajax("pcListJson", {
								dataType : 'json',
								async : false,
								data : "url=" + s,
								success : function(data) {
									var idxArr = [];
									positions = data;
									markers = $(positions).map(function(i, position) {
										var marker = new daum.maps.Marker({
											position : new daum.maps.LatLng(position.y, position.x),
											clickable : true
										});
										var iwContent = '<div style="padding:5px;">' + positions[i].name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
											iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
										var infowindow = new daum.maps.InfoWindow({
											content : iwContent,
											removable : iwRemoveable
										});
										daum.maps.event.addListener(marker, 'click', function() {
											var str = encodeURIComponent(position.name + "," + position.addr + "," + position.x +
												"," + position.y + "," + position.pc_imf);
						
											location.href = 'detail.jsp?test=' + str;
										});
										daum.maps.event.addListener(marker, 'mouseover', function() {
											infowindow.open(map, marker);
										});
										daum.maps.event.addListener(marker, 'mouseout', function() {
											infowindow.close();
										});
										return marker;
									});
									clusterer.addMarkers(markers, markerFlag);
									daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
										var level = map.getLevel() - 1;
										map.setLevel(level, {
											anchor : cluster.getCenter()
										});
									});
								}
							})
							
						}
					
					
						$(function() {
							ajax().then($.ajax("pcListJson", {
								dataType : 'json',
								async : false,
								success : function(data) {
					
									var htmlStr = "";
									var htmlSer = "";
									positions = data;
									htmlSer += "검색 <input id = 'ip' value = '" + s + "'>";
									$("#ser").html(htmlSer);
									htmlStr += "<table id='tbl'>";
									for (i = 1; i < data.length; i++) {
										htmlStr += "<tr>";
										htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' >" + positions[i].name + "</td>";
										htmlStr += "<td>" + positions[i].addr + "</td>";
										htmlStr += "</tr>";
									}
									htmlStr += "</table>";
								
									$('#ip').keyup(function(key) {
										var search = $(this).val();
										
										//console.log(serch);
										var cnt = 0;
										var htmlStr = "";
										for (i = 1; i < data.length; i++) {
											if (positions[i].name.indexOf(search) != -1) {
												htmlStr += "<tr>";
												htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' >" + positions[i].name + "</td>";
												htmlStr += "<td>" + positions[i].addr + "</td>";
												htmlStr += "</tr>";
											} else if (positions[i].addr.indexOf(search) != -1) {
												htmlStr += "<tr>";
												htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' >" + positions[i].name + "</td>";
												htmlStr += "<td>" + positions[i].addr + "</td>";
												htmlStr += "</tr>";
											}
										}
										$("#tbl").html(htmlStr);
										$(".cls").each(function() {
											$(this).click(function() {
												map.setLevel(5);
												map.setCenter(new daum.maps.LatLng($(this).data("lat"), $(this).data("lng")));
											});
										})
										markerFlag = true;
										ajax();
									})
									$("#id").html(htmlStr);
									$(".cls").each(function() {
										$(this).click(function() {
											map.setLevel(5);
											map.setCenter(new daum.maps.LatLng($(this).data("lat"), $(this).data("lng")));
					
											infowindow.open(map, markers);
										});
									})
								}
							}));
						});
					</script>
					<div id="de"></div>
					<div id="ser" style="color: white; text-align: center;"></div>
					<div id="id"></div>
				</div>
			</aside>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>
<style type="text/css">
section {padding-top: 130px;}
.wrap {
	width: 960px;
	margin: 0 auto;
	padding: 0;
	height: 500px;
	border: 0px solid black;
	position: relative;
	}
aside{width: 360px;
    border: 0px solid black;
    padding: 5px;
    display: block;
    height: 488px;
  /*   margin-top: -500px; */
    z-index: 5;
    position: absolute;
    background: rgba(255,255,255, 0.1);
    }
.asidebox1 {
	width: 100%;
    display: inline-block;
    border: 0px solid black;
    font-size: 13px;
    line-height: 24px;
    height: 489px;
    box-sizing: border-box;
    text-align: left;
	}
table{border-collapse: collapse; }
td {height: 45px; border-bottom: 1px solid rgba(255,255,255, 0.1);}
tr:hover {background: rgba(189, 207, 208, 0.2);}	
tr:hover td{color: red; }
#id {
	overflow: scroll;
	width: 347px;
	color:white;
    height: 460px;
    -ms-overflow-style: none;
}
::-webkit-scrollbar {display:none;} 
#ip{font-size: 15px; line-height: 21px;}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %> 
<section>
<c:forEach var="pc" items="${pcList}">
	${pc.pc_num}
</c:forEach>
<div class="wrap">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645189b6e3b4fffa603cf981d6189fc4&libraries=services,clusterer"></script>
	<div id="map" style="width: 600px; height: 488px; float: right;"></div>
	<aside>
	<div class="asidebox1">
					
	<script>
		var markers;
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.5238506, 126.98047020000001), // 지도의 중심좌표
				level : 14 // 지도의 확대 레벨
			};
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});
		var map = new daum.maps.Map(mapContainer, mapOption);
		var geocoder = new daum.maps.services.Geocoder();
		var clusterer = new daum.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			minLevel : 7, // 클러스터 할 최소 지도 레벨
			disableClickZoom : true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		});
		var positions = [];
		var s = '${param.url}';
		$(function() {
			$.ajax("pcListJson",{
				dataType : 'json',
				async : false,
				data : "url=" + s,
				success : function(data) {
					var idxArr = [];
					positions = data;
					markers = $(positions).map(function(i, position) {
						var marker = new daum.maps.Marker({
							position : new daum.maps.LatLng(position.y, position.x),
							clickable : true
						});
							var iwContent = '<div style="padding:5px;">' + positions[i].name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
							var infowindow = new daum.maps.InfoWindow({
								content : iwContent,
								removable : iwRemoveable
							});
	
							daum.maps.event.addListener(marker, 'click', function() {
								var str =encodeURIComponent(position.name+","+position.addr+","+position.x+ 
										","+position.y+","+position.pc_imf);
								location.href = 'detail.jsp?test=' + str;
							});
						
				            daum.maps.event.addListener(marker, 'mouseover', function() {
				            	infowindow.open(map, marker);
				            });

				            daum.maps.event.addListener(marker, 'mouseout', function() {
				                infowindow.close();
				            });
						return marker;
					});
					clusterer.addMarkers(markers);
					daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
						var level = map.getLevel() - 1;
						map.setLevel(level, {
							anchor : cluster.getCenter()
						});
					});
				}
			}).then(function(data) {
				var htmlStr = "";
				var htmlSer = "";
				positions = data;
					htmlSer += "<form>"
					htmlSer += "검색 <input id = 'ip' name='url' value = '"+s+"'>";
					htmlSer += "<input type='submit' value = '검색'></form>";
				$("#ser").html(htmlSer);
					htmlStr += "<table id='tbl'>";
				 for (i = 1; i < data.length; i++) {
				 	htmlStr += "<tr>";
					htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' >" + positions[i].name + "</td>";
					htmlStr += "<td>" + positions[i].addr + "</td>";
					htmlStr += "</tr>";
				} 
					htmlStr += "</table>";
				/* $('#ip').keyup(function(key) {
					var serch = $(this).val();
					//console.log(serch);
					var cnt = 0;
					var htmlStr = "";
					for (i = 1; i < data.length; i++) {
						if (positions[i].name.indexOf(serch) != -1 ) {
							htmlStr += "<tr>";
							htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' >" + positions[i].name + "</td>";
							htmlStr += "<td>" + positions[i].addr + "</td>";
							htmlStr += "</tr>";
						}
						else if (positions[i].addr.indexOf(serch) != -1 ) {
							htmlStr += "<tr>";
							htmlStr += "<td style='cursor:pointer' class='cls' data-lat='" + positions[i].y + "' data-lng='" + positions[i].x + "' >" + positions[i].name + "</td>";
							htmlStr += "<td>" + positions[i].addr + "</td>";
							htmlStr += "</tr>";
						}
					}
					$("#tbl").html(htmlStr);
					$(".cls").each(function() {
						$(this).click(function() {
							map.setLevel(5);
							map.setCenter(new daum.maps.LatLng($(this).data("lat"), $(this).data("lng")));
						});
					}) 
				}) */
				$("#id").html(htmlStr);
				$(".cls").each(function() {
					$(this).click(function() {
						map.setLevel(5);
						map.setCenter(new daum.maps.LatLng($(this).data("lat"), $(this).data("lng"))); 
						infowindow.open(map, markers);
					});
				}) 
			});
		})
	</script>
		<div id="de"></div>
		<div id="ser" style="color: white; text-align: center;"></div>
		<div id="id"></div>
		</div>
		</aside>
		</div>
		</section>
		<%@ include file="footer.jsp" %> 
	</body>
</html> --%>
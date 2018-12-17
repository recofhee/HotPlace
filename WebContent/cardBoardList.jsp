<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>Card Board List</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Noto+Serif+JP|Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="css/bootstrap-grid.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/cardBoardList.css?ver=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	function getQueryVariable (variable) {
		var query = window.location.search.substring(1);
		var vars = query.split("&");
		for (var i = 0; i < vars.length; i++) {
			var pair = vars[i].split("=");
			if(pair[0] == variable) {
				return pair[1];
			}
		}
		//return false;
		return 1; /* false면 1페이지 출력하게끔 */
	}
	
	var page = 1;
	var pageV = 'page';
	var cbList = function(){
		var result = '';
		var pagination = '';
		var pageNo = '';
		var prevPageNo = '';
		var nextPageNo = '';
		var startPageNo = '';
		var endPageNo = '';
		$.ajax({
			url: 'cardBoardListAction',
			type: 'GET',
			data: {
				page: getQueryVariable(pageV)
			},
			dataType: 'json',
			success: function(data) {
				console.log(data);
				var i = 0;
				var j = 3;

				if(data != null && data.length > 0) {
					$.each(data, function(index, item){
						pageNo = item.pageNo;
						prevPageNo = item.prevPageNo;
						nextPageNo = item.nextPageNo;
						startPageNo = item.startPageNo;
						endPageNo = item.endPageNo;
						
							if(i % j == 0) {
								result += '<div class="row">';
							}
							result += '<div class="col-sm-12 col-md-6 col-lg-4"><div class="card2"><a href="cardBoardServlet?command=board_view&page='+item.pageNo+'&cb_num='+item.cbNum+'"><div class="layer-img">';
							if(item.thumbnail != null) {
								result += '<img alt="'+item.thumbnail+'" src="upload/'+item.thumbnail+'">';
							} else {
								result += '<img alt="thumb" src="https://dummyimage.com/350x350/ddd/ddd">';
							}
							result += '</div><div class="card-content"><h2>'+item.title+'</h2>';
							result += '<h5>'+item.name+'</h5><span>'+(item.writeDate).substr(0, 10)+'</span><ul class="card-bottom"><li><span><i class="fas fa-thumbs-up"></i>'+item.likeCnt+'</span></li><li><span><i class="far fa-eye"></i>'+item.readCnt+'</span></li></ul></div></div></a></div>';
							if(i % j == j - 1) {
								result += '</div>';
							}
							i++;
						
					});
				} else {
					result += '<div class="row" style="margin: 0;"><span style="margin: 0 auto;">존재하지 않습니다.</span></div>';
				}
				
				if(prevPageNo != pageNo) {
					pagination += '<a href="?page='+prevPageNo+'"><i class="fas fa-angle-left"></i></a>';
				}
				for(var p = startPageNo; p <= endPageNo; p++) {
					if(p == pageNo) {
						pagination += '<a href="?page='+p+'" class="active">'+p+'</a>';
					} else {
						pagination += '<a href="?page='+p+'">'+p+'</a>';
					}
				}
				if(nextPageNo != pageNo) {
					pagination += '<a href="?page='+nextPageNo+'"><i class="fas fa-angle-right"></i></a>';
				}
				$('.cb-list .cbrow-wrap').html(result);
				$('.cb-list .pagination').html(pagination);
			}
		});
	}
	
	var ready = 0;
	if(ready++ == 0) {
		cbList();
	}
	
	$('#keyword').keyup(function(){
		var k = $(this).val();
		var result = '';
		var pagination = '';
		var pageNo = '';
		var prevPageNo = '';
		var nextPageNo = '';
		var startPageNo = '';
		var endPageNo = '';
		if(k != '') {
			$.ajax({
				url: 'searchCardBoardListAction',
				type: 'GET',
				data: {
					keyword: k,
					page: page
				},
				dataType: 'json',
				success: function(data) {
					console.log(data);
					var i = 0;
					var j = 3;
					if(data != null && data.length > 0) {
						$.each(data, function(index, item){
							pageNo = item.pageNo;
							prevPageNo = item.prevPageNo;
							nextPageNo = item.nextPageNo;
							startPageNo = item.startPageNo;
							endPageNo = item.endPageNo;
							
							if(i % j == 0) {
								result += '<div class="row">';
							}
							result += '<div class="col-sm-12 col-md-6 col-lg-4"><div class="card2"><a href="cardBoardServlet?command=board_view&page='+item.pageNo+'&cb_num='+item.cbNum+'"><div class="layer-img">';
							if(item.thumbnail != null) {
								result += '<img alt="'+item.thumbnail+'" src="upload/'+item.thumbnail+'">';
							} else {
								result += '<img alt="thumb" src="https://dummyimage.com/350x350/ddd/ddd">';
							}
							result += '</div><div class="card-content"><h2>'+item.title+'</h2>';
							result += '<h5>'+item.name+'</h5><span>'+(item.writeDate).substr(0, 10)+'</span><ul class="card-bottom"><li><span><i class="fas fa-thumbs-up"></i>'+item.likeCnt+'</span></li><li><span><i class="far fa-eye"></i>'+item.readCnt+'</span></li></ul></div></div></a></div>';
							if(i % j == j - 1) {
								result += '</div>';
							}
							i++;
							
						});
					} else {
						result += '<div class="row" style="margin: 0;"><span style="margin: 0 auto;">존재하지 않습니다.</span></div>';
					}
					
					$('.cb-list .cbrow-wrap').html(result);
					//$('.cb-list .pagination').hide();
					
					if(prevPageNo != pageNo) {
						pagination += '<a href="searchCardBoardList?keyword='+k+'&page='+prevPageNo+'"><i class="fas fa-angle-left"></i></a>';
					}
					for(var p = startPageNo; p <= endPageNo; p++) {
						if(p == pageNo) {
							pagination += '<a href="searchCardBoardList?keyword='+k+'&page='+p+'" class="active">'+p+'</a>';
						} else {
							pagination += '<a href="searchCardBoardList?keyword='+k+'&page='+p+'">'+p+'</a>';
						}
					}
					if(nextPageNo != pageNo) {
						pagination += '<a href="searchCardBoardList?keyword='+k+'&page='+nextPageNo+'"><i class="fas fa-angle-right"></i></a>';
					}
					
					$('.cb-list .pagination').html(pagination);
				}
			});
			
			$('#searchSubmit').click(function(){
				location.href = 'searchCardBoardList?keyword=' + k;
			});
		} else if(k.trim() == '') {
			var result = '';
			
			cbList();
			
			$('.cb-list .pagination').show();
			$('#keyword').focus();
			
		}
	});
	
});
</script>
</head>
<body>
<%@ include file="header.jsp" %> 

	<section>
		<div class="wrap">
			
			<div class="cb-list container">
				<div class="searchWrap">
					<form action="searchCardBoardList" autocomplete="off">
						<input id="keyword" name="keyword" type="search" class="inputhee" placeholder="검색어를 입력해 주세요."/>
						<button id="searchSubmit" type="submit" value="">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
				<c:if test="${not empty loginUser}">
					<div class="btn-row-ffe">
						<a href="cardBoardWriteForm" class="cb-btn">작성</a>
					</div>
				</c:if>
	
				<!-- 카드 보드 리스트 -->
				<div class="cbrow-wrap"></div>
	
				<!-- 카드 보드 페이징 -->
				<div class="pagination"></div>
			</div>
		</div>

	</section>
	<%@ include file="footer.jsp" %> 
</body>
</html>
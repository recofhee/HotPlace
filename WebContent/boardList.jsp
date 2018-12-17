
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script> -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>게임 게시판</title>
<c:choose>
<c:when test="${param.category_num == 0}">
<link href="boardcss/boardall.css?ver=2" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 1}">
<link href="boardcss/boardlist.css?ver=2" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 2}">
<link href="boardcss/boardlist_over.css?ver=3" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 3}">
<link href="boardcss/boardlist_mon.css?ver=2" rel="stylesheet">
</c:when>
</c:choose>
<script type="text/javascript">


	function check() {
		if (document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
	
	function userCheck(){
		if(document.search.user_email.value == "guest"){
			alert("로그인 후 이용해주세요.");
			return false;
		}
		location.href='boardWrite.g?category_num=${param.category_num }'
		return true;
	}
	

	
	
</script>

</head>
<body>

	<%@ include file="header.jsp"%>
	<section>
		<div class="warp" align="center">
		<div class="back">
			<div class="head">
				
<div class="h1"></div>
				</div>
				
			<div class="center">
				<table class="tabl">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="board" items="${boardList}">
						<input type="hidden" id="email" name="email" value="${board.email }">
						<tr>
							<td>${board.num}</td>
							<td style="text-align: left;">
							<a href="boardView.g?category_num=${board.category_num}&num=${board.num}"><c:out value="${board.title }" escapeXml="true"/></a></td>
							<td>${board.nick_name}</td>
							<td>${board.writedate}</td>
							<td>${board.readcount}</td>
						</tr>
					</c:forEach>

				</table>
				<div class="st">
					<input type="button" value="글쓰기" class="bt" onclick="return userCheck()">	<!-- (10.12) 글쓰기 들어갔을때 주소에 category_num 들어가도록... -->
				</div>
				<div class="num">
					<c:if test="${paging.pageNo != 1}">
					<ul>
						<li><a href="?category_num=${param.category_num }&page=${paging.prevPageNo}">＜</a></li>
					</ul>
					</c:if>
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNo}">
								<ul>
									<li><a id="active" href="?category_num=${param.category_num }&page=${i}">${i}</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li><a href="?category_num=${param.category_num }&page=${i}">${i}</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.pageNo != paging.nextPageNo}">
						<ul>
							<li><a href="?category_num=${param.category_num }&page=${paging.nextPageNo}">＞</a></li>
						</ul>
					</c:if>
				</div>
				<div class="searchbar">
				<form action="boardList.g" name="search" method="get">
					<div class="search1" align="center">
						<select name="keyField" size="1" class="sel">
							<option value="nick_name" name="nick_name">
								<c:if test="${'nick_name'==keyField }"> selected</c:if>작성자
							</option>
							<option value="title" name="title">
								<c:if test="${'title'==keyField }"> selected</c:if>제목
							</option>
							<option value="content" name="content">
								<c:if test="${'content'==keyField }"> selected</c:if> 내용
							</option>
						</select>
					
						<input type="text" size="16" name="keyWord" id="keyWord" class="inp" value="${keyWord }">
					
						<input type="hidden" name="category_num" value="${param.category_num}">
						<input type="hidden" name="user_email" id="user_email" value="${email }">
						
						<input type="button" value="검색" class="btn1" onClick="check()">
					</div>
				</form>
				</div>
			</div>
			<div class="foot"></div>
		</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>


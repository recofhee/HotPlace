
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
<link rel="stylesheet" type="text/css" href="boardcss/boardlist_over.css?ver=3">
<script type="text/javascript">


	function check() {
		if (document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
</head>
<body>
	<%-- 	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/> --%>

	<%@ include file="header.jsp"%>
	<section>
		<div class="warp" align="center">
		<div class="head">
		<div class="h1">
			<h1></h1>
		</div>
			</div>
		
			
			<div class="center">

				<table class="tabl">
					<tr>
						<td colspan="7" class="sort"><input type="radio"
							id="sort_ori" name="sort">원래대로 <input type="radio"
							id="sort_date" name="sort">최신순 <input type="radio"
							id="sort_count" name="sort">조회순 <input type="radio"
							id="sort_reply" name="sort">댓글순</td>
					</tr>

					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>댓글수</th>
						<th>카테고리</th>
						
					</tr>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.num}</td>
							<td style="text-align: left;"><a
								href="boardView.g?num=${board.num}">${board.title}</a></td>
							<td>${board.nick_name}</td>
							<td>${board.writedate}</td>
							<td>${board.readcount}</td>
							<td>${board.repcount}</td>
							<td>${board.category_num }</td>
						</tr>
					</c:forEach>
				
				</table>
				<div class="st">
					<input type="button" value="글쓰기" class="bt"
						onclick="location.href='boardWrite.g'">
				</div>
				<div class="num">
					<!-- class="bt"  -->
					<c:if test="${paging.pageNo != 1}">
						<li><a href="?page=${paging.prevPageNo}">＜</a></li>
					</c:if>
					<c:forEach var="i" begin="${paging.startPageNo}"
						end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNo}">

								<ul>
									<li><a href="?page=${i}">${i}</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul>
									<li><a href="?page=${i}">${i}</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.pageNo != paging.nextPageNo}">
					</c:if>
					<ul>
						<li><a href="?page=${paging.nextPageNo}">＞</a></li>
					</ul>
				</div>
				<form action="boardList.g" name="search" method="get">
					<div class="search1" align="center">
						<select name="keyField" size="1" class="sel">
							<option value="id" name="id">
								<c:if test="${'nick_name'==keyField }"> selected</c:if>작성자
							</option>
							<option value="title" name="title">
								<c:if test="${'title'==keyField }"> selected</c:if>제목
							</option>
							<option value="content">
								<c:if test="${'content'==keyField }"> selected</c:if> 내용
							</option>
						</select> <input type="text" size="16" name="keyWord" id="keyWord"
							class="inp" value="${keyWord }"> <input type="button"
							value="검색" class="btn1" onClick="check()">
					</div>
				</form>
			</div>
			<div class="foot"></div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>


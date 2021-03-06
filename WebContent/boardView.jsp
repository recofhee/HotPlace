<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>게시글 상세</title>
<c:choose>
<c:when test="${param.category_num == 1 }">
<link href="boardcss/boardview.css?ver=3" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 2 }">
<link href="boardcss/boardview_over.css?ver=2" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 3 }">
<link href="boardcss/boardview_mon.css?ver=1" rel="stylesheet">
</c:when>
</c:choose>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function delete_btn(){
		if(confirm("정말 삭제 하시겠습니까?") == true) {
			location.href='boardDelete.g?num=' + ${board.num}
			//location.href='boardDelete.g',
			
			
		} else{
			return false;
		}
		
	}
	
	function userCheck(){
		if(document.frm.user_email.value == "guest"){
			alert("로그인 후 이용해주세요.");
			return false;
		}
		 location.href='boardReply.jsp?category_num=${param.category_num}&num=${board.num}'
		return true;
	}
</script>


<body>
 <%@ include file="header.jsp" %> 
 <section>
<div class="wrap" align="center">
<div class="head">
<div class="h1">
</div>
</div>
<div class="center">
<h2>게시글 상세</h2>
<form method="post" enctype="multipart/form-data" name="frm" >
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="file_modi" value="${board.file_modi }">
	<input type="hidden" name="user_email" id="user_email" value="${email }">
	<input type="hidden" name="writer_email" id="writer_email" value="${board.email}">
	<input type="hidden" name="category_num" id="category_num" value="${param.category_num }">
	<table>
		<tr>
			<td>
				<table>
					<tr>
					<th>번호</th>
					<td>${board.num }</td></tr>
					<tr>
						<th>제목</th>
						<td><c:out value="${board.title }" escapeXml="true"/></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${board.nick_name }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${board.readcount }</td>
					</tr>
<%-- 					<tr>
						<th>첨부파일</th>
						<td>${board.file_modi }</td>
					</tr> --%>
					<tr>
						<th>내용</th>
						<td>
						<c:choose>
							<c:when test="${empty board.file_modi }">
								<!-- <img src="upload/noimage.gif"> -->	
							</c:when>
							<c:otherwise>
								<img src="upload/${board.file_modi }" width="400">
							</c:otherwise>
						</c:choose><br>
						<c:out value="${board.content }" escapeXml="true"/></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${email eq board.email }">
			<input type="button" value="게시글 수정" class="bt" onclick="location.href='boardUpdate.g?category_num=${param.category_num}&num=${board.num}'">
			<input type="button" value="게시글 삭제" class="bt" onclick="delete_btn();">
			<input type="button" value="답글" class="bt" OnClick="location.href='boardReply.jsp?category_num=${param.category_num}&num=${board.num}'">
			<input type="button" value="목록" class="bt" onclick="javascript:history.go(-1);">
		</c:when>
		<c:otherwise>
			<input type="button" value="답글" class="bt" OnClick="return userCheck();">
			<input type="button" value="목록" class="bt" onclick="javascript:history.go(-1);">
		</c:otherwise>
	</c:choose>
 	
	
</form>
</div>
<div class="foot"></div>
</div>
</section>
<%@ include file="footer.jsp" %> 
</body>
</html>
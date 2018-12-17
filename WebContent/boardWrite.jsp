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
<title>게시글 작성</title>
<script>
function writeCheck() {
	 if(document.frm.title.value.length == 0) {
		alert("내용을 작성해주세요");
		frm.title.focus();
		return false;
	} 
	if(document.frm.content.value.length == 0) {
		alert("글 내용을 작성해주세요");
		frm.content.focus();
		return false;
	}	
	location.href='boardList.g?category_num=${param.category_num}';
	return true;
}	
</script>
<c:choose>
	<c:when test="${param.category_num == 0}">
		<link href="boardcss/boardwrite_all.css?ver=3" rel="stylesheet">
	</c:when>
	<c:when test="${param.category_num == 1}">
		<link href="boardcss/boardwrite.css?ver=4" rel="stylesheet">
	</c:when>
	<c:when test="${param.category_num == 2}">
		<link href="boardcss/boardwrite_over.css?ver=3" rel="stylesheet">
	</c:when>
	<c:when test="${param.category_num == 3}">
		<link href="boardcss/boardwrite_mon.css?ver=3" rel="stylesheet">
	</c:when>
</c:choose>
</head>
<body>
 <%@ include file="header.jsp" %> 
 <section>
<div class="wrap" align="center">
<div class="head">
<div class="h1"></div>
</div>
<div class="center">
<form action="boardWrite.g" method="post" enctype="multipart/form-data" name="frm" onsubmit="return writeCheck()">
	<input type="hidden" name="email" id="email" value="${loginUser.email }">
	<table class="tabl">
		<tr>
			<th>카테고리</th>
			<td><select id="category" name="category">
				<option value="1">리그오브레전드</option>
				<option value="2">오버워치</option>
				<option value="3">몬스터 헌터</option>
			</select> </td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" size="30">
			<input type="hidden" id="nick_name" name="nick_name" value="${loginUser.nick_name }">
			</td>
		</tr>
		<tr>
			<th>이미지 첨부</th>
			<td><input type="file" name="file_modi"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="80" id="content" name="content" style="resize: none;"></textarea></td>
		</tr>
	</table>
	<div class="button">
		<input type="submit" value="등록" class="bt" >	
		<input type="reset" value="다시작성" class="bt">
		<input type="button" value="취소" class="bt" onclick="location.href='boardList.g?category_num=${param.category_num}'">
	</div>
</form>
</div>
<div class="foot"></div>
</div>
</section>
 <%@ include file="footer.jsp" %> 
</body>
</html>
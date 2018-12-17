<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<c:choose>
<c:when test="${param.category_num == 1 }">
<link href="boardcss/boardupdate.css?ver=3" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 2 }">
<link href="boardcss/boardupdate_over.css?ver=3" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 3 }">
<link href="boardcss/boardupdate_mon.css?ver=4" rel="stylesheet">
</c:when>
</c:choose>
</head>
<body>
 <%@ include file="header.jsp" %> 
 <section>
<div class="wrap" align="center">
<div class="head">
<div class="h1"></div>
<h3>게시글 수정</h3>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<script>
function userCheck(){
	if(document.frm.user_email.value == ""){
		alert("로그인 후 이용해주세요.");
		return false;
	}
	if(document.frm.user_email.value != document.frm.writer_email.value){
		alert("작성자만 수정 가능합니다.");
		return false;
	}
	return true;
}
</script>
</div>

<div class="center">
<form method="post" enctype="multipart/form-data" name="frm" onsubmit="return userCheck()">
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="nomakeImg" value="${board.file_modi }">
	<input type="hidden" name="user_email" id="user_email" value="${email }">
	<input type="hidden" name="writer_email" id="writer_email" value="${board.email}">
	<table>
		<tr>
			<td>
				<table style="font-size: 12px;">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="${board.title }" size="30"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file_modi" >${board.file_modi }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="20" cols="80" name="content" style="resize: none;">${board.content }</textarea>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<input type="submit" value="수정" class="bt">	
	<input type="reset" value="다시 작성" class="bt">
	<input type="button" value="목록" class="bt" onclick="location.href='boardList.g?category_num=${param.category_num}'">
	
</form>
</div>
<div class="foot"></div>
</div>
</section>
 <%@ include file="footer.jsp" %> 
</body>
</html>
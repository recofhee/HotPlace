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
<link href="boardcss/boardupdate_over.css?ver=3" rel="stylesheet">
</head>
<body>
 <%@ include file="header.jsp" %> 
 <section>
<div class="wrap" align="center">
<div class="head">
<div class="h1"></div>
<h2 style="text-align: center;">게시글 수정</h2>
</div>

<div class="center">
<form method="post" enctype="multipart/form-data" name="frm">
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="nomakeImg" value="${board.file_modi }">
	<table>
		<tr>
			<td>
				<table>
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
	<input type="submit" value="수정" class="bt" >	
	<input type="reset" value="다시 작성" class="bt">
	<input type="button" value="목록" class="bt" onclick="location.href='boardList.g'">
	
</form>
</div>
<div class="foot"></div>
</div>
</section>
 <%@ include file="footer.jsp" %> 
</body>
</html>
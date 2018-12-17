<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>답글 등록</title>
<link href="boardcss/boardwrite_mon.css?ver=4" rel="stylesheet">
</head>
<body>
 <%@ include file="header.jsp" %> 
 <section>
<div class="wrap" align="center">
<div class="head">
<div class="h1"></div>
</div>
<div class="center">
<form method="post" enctype="multipart/form-data" name="frm">
	<table>
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
			<td><input type="text" name="title" size="30"></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td><input type="file" name="file_modi"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="80" name="content" style="resize: none;"></textarea></td>
		</tr>
	</table>
	<div class="button">
		<input type="submit" value="등록" class="bt">	
		<input type="reset" value="다시작성" class="bt">
		<input type="button" value="취소" class="bt" onclick="location.href='boardList.g'">
	</div>
</form>
</div>
<div class="foot"></div>
</div>
</section>
 <%@ include file="footer.jsp" %> 
</body>
</html>
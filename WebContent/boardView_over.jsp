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
<link href="boardcss/boardview_over.css?ver=3" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function displaySet(exe,coNum,coId,coContent,cmd){
		obj=document.frm;
		obj.coNum.value=coNum;
		obj.exe.value=exe;
		obj.coId.value=coId;
		while(coContent.indexOf("<br>") != -1) {
			coContent=coContent.replace("<br>", "\n");
		}
		obj.coContent.value = coContent;
		obcj.cmd.value=cmd;
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
<form method="post" enctype="multipart/form-data" name="frm">
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="file_modi" value="${board.file_modi }">
	<table>
		<tr>
			<td>
				<table>
					<tr>
					<th>번호</th>
					<td>${board.num }</td></tr>
					<tr>
						<th>제목</th>
						<td>${board.title }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${board.nick_name }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${board.readcount }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>${board.file_modi }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
						<c:choose>
							<c:when test="${empty board.file_modi }">
								<img src="upload/noimage.gif">	
							</c:when>
							<c:otherwise>
								<img src="upload/${board.file_modi }" width="400">
							</c:otherwise>
						</c:choose><br>
						${board.content }</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<input type="button" value="게시글 수정" class="bt" onclick="location.href='boardUpdate.g?num=${board.num}'">
	<input type="button" value="게시글 삭제" class="bt" onclick="location.href='boardDelete.g?num=${board.num}'">
	<input type=button value="답글" class="bt" OnClick="location.href='boardReply.jsp?num=${board.num}'">
	<input type="button" value="목록" class="bt" onclick="location.href='boardList.g'">

<%-- 
	<c:forEach var="co" items="${list}">
		<div>

			<span>${co.coId }</span>
			<span>${co.coWritedate }</span>
			<c:set var="content" value="${co.coContent }"/>
			<c:set var="content" value="${fn:replace(coContent,rn,'<br>') }"/>
			<span><a href = "javascript:displaySet(2, '${co.coNum }', '${co.coId }', '${coContent }, '수정')">수정</a>
			<a href = "javascript:displaySet(3, '${co.coNum }', '${co.coId }', '${coContent }, '수정')">삭제</a></span>
			<div>
				${coContent }
			</div>
		</div>
	
	</c:forEach>
 	
 --%>	
	<form action="comment.g" method="post" name="frm">
		<input type="hidden" name="coNum" value="1">	<!-- 댓글 수정/ 삭제할때 자바스크립트 함수에서 value 값 변경 -->
		<input type="hidden" name="exe" value="1"> <!-- exe : 1 댓글추가 -->
		
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="coParent" value="${vo.coNum }"> 
		
		<table>
			<tr><th colspan="4">댓글</th></tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="4"><textarea rows="5" cols="100"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
				<input type="submit" value="저장" name="cmd" class="bt">
				<input type="reset" value="다시쓰기" class="bt">
			</tr>
		</table>
	</form>
	
</form>
</div>
</div>
</section>
<%@ include file="footer.jsp" %> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>게시글 삭제 페이지</title>
<c:choose>
<c:when test="${param.category_num == 1}">
<link href="boardcss/boardlist.css?ver=4" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 2}">
<link href="boardcss/boardlist_over.css?ver=2" rel="stylesheet">
</c:when>
<c:when test="${param.category_num == 3}">
<link href="boardcss/boardlist_mon.css?ver=3" rel="stylesheet">
</c:when>
</c:choose>
</head>
<body>
<div class="container">
<h1>게시글 삭제</h1>
<form method="post" action="boardDelete.g">
<h3>진짜 삭제 할껴?</h3>
<input type = "hidden" value="${board.num}" name ="num">
<input type="submit" value="삭제하기">
</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots" content="no index">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>A best Video</title>
<link href="css/video.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
//리플 삭제시 여기를 타서 servlet으로 보낸다.
	$(document).on('click','.del',function(event) {
		var del = this;
		$.ajax({
			url : "reviewdelete", 
			data : "re_num=" + $(del).data("num"),
			success : function(data) {
				if(data.trim() == 1) {
					$(del).parent().parent().remove();
				}
			}
		})
		return false;
	});
//댓글 글쓰기 버튼 클릭시
	$(document).on('click','#writeReplyBtn',function(event) {
		var content = $("#re_content").val();
		var result = content.replace(/</g,'&lt;');
		result = result.replace(/>/g,'&gt;');
		
		if ($("#re_content").val().trim() == "") {
			alert("댓글을 입력하세요.");
			$("#re_content").focus();
		} else {
			$.ajax({
				url : "playreview",
				type : "post",
				data : {
					play_url : $("#play_url").val(),
					user_id : $("#user_id").val(),
					re_content : result
				},
				success : function() {
					$("#re_content").val("");
				}
			}).then(function() {
				$.ajax({
					url : "reviewlist",
					data : {
						play_url : encodeURIComponent($("#play_url").val())
					},
					dataType : "json",
					success : function(a) {
						var str = '<tr>';
						str += '<th>' + a.id + '</th><td>' + a.content + '</td><td style="width: 120px;">'+a.date
							+'<a class="del" href="#" data-num="'+a.re_num+'">[삭제]</a></td>';
						str += '</tr>';

						$('.reply tr').eq(0).before(str);
					}
				})
			})
		}
	});
// 댓글 창에서 엔터키를 입력시 입력되게 한다
	$(document).keyup(function(event) {
		var content = $("#re_content").val();
		var result = content.replace(/</g,'&lt;');
		result = result.replace(/>/g,'&gt;');
		
	    if ($("#re_content").is(":focus") && event.key == "Enter") {
	    	if ($("#re_content").val().trim() == "") {
				alert("댓글을 입력하세요.");
				$("#re_content").focus();
			} else {
				$.ajax({
					url : "playreview",
					type : "post",
					data : {
						play_url : $("#play_url").val(),
						user_id : $("#user_id").val(),
						re_content : result
					},
					success : function() {
						$("#re_content").val("");
					}
				}).then(function() {
					$.ajax({
						url : "reviewlist",
						data : {
							play_url : encodeURIComponent($("#play_url").val())
						},
						dataType : "json",
						success : function(a) {
							var str = '<tr>';
							str += '<th>' + a.id + '</th><td>' + a.content + '</td><td style="width: 120px;">'+a.date
								+'<a class="del" href="#" data-num="' + a.re_num + '">[삭제]</a></td>';
							str += '</tr>';

							$('.reply tr').eq(0).before(str);
						}
					})
				});
			}
	    }
	});
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
	<!-- 여기서 선택된 영상이 나온다 -->
		<div class="wrap2">
		<h4 style="color: white;">현재 <span style="color: red;">인기</span> 방송</h4>
			<iframe width="690" height="410"
				src="https://www.youtube.com/embed/${one.video_url}" frameborder="0"
				allow="autoplay; encrypted-media" allowfullscreen></iframe>

			<aside>
				<div class="box1">
						<ul>
						<!-- 넘어온 리스트를 출력한다 -->
					<c:forEach var="List" items="${List}">
							<li>
								<a href="liveview?link=${List.video_url}">
									<img style="width: 100%; height: auto;" src="${List.video_img}">
									<p>${List.video_title}</p>
								</a>
							</li>
					</c:forEach>
						</ul>
				</div>
			</aside>
			<!-- 랜덤선택된 동영상의 댓글창 -->
			<article class="review_box">
				<div class="input_box">
					<h3 style="color: white;">댓글</h3>
						<!-- 리플 등록창 -->
					<!-- 여기서 로그인 여부를 확인한다 -->
					<c:choose>
						<c:when test="${loginUser.nick_name eq null}">
							<input type="text" style="width: 100%"  readonly="readonly" value="로그인시 댓글 작성이 가능합니다">
						</c:when>
						<c:otherwise>
						<div class="review_input">
							<input type="hidden" id="play_url" name="play_url" value="${one.video_url}">
							<input type="text" id="user_id" name="user_id" value="${loginUser.nick_name}" disabled>
							<input type="text" id="re_content" name="re_content" maxlength="70" placeholder="댓글은 60글자 이내로 작성하세요">
							<input class="bt" type="button" id="writeReplyBtn" value="등록">
						</div>
						</c:otherwise>
					</c:choose>

				</div>
				<div id="replybox">
					<table class="reply">
						<tr></tr>
						<!-- 리플 출력하는 곳 -->
						<c:forEach var="reply" items="${replyList}">
							<tr>
								<th>${reply.user_id}</th>
								<td>${reply.re_content}</td>
								<td style="width: 120px;">${reply.reg_date}
								<c:if test="${loginUser.nick_name == reply.user_id}">
									<a class="del" href="#" data-num="${reply.re_num}">[삭제]</a>
								</c:if>
								</td>
							<tr>
						</c:forEach>
					</table>
				</div>

			</article>
		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>
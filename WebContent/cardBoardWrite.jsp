<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>Card Board</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Noto+Serif+JP|Roboto">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
<link rel="stylesheet" href="css/bootstrap-grid.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/cardBoardDetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/config.js"></script>
<script type="text/javascript" src="js/file.js"></script>
</head>
<body>
<%@ include file="header.jsp" %> 
	<section>
		<div class="wrap">
			<div class="cb-detail container">
				<form action="cardBoardWrite" method="post" class="cbWriteForm" id="cbWriteForm" enctype="multipart/form-data">
					<!-- <input type="hidden" name="command" value="board_write"/> -->
					
					<input type="hidden" value="${loginUser.email}" name="email" id="email"/>
					<input type="hidden" value="${loginUser.nick_name}" name="name" id="name"/>
					<input type="hidden" value="${loginUser.pw}" name="pw" id="pw"/>
					<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요."/>
					<textarea name="content"></textarea>
					<div class="file-drop-area">
						<span class="file-msg">이 영역을 클릭하여 파일 선택 (드래그하여 첨부 가능)</span>
						<!-- <input type="file" class="file-input" name="file" multiple="multiple"/> -->
						<input type="file" class="file-input" name="file" multiple="multiple" accept="image/gif, image/jpg, image/jpeg, image/png"/>
					</div>
					<!-- <input type="text" name="tag" id="tag" placeholder="태그는 쉼표(,)를 이용하여 구분해 주세요."/> -->
					
					<div class="btnRow">
						<input type="submit" id="submitBtn" value="작성"/>
						<a href="cardBoardList?page=${page}"><button type="button" class="whiteBtn">취소</button></a>
					</div>
					<!-- <a href="#"><i class="fas fa-bars"></i></a> -->
			</form>
			</div>
		</div>
	</section>
	
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(function(){
	/* xxs 공격 방어 */
	// 받은 입력 값 특수 문자 변환 처리
	function XFN_ChangeInputValue(pValue) {
	    var strReturenValue = "";
	    strReturenValue = pValue.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
	    return strReturenValue;
	}

	
	//textarea editor
	CKEDITOR.replace('content');
	
	$('#cbWriteForm').submit(function(){
		
		$('#title').val(XFN_ChangeInputValue($('#title').val()));
		
		CKEDITOR.instances.content.updateElement();
	});
	
	$('input[name="file"]').change(function(){
		if($(this).val().trim() != '') {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			var arr = new Array();
			var files = $(this)[0].files;
			
			for(var i = 0; i < files.length; i++) {
				arr.push(files[i].name);
			}
			
			for(var i in arr) {
				if($.inArray(arr[i].split('.').pop().toLowerCase(), ['gif', 'jpg', 'jpeg', 'png']) == -1) {
					alert('gif, jpg, jpeg, png 파일만 업로드 해 주세요.');
					$(this).val('');
					$('.file-msg').text('이 영역을 클릭하여 파일 선택 (드래그하여 첨부 가능)');
					return false;
				}
			}
			
			// 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 5120 * 5120;
			if(fileSize > maxSize) {
				alert('파일 용량 5MB를 초과하였습니다.');
				$(this).val('');
				$('.file-msg').text('이 영역을 클릭하여 파일 선택 (드래그하여 첨부 가능)');
			}
		}
	});
	
});
</script>
</body>
</html>
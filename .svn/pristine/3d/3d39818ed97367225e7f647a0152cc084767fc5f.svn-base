/**
 * 
 */

$(function(){
	var $fileInput = $('.file-input');
	/*var $droparea = $('.file-drop-area');
	
	// 드래그 할 시 css 변화 주기
	$fileInput.on('dragenter focus click', function() {
	  $droparea.addClass('is-active');
	});
	
	// 원래로 돌아갈 경우
	$fileInput.on('dragleave blur drop', function() {
	  $droparea.removeClass('is-active');
	});*/
	
	// 파일 첨부 영역 바뀔 내용
	$fileInput.on('change', function() {
	  var filesCount = $(this)[0].files.length;
	  var $textContainer = $(this).prev();
	
	  if (filesCount === 1) {
	    // 하나의 파일일 경우, 그 파일 이름 보여 주기
	    var fileName = $(this).val().split('\\').pop();
	    $textContainer.text(fileName);
	  } else {
	    // 두 개 이상의 파일일 경우, 그 개수만큼 보여 주기
	    $textContainer.text(filesCount + ' 개의 파일이 선택되었습니다.');
	  }
	});
});
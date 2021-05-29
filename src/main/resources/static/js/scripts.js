/*!
* Start Bootstrap - Landing Page v6.0.0 (https://startbootstrap.com/theme/landing-page)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-landing-page/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

/*!
* Start Bootstrap - Landing Page v6.0.0 (https://startbootstrap.com/theme/landing-page)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-landing-page/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

window.addEventListener('DOMContentLoaded', event => {

	// 공지사항 글자 수 제한
	$('#inputNoticeContent').on('keyup', function() {
		$('#inputNoticeContentCount').html("("+$(this).val().length+" / 1000)");
		if($(this).val().length > 1000) {
			$(this).val($(this).val().substring(0, 1000));
			$('#inputNoticeContentCount').html("(100 / 100)");
		}
	});
	
	// 공지사항 글자 수 제한
	$('#inputGoodContent').on('keyup', function() {
		$('#inputGoodContentCount').html("("+$(this).val().length+" / 1000)");
		if($(this).val().length > 1000) {
			$(this).val($(this).val().substring(0, 1000));
			$('#inputGoodContentCount').html("(100 / 100)");
		}
	});
});
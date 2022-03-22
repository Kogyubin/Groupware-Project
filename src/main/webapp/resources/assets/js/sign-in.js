

$(function() {
	$(".btn").click(function() {
		$(".form-signin").toggleClass("form-signin-left");
//	    $(".form-signup").toggleClass("form-signup-left");
	    $(".frame").toggleClass("frame-long");
	    $(".signup-inactive").toggleClass("signup-active");
	    $(".signin-active").toggleClass("signin-inactive");
	    $(".forgot").toggleClass("forgot-left");   
	    $(this).removeClass("idle").addClass("active");
		});
});


$(function() {
	$(".btn-signin").click(function(e) {

	  
	  e.preventDefault();
	 let id =  $("input[name='username']");
	 let pw =  $("input[name='password']");
	  
	  if(id.val()==""){
		alert("ID를 입력하세요.");
		id.focus();
		return;
	}
	  if(pw.val()==""){
		alert("PW를 입력하세요.");
		pw.focus();
		return;
	}
		$(".form-signin").attr("action", "sign-in").submit();
	});
});



	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');
	
	signUpButton.addEventListener('click', () => {
		container.classList.add("right-panel-active");
	});
	
	signInButton.addEventListener('click', () => {
		container.classList.remove("right-panel-active");
	});
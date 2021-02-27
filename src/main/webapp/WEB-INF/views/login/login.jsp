<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Login</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/jquery-validation/1.19.3/jquery.validation.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css"/>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/css.css"/>
</head>
<body>
	<div class="div-login">
		<div class="div-login-form">
			<form id="login-form">
				<div class="div-input">
					<p><label class="form-label">아이디</label></p>
					<p><input type="text" name="user_id" id="user_id" class="input-login-form"/></p>
				</div>
				<div class="div-input">
					<p><label class="form-label">패스워드</label></p>
					<p><input type="password" name="password" id="password" class="input-login-form"></p>				
				</div>			
				<div>
	    			<button type="submit" id="btn" class="btn-login-form">로그인</button>
	    		</div>
		    </form>
	    </div>
    </div>
</body>   
<script >
$(function(){
	$('input[type="text"]').keydown(function(e){
		if(e.keyCode === 13){
			e.preventDefault();
		};
	});	
	$("#btn").click(function() {
		$("#login-form").validate({
       		rules: {
       			user_id: "required",
       			password: "required"
       		},
       		messages: {
       			user_id: "아이디는 필수 입력값입니다.",
       			password: "패스워드는 필수 입력값입니다."
       		},       		
       		submitHandler: function(form){
       			var targetUrl = "/loginProcess";
           		var data = {
           			user_id: $('#user_id').val(),
           			password: $('#password').val()
           		}
           		$.ajax({
           			type: "POST",
           			url: targetUrl,
           			data: data,
           			success: function(result) {
   						if(result.success===true) {
   							sessionStorage.setItem('user_id', result.user_id);
   							alert(result.user_name + " 님 환영합니다.");
   							location.href = "/posts";
   						} 
   						else {
   							alert("아이디와 패스워드를 확인하세요.");
   						}
 					},
            		error: function(e){
            			alert("error", e);
            		}
          		});
           	}
       	});
	});
});    
</script>
  

	
	
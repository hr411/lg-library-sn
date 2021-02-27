<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Login</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/jquery-validation/1.19.3/jquery.validation.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css" />
</head>
<body>
	<h1>
		Login Page!  
	</h1>
	<div class="div-login">
		<form id="login-form">
			<div>
				<p>아이디 : <input type="text" name="user_id" id="user_id"></p>
				<p>패스워드 :<input type="password" name="password" id="password"></p>
			</div>
			<div>
    			<button type="submit" id="btn">로그인</button>
    		</div>
	    </form>
    </div>
   
<script type="text/javascript">
$(function(){
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
    $("#password").keydown(function(key) {
   		if(key.keyCode == 13) {
   			$("#btn").click();
       	}
   	});
});    
</script>
  
</body>

	
	
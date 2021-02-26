<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Login</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>
		Login Page!  
	</h1>
	<form>
		아이디 : <input type="text" name="user_id" id="user_id">
		패스워드 :<input type="password" name="password" id="password">
	     <button type="button" id="btn">로그인</button>
    </form>
    <script type="text/javascript">
        $(function() {
            $("#btn").on("click", function() {
            	var targetUrl = "/loginProcess";
            	var data = {
            		user_id: $('#user_id').val(),
            		password: $('#password').val(),
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
            });            
        });
     </script>
  
</body>

	
	
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Post Update</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/jquery-validation/1.19.3/jquery.validation.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css"/>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/css.css"/>
</head>
<body>
	<h1>
		Post Update  
	</h1>
	<div class="div-post">
		<form id="post-form">
			<div class="div-input">
				<input type="hidden" value="${resultpostVO.post_no}" id="post_no"/>
				<label class="form-label" >제목</label>
				<p><input type="text" name="title" id="title" class="input-post-form" value="${resultpostVO.title}"></p>
			</div>
			<div class="div-textarea">
				<label class="form-label">내용</label>
				<p><textarea name="content" id="content">${resultpostVO.content}</textarea></p>
			</div>
			<div>
				<button type="submit" id="update">수정</button>
				<button type="button" id="list" onclick="location.href='/posts/${resultpostVO.post_no}'">취소</button>			
			</div>	
		</form>
	</div>
<script>
$(function() {
	$('input[type="text"]').keydown(function(e){
		if(e.keyCode === 13){
			e.preventDefault();
		};
	});	
	$("#update").on("click", function() {
		$("#post-form").validate({
       		rules: {
       			title: "required",
       			content: "required"
     		},
       		messages: {
       			title: "제목은 필수 입력값입니다.",
       			content: "내용은 필수 입력값입니다."
       		},
       		submitHandler: function(form){
       			var targetUrl = "/postUpdateProcess/" + $('#post_no').val();	
           		var data = {
           			title: $("#title").val(),
           			content: $("#content").val(),
           		}
           		$.ajax({
            		type: "PUT",
            		url: targetUrl,
            		contentType: "application/json;charset=UTF-8",
            		data: JSON.stringify(data),
            		success: function(result) {
	   					if(result.success===true) {
	   						alert("수정되었습니다.");
	   						location.href = "/posts";
	   					} 
	   					else {
	   						alert("수정되지 않았습니다.");
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
  
</body>

	
	
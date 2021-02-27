<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Post Create</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/jquery-validation/1.19.3/jquery.validation.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css"/>
</head>
<body>
	<h1>
		글쓰기 
	</h1>
	<div class="div-post">
		<form id="post-form">	
			<div>
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea type="text" name="content" id="content"></textarea></td>
					</tr>
				</table>
			</div>
			<div>
				<button type="submit" id="save">저장</button>
			</div>
		</form>
	</div>	

<script type="text/javascript">
$(function() {
	$("#save").on("click", function() {	
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
     			var targetUrl = "/postCreateProcess";
         		var data = {
            		title: $("#title").val(),
            		content: $("#content").val(),
            		user_id: sessionStorage.getItem('user_id')
            	}
            	$.ajax({
            		type: "POST",
            		url: targetUrl,
            		data: data,
            		success: function(result) {
	   					if(result.success===true) {
	   						alert("저장되었습니다.");
	   						location.href = "/posts";
	   					} 
	   					else {
	   						alert("저장되지 않았습니다.");
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

	
	
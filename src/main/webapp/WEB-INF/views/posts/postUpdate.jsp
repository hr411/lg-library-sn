<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Post Update</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/jquery-validation/1.19.3/jquery.validation.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css" />
</head>
<body>
	<h1>
		Post Update!  
	</h1>
	<div class="div-post">
		<form id="post-form">
			<div>
				<input type="hidden" value="${resultpostVO.post_no}" id="post_no"/>
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title" value="${resultpostVO.title}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea type="text" name="content" id="content">${resultpostVO.content}</textarea></td>
					</tr>
				</table>
			</div>
			<div>
				<button type="button" id="list" onclick="location.href='/posts/${resultpostVO.post_no}'">취소</button>
				<button type="submit" id="update">수정</button>
			</div>	
		<form>
	</div>
<script type="text/javascript">
$(function() {
	$("#update").on("click", function() {
		console.log("111");
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

	
	
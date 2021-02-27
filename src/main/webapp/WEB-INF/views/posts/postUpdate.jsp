<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Post Update</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css" />
</head>
<body>
	<h1>
		Post Update!  
	</h1>
	<input type="hidden" value="${resultpostVO.post_no}" id="post_no"/>
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title" value="${resultpostVO.title}"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" id="content" value="${resultpostVO.content}"></td>
		</tr>
		
	</table>
	<tr>
		<button type="button" id="list" onclick="location.href='/posts/${resultpostVO.post_no}'">취소</button>
		<button type="button" id="update">수정</button>
	</tr>

    <script type="text/javascript">
        $(function() {
         $("#update").on("click", function() {
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
            });                                        
        });
     </script>
  
</body>

	
	
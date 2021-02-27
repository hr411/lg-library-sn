<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Post Create</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css" />
</head>
<body>
	<h1>
		글쓰기 
	</h1>
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" id="content"></td>
		</tr>
		
	</table>
	<button type="button" id="save">저장</button>

    <script type="text/javascript">
        $(function() {
            $("#save").on("click", function() {
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
            });                    
        });
     </script>
  
</body>

	
	
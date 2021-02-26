<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Post Info</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>
		Post Info!  
	</h1>
	<input type="hidden" value="${resultpostVO.post_no}" id="post_no"/>
	<table>
		<tr>
			<td>제목</td>
			<td>${resultpostVO.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${resultpostVO.content}</td>
		</tr>
		
	</table>
	<tr>
		<button type="button" id="list" onclick="location.href='/posts'">목록</button>
		<button type="button" id="del">삭제</button>
	</tr>

    <script type="text/javascript">
         $(function() {
            $("#del").on("click", function() {
            	var targetUrl = "/postDeleteProcess/" + $('#post_no').val();	
            	$.ajax({
            		type: "DELETE",
            		url: targetUrl,
            		success: function(result) {
	   					if(result.success===true) {
	   						alert("삭제되었습니다.");
	   						location.href = "/posts";
	   					} 
	   					else {
	   						alert("삭제되지 않았습니다.");
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

	
	
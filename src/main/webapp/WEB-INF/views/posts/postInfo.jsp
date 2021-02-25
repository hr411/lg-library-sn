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
		<button type="button" id="btn" onclick="location.href='/posts'">목록</button>
	</tr>

    <script type="text/javascript">
        $(function() {
            $("#btn").on("click", function() {
            	            
        });
     </script>
  
</body>

	
	
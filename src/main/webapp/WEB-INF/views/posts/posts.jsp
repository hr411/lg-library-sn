<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Posts</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>
		Posts Page!  
	</h1>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일시</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(resultpostsVO) == 0}">
			<tr>
				<td colspan="4">내용이 없습니다.</td>
			<tr>
		</c:if>
		<c:forEach var="post" items="${resultpostsVO}" varStatus="status">	
			<tr>
				<td>${post.post_no}</td>
				<td>${post.user_id}</td>
				<td>${post.title}</td>
				<td>${post.created_at}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<form>
	
    </form>
    <script type="text/javascript">
        $(function() {
            $("#btn").on("click", function() {
            	            
        });
     </script>
  
</body>

	
	
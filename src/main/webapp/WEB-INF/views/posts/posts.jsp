<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Posts</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css"/>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/css.css"/>
</head>
<body>
	<h1>
		Posts
	</h1>
	<table class="posts">
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
				<td><a href="posts/${post.post_no}">${post.title}</a></td>
				<td>${post.created_at}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
		<button type="button" id="btn" onclick="location.href='/postCreate'">글쓰기</button>
		<button type="button" id="logout" onclick="doLogout()">로그아웃</button>
	</div>
</body>
<script>
function doLogout() {
	alert('로그아웃합니다.');
	location.href='/logout';
}
</script>

	
	
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Post Info</title>
	<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/reset.css"/>
	<link type="text/css" rel="stylesheet" media="screen" href="/resources/css/css.css"/>
</head>
<body>
	<h1>
		Post Info!  
	</h1>
	<input type="hidden" value="${resultpostVO.post_no}" id="post_no"/>
	<input type="hidden" value="${resultpostVO.user_id }" id="user_id"/>
		<label class="form-label">제목</lable>
		<p><class="input-post-form>${resultpostVO.title}</p>
		<label class="form-label">내용</lable>
		<p>${resultpostVO.content}</p>
		</tr>
		
	</table>
	<div>
		<button type="button" id="list" onclick="location.href='/posts'">목록</button>
		<div id="user-own-post">
			<button type="button" id="del">삭제</button>
			<button type="button" id="update" onclick="location.href='/postUpdate/${resultpostVO.post_no}'">수정</button>
		</div>
	</div>
</body>
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
	if(sessionStorage.getItem("user_id") === $("#user_id").val()) {
      	$("#user-own-post").css('display', 'inline-block')
    } 
    else {
        $("#user-own-post").css('display', 'none')
    }
});
</script>

	
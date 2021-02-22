<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p> UserId : <input type='text' id='user_id'/> </p>
<button type = "button" onclick="getLoginInfo()">Login</button>
</body>
<script>
function getLoginInfo() {
	var searchUserElem = document.getElementById('user_id');
	console.log(searchUserElem.value);
	var user_id = searchUserElem.value;
	location.href="/login?user_id=" + user_id;
}
	</script>
</html>

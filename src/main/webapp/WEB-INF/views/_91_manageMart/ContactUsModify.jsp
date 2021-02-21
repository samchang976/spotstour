<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>編輯聯絡我們</title>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="font.css">
<style>
body {
	text-align: center;
}

#form {
	margin: 50px auto;
	padding: 20px;
	text-align: left;
	border: 1px solid #cccccc;
	width: 500px;
	height: 600px;
}

div {
	margin-bottom: 5px;
}

input {
	width: 98%;
}

#message {
	padding-bottom: 200px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/header.jsp" />
	<div id="form">
		<div>
			<div>姓名:</div>
			<label for="name"> </label> <input type="text" name="name" id="name">
		</div>
		<div>
			<div>連絡電話:</div>
			<label for="phone"> </label> <input type="text" name="phone"
				id="phone">
		</div>
		<div>
			<div>Email:</div>
			<label for="email"> </label> <input type="email" name="emailadd"
				id="email">
		</div>
		<div>
			<div>訊息:</div>
			<label for="message"> </label> <input type="text" name="message"
				id="message">
		</div>
		<button style="margin-top: 15px; width: 60px;">送出</button>
	</div>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />
</body>
</html>
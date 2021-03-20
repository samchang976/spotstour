<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags------------------------------------------------------------------------------------- -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS ----------------------------------------------------------------------------------------- -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn----------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<!-- css連結------------------------------------------------------------------------------------------------ -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilFont.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/utilColor.css'></c:url>">


<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallColor.css'></c:url>">

<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallFont.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->

<title>聯絡我們</title>
<link rel="stylesheet" href="button.css">
<link rel="stylesheet" href="font.css">
<style>
body {
	text-align: center;
}

#form {
	margin: 50px auto;
	/* 	padding: 20px; */
	text-align: left;
	/* 	border: 1px solid #cccccc; */
	width: 500px;
	/* 	height: 1000px; */
}

/* div { */
/* 	margin-bottom: 5px; */
/* } */
input {
	width: 98%;
}

/* #message { */
/* 	padding-bottom: 200px; */
/* } */
</style>
</head>
<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->

		<div class="container">
			<div id="form">
				<div style="text-align: center;">
					<h2>聯絡我們</h2>
				</div>
				<div class="shadow p-5 mb-5 bg-body rounded">
					<div>
						<div>
							<label for="name">姓名:</label> <input type="text" name="name"
								class="form-control" id="name">
						</div>
						<br>
						<div>
							<label for="phone">連絡電話:</label> <input type="text" name="phone"
								class="form-control" id="phone">
						</div>
						<br>
						<div>
							<label for="email">Email:</label> <input type="email"
								class="form-control" name="emailadd" id="email">
						</div>
						<br>
						<div>
							<label for="message">訊息:</label> <input type="text"
								style="height: 250px;" class="form-control" name="message"
								id="message">
						</div>
						<br>
					</div>
				</div>
				<div style="text-align: center;">
					<button class="btn btn-primary">送出</button>
				</div>
			</div>
		</div>
		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->
</body>
</html>

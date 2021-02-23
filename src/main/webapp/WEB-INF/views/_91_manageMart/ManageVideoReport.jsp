<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="button.css">

<title>管理影片檢舉</title>

<style>
body {
	text-align: center;
	font-size: 20px;
}

.container {
	text-align: center;
}

.row {
	margin-bottom: 10px;
}

.video {
	max-width: 200px;
	min-width: 80px;
}

.first {
	text-align: center;
}

.col-3-2 {
	text-align: left;
}

button { /*按鈕的樣式*/
	padding: 10px;
	color: rgb(24, 24, 168);
	border: 1px rgb(24, 24, 168) solid;
	background-color: rgb(245, 241, 242);
	border-radius: 5px;
	float: left;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col">
				<div>
					<button>全選</button>
				</div>
			</div>

		</div>
	</div>


	<br>
	<div class="container">

		<div class="row">
			<div class="col first">
				<input class="form-check-input" type="checkbox" id="checkboxNoLabel"
					value="" aria-label="...">
			</div>

			<div class="col col-2-2">
				<br>
				<div>影片編號:A1001</div>
				<br> <br> <input type="video" id="video"></input>
			</div>



			<div class="col col-3-2">
				<br>
				<div>檢舉人:</div>
				<br>
				<div>檢舉編號:</div>
			</div>

			<div class="col col-4-2">
				<br>
				<div>檢舉內容:</div>
				<input type="text" style="height: 150px; width: 250px;"><br>
			</div>


			<div class="col col-5-2">
				<br>
				<div>
					<input type="button" value="確認檢舉內容">
				</div>
				<br>
				<div>
					<input type="button" value="略過檢舉內容">
				</div>
			</div>
		</div>
		<br>
	</div>
	<hr>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
	<div class="container">
		<!--上方-->
		<div class="row">
			<!--搜尋結果-->
			<div class="col-2">
				
			</div>
			<!--按鈕  -->
			<div class="col">
				<select class="form-select" aria-label="Default select example">
					<option selected>選擇排序方式</option>
					<option value="time">依時間</option>
					<option value="look">依觀看數次數</option>
					<option value="good">依按讚數</option>
				</select>
			</div>
			<!-- 搜尋 -->
			<div class="col">
				<form class="d-flex" action="SearchResult" method="get">
					<input class="form-control me-2" type="text" name="searchWord"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
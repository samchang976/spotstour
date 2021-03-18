<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>search</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<style>
#container_search {
/* 	margin-bottom: 20px; */
font-size: 25px;
}
#container_search ul li{
list-style-type:none;
}

#want {
	font-size: 25px;
	width:20%;
}

</style>
</head>
<body>

	<div class="container" id="container_search">
		<div class="row">
			<div class="col-5">
				<span id="want">想買什麼?</span>
				<div style="display: inline-flex;  width:60%; ">
					<form class="input-group mb-3"action="${pageContext.request.contextPath}/merchandiseSearchResult" method="get">
						<input class="form-control" type="search" name="searchWord"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-secondary" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>

<%-- 					<form class="d-flex" action="${pageContext.request.contextPath}/merchandiseSearchResult" method="get"> --%>
<!-- 						<input class="form-control me-2" type="search" name="searchWord" -->
<!-- 							placeholder="Search" aria-label="Search"> -->
<!-- 						<button class="btn btn-outline-success" type="submit"> -->
<!-- 							<i class="fas fa-search"></i> -->
<!-- 						</button> -->
<%-- 					</form> --%>

				</div>
			</div>
			<div class="col-7" id="latestNews">
				<ul>
					<li>spots-tour全館85折!!</li>
					<li>快來買喔喔喔喔~</li>
					<li>很便宜~</li>
				</ul>
			</div>

		</div>

	</div>


	<script src="<c:url value='/_00_util/shoppingMallUtil/javascript/marquee.js'></c:url>"></script>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

</body>
</html>
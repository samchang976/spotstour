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
<title>商城首頁</title>
</head>

<body>
	<!--header--------------------------------------------------------------------------->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!-- 搜尋 ----------------------------------------------------------------------------->
		<jsp:include
			page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/search.jsp" />
		<!------------------------------------------------------------------------------------------->

		<!-- 活動快訊 ---------------------------------------------------------------------------->
		<div class="container" id="container_news">
			<div class="col">
				<button class="btn btn-primary btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/merchandiseSearchResult'">查看所有商品</button>
			</div>
			<br>
			<div class="shadow p-3 mb-5 bg-body rounded">
				<div class="row row-cols-1 newsBlock">
					<div class="col">
						<div class="overflow-scroll" style="height: 350px;">
							<div id="newsTitle">活動快訊</div>

							<c:forEach var='activity' items='${activitys}'>
								<div class="block"
									onclick="location.href='${pageContext.request.contextPath}/activityDetail/Id=${activity.activityId}'">
									<!-- 											日期 -->
									<span class="date">${activity.activity_createTime}</span>
									<!-- 											優惠標頭 -->
									<span class="discount">${activity.activityHeader}</span>
									<!-- 											優惠內容 -->
									<span class="discount">${activity.activityContent}</span>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
			<!-- 地區搜尋 ----------------------------------------------------------------------------->
			<div class="row row-cols-1 row-cols-md-4">
				<c:forEach var='country' items='${countrys}'>
					<div class="col area_search my-3"
						onclick="location.href=
                        'merchandiseSearchResult/Id=${country.countryId}'">



						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							alt="area">




						<div class="mask">
							<h2 id="countryName">${country.countryName}</h2>
						</div>
					</div>


					<!-- 					<div class="col-12 area_search" -->
					<!-- 						onclick="location.href= -->
					<!--                         'MerchandiseSearchResult'"> -->

					<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
					<!-- 							alt="area"> -->

					<!-- 						<div class="mask"> -->
					<!-- 							<h2>韓國</h2> -->
					<!-- 						</div> -->
					<!-- 					</div> -->

					<!-- 					<div class="col-12 area_search" -->
					<!-- 						onclick="location.href= -->
					<!--                         'MerchandiseSearchResult'"> -->
					<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
					<!-- 							alt="area"> -->

					<!-- 						<div class="mask"> -->
					<!-- 							<h2>韓國</h2> -->
					<!-- 						</div> -->
					<!-- 					</div> -->

					<!-- 					<div class="col-12 area_search" -->
					<!-- 						onclick="location.href= -->
					<!--                         'MerchandiseSearchResult'"> -->
					<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
					<!-- 							alt="area"> -->


					<!-- 						<div class="mask"> -->
					<!-- 							<h2>韓國</h2> -->
					<!-- 						</div> -->
					<!-- 					</div> -->

					<!-- -------------------------------------------------------------------------------------- -->


				</c:forEach>
			</div>
		</div>

		<!-----------定位----------------------------------------------------------------------------->
	</div>

	<!------------------------------------------------------------------------------------------->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>

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

<title>關於我們</title>
<style>
.value {
	font-size: 48px;
	color: #2d64b7;
	margin: 20px;
}

.text {
	display: block;
	text-align: center;
	font: sans-serif;
	color: #272727;
	font-size: 13px;
}

.item {
	display: inline-block;
}

.content {
	width: 650px;
	display: inline-block;
	font-family: sans-serif;
}

.circle {
	margin: 10px auto;
	/* 	padding:30px 0px; */
	width: 150px;
	line-height: 150px;
	border-radius: 50%;
	background-color: rgb(136, 133, 133, 0.5);
	border: 1px solid rgb(136, 133, 133, 0.2);
}

#AboutUs {
	text-align: center;
	min-height: 800px;
	font-size: 1.5rem;
}

#AboutUs img {
	border-bottom-left-radius: 20px;
	border-top-right-radius: 50px;
	opacity: 0.9;
	/* box-shadow:0em 0.1em 0.2em rgb(0, 0, 0,0.3); */
}

.row {
	display: flex;
	text-align: center;
	align-items: center;
}

.colleft {
	text-align: left;
}
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
		<div class="container" id="AboutUs">
			<div style="text-align: center;">
				<h2>關於我們</h2>
			</div>
			<div class="row" style="margin: 3rem 0px;">
				<div class="col-7 colleft"></div>
			</div>


			<div class="row">
				<div class="col-6">
					<img alt="" class="w-100"
						src="<c:url value='/images/aboutus\leon-seibert-ijXcrwcQACc-unsplash.jpg'></c:url>">
				</div>
				<div class="col-6 colleft">
					<!-- 				<div class="circle">會員</div> -->
					<div>
						在疫情影響下，你是否也被突如奇來的疫情<br> 打亂原本的旅遊計畫呢？<br>
						許多想朝聖或一訪再訪參觀的景點卻只能<br> 看著過去的照片懷念，<br>
						感嘆沒有好好保握可以說走就走逃離壓力生活的時光?<br> 讓SPOTS-TOUR帶大家一起環遊世界！<br>
						SPOTS-TOUR打造一個景點共享平台，<br> 即時提供關於當地旅遊勝地的影片，<br>
						提供使用者真實的體驗，彷彿身處在現場。<br> 就算無法到達當地，也讓你身歷其境，美景盡收眼底！<br>


					</div>
				</div>

				<div class="row" style="margin: 3rem 0px;">
					<div class="col-7 colleft"></div>
				</div>

				<div class="row">
					<div class="col-6 colleft">
						<div>
							<h3>
								<b>觀賞影片</b>
							</h3>
							<br> spots-tourer們可以即時分享各個景點資訊，<br> 記錄自己的拍攝影作品，也可以評論或收藏<br>
							別人的分享的景點資訊。<br> 方便的搜尋方式讓tourer們可以快速<br> 找到想瀏覽的景點影片、<br>
							資訊以及景點瀏覽紀錄。<br>
						</div>
					</div>
					<div class="col-6">
						<!-- 				<div class="circle">影片</div> -->
						<img alt="" class="w-100"
							src="<c:url value='/images/aboutus/chris-lawton-LarvHiXifpA-unsplash.jpg'></c:url>">
					</div>
				</div>

				<div class="row" style="margin: 3rem 0px;">
					<div class="col-7 colleft"></div>
				</div>

				<div class="row">
					<div class="col-6">
						<!-- 				<div class="circle">代購商城</div> -->
						<img alt="" class="w-100"
							src="<c:url value='/images/aboutus/tamanna-rumee-eD1RNYzzUxc-unsplash.jpg'></c:url>">
					</div>
					<div class="col-6 colleft">
						<div>
							<h3>
								<b>代購商城</b>
							</h3>
							<br> 想買購買國內買不到其他國家的特色商品嗎?<br> 我們提供代購的服務，<br>收集來自世界各地的食品、生活家居、<br>美妝保養、家電3C以及服飾配件等商品<br>來滿足大家旺盛的購物需求!<br>
						</div>
					</div>
				</div>

				<div class="row" style="margin: 3rem 0px;">
					<div class="col-7 colleft"></div>
				</div>
			</div>

			<h3>
				<b>聯絡我們</b>
			</h3>
			<p></p>

			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.7432711166744!2d121.53559291540047!3d25.04278514409238!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a97d255598df%3A0x47ea748e8f3f53aa!2z5ZyL56uL6Ie65YyX56eR5oqA5aSn5a24!5e0!3m2!1szh-TW!2stw!4v1616413058663!5m2!1szh-TW!2stw"
				width="100%" height="500px" style="border: 0;" allowfullscreen=""
				loading="lazy"></iframe>
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

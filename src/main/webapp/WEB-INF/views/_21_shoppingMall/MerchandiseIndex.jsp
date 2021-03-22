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
<!-- animation --------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
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
<style>
.itemName {
	height: 70px;
	text-align: center;
}

.addcart {
	width: 100%;
	background-color: rgba(177, 112, 82, 0.3);
}

.addcart:hover {
	/* background: url(./download.jpg) center; */
	/* background-size: cover; */
	background-color: rgba(177, 112, 82, 0.9);
	color: white;
}

.imageFrame {
	height: 300px; /*can be anything*/
	width: 300px; /*can be anything*/
	position: relative;
	overflow: hidden;
}

.imageFrameSide {
	height: 200px; /*can be anything*/
	width: 200px; /*can be anything*/
	position: relative;
	overflow: hidden;
}

.imageFrame .img, .imageFrameSide .img {
	transform: scale(1, 1);
	transition: all 0.5s ease-out;
}

.imageFrame .img:hover, .imageFrameSide .img:hover {
	transform: scale(1.5, 1.5);
}

.img {
	max-height: 100%;
	max-width: 100%;
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}

#hot{
	display:inline-block;
	padding: 0px 5px; 
	border-radius: 15px;
	background: Orange;
	color: white;
}

.area{
font-size: 1.5rem;
padding: 5px;
}

.area:hover {
	color: Orange;
	cursor: pointer;
}

</style>
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
		<!-- 側邊購物車--------------------------------------------------------------------------------------- -->
		<jsp:include page="/WEB-INF/views/_21_shoppingMall/SideShoppingCart.jsp"></jsp:include>

		<!-- 活動快訊 ---------------------------------------------------------------------------->
		<div class="container" id="container_news">
			<!--查看所有商品------------------------------------------------------------------------ -->
			<div class="row" >
				<div class="col" style="display:flex; align-items: center;">
					<button class="btn btn-primary btn-lg"
						onclick="location.href='${pageContext.request.contextPath}/merchandiseSearchResult'">來去逛逛</button>
					<div class="d-inline-block area">美國</div>
					<div class="d-inline-block area">日本</div>
					<div class="d-inline-block area">泰國</div>
					<div class="d-inline-block area">韓國</div>
					<div class="d-inline-block area">香港</div>
				</div>
			</div>
			<!--活動快訊 ------------------------------------------------------------------------------>
			<div
				class="row row-cols-1 newsBlock bg-body overflow-auto rounded my-3 mb-5 p-4 shadow">
				<div class="col">
					<div id="newsTitle">活動快訊</div>
					<c:forEach var='activity' items='${activitys}'>
						<div class="block"
							onclick="location.href='${pageContext.request.contextPath}/activityDetail/Id=${activity.activityId}'">
							<!--日期---------------------------------------------- -->
							<span class="date">${activity.activity_createTime}</span>
							<!--優惠標頭-------------------------------------------- -->
							<span class="discount">${activity.activityHeader}</span>
							<!--優惠內容 ---------------------------------------------->
							<span class="discount">${activity.activityContent}</span>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 地區搜尋 ----------------------------------------------------------------------------->
<!-- 			<div class="row row-cols-1 row-cols-md-4"> -->
			<div class="row row-cols-auto">
				<c:forEach var='country' items='${countrys}'>
<!-- 					<div class="col"> -->
						<div class="area_search my-1"
							onclick="location.href=
			 	                        'merchandiseSearchResult/Id=${country.countryId}'">

							<!-- 			 							<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"  -->
							<!-- 											alt="area"> -->

<!-- 							<div class="mask"> -->
<!-- 								<h2 id="countryName"> -->
								${country.countryName}
<!-- 								</h2> -->
<!-- 							</div> -->
						</div>
<!-- 					</div> -->
				</c:forEach>
			</div>
			<!-- 商品搜尋 ----------------------------------------------------------------------------->
			<div id="topItemsTitle" style="text-align: left;" class="my-4">
				
				<div id="hot" >Hot</div>
				<h2 style="display:inline-block;" >熱賣商品</h2>
			</div>
			
			<div class="row row-cols-1 row-cols-md-4 g-3">
				<c:forEach var='item' items='${items}'>
					<div class="col">
						<div data-aos="zoom-out-down">

							<div class="card">
								<div class="itemImageBorder">
									<!-- 							圖片輪播 -->
									<div id="carouselExampleControls${item.itemId}"
										class="carousel slide" data-bs-ride="carousel">
										<div class="carousel-inner">
											<div class="carousel-item active">
												<div class="imageFrame">
													<img class="img" src="/upload/${item.itemPic1}"
														class="d-block w-100" alt="...">
												</div>
											</div>
											<div class="carousel-item">
												<div class="imageFrame">
													<img class="img" src="/upload/${item.itemPic2}"
														class="d-block w-100" alt="...">
												</div>
											</div>
											<div class="carousel-item">
												<div class="imageFrame">
													<img class="img" src="/upload/${item.itemPic3}"
														class="d-block w-100" alt="...">
												</div>
											</div>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleControls${item.itemId}"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleControls${item.itemId}"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>


								</div>

								<div class="itemName ">
									<a href="<c:url value="/merchandiseDetail/Id=${item.itemId}"/>">
										<img class="w-100"> ${item.itemHeader}
									</a>
								</div>
								<%-- 								<div class="itemPrice">價格 : ${item.itemPrice}元</div> --%>
								<!-- 								<div class="countryName">產地 -->
								<%-- 									:${item.countryBean.countryName}</div> --%>
								<!-- 								<div class="itemType">商品類別 : -->
								<%-- 									${item.item_typeBean.itemType}</div> --%>
								<%-- 								<c:choose> --%>
								<%-- 									<c:when test="${mPid==2||mPid==1}"> --%>
								<!-- 										<div class="animate__animated animate__bounce"> -->


								<%-- 											<form --%>
								<%-- 												action="${pageContext.request.contextPath}/shoppingCart/add/${item.itemId}" --%>
								<%-- 												method="post"> --%>
								<!-- 												<button type="button" onclick="this.form.submit()" -->
								<!-- 													class="btn addcart"> -->
								<!-- 													<i class="fas fa-cart-arrow-down addButton"></i> 加入購物車 -->
								<!-- 												</button> -->
								<%-- 											</form> --%>
								<!-- 										</div> -->
								<%-- 									</c:when> --%>

								<%-- 									<c:otherwise> --%>
								<!-- 										<div class="animate__animated animate__bounce"> -->
								<%-- 											<form name="form${item.itemId}"> --%>
								<!-- 												<input type="hidden" name="itemQty"> -->
								<!-- 												<button type="button" -->
								<%-- 													onclick=" --%>
								<%-- 									chackcartitem(${item.itemId})" --%>
								<!-- 													class="btn addcart"> -->
								<!-- 													加入購物車 -->
								<!-- 																							<i class="fas fa-cart-arrow-down addButton"></i> -->
								<!-- 												</button> -->
								<%-- 											</form> --%>
								<!-- 										</div> -->
								<%-- 									</c:otherwise> --%>
								<%-- 								</c:choose> --%>

							</div>
						</div>
					</div>

				</c:forEach>
				<!-- ======================================================================================================= -->

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
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
</body>
</html>

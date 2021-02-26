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
	href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>">

<link rel="stylesheet" href="../css/button.css">
<link rel="stylesheet" href="../css/04_.css">
<title>商品詳細</title>

</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>

	<!-- 搜尋 ----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<jsp:include
			page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/search.jsp" />

		<!--  -->
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-6">
					<img src="https://fakeimg.pl/350x250/?text=World&font=lobster"
						class="w-100">
				</div>
				<div class="col-12 col-md-6">
					泰國-餅乾泡麵<br> 售價 : $80<br> 已售出個數 :24個<br> 代購國家 : 國家<br>
					款式資訊 : 辣味 | 原味 | 洋蔥 | 起司 <br>

					<button id="like" class="Bt_black">加入收藏</button>
					<button id="saleType" class="Bt_black">完售</button>

					<br> 付款方式 : 現金付款 寄送方式 : 郵局、ezShip店到店(全家/萊爾富/OK)
				</div>

			</div>
		</div>

		<!-- 下方 -->
		<div class="container marginTop20">
			<div class="row">
				<div class="col-12">
					<button>商品描述</button>
					<button>費用&寄送資訊</button>
					<button>問與答 (7)</button>
				</div>
				<!--  -->
				<div class="col-12">
					<div class="content">
						<span class="title"> 泰國-餅乾泡麵 </span>
						<!-- 商品圖片 -->
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">
						<div>內文................................................................
							........................................................................
							.......................................................................
							........................................................................</div>
					</div>

					<!-- 加入購物車 -->
					<div class="col-12 col-md-3">
						<div class="input-group marginTop20">
							<select class="form-select" id="inputGroupSelect04"
								aria-label="Example select with button addon">
								<option selected>請選擇商品數量</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
							<button class="btn btn-outline-secondary" type="button"
								onclick="window.open('ShoppingCart')">加入購物車</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--內嵌footer  -->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>

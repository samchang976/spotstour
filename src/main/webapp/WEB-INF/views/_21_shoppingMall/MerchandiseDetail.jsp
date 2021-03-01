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
<!-- --------------------------------------------------------------------------------------------------------->

<title>商品詳細</title>

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

		<div class="container" id="container_MerchandiseDetail">
			<!-- 上方 ------------------------------------------------------------------------------------>
			<form:form method='POST' modelAttribute='itemBean'>
				<div class="row above">
					<div class="col-12 col-md-6">
						<img src="https://fakeimg.pl/350x250/?text=World&font=lobster"
							class="w-100">
					</div>
					<div class="col-12 col-md-6">
						${itemBean.itemHeader}<br> 售價 : ${itemBean.itemPrice}<br>
						已售出個數 :24個<br> 代購國家 : ${itemBean.countryBean.countryName}<br>
						款式資訊 : 辣味 | 原味 | 洋蔥 | 起司 <br>

						<button id="like" class="Bt_black">加入收藏</button>
						<button id="saleType" class="Bt_black">完售</button>

						<br> 付款方式 : 現金付款<br>
						<form:form method='POST' modelAttribute='ordBean'>
							<form:select path="shipTypeTId" class="custom-select">
								<form:option value="-1" label="請選擇寄送方式" />
								<form:options items="${ship_TypeMap}" />
							</form:select>
							<br>
							<form:select path="receiptTypeTId" class="custom-select">
								<form:option value="-1" label="請選擇發票型式" />
								<form:options items="${receipt_TypeMap}" />
							</form:select>
						</form:form>
					</div>
				</div>
			</form:form>

			<!-- 下方 ----------------------------------------------------------------------------------->
			<%-- 購買資訊分頁的按鈕-------------------------------------------------------------------  --%>
			<div class="row AboutPurchaseInformation">
				<div class="col-12">
					<div id="ProductDescription">商品描述</div>
					<div id="Purchase">費用&寄送資訊</div>
					<div id="QA">問與答 (7)</div>
				</div>
			</div>

			<%-- 商品資訊------------------------------------------------------- -----------------------%>
			<div class="row">
				<div class="col-12">
					<div class="ItemInformationContent">
						<span class="title"> ${itemBean.itemHeader} </span>
						<!-- 商品圖片-------------------------------------------------------- -->
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
							class="w-100">

						<!-- 商品敘述-------------------------------------------------------- -->
						<div>${itemBean.itemDes}</div>
					</div>
				</div>
				<!-- 加入購物車 --------------------------------------------------------------------------------->
				<div class="row">
					<div class="col-12">
						<select class="form-select"
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

		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>

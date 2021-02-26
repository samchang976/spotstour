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
<link rel="stylesheet" href="../css/10_.css">
<title>訂單明細</title>
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<div class="container">
		<!--訂單編號  -->
		<div class="row">
			<div class="col-12">
				<!-- 訂單編號區塊 -->
				<div class="orderNumber">
					<span>訂單編號 : </span><span>FSWE1233245</span> <span>訂購時間 :</span><span>2021/01/12</span>
				</div>
			</div>
		</div>

		<!-- 欄位敘述 -->
		<div class="row">
			<div class="col-4 fieldDescription_10">
				<div>商品名稱</div>
			</div>
			<div class="col-1 fieldDescription_10">數量</div>
			<div class="col-1 fieldDescription_10">單價</div>
			<div class="col-1 fieldDescription_10">小計</div>
		</div>
		<!-- 商品清單 -->
		<!-- 第一列 -->
		<div class="row W-SuOdIt">
			<!-- 商品照片 -->
			<div class="col-2 ">
				<img src="https://fakeimg.pl/350x350/?text=World&font=lobster">
				<i class="fas fa-search"></i>
			</div>

			<div class="col-2 ">
				<div>
					日本代購-<br>海苔天婦羅餅乾
				</div>
			</div>
			<!--數量  -->
			<div class="col-1 ">
				<div>
					<div>1</div>
				</div>
			</div>
			<!-- 單價 -->
			<div class="col-1 ">$135</div>
			<!-- 小計 -->
			<div class="col-1 ">$135</div>
		</div>

		<!--第二列  -->
		<div class="row W-SuOdIt">
			<!-- 商品照片 -->
			<div class="col-2 ">
				<img src="https://fakeimg.pl/350x350/?text=World&font=lobster">
				<i class="fas fa-search"></i>

			</div>

			<div class="col-2 ">
				<div>
					日本代購-<br>海苔天婦羅餅乾
				</div>
			</div>
			<!--數量  -->
			<div class="col-1 ">
				<div>
					<div>1</div>
				</div>
			</div>
			<!-- 單價 -->
			<div class="col-1 ">$135</div>
			<!-- 小計 -->
			<div class="col-1 ">$135</div>
		</div>

		<!-- 第三列 -->
		<div class="row W-SuOdIt">
			<!-- 商品照片 -->
			<div class="col-2 ">
				<img src="https://fakeimg.pl/350x350/?text=World&font=lobster">
				<i class="fas fa-search"></i>

			</div>

			<div class="col-2">
				<div>
					日本代購-<br>海苔天婦羅餅乾
				</div>
			</div>
			<!--數量  -->
			<div class="col-1">
				<div>
					<div>1</div>
				</div>
			</div>
			<!-- 單價 -->
			<div class="col-1">$135</div>
			<!-- 小計 -->
			<div class="col-1">$135</div>
		</div>
		<!-- 總金額 -->

		<div class="Total">
			<div class="subtotalBlock_10">
				共<span id="items">3</span>商品，總金額 : <span id="subtotal">405</span>元
			</div>
		</div>

		<!-- 回商城首頁 -->
		<div class="col">
			<button class="Bt_black "
				onclick="window.open('01_MerchandiseIndex.html') ">回商城首頁</button>
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
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


<title>購物車</title>
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12 buttonsBlock">
				<button class="Bt_blue">全選</button>
				<button class="Bt_blue">多項刪除</button>
			</div>

		</div>
		<!-- 		<!-- 欄位敘述 -->
		<div class="row">
			<div class="col-1">選擇欄</div>
			<div class="col-4 fieldDescription">
				<div>商品名稱</div>
			</div>
			<!-- 商品照片 -->
			<div class="col-1 fieldDescription">數量</div>
			<div class="col-1 fieldDescription">單價</div>
			<div class="col-1 fieldDescription">小計</div>
			<div class="col-1 fieldDescription">庫存</div>
		</div>
		<!-- 商品清單 ，動態新增-->
		<!-- 第一列 -->
		<div class="row">
			<!-- 			<!-- 選擇欄  -->
			<div class="col-1 C_SpCre">
				<div>
					<input class="form-check-input" type="checkbox"
						id="checkboxNoLabel" value="" aria-label="...">
				</div>
			</div>
			<!-- 商品照片 -->
			<div class="col-2 C_SpCre">
				<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
					class="w-100"> <i class="fas fa-search float-right"></i>
			</div>

			<div class="col-2 C_SpCre">
				<div>
					日本代購-<br>海苔天婦羅餅乾
				</div>
			</div>

			<div class="col-1 C_SpCre">
				<div>
					<input type="number">
				</div>

			</div>
			<div class="col-1 C_SpCre">$135</div>
			<div class="col-1 C_SpCre">$135</div>
			<div class="col-1 C_SpCre">足夠</div>
			<!-- 刪除鈕區塊 -->
			<div class="col-1 C_SpCre">
				<Button class="Bt_blue">刪除</Button>
			</div>

		</div>

		<!--結帳  -->
		<hr>
		<div class="row-12 float-right">
			<div class="subtotalBlock">
				共<span id="items">0</span>商品，總金額 : <span id="subtotal">0</span>元
			</div>
			<button id="BtcheckNow" class="Bt_black " type="submit"
				onclick="window.open('SelectPayment')">立即結帳</button>

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
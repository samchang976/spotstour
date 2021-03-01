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

<title>購物車</title>
</head>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
<!------------------------------------------------------------------------------------------->	
	
	<div class="container" id="container_ShoppingCart">
		<!-- 上方按鈕區------------------------------------------------------------ -->
		<div class="row ButtonsBlock">
			<div class="col-12 ">
				<button class="Bt_blue">全選</button>
				<button class="Bt_blue">多項刪除</button>
			</div>

		</div>
		<!-- 欄位敘述------------------------------------------------------------ -->
		<div class="row">
			<div class="col-1 FieldDescription">選擇</div>
			<div class="col-4 FieldDescription">
				<div>商品名稱</div>
			</div>
			<!-- 商品照片 --------------------------------------------------------->
			<div class="col-1 FieldDescription">數量</div>
			<div class="col-1 FieldDescription">單價</div>
			<div class="col-1 FieldDescription">小計</div>
			<div class="col-1 FieldDescription">庫存</div>
		</div>
		<!-- 商品清單 ，動態新增---------------------------------------------------->
		<div class="row">
			<!-- 選擇欄 ------------------------------------------------------- -->
			<div class="col-1 ItemField">
				<div>
					<input class="form-check-input" type="checkbox"
						id="checkboxNoLabel" value="" aria-label="...">
				</div>
			</div>
			<!-- 商品照片 -------------------------------------------------------->
			<div class="col-2 ItemField">
				<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
					class="w-100"> <i class="fas fa-search float-right"></i>
			</div>
			<!-- 商品名稱 -------------------------------------------------------->
			<div class="col-2 ItemField">
				<div>
					日本代購- <br>海苔天婦羅餅乾
				</div>
			</div>
			<!-- 選擇數量 -------------------------------------------------------->
			<div class="col-1 ItemField">
				<div>
					<input type="number">
				</div>
			</div>
			<!-- 單價------------------------------------------------------------>
			<div class="col-1 ItemField">$135</div>

			<!-- 小計----------------------------------------------------------->
			<div class="col-1 ItemField">$135</div>

			<!-- 庫存----------------------------------------------------------->
			<div class="col-1 ItemField">足夠</div>
			<!-- 刪除----- ----------------------------------------------------->
			<div class="col-1 ItemField">
				<Button class="Bt_blue">刪除</Button>
			</div>

		</div>

		<!--結帳 ------------------------------------------------------------------------ -->
		<hr>
		<div class="row-12" id="SubtotalBlock">
			共<span id="items">0</span>商品，總金額 : <span id="subtotal">0</span>元
			<button id="BtcheckNow" class="Bt_black " type="submit"
				onclick="window.open('SelectPayment')">立即結帳</button>

		</div>
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
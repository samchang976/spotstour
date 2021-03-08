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
	<c:forEach varStatus='vs' var='cart' items='${cart}'>	
		<div class="row" id="CartItem">
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
					${cart.itemBean.itemHeader}
<!-- 					日本代購- <br>海苔天婦羅餅乾 -->
				</div>
			</div>
			<!-- 選擇數量 -------------------------------------------------------->
			<div class="col-1 ItemField">
				<div>
					<input type="number" value="${cart.s_ordQty}" min="1">
				</div>
			</div>
			<!-- 單價------------------------------------------------------------>
			<div class="col-1 ItemField">${cart.itemBean.itemPrice}元</div>

			<!-- 小計----------------------------------------------------------->
			<div class="col-1 ItemField" id="Total${vs.index}">${cart.s_ordQty * cart.itemBean.itemPrice}元</div>

			<!-- 庫存----------------------------------------------------------->
			<div class="col-1 ItemField">${cart.itemBean.itemQty}個</div>
			<!-- 刪除----- ----------------------------------------------------->
			<div class="col-1 ItemField">
			
			<form action="shoppingCart/delete/Id=${cart.sc_Id}"
			method='post'
			>
			<input class='Bt_blue' value="刪除" type="submit">
			
			</form>
<!-- 				<Button class="Bt_blue"  -->
<%-- 					onclick="location.href='shoppingCart/delete/Id=${cart.sc_Id}'">刪除</Button> --%>
			</div>

		</div>
	</c:forEach>	
		<!--結帳 ------------------------------------------------------------------------ -->
		<hr>
		<div class="row-12" id="SubtotalBlock">
			共<span id="items">${cartSize}</span>商品，總金額 : <span id="TotalMoney"></span>元
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
<script>
// var subtotal = 0; //總金額從0開始
// var itemTotal =  window.querySelector("#CartItem"); //取得購物車商品數量

// for(i=0;i<=itemTotal.length;i++){
// 	itemTotal=window.getElementById("Total${i}").value;
// 	subtotal += itemTotal;
// 	}
window.addeventListener('onload',function () {

document.getElementById("TotalMoney").innerText("1");

})

</script>
</body>
</html>
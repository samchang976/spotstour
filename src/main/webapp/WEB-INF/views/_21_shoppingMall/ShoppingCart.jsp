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
<style>
.imageFrame {
	position: relative;
	overflow: hidden;
}

.imageFrame img {
	transform: scale(1, 1);
	transition: all 1s ease-out;
}

.imageFrame img:hover {
	transform: scale(1.5, 1.5);
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

		<div class="container" id="container_ShoppingCart">
		<div style="text-align: center;">
				<h2>我的購物車</h2>
			</div>
			<!-- 上方按鈕區------------------------------------------------------------ -->
			<div class="row ButtonsBlock">
				<div class="col-12 ">
					<button class="Bt_blue" id='checkedALL'>全選</button>
					<button class="Bt_blue">多項刪除</button>
				</div>

			</div>
			<!-- 欄位敘述------------------------------------------------------------ -->
			<div class="shadow p-3 mb-5 bg-body rounded">
			<div class="row">
				<div class="col-1 FieldDescription">選擇</div>
				<div class="col-5 FieldDescription">
					<div>商品名稱</div>
				</div>
				<!-- 商品照片 --------------------------------------------------------->
				<div class="col-1 FieldDescription">產地</div>
				<div class="col-1 FieldDescription">數量</div>
				<div class="col-1 FieldDescription">單價</div>
				<div class="col-1 FieldDescription">小計</div>
				<div class="col-1 FieldDescription">庫存</div>
			</div>
<hr>
			<!-- 商品清單 ，動態新增---------------------------------------------------->
			<c:forEach varStatus='vs' var='cart' items='${cart}'>
				<div class="row CartItem">
					<!-- 選擇欄 ------------------------------------------------------- -->
					<div class="col-1 ItemField">
						<div>
							<input class="form-check-input" type="checkbox"
								id="checkboxNoLabel" value="" aria-label="..." name="checkboxs">
						</div>
					</div>
					<!-- 商品照片 -------------------------------------------------------->
					<div class="col-2 ItemField">
					<div class="imageFrame">
						<img src="/upload/${cart.itemBean.itemPic1}"
							class="w-100"> <i class="fas fa-search float-right"></i>
					</div>
					</div>
					<!-- 商品名稱 -------------------------------------------------------->
					<div class="col-3 ItemField">
						<div>${cart.itemBean.itemHeader}</div>
					</div>
					<!-- 商品產地 -------------------------------------------------------->
					<div class="col-1 ItemField">
						<div>${cart.itemBean.countryBean.countryName}</div>
					</div>
					<!-- 選擇數量 -------------------------------------------------------->
					
					<div class="col-1 ItemField">
						<div>
						<form action="shoppingCart/${cart.sc_Id}" method="post">
							<input type="number" value="${cart.s_ordQty}" min="1"
								id="Qty${vs.index}" name="s_ordQty" 
								onchange="newQtyChange(${cart.sc_Id},${vs.index},${cart.itemBean.itemId},${cart.memberBean.mId})"/>
<%-- 								onchange="this.form.submit()" --%>
<!-- 						顯示:綁識別字串 -->
<!-- 						數量修改靠js -->
						</form>
						</div>
					</div>
					
					<!-- 單價------------------------------------------------------------>
					<div class="col-1 ItemField">
						<span id="uniPrice${vs.index}">${cart.itemBean.itemPrice}</span>元
					</div>

					<!-- 小計----------------------------------------------------------->
					<div class="col-1 ItemField">
						<span id="Total${vs.index}"></span>元
						<%-- <span id="Total${vs.index}">${cart.s_ordQty * cart.itemBean.itemPrice}</span>元 --%>
					</div>

					<!-- 庫存----------------------------------------------------------->
					<div class="col-1 ItemField">
						<span id="Stock${vs.index}">${cart.itemBean.itemQty}</span>個
					</div>
					
					<!-- 刪除----- ----------------------------------------------------->
					<div class="col-1 ItemField">
						<form action="shoppingCart/delete/Id=${cart.sc_Id}" method='post'>
							<input class='btn btn-primary' value="刪除" type="submit">
						</form>
					</div>

				</div>
			</c:forEach>
			<!--結帳 ------------------------------------------------------------------------ -->
			<hr>
			<div class="row-12" id="SubtotalBlock">
				共<span id="items">${cartSize}</span>商品，總金額 : <span id="TotalMoney"></span>元
				<div style="text-align: center;">
				<button id="BtcheckNow" class="btn btn-primary btn-lg" type="submit"
					onclick="location.href='${pageContext.request.contextPath}/selectPayment'">立即結帳</button>

			
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
	<script src="<c:url value='/_00_util/shoppingMallUtil/javascript/shoppingCart.js'></c:url>"></script>
	
	
</body>
</html>
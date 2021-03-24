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
	transition: all 0.5s ease-out;
}

.imageFrame img:hover {
	transform: scale(1.5, 1.5);
}

.wei-grid-special1 {
	position: relative;
	left: 10%;
	top: 0;
	left: 0;
	width: 200px;
	height: 200px;
	/*     border: 1px solid black; */
	margin: 0px 10px 0px 10px;
	/*     overflow: hidden; */
	transition: all .8s ease;
	/*     z-index: 1; */
}

.wei-grid-special1:hover {
	position: relative;
	top: -90px;
	left: 80px;
}

.wei-image6 {
	transition: transform 0.5s ease-in;
	width: 100%;
	height: 100%;
}

.wei-grid-special1:hover .wei-image6, .wei-grid-special:focus .wei-image6
	{
	transform: scale(2);
	-ms-transform: scale(2);
	-webkit-transform: scale(2);
	-webkit-box-shadow: 0 0 15px #f3d42e;
	-moz-box-shadow: 0 0 15px #f3d42e;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
	/*  	z-index: auto; */
}

.fa-times{
color:red;
font-size: 1.5rem;
}

.fa-check{
color:green;
font-size: 1.5rem;
}

.check{
border: 2px solid red;
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
					<button class="btn btn-primary" id='checkedALL'>全選</button>
					<button class="btn btn-primary">多項刪除</button>
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
				<div>
				<c:forEach varStatus='vs' var='cart' items='${cart}'>
					<div class="row CartItem" id="CartItem${vs.index}">
						<!-- 選擇欄 ------------------------------------------------------- -->
						<div class="col-1 ItemField">
							<div>
								<input class="form-check-input" type="checkbox"
									id="checkboxNoLabel" value="" aria-label="..." name="checkboxs">
							</div>
						</div>
						<!-- 商品照片 -------------------------------------------------------->
						<div class="col-2 ItemField">
							<!-- 					<div class="imageFrame"> -->
							<div class="wei-grid-special1">
								<img class="wei-image6" src="/upload/${cart.itemBean.itemPic1}"
									class="w-100">
								<!-- 							<i class="fas fa-search float-right"></i> -->
							</div>
							<!-- 					</div> -->
							<br>
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
										onchange="newQtyChange(${cart.sc_Id},${vs.index},${cart.itemBean.itemId},${cart.memberBean.mId})" />
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
<%-- 							<span id="Stock${vs.index}">${cart.itemBean.itemQty}</span> --%>
							<span id="Stock${vs.index}">${cart.itemBean.itemQty}</span>
						</div>

						<!-- 刪除----- ----------------------------------------------------->
						<div class="col-1 ItemField">
							<form action="shoppingCart/delete/Id=${cart.sc_Id}" method='post'>
								<input class='btn btn-primary' value="刪除" type="submit">
							</form>
						</div>
					</div>
						<hr>
				</c:forEach>
				</div>
				<!--結帳 ------------------------------------------------------------------------ -->
				<div class="row-12" id="SubtotalBlock">
					共<span id="items">${cartSize}</span>商品，總金額 : <span id="TotalMoney"></span>元
					<div style="text-align: center;">
						<button id="BtcheckNow" class="btn btn-primary btn-lg"
							type="submit"
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
	<script
		src="<c:url value='/_00_util/shoppingMallUtil/javascript/shoppingCart.js'></c:url>">
	</script>

	<script>
		function doFirst() {
		var items = document.querySelectorAll(".CartItem");
		
		for(i=0;i<items.length;i++){
			Qty = parseInt(document.getElementById("Qty"+i).value); //商品選擇數量
			Stock=parseInt(document.getElementById("Stock"+i).innerText);//庫存數量
			// alert(Stock);

			if(Qty > Stock){ //庫存數量不足
				document.getElementById("Stock"+i).innerText = "";
				stock = document.getElementById("Stock"+i);
				var a = document.createElement("i");
					a.setAttribute("class", "fas fa-times");
					
			　　　	stock.appendChild(a);
			　　　
			　　　sub = document.getElementById("BtcheckNow");
				sub.setAttribute("disabled","true");
				sub.setAttribute("class","btn btn-secondary btn-lg")
				
				alert("庫存數量不足，請修改數量!");
				
				item = document.getElementById('CartItem'+i);
				item.setAttribute("class","row check");
			}
			if(Qty <= Stock){ //庫存足夠
				document.getElementById("Stock"+i).innerText = "";
				stock = document.getElementById("Stock"+i);
				var a = document.createElement("i");
					a.setAttribute("class", "fas fa-check");
			　　　	stock.appendChild(a);
			}
		}	

		}
		window.addEventListener('load',doFirst);
	
	
	</script>

</body>
</html>
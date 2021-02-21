<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="../css/button.css">
<link rel="stylesheet" href="../css/04_.css">
<title>商品詳細</title>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/_00_util/shoppingMallUtil/search.jsp" />
	<!--search -->
	<jsp:include page="/WEB-INF/views/_00_util/shoppingMallUtil/search.jsp" />


	<!-- 上方 -->
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
							onclick="window.open('05_ShoppingCart.html')">加入購物車</button>
					</div>

				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />
		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
			crossorigin="anonymous"></script>
</body>
</html>
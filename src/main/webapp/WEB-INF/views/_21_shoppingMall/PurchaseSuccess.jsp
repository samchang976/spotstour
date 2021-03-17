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

<title>訂購成功</title>
</head>
<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->

		<div class="container" id="container_PurchaseSuccess">
			<div class="row">
				<div class="col-4"></div>
				<div class="col-8">
					<nav
						style="-bs-breadcrumb-divider: url(&amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&amp;amp;#34;);"
						aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="<c:url value="/shoppingCart"/>">我的購物車</a></li>
							<li class="breadcrumb-item"><a
								href="<c:url value="/selectPayment"/>">填寫訂購資訊</a></li>
							<li class="breadcrumb-item"><a
								href="<c:url value="/submitOrderInfo"/>">確認訂購資訊</a></li>
							<li class="breadcrumb-item active" aria-current="page">訂購成功</li>
						</ol>
					</nav>
				</div>
			</div>

			<!--訂購成功  -->
			<div class="row">
				<div class="col-12">
					<div>
						<i class="fas fa-check-circle"></i> <span id="successText">
							訂購成功! </span>
					</div>
				</div>
			</div>
			<!-- 訂單編號區塊 -->
			<div class="row">
				<div class="col-12">
					<div class="OrderNumber" style="text-align: center;">
						<h4>
							<span>訂單編號 : </span> <span><b>FSWE1233245</b></span>
						</h4>
					</div>
				</div>
			</div>
			<!--感謝詞  -->

			<div id="thanks">
				<br>同時Spotstour將會寄出一封電子通知信<br>
				<br>您可以至會員信箱裡查看<br>
				<br>謝謝您!歡迎下次再光臨
			</div>

			<!-- 我的訂單 -->
			<button class="btn btn-primary btn-lg"
				onclick="location.href='${pageContext.request.contextPath}/myOrderList'">返回我的訂單</button>

			<!-- 回商城首頁 -->
			<button class="btn btn-primary btn-lg"
				onclick="location.href='${pageContext.request.contextPath}/merchandiseIndex'">回商城首頁</button>


		</div>
		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!------------------------------------------------------------------------------------------->

</body>
</html>
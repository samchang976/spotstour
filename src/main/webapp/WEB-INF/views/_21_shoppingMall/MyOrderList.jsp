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
<link rel="stylesheet" href="../css/09_.css">
<title>我的訂單</title>
</head>
<body>
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-- 欄位敘述 -->
	<div class="container ">
		<div class="row ">
			<!-- 訂單編號 -->
			<div class="col-3 fieldDescription_09 ">
				<div>訂單編號</div>
			</div>
			<!-- 訂購時間 -->
			<div class="col-3 fieldDescription_09">
				<div>訂單時間</div>
			</div>
			<!-- 出貨時間 -->
			<div class="col-3 fieldDescription_09">出貨時間</div>
			<!-- 狀態 -->
			<div class="col-2 fieldDescription_09">狀態</div>
			<!-- 退貨按鈕 -->
			<div class="col-1 "></div>
		</div>

		<!-- 訂單項目 -->
		<!-- 第一項 -->
		<div class="row OLitem">
			<!-- 訂單編號 -->
			<div class="col-3">
				<div onclick="location.href=
                '10_OrderDetail.html'">FSWE1233000</div>
			</div>
			<!-- 訂購時間 -->
			<div class="col-3">
				<div>2020/12/12</div>
			</div>
			<!-- 出貨時間 -->
			<div class="col-3">2020/12/25</div>
			<!-- 狀態 -->
			<div class="col-2">完成</div>
			<!-- 退貨按鈕 -->
			<div class="col-1">
				<button class="Bt_blue">退貨</button>
			</div>
		</div>
		<!-- 第二項 -->
		<div class="row OLitem">
			<!-- 訂單編號 -->
			<div class="col-3">
				<div>FSWE1561245</div>
			</div>
			<!-- 訂購時間 -->
			<div class="col-3">
				<div>2021/01/05</div>
			</div>
			<!-- 出貨時間 -->
			<div class="col-3">2021/01/10</div>
			<!-- 狀態 -->
			<div class="col-2">已送達</div>
			<!-- 退貨按鈕 -->
			<div class="col-1">
				<button class="Bt_blue">退貨</button>
			</div>
		</div>

		<!-- 第三項 -->
		<div class="row OLitem">
			<!-- 訂單編號 -->
			<div class="col-3">
				<div>FSWE1233245</div>
			</div>
			<!-- 訂購時間 -->
			<div class="col-3">
				<div>2021/01/12</div>
			</div>
			<!-- 出貨時間 -->
			<div class="col-3">-------------</div>
			<!-- 狀態 -->
			<div class="col-2">處理中</div>
			<!-- 退貨按鈕 -->
			<div class="col-1">
				<button class="Bt_blue">退貨</button>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<button class="Bt_black" onclick="window.open('MerchandiseIndex') ">回商城首頁</button>
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
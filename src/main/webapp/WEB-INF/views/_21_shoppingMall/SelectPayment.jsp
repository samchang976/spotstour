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
<title>訂購資訊</title>
</head>
<!-- header -->

<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->

		<!--付款資訊  ---------------------------------------------------------------------------->
		<div class="container" id="container_SelectPayment">
			<form class="row g-2 needs-validation" novalidate action="#">

				<!-- 訂購者資料---------------------------------------------------------------- -->

				<div>
					訂購人:
					<!-- 姓名 -->

					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="Orderer" class="col-form-label">姓名:</label>
						</div>

						<div class="col-auto">
							<input type="text" id="Orderer" class="form-control"
								name="Orderer" value="多拉夢">
						</div>
					</div>

					<div class=" form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="Gender"
							id="Male" value="Male"> 
							<label class="form-check-label"
							for="Male">先生</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="Gender"
							id="Famale" value="Famale"> <label
							class="form-check-label" for="Famale">小姐</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="Gender"
							id="Secrecy" value="Secrecy"> <label
							class="form-check-label" for="Secrecy">保留</label>
					</div>
					<div>
					身分證字號 : A123456778
					
					</div>
					<!--從會員資料庫拿-->
				</div>
				<!-- 付款方式 ------------------------------------------------------------------->
				<div>
					付款方式 :
					<div class="form-check form-check-inline" id="PayType">
						<input class="form-check-input" type="checkbox" name="PayType"
							id="CashOnDelivery" value="貨到付款"> <label
							class="form-check-label" for="CashOnDelivery">貨到付款</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="PayType"
							id="ConvenienceStore" value="門市取貨付款"> <label
							class="form-check-label" for="ConvenienceStore">超商取貨付款</label>
					</div>
				</div>

				<!-- 手機 --------------------------------------------------------------------->
				<div>
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="OrdererPhone" class="col-form-label">手機:</label>
						</div>

						<div class="col-auto">
							<input type="text" id="OrdererPhone" class="form-control"
								name="OrdererPhone">
						</div>
					</div>
				</div>




				<!-- 市話 -------------------------------------------------------------------->
				<div>
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="OrdererLocalCall" class="col-form-label">市話:</label>
						</div>

						<div class="col-auto">
							<input type="text" id="OrdererLocalCall" class="form-control"
								name="OrdererLocalCall">
						</div>
					</div>
				</div>



				<!-- 發票類型 --------------------------------------------------------------->
				<div>
					發票 :
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="ReceiptType"
							id="EInvoice" value="個人電子發票"> <label
							class="form-check-label" for="EInvoice">個人電子發票</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="ReceiptType"
							id="Donation" value="捐贈發票 "> <label
							class="form-check-label" for="Donation">捐贈發票</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="ReceiptType"
							id="Company" value="公司戶電子發票"> <label
							class="form-check-label" for="Company">公司戶電子發票</label>
					</div>
				</div>
				<hr>

				<!-- 收貨人資訊 --------------------------------------------------------------->
				<div>收貨人 :</div>
				<!-- 姓名 -->
				<div>
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="Consignee" class="col-form-label">姓名:</label>
						</div>

						<div class="col-auto">
							<input type="text" id="Consignee" class="form-control"
								name="Consignee">
						</div>
					</div>
				</div>
				<!-- 通訊 -->
				<div>
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="ConsigneePhone" class="col-form-label">手機:</label>
						</div>
						<div class="col-auto">
							<input type="text" id="ConsigneePhone" class="form-control"
								name="ConsigneePhone">
						</div>
					</div>
				</div>

				<div>
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="ConsigneeLocalCall" class="col-form-label">市話:</label>
						</div>
						<div class="col-auto">
							<input type="text" id="ConsigneeLocalCall" class="form-control"
								name="ConsigneeLocalCall">
						</div>
					</div>
				</div>
				<!-- 地址 -->
				<div>
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="Consigneeaddress" class="col-form-label">收件地址:</label>
						</div>
						<div class="col-auto">
							<input type="text" id="Consigneeaddress" class="form-control"
								name="Consigneeaddress">
						</div>
					</div>
				</div>
				<!-- 運送方式 -->
				<div>
					寄送方式 :
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							name="DeliveryMethod" id="HomeDelivery" value="宅配運送"> <label
							class="form-check-label" for="HomeDelivery">宅配運送</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							name="DeliveryMethod" id="Seven" value="7-11取貨"> <label
							class="form-check-label" for="Seven">7-11取貨</label>
					</div>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							name="DeliveryMethod" id="FamilyMart" value="全家取貨"> <label
							class="form-check-label" for="FamilyMart">全家取貨</label>
					</div>
				</div>

				<!--送出  ----------------------------------------------------------------------->
				<div class="col-12" id="SubmitBlock">
					<button type="submit" class="Bt_black">確定送出</button>
				</div>
			</form>
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
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
<title>提交訂單資訊</title>

</head>
<body>
	<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!------------------------------------------------------------------------------------------->

		<div class="container" id="container_SubmitOrderInfo">
			<!-- 訂單編號區塊 ----------------------------------------------->

			<div class="OrderNumber">
				<span>訂單編號 : </span><span>FSWE1233245</span>
			</div>
			<!-- 欄位敘述 -------------------------------------------------->
			<div class="row">
				<div class="col-4 FieldDescription">
					<div>商品名稱</div>
				</div>
				<div class="col-1 FieldDescription">數量</div>
				<div class="col-1 FieldDescription">單價</div>
				<div class="col-1 FieldDescription">小計</div>
				<div class="col-1 FieldDescription">庫存</div>
			</div>
			<!-- 商品清單 ------------------------------------------------------------------->
			<c:forEach var='ord_detail' items='${ord_details}'>
				<div class="row Item">
					<!-- 商品照片 -->
					<div class="col-2 ">
						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster">
						<i class="fas fa-search" style="float: right;"></i>
					</div>

					<div class="col-2 ">
						<div>
							日本代購-<br>海苔天婦羅餅乾
						</div>
					</div>
					<!--數量  -->
					<div class="col-1 ">
						<div>
							<div>${ord_detail.ordQty}</div>
						</div>
					</div>
					<!-- 單價 -->
					<div class="col-1 ">${ord_detail.itemBean.itemPrice}</div>
					<!-- 小計 -->
					<div class="col-1 ">${ord_detail.ordQty * ord_detail.itemBean.itemPrice}</div>
					<!-- 狀態 -->
					<div class="col-1 ">足夠</div>
				</div>
			</c:forEach>

			<div class="Orderer">
				<!--付款資訊  -------------------------------------------------------------------------->
				<div class="PayTitle">付款資訊</div>
				姓名:多拉A ■ 先生 □ 小姐 身分證字號 : A123456778 <br> ■ 貨到付款 □門市取貨付款<br>
				手機 : 0912345678 <br> 市話 : -----------<br>


				<div class="PayTitle">發票</div>
				■ 個人電子發票 □ 捐贈發票 □ 公司戶電子發票<br>

				<div class="PayTitle">收貨人</div>
				姓名 : 多拉B 手機 : 0912345677 市話 :<br> 收件地址 : 桃園市楊梅區光明街32巷123號1樓<br>

				<div class="PayTitle">寄送方式</div>
				■ 宅配運送 □ 7-11取貨 □全家取貨<br>



				<!--送出訂單  ---------------------------------------------------------------------------->
				<c:forEach var='ord_detail' items='${ord_details}' varStatus="s">
					<div class="Submit">
						<div class="row-12">
							<div class="col" id="SubtotalBlock">
								<c:set
									value="${ord_detail.ordQty * ord_detail.itemBean.itemPrice}"
									var="sum" />
								<c:set value="${sums + sum}" var="sums" />
								<c:if test="${s.last==true}">

							共<span id="items"> <c:out value="${s.count}" /></span>
							商品，總金額 : <span id="subtotal">${sums}</span>元
							</c:if>

								<button id="SubmitBlock" type="submit" class="Bt_black"
									onclick="window.open('PurchaseSuccess') ">送出訂單</button>

							</div>

						</div>
					</div>
				</c:forEach>
			</div>

		</div>
		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>

</body>
</html>
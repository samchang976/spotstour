<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<div style="text-align: center;">
				<h2>確認訂單資訊</h2>
			</div>
			<!-- 訂單編號區塊 ----------------------------------------------->
			<div class="shadow p-3 mb-5 bg-body rounded">
				<c:forEach var='cart' items='${cart}' varStatus="s">
					<c:if test="${s.first==true}">
						<!--訂單編號  -->
						<div class="row">
							<div class="col-12">
								<!-- 訂單編號區塊 -->
								<!-- 							<div class="OrderNumber"> -->
								<%-- 								<span>訂單編號 : </span><span>FSWE1233${cart.sc_Id}</span> --%>
								<!-- 							</div> -->
							</div>
						</div>

						<!-- 欄位敘述 -------------------------------------------------->
						<div class="row" style="text-align:center;">
							<div class="col-5 FieldDescription">
								<div>商品名稱</div>
							</div>
							<div class="col-1 FieldDescription">產地</div>
							<div class="col-1 FieldDescription">數量</div>
							<div class="col-1 FieldDescription">單價</div>
							<div class="col-1 FieldDescription">小計</div>
							<div class="col-1 FieldDescription">庫存</div>
						</div>
					</c:if>
					<!-- 商品清單 ------------------------------------------------------------------->
					<div class="row Item" style="text-align:center;">
						<!-- 商品照片 -->
						<div class="col-2 ">
							<img src="/upload/${cart.itemBean.itemPic1}">
							<i class="fas fa-search" style="float: right;"></i>
						</div>

						<div class="col-3 ">
							<div>${cart.itemBean.itemHeader}</div>
						</div>
						<!--產地  -->
						<div class="col-1 ">
							<div>
								<div>${cart.itemBean.countryBean.countryName}</div>
							</div>
						</div>
						<!--數量  -->
						<div class="col-1 ">
							<div>
								<div>${cart.s_ordQty}個</div>
							</div>
						</div>
						<!-- 單價 -->
						<div class="col-1 ">${cart.itemBean.itemPrice}元</div>
						<!-- 小計 -->
						<div class="col-1 ">${cart.s_ordQty * cart.itemBean.itemPrice}元</div>
						<!-- 狀態 -->
						<div class="col-1 ">足夠</div>
					</div>
				</c:forEach>

				<div class="Orderer">
					<!--付款資訊  -------------------------------------------------------------------------->
					<div class="PayTitle">付款資訊</div>
					<form:form method='POST' modelAttribute='orderVoNew'>

				姓名 : ${orderVoNew.mName} <br> 性別 : ${orderVoNew.mGender} <br> 身分證字號 : ${orderVoNew.mUid} <br>
						<%-- 				${orderVo.shipTypeId}<br> --%>
				手機 : ${orderVoNew.mPhone} <br> 收件地址 : ${orderVoNew.s_mAddress}

					<div class="PayTitle">發票</div>
						<c:if test="${ orderVoNew.receiptTypeId == 1}">
							<c:set var="theRT" value="三聯式統一發票" />
						</c:if>
						<c:if test="${ orderVoNew.receiptTypeId == 2}">
							<c:set var="theRT" value="二聯式統一發票" />
						</c:if>
						<c:if test="${ orderVoNew.receiptTypeId == 3}">
							<c:set var="theRT" value="個人電子發票" />
						</c:if>
						<c:if test="${ orderVoNew.receiptTypeId == 4}">
							<c:set var="theRT" value="公司戶電子發票" />
						</c:if>
						<c:if test="${ orderVoNew.receiptTypeId == 5}">
							<c:set var="theRT" value="捐贈發票" />
						</c:if>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckCheckedDisabled" checked disabled> <label
								class="form-check-label" for="flexCheckCheckedDisabled">
								${theRT}</label>
						</div>

						<!-- 					<div class="PayTitle">發票</div> -->
						<!-- 				■ 個人電子發票 □ 捐贈發票 □ 公司戶電子發票<br> -->

						<div class="PayTitle">寄送方式</div>
						<c:if test="${ orderVoNew.shipTypeId == 1}">
							<c:set var="theST" value="宅配" />
						</c:if>
						<c:if test="${ orderVoNew.shipTypeId == 2}">
							<c:set var="theST" value="郵寄" />
						</c:if>
						<c:if test="${ orderVoNew.shipTypeId == 3}">
							<c:set var="theST" value="7-11門市取貨" />
						</c:if>
						<c:if test="${ orderVoNew.shipTypeId == 4}">
							<c:set var="theST" value="全家門市取貨" />
						</c:if>
						<c:if test="${ orderVoNew.shipTypeId == 5}">
							<c:set var="theST" value="萊爾富門市取貨" />
						</c:if>
						<c:if test="${ orderVoNew.shipTypeId == 6}">
							<c:set var="theST" value="OK門市取貨" />
						</c:if>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckCheckedDisabled" checked disabled> <label
								class="form-check-label" for="flexCheckCheckedDisabled">
								${theST}</label>
						</div>
					</form:form>


					<!--送出訂單  ---------------------------------------------------------------------------->
					<c:forEach var='cart' items='${cart}' varStatus="s">
						<div class="Submit">
							<div class="row-12">
								<div class="col" id="SubtotalBlock">
									<c:set value="${cart.s_ordQty * cart.itemBean.itemPrice}"
										var="sum" />
									<c:set value="${sums + sum}" var="sums" />
									<c:if test="${s.last==true}">

										<%-- 							共<span id="items"> <c:out value="${s.count}" /></span> --%>
										<%-- 							商品，總金額 : <span id="subtotal">${sums}</span>元 --%>
										<h5>
											共<span id="items"> <c:out value="${s.count}" />
											</span> 商品，原價總金額 : <span id="subtotal1"><fmt:formatNumber
													maxFractionDigits="0" value="${sums}" type="currency" /></span>元
											<br> <br>
											<c:set var="formatSums" value="${sums * 0.8}" />

											使用八折優惠券，折扣後總金額 : <span id="subtotal2"><fmt:formatNumber
													maxFractionDigits="0" value="${formatSums}" type="currency" /></span>元
											<br>
										</h5>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div style="text-align: center;">
				<button id="SubmitBlock" type="submit"
					class="btn btn-primary btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/purchaseSuccess'">送出訂單</button>
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
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
			<%-- 						<form class="row g-2 needs-validation" novalidate action="#"> --%>

			<!-- 訂購者資料---------------------------------------------------------------- -->
			<div class="shadow p-3 mb-5 bg-body rounded">
				<form:form method='POST' modelAttribute='orderVo'>
					<div>
						<h3>訂購人資訊:</h3>
						<!-- 姓名 -->
						<br>
						<div class="form-group row">
							<div class="input-group mb-3">
								<div class="row g-3 align-items-center">
									<div class="col-auto">
										<label for="Orderer" class="col-form-label">姓名 :</label>
									</div>

									<div class="col-auto">
										<form:input type="text" id="mName" class="form-control"
											path="mName" name="mName" value="${LoginOK.mName}"
											placeholder="${LoginOK.mName}" disabled="true" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="input-group mb-3">
								<div class="row g-3 align-items-center">
									<div class="col-auto">
										<label for="Orderer" class="col-form-label">性別 :</label>
									</div>

									<div class="col-auto">
										<form:input type="text" id="mGender" class="form-control"
											path="mGender" name="mGender" value="${LoginOK.mGender}"
											placeholder="${LoginOK.mGender}" disabled="true" />
									</div>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<div class="input-group mb-3">
								<div class="row g-3 align-items-center">
									<div class="col-auto">
										<label for="Orderer" class="col-form-label">身分證 :</label>
									</div>

									<div class="col-auto">
										<form:input type="text" id="mUid" class="form-control"
											path="mUid" name="mUid" value="${LoginOK.mUid}"
											placeholder="${LoginOK.mUid}" disabled="true" />
									</div>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<div class="input-group mb-3">
								<div class="row g-3 align-items-center">
									<div class="col-auto">
										<label for="Orderer" class="col-form-label">手機 :</label>
									</div>

									<div class="col-auto">
										<form:input type="text" id="mPhone" class="form-control"
											path="mPhone" name="mPhone" value="${LoginOK.mPhone}"
											placeholder="${LoginOK.mPhone}" disabled="true" />
									</div>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<div class="input-group mb-3">
								<div class="row g-3 align-items-center">
									<div class="col-auto">
										<label for="Orderer" class="col-form-label">地址 :</label>
									</div>

									<div class="col-auto">
										<form:input type="text" id="d_mAddress" class="form-control"
											path="d_mAddress" name="d_mAddress"
											value="${LoginOK.d_mAddress}"
											placeholder="${LoginOK.d_mAddress}" disabled="true" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="input-group mb-3">
								<div class="row g-3 align-items-center">
									<div class="col-auto">
										<label for="Orderer" class="col-form-label">更改收件地址 :</label>
									</div>

									<div class="col-auto">
										<form:input type="text" id="s_mAddress" class="form-control"
											path="s_mAddress" name="s_mAddress"
											value="${LoginOK.d_mAddress}"
											placeholder="${LoginOK.d_mAddress}" />
									</div>
								</div>
							</div>
						</div>


					</div>
					<!-- 付款方式 ------------------------------------------------------------------->
					<div>
						<label for="Orderer" class="col-form-label">付款方式 :</label> <select
							class="form-select" aria-label="Default select example">
							<option selected="selected" value="">請選擇付款方式</option>
							<option value="1">貨到付款</option>
							<option value="2">超商取貨付款</option>
							<option value="3">信用卡付款</option>
						</select>
					</div>

					<!-- 發票類型 --------------------------------------------------------------->
					<div>
						<label for="Orderer" class="col-form-label">發票類型 :</label>
						<form:select path="receiptTypeId" class="form-select"
							aria-label="Default select example">
							<form:option value="-1" label="請選擇發票型式" />
							<form:options items="${receipt_TypeMap}" />
						</form:select>
					</div>

					<!-- 寄送方式 --------------------------------------------------------------->
					<div>
						<label for="Orderer" class="col-form-label">寄送方式 :</label>
						<form:select path="shipTypeId" class="form-select"
							aria-label="Default select example">
							<form:option value="-1" label="請選擇寄送方式" />
							<form:options items="${ship_TypeMap}" />
						</form:select>
					</div>
					<br>
					<!--送出  ----------------------------------------------------------------------->
					<%-- 				<c:forEach var='order' items='${orders}'> --%>
					<%-- 				<c:set value="" var="order" /> --%>

					<%-- 				</c:forEach> --%>
					<div class="col-12" id="SubmitBlock">
						<div style="text-align: right;">
							<button type="submit" class="btn btn-primary"
								onclick="submitOrderInfo()">提交訂單資訊</button>
						</div>
					</div>
				</form:form>
			</div>
			<div class="col-12" id="SubmitBlock">
				<div style="text-align: center;">
					<button class="btn btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/merchandiseIndex'">回商城首頁</button>
				</div>
			</div>
			<%-- 						</form> --%>
		</div>
		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!-- --------------------------------------------------------------------------------------->
	<script>
		function submitOrderInfo() {
						document.forms[0].action = "<c:url value='/submitOrderInfo' />";
// 			document.forms[0].action = "<c:url value='/purchaseSuccess' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		}
	</script>
</body>
</html>
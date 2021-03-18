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

<title>我的訂單</title>
</head>
<body>
	<!--header--------------------------------------------------------------------------->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">


		<!-- 欄位敘述 -->
		<div class="container" id="container_MyOrderList">

			<div class="shadow p-5 mb-5 bg-body rounded">
				<c:forEach var='order' items='${orders}' varStatus="s">
					<c:if test="${s.first==true}">
						<h2>我的訂單</h2>
			<div class="row py-3">
			<!-- 訂單狀態選擇欄 --------------------------------------------------------------------------->
						<div class="col" style="text-align: left;">
							<form:form method='POST' modelAttribute='ordBean'>
								<form:select path="ordStatBean.oSid" class="custom-select">
									<form:option value="-1" label="請選擇訂單狀態" />
									<form:options items="${ordStatMap}" />
								</form:select>
							</form:form>
						</div>
			<!-- 現在時間 ----------------------------------------------------------------------------->
						<div class="col" style="text-align: right;">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<span>現在時間 : <fmt:formatDate type="both" dateStyle="long"
									timeStyle="long" value="${now}" /></span>
						</div>
			</div>			
			<!-- 欄位名稱---------------------------------------------------------------------------- -->
						<div class="row ">
							<!-- 訂單編號 -->
							<div class="col-1 FieldDescription ">
								<div>訂單編號</div>
							</div>
							<!-- 訂購時間 -->
							<div class="col-2 FieldDescription">
								<div>訂單時間</div>
							</div>
							<!-- 出貨時間 -->
							<div class="col-2 FieldDescription">出貨時間</div>
							<!-- 出貨地址 -->
							<div class="col-4 FieldDescription">出貨地址</div>
							<!-- 狀態 -->
							<div class="col-1 FieldDescription">狀態</div>
							<!-- 退貨按鈕 -->
							<div class="col-2 FieldDescription">訂單資訊</div>
						</div>
					</c:if>
			<!-- 訂單項目------------------------------------------------------------------------------ -->
					<div class="row Item">
						<!-- 訂單編號 -->
						<div class="col-1">
							<div>FSWE1233${order.ord_Id}</div>
						</div>
						<!-- 訂購時間 -->
						<div class="col-2">
							<c:set var="orderTime" value="${order.o_createTime}" />
							<fmt:formatDate type="date" value="${orderTime}" />
						</div>
						<!-- 出貨時間 -->
						<div class="col-2">
							<c:set var="shipTime" value="${order.s_createTime}" />
							<fmt:formatDate type="date" value="${shipTime}" />
						</div>
						<!-- 出貨地址 -->
						<div class="col-4">${order.s_mAddress}</div>
						<!-- 狀態 -->
						<div class="col-1">${order.ordStatBean.ordStat}</div>
						<!-- 訂單詳細資訊按鈕 -->
						<div class="col-2">
							<button class="btn btn-primary"
								onclick="location.href='${pageContext.request.contextPath}/orderDetail/Id=${order.ord_Id}'">詳細資訊</button>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="row">
				<div class="col">
					<!-- 					<button class="Bt_black">回商城首頁</button> -->
					<button type="submit" class="btn btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/merchandiseIndex'">回商城首頁</button>
				</div>
			</div>
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

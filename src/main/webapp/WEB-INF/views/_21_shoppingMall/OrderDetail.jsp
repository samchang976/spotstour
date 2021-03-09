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

<title>訂單明細</title>
</head>
<body>
<!--header=================================================================================  -->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
<!------------------------------------------------------------------------------------------->	
	<div class="container" id="container_OrderDetail">
		<!--訂單編號  -->
		<div class="row">
			<div class="col-12">
				<!-- 訂單編號區塊 -->
				<div class="OrderNumber">
					<span>訂單編號 : </span><span>FSWE1233245</span> <span>訂購時間 :</span><span>2021/01/12</span>
				</div>
			</div>
		</div>

		<!-- 欄位敘述 -->
		<div class="row">
			<div class="col-4 FieldDescription">
				<div>商品名稱</div>
			</div>
			<div class="col-1 FieldDescription">數量</div>
			<div class="col-1 FieldDescription">單價</div>
			<div class="col-1 FieldDescription">小計</div>
		</div>
		<!-- 商品清單 -->
		<!-- 第一列 -->
		<c:forEach var='feedback' items='${feedbacks}'>
		<div class="row Item">
			<!-- 商品照片 -->
			<div class="col-2 ">
				<img src="https://fakeimg.pl/350x350/?text=World&font=lobster">
				<i class="fas fa-search"></i>
			</div>

			<div class="col-2 ">
				<div>
					日本代購<br>海苔天婦羅餅乾
				</div>
			</div>
			<!--數量  -->
			<div class="col-1 ">
				<div>
					<div>1</div>
				</div>
			</div>
			<!-- 單價 -->
			<div class="col-1 ">$135</div>
			<!-- 小計 -->
			<div class="col-1 ">$135</div>
		</div>
			</c:forEach>
		<!-- 總金額 -->

		<div class="Total">
			<div id="SubtotalBlock">
				共<span id="items">3</span>商品，總金額 : <span id="subtotal">405</span>元
			</div>
		</div>


		<!-- 回商城首頁 -->
		<div class="col">
			<button class="Bt_black "
				onclick="location.href='${pageContext.request.contextPath}/merchandiseIndex'">回商城首頁</button>
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
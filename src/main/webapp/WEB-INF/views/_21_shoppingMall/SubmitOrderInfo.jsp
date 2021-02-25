<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="../css/07_.css">
<link rel="stylesheet" href="../css/button.css">
<title>提交訂單資訊</title>

</head>
<body>

	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />r.jsp"
	/>

	<div class="container container_product">
		<!-- 訂單編號區塊 -->
		<div class="orderNumber">
			<span>訂單編號 : </span><span>FSWE1233245</span>
		</div>
		<!-- 欄位敘述 -->
		<div class="row">
			<div class="col-4 fieldDescription_07">
				<div>商品名稱</div>
			</div>
			<div class="col-1 fieldDescription_07">數量</div>
			<div class="col-1 fieldDescription_07">單價</div>
			<div class="col-1 fieldDescription_07">小計</div>
			<div class="col-1 fieldDescription_07">庫存</div>
		</div>
		<!-- 商品清單 -->
		<!-- 第一列 -->
		<div class="row W-SuOdIt">
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
					<div>1</div>
				</div>
			</div>
			<!-- 單價 -->
			<div class="col-1 ">$135</div>
			<!-- 小計 -->
			<div class="col-1 ">$135</div>
			<!-- 狀態 -->
			<div class="col-1 ">足夠</div>
		</div>

		<!--第二列  -->
		<div class="row W-SuOdIt">
			<!-- 商品照片 -->
			<div class="col-2 C_SpCre">
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
				<div>1</div>
			</div>
			<!-- 單價 -->
			<div class="col-1 ">$135</div>
			<!-- 小計 -->
			<div class="col-1 ">$135</div>
			<!-- 狀態 -->
			<div class="col-1 ">足夠</div>
		</div>

		<!-- 第三列 -->
		<div class="row W-SuOdIt">
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
					<div>1</div>
				</div>
			</div>
			<!-- 單價 -->
			<div class="col-1 ">$135</div>
			<!-- 小計 -->
			<div class="col-1 ">$135</div>
			<!-- 狀態 -->
			<div class="col-1 ">足夠</div>
		</div>
	</div>


	<div class="container container_Orderer">
		<!--付款資訊  -->
		<div class="Pay_txt_title">付款資訊</div>
		姓名:多拉A ■ 先生 □ 小姐 身分證字號 : A123456778 <br> ■ 貨到付款 □門市取貨付款<br>
		手機 : 0912345678 <br> 市話 : -----------<br>


		<div class="Pay_txt_title">發票</div>
		■ 個人電子發票 □ 捐贈發票 □ 公司戶電子發票<br>

		<div class="Pay_txt_title">收貨人</div>
		姓名 : 多拉B 手機 : 0912345677 市話 :<br> 收件地址 : 桃園市楊梅區光明街32巷123號1樓<br>

		<div class="Pay_txt_title">寄送方式</div>
		■ 宅配運送 □ 7-11取貨 □全家取貨<br>


	</div>

	<!--送出訂單  -->
	<div class="container container_Submit">
		<div class="row-12">
			<div class="col">
				<div class="subtotalBlock">
					共<span id="items">3</span>商品，總金額 : <span id="subtotal">250</span>元
				</div>
				<button id="OrSubmit" type="submit" class="Bt_black"
					onclick="window.open('PurchaseSuccess') ">送出訂單</button>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="../css/06_.css">
<link rel="stylesheet" href="../css/button.css">
<title>訂購資訊</title>
</head>
<!-- header -->

<body>
<jsp:include page="/WEB-INF/views/_00_util/allUtil/header.jsp" />

	<!--付款資訊  -->
	<div class="container">
		<form class="row g-2 needs-validation" novalidate action="#"
			method="POST">

			<!-- 訂購者資料 -->

			<div>訂購人:</div>
			<div>
				姓名:多拉A ■ 先生 □ 小姐 身分證字號 : A123456778
				<!--從會員資料庫拿-->
			</div>

			<!-- 付款方式 -->
			<div>
				付款方式 :
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="pay_type"
						id="pay_type" value="貨到付款"> <label
						class="form-check-label" for="inlineRadio1">貨到付款</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="pay_type"
						id="pay_type" value="門市取貨付款"> <label
						class="form-check-label" for="inlineRadio2">門市取貨付款</label>
				</div>
			</div>

			<!-- 手機 -->
			<div>
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="phone" class="col-form-label">手機:</label>
					</div>
					<div class="col-auto">
						<input type="text" id="phone" class="form-control" name="手機">
					</div>
				</div>
			</div>

			<!-- 市話 -->
			<div>
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="phone" class="col-form-label">市話:</label>
					</div>
					<div class="col-auto">
						<input type="text" id="phone" class="form-control" neame="市話">
					</div>
				</div>
			</div>

			<!-- 發票類型 -->
			<div class="Pay_txt_title">
				發票 :
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="ReceiptType"
						id="ReceiptType" value="個人電子發票"> <label
						class="form-check-label" for="inlineRadio1">個人電子發票</label>
				</div>

				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="ReceiptType"
						id="ReceiptType" value="捐贈發票 "> <label
						class="form-check-label" for="inlineRadio2">捐贈發票</label>
				</div>

				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="ReceiptType"
						id="ReceiptType" value="公司戶電子發票"> <label
						class="form-check-label" for="inlineRadio2">公司戶電子發票</label>
				</div>
			</div>


			<!-- 收貨人資訊 -->
			<div>收貨人 :</div>
			<!-- 姓名 -->
			<div>
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="phone" class="col-form-label">姓名:</label>
					</div>
					<div class="col-auto">
						<input type="text" id="phone" class="form-control" name="姓名">
					</div>
				</div>
			</div>
			<!-- 通訊 -->
			<div>
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="phone" class="col-form-label">手機:</label>
					</div>
					<div class="col-auto">
						<input type="text" id="phone" class="form-control" name="手機">
					</div>
				</div>
			</div>
			<div>
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="phone" class="col-form-label">市話:</label>
					</div>
					<div class="col-auto">
						<input type="text" id="phone" class="form-control" name="市話">
					</div>
				</div>
			</div>
			<!-- 地址 -->
			<div>
				<div class="row g-3 align-items-center">
					<div class="col-auto">
						<label for="phone" class="col-form-label">收件地址:</label>
					</div>
					<div class="col-auto">
						<input type="text" id="phone" class="form-control" name="收件地址">
					</div>
				</div>
			</div>
			<!-- 運送方式 -->
			<div class="Pay_txt_title">
				寄送方式 :
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="ReceiptType"
						id="ReceiptType" value="宅配運送"> <label
						class="form-check-label" for="inlineRadio1">宅配運送</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="ReceiptType"
						id="ReceiptType" value="7-11取貨"> <label
						class="form-check-label" for="inlineRadio2">7-11取貨</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="checkbox" name="ReceiptType"
						id="ReceiptType" value="全家取貨"> <label
						class="form-check-label" for="inlineRadio2">全家取貨</label>
				</div>
			</div>

			<!--送出  -->
			<div class="col-12">
				<button type="submit" id="SP_Summit" class="Bt_black"
				onclick="window.open('PurchaseSuccess') "
				>確定送出</button>
			</div>
		</form>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>



</body>
</html>
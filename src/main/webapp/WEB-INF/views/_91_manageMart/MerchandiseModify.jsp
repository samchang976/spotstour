<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- icon cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="WEB-INF/views/_00_util/shoppingMallUtil/css/button.css">

<title>編輯商品</title>

<style>
.container-fluid {
	text-align: center;
}

.row {
	margin-bottom: 10px;
}

/* 欄位敘述區 */
.de {
	/* border: 1px solid rgb(65, 65, 65); */
	/* background: rgb(133, 133, 133); */
	/* line-height:25px; */
	min-width: 60px;
}

/* 商品清單區 */
img {
	max-width: 200px;
	min-width: 80px;
}

.R_SpCre {
	/* background: rgb(184, 181, 181); */
	display: flex;
	align-items: center
}

.C_SpCre {
	min-width: 60px;
}
/* .form-check-input{
        
        align-content: center;
    } */
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/header.jsp" />

	<div class="container-fluid">
		<!-- 欄位敘述 -->
		<div class="row">
			<div class="col-1">
				<!-- 選擇欄 -->
			</div>
			<div class="col-4 de"></div>
			<!-- 商品照片 -->
			<!-- <div class="col"></div> -->

			<div class="col-1 de"></div>
			<div class="col-1 de"></div>
			<div class="col-1 de"></div>
			<div class="col-1 de"></div>
			<div class="col-1 de"></div>
			<div class="col-1 de"></div>
			<div class="col-1 de"></div>
			<!-- 刪除鈕區塊 -->
			<!-- <div class="col-1 de"></div> -->
		</div>
		<!-- 功能按鈕 -->
		<!-- 第一列 -->
		<div class="row R_SpCre">
			<!-- 選擇欄 -->
			<div class="col-1 C_SpCre">
				<div>
					<i class="fas fa-plus"></i> <input type="button" value="新增商品">
				</div>
			</div>
			<div class="col-1 C_SpCre">
				<input type="button" value="全選">
			</div>
			<div class="col-1 C_SpCre">
				<input type="button" value="儲存變更">
			</div>
		</div>
	</div>
	<!-- 間隔 -->
	<hr>
	<br>
	<div>
		<form method="POST" action="*" enctype='multipart/form-data'>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="itemHeader">標頭：</label> <input type="text"
						name="itemHeader" value="" class="form-control" placeholder="XXX">
					<font color="red" size="-1"></font>
				</div>
				<div class="form-group col-md-6">
					<label for="itemPrice">價錢：</label> <input type="text"
						name="itemPrice" value="" class="form-control" placeholder="120">
					<font color="red" size="-1"></font>
				</div>
				<div class="form-group col-md-6">
					<label for="itemQty">數量：</label> <input type="text"
						name="itemQty" value="" class="form-control" placeholder="50">
					<font color="red" size="-1"></font>
				</div>
				<div class="form-group col-md-6">
					<label for="itemDes">描述：</label> <input type="text"
						name="itemDes" value="" class="form-control" placeholder="XXXXXXXXXXX">
					<font color="red" size="-1"></font>
				</div>
		</form>
	</div>

	<!--第二列  -->
	<div class="row R_SpCre">
		<!-- 第1欄 -->
		<div class="col-1 C_SpCre">
			<input class="form-check-input" type="checkbox" id="checkboxNoLabel"
				value="" aria-label="...">
		</div>
		<!-- 第2欄 -->
		<div class="col-1 C_SpCre">
			<div>商品編號:A1001</div>
			<br>
			<div>紀念品照片1</div>
			<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
				class="w-100">
		</div>
		<!-- 第3欄 -->
		<div class="col-1 C_SpCre">
			<div>點擊次數:555次</div>
			<br>
			<div>紀念品照片2</div>
			<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
				class="w-100">
		</div>
		<!-- 第4欄 -->
		<div class="col-1 C_SpCre">
			<br> <br>
			<div>紀念品照片3</div>
			<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
				class="w-100">
		</div>
		<!-- 第5欄 -->
		<div class="col-2 C_SpCre">
			<br>
			<div>商品描述:</div>
			<input type="text" style="height: 150px; width: 250px;"><br>
		</div>
		<!-- 第6欄 -->
		<div class="col-1 C_SpCre">
			<br>
			<div>商品定價:100元</div>
			<br>
			<div>商品剩餘:50個</div>
		</div>
		<!-- 第7欄 -->
		<div class="col-1 C_SpCre">
			<br>
			<div>
				<Button>上傳照片</Button>
			</div>
			<br>

		</div>
	</div>
	<br>

	<hr>
	<!-- <tr><i class="fas fa-plus"></i></tr>
            <tr><input type="button" value="新增商品"></tr>
            <tr><input type="button" value="全選"></tr>
            <tr><input type="button" value="儲存變更"></tr>
   
              <tr>商品編號:A1001</tr>
              <tr>點擊次數:555次</tr>
              <tr>商品定價:100圓</tr>
              <tr><input type="button" value="上傳照片"></tr>
              <tr></tr>
          </td>  
        
        
            <td>
                <tr><input type="checkbox" name="history" ></tr>
                <tr>紀念品照片1</tr>
                <tr><img src="https://fakeimg.pl/350x350/?text=World&font=lobster" class="w-100"></tr>
                <tr>紀念品照片2</tr>
                <tr></tr>
                <tr>紀念品照片3</tr> -->
	</div>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>
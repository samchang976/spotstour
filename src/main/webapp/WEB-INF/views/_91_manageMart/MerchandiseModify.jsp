<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
body {
	font-size: 20ox;
	text-align: center;
}

.container {
	text-align: left;
}

.container-fluid {
	text-align: center;
	border: 1px solid black;
	margin: 10px;
	padding-top: 10px;
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

button { /*按鈕的樣式*/
	padding: 10px;
	color: rgb(24, 24, 168);
	border: 1px rgb(24, 24, 168) solid;
	background-color: rgb(245, 241, 242);
	border-radius: 5px;
}
/* .form-check-input{
        
        align-content: center;
    } */
#addItem {
	display: flex;
	/* 	justify-content: flex-start; */
	/* 	align-content: flex-start; */
}

#addSquare {
	border: 1px solid black;
	margin: 10px;
	padding: 10px;
}
</style>
</head>
<body>
	<!-- 引入header -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<%-- 	<jsp:include page="<c:url value='${pageContext.request.contextPath}/WEB-INF/views/_00_util/allUtil/jsp/header.jsp'/>" /> --%>
	<div class="container">
		<div class="row">
			<div class="col">
				<div>
					<i class="fas fa-plus"></i>
					<button id="newM">新增商品</button>
					<button id="selectA">全選</button>
					<button id="save">儲存變更</button>
				</div>
			</div>
		</div>
	</div>

	<br>
	<div id="addSquare">
		<form:form method='POST' modelAttribute='itemBean'>
			<div class="form-group row">
				<label for="itemHeader" class="col-sm-2 col-form-label">標頭</label>
				<div class="col-sm-10">
					<form:input type="text" path="itemHeader" class="form-control"
						id="itemHeader" />
				</div>
			</div>
			<div class="form-group row">
				<label for="itemPrice" class="col-sm-2 col-form-label">價錢</label>
				<div class="col-sm-10">
					<form:input type="text" path="itemPrice" class="form-control"
						id="itemPrice" />
				</div>
			</div>
			<div class="form-group row">
				<label for="itemQty" class="col-sm-2 col-form-label">數量</label>
				<div class="col-sm-10">
					<form:input type="number" path="itemQty" min="0"
						class="form-control" id="itemQty" />
				</div>
			</div>
			<div class="form-group row">
				<label for="itemDes" class="col-sm-2 col-form-label">描述</label>
				<div class="col-sm-10">
					<form:input type="text" path="itemDes" min="0" class="form-control"
						id="itemDes" />
				</div>
			</div>

			<div class="form-group row">
				<label for="itId" class="col-sm-2 col-form-label">商品類型</label>
				<div class="mb-3 col-10">
					<form:select path="itId" class="custom-select">
						<form:option value="-1" label="請選擇商品類型" />
						<form:options items="${item_TypeMap}" />
					</form:select>
				</div>
			</div>

			<div class="form-group row">
				<label for="countryId" class="col-sm-2 col-form-label">國家</label>
				<div class="mb-3 col-10">
					<form:select path="countryId" class="custom-select">
						<form:option value="-1" label="請選擇國家" />
						<form:options items="${countryMap}" />
					</form:select>
				</div>
			</div>
			<div id="addItem">
				<div class="col col-2-1 C_SpCre">
					<%-- 					<div>紀念品照片1${item.Pic1}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
					<button id="updateP">上傳照片1</button>
				</div>

				<div class=" col col-3-1 C_SpCre">
					<%-- 					<div>紀念品照片2${item.Pic2}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
					<button id="updateP">上傳照片2</button>
				</div>

				<div class="col col-4-1 C_SpCre">
					<%-- 					<div>紀念品照片3${item.Pic3}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
					<button id="updateP">上傳照片3</button>
				</div>
			</div>
			<div class="form-group row  d-flex justify-content-end mt-5">
				<!-- 				<div> -->
				<!-- 					<button type="submit" class="btn btn-secondary mr-3">一鍵輸入</button> -->
				<!-- 				</div> -->
				<div>
					<button type="submit" id="btnAdd" class="btn btn-primary">新增</button>
				</div>
			</div>
		</form:form>
	</div>



	<c:forEach var='item' items='${items}'>
		<div class="container-fluid">
			<div class="row R_SpCre">

				<div class="col col-1 C_SpCre">
					<input class="form-check-input" type="checkbox"
						id="checkboxNoLabel" value="" aria-label="...">
				</div>

				<div class="col col-2-1 C_SpCre">
					<div>商品編號:${item.itemId}</div>
					<br>
					<%-- 					<div>紀念品照片1${item.Pic1}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
				</div>

				<div class=" col col-3-1 C_SpCre">
					<div>商品類別:${item.item_typeBean.itemType}</div>
					<br>
					<%-- 					<div>紀念品照片2${item.Pic2}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
				</div>

				<div class="col col-4-1 C_SpCre">
					<div>商品國家:${item.countryBean.countryName}</div>
					<br>
					<%-- 					<div>紀念品照片3${item.Pic3}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
				</div>

				<div class="col col-5-1 C_SpCre">
					<br>
					<div>
						商品描述:<br> <br> ${item.itemDes}
					</div>
				</div>

				<div class=" col col-6-1 C_SpCre">
					<br>
					<div>商品定價:${item.itemPrice}</div>
					<br>
					<div>商品剩餘:${item.itemQty}</div>
				</div>

				<div class="col col-7-1 C_SpCre">
					<br>

					<div>
						<button id="editM">編輯商品</button>
					</div>
					<br>
					<div>
						<button id="deleteM" value="/Id=${itemId}"
							onclick="location.href='merchandiseModify/Id=${item.itemId}'">刪除商品</button>
						<%-- 						<input type="button" value="/Id=${itemId}" onclick="location.href='merchandiseModify/Id=${item.itemId}'">刪除</input> --%>
					</div>
				</div>
			</div>
			<br>
		</div>
	</c:forEach>
	<hr>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<!-- 	<script -->
	<!-- 		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" -->
	<!-- 		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" -->
	<!-- 		crossorigin="anonymous"></script> -->
</body>
</html>

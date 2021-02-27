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
	href="<c:url value='/_00_util/shoppingMallUtil/css/managerLayout.css'></c:url>">
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
	<!--內嵌header  -->
	<div
		style="position: fixed; width: 100%; background-color: rgba(155, 146, 146, 0.705); top: 0px; z-index: 5;">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<%-- 	<jsp:include page="<c:url value='${pageContext.request.contextPath}/WEB-INF/views/_00_util/allUtil/jsp/header.jsp'/>" /> --%>
	<div class="container">
		<div class="row">
			<div class="col">
				<div>
					<i class="fas fa-plus"></i>
					<!-- 					<button id="newM">新增商品</button> -->
					<div>
						<button id="newM" value="/Id=${itemId}"
							onclick="location.href='merchandiseModify'">
							<span class="fas fa-plus"></span>新增商品
						</button>
					</div>
					<button id="selectA">全選</button>
					<button id="save">儲存變更</button>
				</div>
			</div>
		</div>
	</div>

	<br>
	<!-- 	新增商品 -->
	<h3>新增商品</h3>
	<div id="addSquare">
		<form:form method='POST' modelAttribute='itemBean'>

			<c:if test="${null!=itemId}">
				<div class="form-group row">
					<label for="itemId" class="col-sm-2 col-form-label">商品編號</label>
					<div class="col-sm-10">
						<form:input type="text" path="itemId" class="form-control"
							id="itemId" />
					</div>
				</div>
			</c:if>

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
					<button id="updateP1">上傳照片1</button>
				</div>

				<div class=" col col-3-1 C_SpCre">
					<%-- 					<div>紀念品照片2${item.Pic2}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
					<button id="updateP2">上傳照片2</button>
				</div>

				<div class="col col-4-1 C_SpCre">
					<%-- 					<div>紀念品照片3${item.Pic3}</div> --%>
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
					<button id="updateP3">上傳照片3</button>
				</div>
			</div>
			<div class="form-group row  d-flex justify-content-end mt-5">
				<!-- 				<div> -->
				<!-- 					<button type="submit" class="btn btn-secondary mr-3">一鍵輸入</button> -->
				<!-- 				</div> -->
				<div>
					<button type="submit" id="btnAdd" class="btn btn-primary">新增</button>
				</div>
				<!-- 				<div> -->
				<!-- 					<button type="submit" id="btnEdit" class="btn btn-primary">儲存變更</button> -->
				<!-- 				</div> -->

			</div>
			<div>
				<button type="submit" id="editM" class="btn btn-primary"
					onclick="location.href='merchandiseModify/get/Id=${item.itemId}'">儲存變更</button>
			</div>
			<!-- 			<div> -->
			<%-- 				<button type="submit" id="editM" value="/Id=${itemId}" --%>
			<%-- 					onclick="location.href='merchandiseModify/update/Id=${item.itemId}'">儲存變更</button> --%>
			<!-- 			</div> -->


		</form:form>
	</div>



	<!-- 陳列商品 -->
	<h3>陳列商品</h3>
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

					<!-- 					<div> -->
					<!-- 						<button id="editM">編輯商品</button> -->
					<!-- 					</div> -->

					<div>
						<button id="editM" value="/Id=${itemId}"
							onclick="location.href='merchandiseModify/get/Id=${item.itemId}'">編輯商品</button>
					</div>
					<br>
					<div>
						<button id="deleteM" value="/Id=${itemId}"
							onclick="location.href='merchandiseModify/delete/Id=${item.itemId}'">刪除商品</button>
					</div>
				</div>
			</div>
			<br>
		</div>
	</c:forEach>

	<hr>
	<!--內嵌footer  -->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
</body>
</html>

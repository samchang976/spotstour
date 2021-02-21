<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- icon cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    

<link rel="stylesheet" href="../css/03_.css">
<title>商品搜尋結果</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/header.jsp" />>
	<!--search -->
	<jsp:include page="/WEB-INF/views/_00_util/shoppingMallUtil/search.jsp" />

	<!--商品  -->
	<c:forEach var="entry" items="${products}">

		<img height='100' width='80'
			src='${pageContext.servletContext.contextPath}/_00_init/getBookImage?id=${entry.value.bookId}'>
      	<div>商品名稱 : ${itemHeader1}</div>
      	<div>價錢 : ${itemPrice}</div>
		<div>產地 : ${countryId}</div>
		<div>庫存數量 : ${itemQty}</div>
	</c:forEach>


	<div class="container text_center">
		<div class="row row-cols-1 row-cols-md-4 ">

			<div class="col ">
				<div class="itemImageBorder">
					<a href='04_MerchandiseDetail.html'> <img
						src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
					</a>

				</div>
				<div class="itemName">韓國餅乾泡麵</div>
				<div class="itemPrice">$120</div>
				<i class="fas fa-cart-arrow-down addButton" id="A1001"> <input
					type="hidden" value="韓國餅乾泡麵|照片名稱|120">
				</i>
			</div>

			<div class="col">
				<div class="itemImageBorder">
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
				</div>
				<div class="itemName">韓國夾心餅乾</div>
				<div class="itemPrice">$80</div>
				<i class="fas fa-cart-arrow-down addButton" id="A1002"> <input
					type="hidden" value="韓國夾心餅乾|照片名稱|80">
				</i>
			</div>

			<div class="col">
				<div class="itemImageBorder">
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
				</div>
				<div class="itemName">韓國香蕉巧克力</div>
				<div class="itemPrice">$99</div>
				<i class="fas fa-cart-arrow-down addButton" id="A1003"> <input
					type="hidden" value="韓國香蕉巧克力|照片名稱|99">
				</i>
			</div>

			<div class="col">
				<div class="itemImageBorder">
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
				</div>
				<div class="itemName">韓國草莓派</div>
				<div class="itemPrice">$150</div>
				<i class="fas fa-cart-arrow-down addButton" id="A1004"> <input
					type="hidden" value="韓國草莓派|照片名稱|150">
				</i>
			</div>

			<div class="col">
				<div class="itemImageBorder">
					<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
						class="w-100">
				</div>
				<div class="itemName">泰國香蕉巧克力棒</div>
				<div class="itemPrice">$120</div>
				<i class="fas fa-cart-arrow-down addButton" id="A1004"> <input
					type="hidden" value="泰國香蕉巧克力棒|照片名稱|120">
				</i>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/_00_util/allUtil/footer.jsp" />

</body>
</html>
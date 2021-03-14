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
<title>商品搜尋結果</title>
</head>
<body>
	<!--header--------------------------------------------------------------------------->
	<div class="HeaderPostition">
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	</div>
	<!-----------定位----------------------------------------------------------------------------->
	<div class="BodyPosition">
		<!-- 搜尋 ----------------------------------------------------------------------------->
		<jsp:include
			page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/search.jsp" />
		<!------------------------------------------------------------------------------------------->
	session
<div id="sessionCart">
	<c:forEach var="sessioncart" items="${sessionShoppingCart}">
		${sessioncart},
	</c:forEach>
</div>

		<!--商品  -->
		<div class="container" id="container_MerchandiseSearchResult">
			<div class="row row-cols-1 row-cols-md-4 ">

				<c:forEach var='item' items='${items}'>
					<div class="col ">
						<div class="itemImageBorder">


							<%-- 							<a href="<c:url value="/merchandiseDetail/Id=${item.itemId}"/>"> <img --%>
							<!-- 								src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
							<!-- 								class="w-100"> -->
							<!-- 							</a> -->

							<!-- 							圖片輪播 -->



							<div id="carouselExampleControls${item.itemId}"
								class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
											class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
											class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="https://fakeimg.pl/350x350/?text=World&font=lobster"
											class="d-block w-100" alt="...">
									</div>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleControls${item.itemId}"
									data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleControls${item.itemId}"
									data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>


						</div>
						<div class="itemName">
							<a href="<c:url value="/merchandiseDetail/Id=${item.itemId}"/>">
								<img class="w-100"> ${item.itemHeader}
							</a>
						</div>
						<div class="itemPrice">價格 : ${item.itemPrice}元</div>
						<div class="countryName">產地 :
							${item.countryBean.countryName}</div>
						<div class="itemType">商品類別 : ${item.item_typeBean.itemType}</div>
						<!-- 						<i class="fas fa-cart-arrow-down addButton" id="A1001"> <input -->
						<%-- 							type="hidden" value="${item.itemHeader}|照片名稱|${item.itemPrice}"> --%>
						<!-- 						</i> -->
						<!-- 加入購物車================================================================================================= -->
<!-- 							@@@判斷會員/管理員才顯示加入購物車按鈕 -->
<%-- 							<c:if test="${mPid==2||mPid==1}"> --%>
<%-- 							<form action="${pageContext.request.contextPath}/shoppingCart/add/${item.itemId}" method="post"> --%>
<%-- 								<c:if test="${hasItem==0}"> --%>
<!-- 									<button type="button" onclick="this.form.submit()"  data-bs-toggle="modal" data-bs-target="#exampleModal"> -->
<!-- 									<i class="fas fa-cart-arrow-down addButton"></i> -->
<!-- 									</button> -->
<%-- 							</form> --%>
<%-- 								</c:if> --%>
								
<!-- ---------------------------------------------------------------------------------------------------------------- -->
						<c:choose>	
							<c:when test="${mPid==2||mPid==1}">
								<form action="${pageContext.request.contextPath}/shoppingCart/add/${item.itemId}" method="post">
									<button type="button" onclick="this.form.submit()">
									<i class="fas fa-cart-arrow-down addButton"></i>
									</button>
								</form>
							</c:when>	
							
							<c:otherwise> 
								<form action="${pageContext.request.contextPath}/shoppingCart/visitoradd/${item.itemId}" method="post"
								name="form${item.itemId}">
									<button type="button" onclick="
									chackcartitem(${item.itemId})">
										<i class="fas fa-cart-arrow-down addButton"></i>
									</button>
								</form>
							</c:otherwise>
						</c:choose>		
<!--================================================================================= -->								
<%-- 								onchange="newQtyChange(${cart.sc_Id},${vs.index},${cart.itemBean.itemId},${cart.memberBean.mId})"/> --%>
<%-- 								onchange="this.form.submit()" --%>
<!-- 						顯示:綁識別字串 -->
<!-- 						數量修改靠js -->

						
<%-- 						</c:if> --%>
							<%-- 						<input type="hidden" value="${item.itemHeader}|照片名稱|${item.itemPrice}"> --%>
						
<!-- ======================================================================================================= -->

					</div>


					<!-- 				<div class="col"> -->
					<!-- 					<div class="itemImageBorder"> -->
					<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
					<!-- 							class="w-100"> -->
					<!-- 					</div> -->
					<!-- 					<div class="itemName">韓國夾心餅乾</div> -->
					<!-- 					<div class="itemPrice">$80</div> -->
					<!-- 					<i class="fas fa-cart-arrow-down addButton" id="A1002"> <input -->
					<!-- 						type="hidden" value="韓國夾心餅乾|照片名稱|80"> -->
					<!-- 					</i> -->
					<!-- 				</div> -->


					<!-- 				<div class="col"> -->
					<!-- 					<div class="itemImageBorder"> -->
					<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
					<!-- 							class="w-100"> -->
					<!-- 					</div> -->
					<!-- 					<div class="itemName">韓國香蕉巧克力</div> -->
					<!-- 					<div class="itemPrice">$99</div> -->
					<!-- 					<i class="fas fa-cart-arrow-down addButton" id="A1003"> <input -->
					<!-- 						type="hidden" value="韓國香蕉巧克力|照片名稱|99"> -->
					<!-- 					</i> -->
					<!-- 				</div> -->

					<!-- 				<div class="col"> -->
					<!-- 					<div class="itemImageBorder"> -->
					<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
					<!-- 							class="w-100"> -->
					<!-- 					</div> -->
					<!-- 					<div class="itemName">韓國草莓派</div> -->
					<!-- 					<div class="itemPrice">$150</div> -->
					<!-- 					<i class="fas fa-cart-arrow-down addButton" id="A1004"> <input -->
					<!-- 						type="hidden" value="韓國草莓派|照片名稱|150"> -->
					<!-- 					</i> -->
					<!-- 				</div> -->

					<!-- 				<div class="col"> -->
					<!-- 					<div class="itemImageBorder"> -->
					<!-- 						<img src="https://fakeimg.pl/350x350/?text=World&font=lobster" -->
					<!-- 							class="w-100"> -->
					<!-- 					</div> -->
					<!-- 					<div class="itemName">泰國香蕉巧克力棒</div> -->
					<!-- 					<div class="itemPrice">$120</div> -->
					<!-- 					<i class="fas fa-cart-arrow-down addButton" id="A1004"> <input -->
					<!-- 						type="hidden" value="泰國香蕉巧克力棒|照片名稱|120"> -->
					<!-- 					</i> -->
					<!-- 				</div> -->
				</c:forEach>
<!-- ======================================================================================================= -->	
<!-- 				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 				  <div class="modal-dialog"> -->
<!-- 				    <div class="modal-content"> -->
<!-- 				      <div class="modal-header"> -->
<!-- 				        <h5 class="modal-title" id="exampleModalLabel">sopts-tour商城</h5> -->
<!-- 				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 				      </div> -->
<!-- 				      <div class="modal-body"> -->
<%-- 							<c:if test="${hasItem==1}"> --%>
<!-- 								已經有此項商品 -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${hasItem==0}"> --%>
<!-- 								加入購物車成功 -->
<%-- 							</c:if> --%>
<!-- 						已加入購物車 -->
<!-- 				      </div> -->
<!-- 				      <div class="modal-footer"> -->
<!-- 				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!-- 				      </div> -->
<!-- 				    </div> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- ======================================================================================================= -->	
				
				
				
			</div>
		</div>



		<!-----------定位----------------------------------------------------------------------------->
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!------------------------------------------------------------------------------------------->

	<script>

		//sessioncart
		function chackcartitem(itemId) {
			// alert(itemId);
			sessioncart=document.getElementById("sessionCart").innerText;//字串
			// alert(typeof sessioncart);
			list=sessioncart.substr(0, sessioncart.length-1).split(",");
			// alert(list.length);
			for(i=0;i<list.length;i++){
				// alert(typeof parseInt(list[i])) //string
// 				alert(typeof itemId);
// 				alert("session內"+list[i]+"點選的商品id"+itemId);
// 				alert(itemId==parseInt(list[i]));//false
				if(itemId==parseInt(list[i])){
					hasTheSame = true;
				}else{
					hasTheSame = false;
					}
			}
			if(hasTheSame == true){
				alert("購物車內已有相同的商品!");
			}else{
				alert("已加入購物車");
			let name="form"+itemId;
			var thisForm = document.forms[name];
			thisForm.action="${pageContext.request.contextPath}/shoppingCart/visitoradd/"+itemId;
			thisForm.method="post";
			// alert(name);
// 			console.info(thisForm);
			thisForm.submit();
			}
		}
		// alert(list[0]);

	</script>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>

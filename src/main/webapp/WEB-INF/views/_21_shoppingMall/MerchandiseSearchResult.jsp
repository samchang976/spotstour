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
<!-- animation --------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<%-- jQuery============================================================================ --%>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.9.1.min.js'></script>

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

<style>
body {
	/* 		 	background: #000 url("<c:url value='/images/background/ugur-peker-AkX0_cZQ6PI-unsplash.jpg'></c:url>") center fixed no-repeat; */
	background-size: cover;
}

.itemName {
	height: 70px;
}

.addcart {
	width: 100%;
	background-color: rgba(177, 112, 82, 0.3);
}

.addcart:hover {
	/* background: url(./download.jpg) center; */
	/* background-size: cover; */
	background-color: rgba(177, 112, 82, 0.9);
	color: white;
}

/* ===================================================================== */
.imageFrame {
	height: 300px; /*can be anything*/
	width: 300px; /*can be anything*/
	position: relative;
	overflow: hidden;
}

.imageFrameSide {
	height: 200px; /*can be anything*/
	width: 200px; /*can be anything*/
	position: relative;
	overflow: hidden;
}

.imageFrame .img, .imageFrameSide .img {
	transform: scale(1, 1);
	transition: all 0.5s ease-out;
}

.imageFrame .img:hover, .imageFrameSide .img:hover {
	transform: scale(1.5, 1.5);
}

.img {
	max-height: 100%;
	max-width: 100%;
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}
#gotop {
	position: fixed;
	z-index: 90;
	right: 30px;
	bottom: 31px;
	display: none;
	width: 50px;
	height: 50px;
	color: #fff;
	opacity: 0.4;
	background: #333333;
	line-height: 50px;
	border-radius: 50%;
	cursor: pointer;
	text-align: center;
	transition: all 0.5s;
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	/* 	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 */
	/* 		rgba(0, 0, 0, 0.12); */
}

#gotop :hover {
	opacity: 1; /* 透明度 */
	/* 	background: #3641C1; */
/* 	background: #888888; */
}
</style>
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
		<!-- 側邊購物車--------------------------------------------------------------------------------------- -->
		<jsp:include
			page="/WEB-INF/views/_21_shoppingMall/SideShoppingCart.jsp"></jsp:include>
		<!-- 		<div id="inCart"> -->
		<!-- 			<i class="fas fa-shopping-bag"></i> -->
		<!-- 			<div> -->
		<%-- 				<c:choose> --%>
		<%-- 					<c:when test="${mPid==2||mPid==1}"> --%>
		<%-- 						<div id="number2">${membercartlist.size()}</div> --%>
		<%-- 					</c:when> --%>
		<%-- 					<c:otherwise> --%>
		<!-- 						<div id="number"></div> -->
		<%-- 					</c:otherwise> --%>
		<%-- 				</c:choose> --%>
		<!-- 			</div> -->
		<!-- 		</div> -->

		<!-- 		<div id="imgBoard"> -->
		<!-- 			購物車 -->
		<!-- 			<!--判斷購物車內是否有相同商品:未顯示----------------------------------------------------------->
		<!-- 			<div id="sessionCart"> -->
		<!-- 									map取值:OO.key/OO.value -->
		<%-- 				<c:forEach var="sessioncart" items="${sessionShoppingCart}"> --%>
		<%-- 						${sessioncart.key}, --%>
		<%-- 					</c:forEach> --%>
		<!-- 			</div> -->
		<!-- 			<!------------------------------------------------------------------------------------>
		<%-- 			<c:choose> --%>
		<%-- 				<c:when test="${mPid==2||mPid==1}"> --%>
		<!-- 					會員--------------------------------------------------------------------------------------- -->
		<!-- 					<div> -->
		<%-- 						<c:forEach var="membercartlist" items="${membercartlist}"> --%>
		<%-- 							<form> --%>
		<!-- 								<i class="fas fa-minus-circle" -->
		<%-- 									onclick="location.href='shoppingCart/delete/Id=${membercartlist.sc_Id}'"></i> --%>
		<!-- 								<div class="imageFrameSide"> -->
		<!-- 									<img class="img" -->
		<%-- 										src="/upload/${membercartlist.itemBean.itemPic1}" alt="商品照片"></img> --%>
		<!-- 								</div> -->
		<%-- 														<img src="<c:url value='upload/${sessioncartList.itemPic1}'></c:url>" alt="商品照片"></img>  --%>
		<!-- 								<img src="#" alt="商品照片"></img> -->
		<%-- 								<div>${membercartlist.itemBean.itemHeader}</div> --%>
		<%-- 								<div>${membercartlist.itemBean.itemPrice}元</div> --%>
		<%-- 							</form> --%>
		<%-- 						</c:forEach> --%>
		<!-- 					</div> -->

		<%-- 				</c:when> --%>
		<%-- 				<c:otherwise> --%>
		<!-- 					<div> -->
		<%-- 						<c:forEach var="sessioncartList" --%>
		<%-- 							items="${sessionShoppingCartList}"> --%>
		<%-- 							<form name="sideform${sessioncartList.itemId}"> --%>
		<!-- 								<i class="fas fa-minus-circle" -->
		<%-- 									onclick="deleteItem(${sessioncartList.itemId})"></i> --%>
		<!-- 								<div class="imageFrameSide"> -->
		<%-- 									<img class="img" src="/upload/${sessioncartList.itemPic1}" --%>
		<!-- 										alt="商品照片"></img> -->
		<!-- 								</div> -->
		<%-- 														<img src="<c:url value='upload/${sessioncartList.itemPic1}'></c:url>" alt="商品照片"></img>  --%>
		<!-- 								<img src="#" alt="商品照片"></img> -->
		<%-- 								<div>${sessioncartList.itemHeader}</div> --%>
		<%-- 								<div>${sessioncartList.itemPrice}元</div> --%>

		<%-- 							</form> --%>
		<%-- 						</c:forEach> --%>
		<!-- 					</div> -->
		<%-- 				</c:otherwise> --%>
		<%-- 			</c:choose> --%>

		<!-- 			<button class="btn addcart" type="button" -->
		<%-- 				onclick="location.href='<c:url value="/shoppingCart/sessionCartSave"/>'">確定購買</button> --%>
		<!-- 			<!-- 				導向存session的controller -->

		<!-- 		</div> -->
		<!--商品------------------------------------------------------------------------------------------------------------  -->
		<div class="container" id="container_MerchandiseSearchResult">
			<div class="row row-cols-1 row-cols-md-4 g-3">


				<c:forEach var='item' items='${items}'>
					<div class="col">
						<div data-aos="zoom-out-down">

							<div class="card">
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
												<div class="imageFrame">
													<img class="img" src="/upload/${item.itemPic1}"
														class="d-block w-100" alt="...">
												</div>
											</div>
											<div class="carousel-item">
												<div class="imageFrame">
													<img class="img" src="/upload/${item.itemPic2}"
														class="d-block w-100" alt="...">
												</div>
											</div>
											<div class="carousel-item">
												<div class="imageFrame">
													<img class="img" src="/upload/${item.itemPic3}"
														class="d-block w-100" alt="...">
												</div>
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

								<div class="itemName ">
									<a href="<c:url value="/merchandiseDetail/Id=${item.itemId}"/>">
										<img class="w-100"> ${item.itemHeader}
									</a>
								</div>
								<div class="itemPrice">價格 : ${item.itemPrice}元</div>
								<div class="countryName">產地
									:${item.countryBean.countryName}</div>
								<div class="itemType">商品類別 :
									${item.item_typeBean.itemType}</div>
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
										<div class="animate__animated animate__bounce">
											<form
												action="${pageContext.request.contextPath}/shoppingCart/add/${item.itemId}"
												method="post">
												<button type="button" onclick="this.form.submit()"
													class="btn addcart">
													<i class="fas fa-cart-arrow-down addButton"></i> 加入購物車
												</button>
											</form>
										</div>
									</c:when>

									<c:otherwise>
										<div class="animate__animated animate__bounce">
											<form name="form${item.itemId}">
												<input type="hidden" name="itemQty">
												<button type="button"
													onclick="
									chackcartitem(${item.itemId})"
													class="btn addcart">
													加入購物車
													<!-- 										<i class="fas fa-cart-arrow-down addButton"></i> -->
												</button>
											</form>
										</div>
									</c:otherwise>
								</c:choose>
								<!--================================================================================= -->
								<%-- 						onchange="newQtyChange(${cart.sc_Id},${vs.index},${cart.itemBean.itemId},${cart.memberBean.mId})"/> --%>
								<%-- 						onchange="this.form.submit()" --%>
								<!-- 						顯示:綁識別字串 -->
								<!-- 						數量修改靠js -->


								<%-- 						</c:if> --%>
								<%-- <input type="hidden" value="${item.itemHeader}|照片名稱|${item.itemPrice}"> --%>
								<!-- ========================================================================================================-->

								<!-- <div class="card" style="width: 18rem;"> -->
								<!--         <img src="..." class="card-img-top" alt="..."> -->
								<!--         <div class="card-body"> -->
								<!--           <h5 class="card-title">Card title</h5> -->
								<!--           <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
								<!--           <a href="#" class="btn btn-primary">Go somewhere</a> -->
								<!--         </div> -->
								<!--       </div> -->
								<!-- ======================================================================================================= -->

							</div>
						</div>
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
	<div id="gotop">
		<i class="fa fa-angle-up"></i>
	</div>
	<!--內嵌footer-------------------------------------------------------------------------------->
	<div>
		<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	</div>
	<!------------------------------------------------------------------------------------------->
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous">
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$.extend($.easing, {
				easeOutExpo : function(x, t, b, c, d) {
					return (t == d) ? b + c : c
							* (-Math.pow(2, -10 * t / d) + 1) + b;
				}
			});
			/* 按下GoTop按鈕時的事件 */
			$('#gotop').click(function() {
				$('html,body').animate({
					scrollTop : 0
				}, 'easeOutExpo'); /* 返回到最頂上 */
				return false;
			});
			
			

			/* 偵測卷軸滑動時，往下滑超過400px就讓GoTop按鈕出現 */
			$(window).scroll(function() {
				if ($(this).scrollTop() > 400) {
					$('#gotop').fadeIn();
				} else {
					$('#gotop').fadeOut();
				}
			});
		});
	</script>
	
	
	
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
  AOS.init();
</script>
</body>
</html>
